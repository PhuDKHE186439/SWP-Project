/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Admin;

import dal.AccountDAO;
import dal.RoleDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import model.account;
import model.role;

/**
 *
 * @author Laptop
 */
@WebServlet(name = "AccountEditServlet", urlPatterns = {"/AccountEditServlet"})
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

        int accountID = Integer.parseInt(request.getParameter("accountID"));
        AccountDAO accountDAO = new AccountDAO();
        account acc = accountDAO.getAccountByID(accountID);
        RoleDAO roleDAO = new RoleDAO();
        List<role> roles = roleDAO.getAllRoles();
        request.setAttribute("account", acc);
        request.setAttribute("roles", roles);
        request.getRequestDispatcher("BanAccount").forward(request, response);
    }

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String submitType = request.getParameter("submitType");
    int accountID = Integer.parseInt(request.getParameter("accountID"));

    if ("delete".equals(submitType)) {
        AccountDAO accountDAO = new AccountDAO();
        accountDAO.deleteAccount(accountID);
        response.sendRedirect("BanAccount?success=delete");
    } else {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        int roleID = Integer.parseInt(request.getParameter("roleID"));
        AccountDAO accountDAO = new AccountDAO();
        account updatedAccount = new account(accountID, phoneNumber, username, null, email, roleID, 0, null); // Adjust constructor accordingly
        accountDAO.updateAccount(updatedAccount);

        response.sendRedirect("BanAccount?success=update");
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
