/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.PassengerDAO;
import dal.PaymentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.passenger;
import EnCrypt.BCrypt;


/**
 *
 * @author My Asus
 */
public class UpdateUserProfile extends HttpServlet {

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
            out.println("<title>Servlet UpdateUserProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateUserProfile at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        PassengerDAO passDAO = new PassengerDAO();
        HttpSession session = request.getSession();
        AccountDAO accDAO = new AccountDAO();
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String rePassword = request.getParameter("rePassword");
        if (session.getAttribute("AccID") != null) {
            int accountID = (int) session.getAttribute("AccID");
            if ( BCrypt.checkpw(currentPassword, accDAO.getAccountByID(accountID).getPassword()) && rePassword.equals(newPassword)) {
                try {
                    String cryptpass = BCrypt.hashpw(newPassword, BCrypt.gensalt());
                    accDAO.updateAccountPassword(accountID, cryptpass);
                    request.setAttribute("passwordChange", "Password Change Successfully");
                } catch (Exception e) {
                    System.out.println(e);
                }
            } else if (! BCrypt.checkpw(currentPassword, accDAO.getAccountByID(accountID).getPassword())) {
                request.setAttribute("passwordChange", "Password Change Failed, Please Check Your Current Password Again");
            } else {
                request.setAttribute("passwordChange", "Password Change Failed, Re-Type Password Does not Matches");
            }
            passenger profilePassenger = passDAO.getPassengerByID(accDAO.getAccountByID(accountID).getPassengerID());
            request.setAttribute("profile", profilePassenger);
            PaymentDAO paymentDAO = new PaymentDAO();

        int currentPage = Integer.parseInt(request.getParameter("page") != null ? request.getParameter("page") : "1");
            int recordsPerPage = 2;
            int totalRecords = paymentDAO.getPaymentByPassengerID(accDAO.getAccountByID(accountID).getPassengerID()).size();
            int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("totalRecords", totalRecords);
            request.setAttribute("CustomerHistory", paymentDAO.getPaymentPaging(accDAO.getAccountByID(accountID).getPassengerID(),currentPage, recordsPerPage));

        }
                
        request.getRequestDispatcher("profiletest.jsp").forward(request, response);
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
