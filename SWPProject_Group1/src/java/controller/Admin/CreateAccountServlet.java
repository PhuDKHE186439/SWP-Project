/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Admin;

import dal.AccountDAO;
import dal.RoleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.account;
import model.role;

/**
 *
 * @author Laptop
 */
public class CreateAccountServlet extends HttpServlet {

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
            out.println("<title>Servlet CreateAccountServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateAccountServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    private boolean isValidPassword(String password) {
        return password.length() >= 8
                && password.matches(".*[A-Z].*")
                && password.matches(".*[a-z].*")
                && password.matches(".*\\d.*")
                && password.matches("[a-zA-Z0-9]+");
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
        RoleDAO roleDAO = new RoleDAO();
        List<role> role = roleDAO.getAllRoles();

        request.setAttribute("role", role);
        request.getRequestDispatcher("Admin.jsp").forward(request, response); // Forward to your JSP page
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        int roleID = Integer.parseInt(request.getParameter("roleID"));

        if (phoneNumber.length() !=10) {
            HttpSession session = request.getSession();
            session.setAttribute("message", "Phone number must be 10 digits.");
            request.getRequestDispatcher("Admin.jsp").forward(request, response);
            return;
        }
        if (!username.matches("[a-zA-Z0-9]+")) {
            HttpSession session = request.getSession();
            session.setAttribute("message", "Username can only contain letters and numbers.");
            request.getRequestDispatcher("Admin.jsp").forward(request, response);
            return;
        }
        if (!isValidPassword(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("message", "Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one number.");
            request.getRequestDispatcher("Admin.jsp").forward(request, response);
            return;
        }

        AccountDAO accountDAO = new AccountDAO();
        if (accountDAO.accountExists(email, phoneNumber)) {
            HttpSession session = request.getSession();
            session.setAttribute("message", "Account with this email or phone number already exists.");
            request.getRequestDispatcher("Admin.jsp").forward(request, response);
        } else {
            try {
                accountDAO.registerAccountAD(phoneNumber, username, password, email, roleID);
                HttpSession session = request.getSession();
                session.setAttribute("message", "Account created successfully.");
                response.sendRedirect("Admin.jsp");
            } catch (Exception e) {
                HttpSession session = request.getSession();
                session.setAttribute("message", "Error creating account: " + e.getMessage());
                request.getRequestDispatcher("Admin.jsp").forward(request, response);
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