/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Admin;

import dal.AccountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import model.account;

/**
 *
 * @author Laptop
 */
public class AccountEditServlet extends HttpServlet {

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
            out.println("<title>Servlet AccountEditServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountEditServlet at " + request.getContextPath() + "</h1>");
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
        int accountId = Integer.parseInt(request.getParameter("accountID"));
        AccountDAO accountDAO = new AccountDAO();
        account acc = accountDAO.getAccountByID(accountId); // Retrieve account by ID

        RoleDAO roleDAO = new RoleDAO();
        List<role> roles = roleDAO.getAllRoles(); // Retrieve all roles

        request.setAttribute("account", acc);
        request.setAttribute("roles", roles); // Pass roles to the JSP
        request.getRequestDispatcher("EditAccount.jsp").forward(request, response); // Forward to your EditAccount.jsp
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        AccountDAO accountDAO = new AccountDAO();
        HttpSession session = request.getSession();

        if ("edit".equals(action)) {
            int accountId = Integer.parseInt(request.getParameter("accountID"));
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phoneNumber");
            String username = request.getParameter("username");
            int roleID = Integer.parseInt(request.getParameter("roleID"));

            account acc = new account(accountId, phoneNumber, username, null, email, roleID, 0, "Active");
            accountDAO.updateAccount(acc);
            session.setAttribute("message", "Account updated successfully.");
        } else if ("delete".equals(action)) {
            int accountId = Integer.parseInt(request.getParameter("accountID"));
            accountDAO.deleteAccount(accountId);
            session.setAttribute("message", "Account deleted successfully.");
        }

        response.sendRedirect("Admin.jsp"); // Redirect to Admin.jsp after update/delete
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
