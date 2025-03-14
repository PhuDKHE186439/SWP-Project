/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Train;

import dal.RefundDAO;
import dal.TicketDAO;
import dal.TrainDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;
import model.ticket;
import model.train;

/**
 *
 * @author My Asus
 */
public class refundc extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet refundc</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet refundc at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final List<String> badword = Arrays.asList("fuck", "bitch", "dmm", "dcm", "me may","ngu","lon","oc cho");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        HttpSession session = request.getSession();

        String ticketidParam = request.getParameter("ticketid");
        String passengeridParam = request.getParameter("passengerid");
        String message = request.getParameter("refundMessage").replaceAll("\\s+", " ").trim();
        RefundDAO dao = new RefundDAO();
        TrainDAO trainDAO = new TrainDAO();
        TicketDAO ticketDAO = new TicketDAO();
        boolean checkword = false;
        try {

            if (message.isEmpty()) {
                session.setAttribute("mess", "Cannt Enter Empty Message");
                response.sendRedirect("userprofile");

            } else {
                for (String words : badword) {
                    if (message.toLowerCase().contains(words.toLowerCase())) {
                        checkword = true;
                    }
                }
                if (checkword == true) {
                    session.setAttribute("mess", "Please dont use Badword/Swear word in Message");
                    response.sendRedirect("userprofile");
                } else {
                    int ticketID = Integer.parseInt(ticketidParam);
                    ticket ticketRequest = ticketDAO.getTicketbyTicketID(ticketID);
                    train trainTicket = trainDAO.getAllTrainByID(ticketRequest.getSeat().getCompartment().getTrain().getTrainID());
                    LocalDate refundreqdate = LocalDate.now();
                    LocalDate trainDate = LocalDate.parse(trainTicket.getTrainScheduleTime());
                    LocalDate twoDaysBefore = trainDate.minusDays(2);
                    int passsengerID = Integer.parseInt(passengeridParam);
                    if (refundreqdate.isBefore(twoDaysBefore)) {
                        dao.AddRefundRequest(passsengerID, ticketID, 1, message, 40);
                    } else {
                        dao.AddRefundRequest(passsengerID, ticketID, 1, message, 25);
                    }
                    session.setAttribute("mess", "Request sent!");
                    response.sendRedirect("userprofile");
                }
            }
        } catch (Exception e) {
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
