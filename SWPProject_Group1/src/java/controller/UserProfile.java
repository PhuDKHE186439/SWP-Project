/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.PassengerDAO;
import dal.PaymentDAO;
import dal.TicketDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.passenger;

/**
 *
 * @author My Asus
 */
public class UserProfile extends HttpServlet {

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
            out.println("<title>Servlet UserProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserProfile at " + request.getContextPath() + "</h1>");
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
        PassengerDAO passDAO = new PassengerDAO();
        AccountDAO accDAO = new AccountDAO();
        HttpSession session = request.getSession();
        PaymentDAO paymentDAO = new PaymentDAO();
        if (session.getAttribute("AccID") != null) {
            int accountID = (int) session.getAttribute("AccID");
            passenger profilePassenger = passDAO.getPassengerByID(accDAO.getAccountByID(accountID).getPassengerID());
            request.setAttribute("profile", profilePassenger);
            int currentPage = Integer.parseInt(request.getParameter("page") != null ? request.getParameter("page") : "1");
            int recordsPerPage = 5;
            int totalRecords = paymentDAO.getPaymentByPassengerID(accDAO.getAccountByID(accountID).getPassengerID()).size();
            int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("totalRecords", totalRecords);
            request.setAttribute("CustomerHistory", paymentDAO.getPaymentPaging(accDAO.getAccountByID(accountID).getPassengerID(),currentPage, recordsPerPage));
            request.getRequestDispatcher("profiletest.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
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
        PassengerDAO passDAO = new PassengerDAO();
        HttpSession session = request.getSession();
        AccountDAO accDAO = new AccountDAO();
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        TicketDAO ticketDAO = new TicketDAO();
        if (session.getAttribute("AccID") != null) {
            int accountID = (int) session.getAttribute("AccID");
            try {
                if (name != null) {
                    passDAO.updatePassengerInform(accDAO.getAccountByID(accountID).getPassengerID(), name, Integer.parseInt(age), address, phone);
                }
                if (email != null) {
                    passDAO.updatePassengerInformEmail(accDAO.getAccountByID(accountID).getPassengerID(), email);
                }
                passenger profilePassenger = passDAO.getPassengerByID(accDAO.getAccountByID(accountID).getPassengerID());
                request.setAttribute("profile", profilePassenger);
                request.setAttribute("CustomerHistory", ticketDAO.getTicketByPassengerID(accDAO.getAccountByID(accountID).getPassengerID()));
            } catch (NumberFormatException e) {
                System.out.println(e);
            }
        }
        response.sendRedirect("userprofile");
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