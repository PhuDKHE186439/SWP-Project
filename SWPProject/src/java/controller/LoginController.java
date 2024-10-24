/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.OtpQuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.account;

/**
 *
 * @author My Asus
 */
public class LoginController extends HttpServlet {

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
            out.println("<title>Servlet loginController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loginController at " + request.getContextPath() + "</h1>");
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
    AccountDAO dao = new AccountDAO();
    List<account> list = new ArrayList();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie arr[] = request.getCookies();
        if (arr != null) {
            for (Cookie o : arr) {
                if ("userC".equals(o.getName())) {
                    request.setAttribute("username", o.getValue());
                }
                if ("passC".equals(o.getName())) {
                    request.setAttribute("password", o.getValue());
                    request.setAttribute("check", "checked");
                }
            }
        }
        String checklogout = request.getParameter("logout");
        HttpSession session = request.getSession();

        if (checklogout != null) {
            session.removeAttribute("account");
            session.removeAttribute("AccID");
        }
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        int role;
        boolean check = false;
        String result = "Please check your username or password";
        list = dao.getAllAccount();
        OtpQuestionDAO otpDAO = new OtpQuestionDAO();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        Cookie user = new Cookie("userC", username);
        Cookie pass = new Cookie("passC", password);
        for (account o : list) {
            if (username.equals(o.getUsername()) && password.equals(o.getPassword())) {
                session.setAttribute("acc", o);
                role = o.getRoleID();
                check = true;
                session.setAttribute("AccID", o.getAccountID());
                if (remember != null) {
                    user.setMaxAge(60);
                    pass.setMaxAge(60);
                    request.setAttribute("check", "checked");
                } else {
                    request.removeAttribute("check");
                    user.setMaxAge(0);
                    pass.setMaxAge(0);
                }
                response.addCookie(user);
                response.addCookie(pass);
                if (session.getAttribute("AccID") != null) {
                    int accountID = (int) session.getAttribute("AccID");
                    if (otpDAO.getOTPByID(accountID).isEmpty()) {
                        request.setAttribute("OTPCheck", false);
                    } else {
                        request.setAttribute("OTPCheck", true);
                    }
                }

                switch (role) { //1. case 1 for admin page // 2. case 2 for ticket manager page //3. case 3 for passenger Page
                    case 1 ->
                        response.sendRedirect("Admin.jsp");
                    case 2 ->
                        response.sendRedirect("home");
                    case 3 ->
                        response.sendRedirect("userprofile");
                }
            }
        }
        if (check == false) {
            request.setAttribute("key", result);
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
