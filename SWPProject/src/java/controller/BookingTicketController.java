/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.TicketDAO;
import dal.TrainDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.account;
import model.seat;
import model.train;

/**
 *
 * @author ThinkPro
 */
public class BookingTicketController extends HttpServlet {

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
            out.println("<title>Servlet BookingTicketController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingTicketController at " + request.getContextPath() + "</h1>");
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);

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
        String trainID = request.getParameter("trainId");
        String price_raw = request.getParameter("price");
        String seatID_raw = request.getParameter("seatID");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        TrainDAO trd = new TrainDAO();
        seat s = trd.getSeatById(Integer.parseInt(seatID_raw));
        int cp = 1;
        int cpn = 1;
        if (s != null && s.getCompartment() != null) {
            cp = s.getCompartmentID();
            cpn = s.getCompartment().getCompartmentNumber();
        }
        HttpSession sesssion = request.getSession();
        account acc = (account) sesssion.getAttribute("acc");
        if (acc == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        } else {
            TicketDAO td = new TicketDAO();

            try {
                train t = trd.getTrainById(Integer.parseInt(trainID));
                int tkid = td.CreateTicket(acc.getAccountID(), price_raw, seatID_raw,
                        t.getTrainScheduleTime(), cp, cpn);
                td.CreatePayment(tkid, "Bank", price_raw, fullName, email, phone);

            } catch (SQLException ex) {
                Logger.getLogger(BookingTicketController.class.getName()).log(Level.SEVERE, null, ex);
            }
            HttpSession session = request.getSession();
            session.setAttribute("noti", "Đăng ký đặt vé thành công, vui lòng chờ xác nhận!");
            response.sendRedirect("home");
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
