/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.OtpQuestionDAO;
import dal.PassengerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.otpQuestion;
import model.passenger;

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
            if (accDAO.getAccountByID(accountID).getPassword().equals(currentPassword) && rePassword.equals(newPassword)) {
                try {
                    accDAO.updateAccountPassword(accountID, newPassword);
                    request.setAttribute("passwordChange", "Password Change Successfully");
                } catch (Exception e) {
                    System.out.println(e);
                }
            } else if (!accDAO.getAccountByID(accountID).getPassword().equals(currentPassword)) {
                request.setAttribute("passwordChange", "Password Change Failed, Please Check Your Current Password Again");
            } else {
                request.setAttribute("passwordChange", "Password Change Failed, Re-Type Password Does not Matches");
            }
            passenger profilePassenger = passDAO.getPassengerByID(accDAO.getAccountByID(accountID).getPassengerID());
            request.setAttribute("profile", profilePassenger);
            OtpQuestionDAO otpDAO = new OtpQuestionDAO();
            List<otpQuestion> otps = otpDAO.getOTPByID(accountID);
            if (otpDAO.getOTPByID(accountID).isEmpty()) {
                request.setAttribute("OTPCheck", false);
            } else {
                request.setAttribute("OTPCheck", true);
            }
            if (!otps.isEmpty()) {
                session.setAttribute("OTP1", otps.get(0).getOtpAnswer());
                session.setAttribute("OTP2", otps.get(1).getOtpAnswer());
                session.setAttribute("OTP3", otps.get(2).getOtpAnswer());
            }
        }

        request.getRequestDispatcher("UserProfiletest.jsp").forward(request, response);
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
