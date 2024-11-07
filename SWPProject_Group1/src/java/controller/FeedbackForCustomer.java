/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.FeedbackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;

/**
 *
 * @author My Asus
 */
public class FeedbackForCustomer extends HttpServlet {

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
            out.println("<title>Servlet FeedbackForCustomer</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FeedbackForCustomer at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("MakeFeedBackForCustomer.jsp").forward(request, response);

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
        FeedbackDAO feedDAO = new FeedbackDAO();
        AccountDAO accDAO = new AccountDAO();
        HttpSession session = request.getSession();
        LocalDate currentDateTime = LocalDate.now();
        String feedbacktype = request.getParameter("feedbacktype");
        String message = request.getParameter("feedback").replaceAll("\\s+", " ").trim();
        if (session.getAttribute("AccID") != null) {
            try {
                if (feedbacktype.isEmpty()) {
                    request.setAttribute("message", "Please Choose Your Type of feed");
                    request.getRequestDispatcher("MakeFeedBackForCustomer.jsp").forward(request, response);

                } else if (message.isEmpty()) {
                    request.setAttribute("message", "You cant sent Empty Feedback");
                    request.getRequestDispatcher("MakeFeedBackForCustomer.jsp").forward(request, response);

                } else {
                    int accID = (int) session.getAttribute("AccID");
                    feedDAO.createFeedback(message, accDAO.getAccountByID(accID).getPassengerID(), currentDateTime.toString(), feedbacktype);
                    request.setAttribute("message", "Feedback has been Sent");
                    request.getRequestDispatcher("MakeFeedBackForCustomer.jsp").forward(request, response);
                }
            } catch (ServletException | IOException e) {
                System.out.println(e);
            }
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
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
