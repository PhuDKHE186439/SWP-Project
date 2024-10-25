/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import EnCrypt.BCrypt;
/**
 *
 * @author My Asus
 */
public class ResetPassword extends HttpServlet {

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
            out.println("<title>Servlet ResetPassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ResetPassword at " + request.getContextPath() + "</h1>");
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
       // processRequest(request, response);
       request.getRequestDispatcher("forgetPassword.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        if (session.getAttribute("AccIDOTP") != null) {
            int AccID = (int) session.getAttribute("AccIDOTP");
            String answer1 = request.getParameter("answer1");
            String answer2 = (String)session.getAttribute("OTPCode");
            String resetpass = request.getParameter("newpassreset");
            String repass = request.getParameter("repassreset");
            AccountDAO accDAO = new AccountDAO();
            if (answer1 != null) {
                if (answer1.equals(answer2)) {
                    request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);
                } else {
                    request.setAttribute("annoutment", "The Answer Is Not Correts");
                    request.getRequestDispatcher("AnswerOTP.jsp").forward(request, response);
                }
            }
            if (resetpass != null && resetpass.equals(repass)) {
                String pass = BCrypt.hashpw(resetpass, BCrypt.gensalt());
                accDAO.updateAccountPassword(AccID, pass);
                request.setAttribute("annoutment", "Reset Password Successful, Please Login Again");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                request.setAttribute("annoutment", "Password and Re-Type Password not Corrects");
                request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);

            }
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
