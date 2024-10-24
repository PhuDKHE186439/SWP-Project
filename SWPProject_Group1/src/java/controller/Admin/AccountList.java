/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Admin;

import dal.AccountDAO;
import dal.RoleDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.stream.Collectors;
import model.account;
import model.role;

/**
 *
 * @author Laptop
 */
public class AccountList extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private AccountDAO accountDAO;

    public AccountList() {
        super();
        accountDAO = new AccountDAO(); // Assuming you have AccountDAO to interact with DB
    }

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
            out.println("<title>Servlet AccountList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AccountList at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve accounts and roles from database or service
        List<account> accounts = accountDAO.getAllAccount();
        RoleDAO roleDAO = new RoleDAO();
        List<role> roles = roleDAO.getAllRoles();

        // Add role names to each account for easy display in JSP
        for (account acc : accounts) {
            for (role r : roles) {
                if (r.getRoleID() == acc.getRoleID()) {
                    r.setRoleName(r.getRoleID() == acc.getRoleID() ? r.getRoleName() : null);
                    break;
                }
            }
        }

        // Store the accounts in request scope and forward to JSP
        request.setAttribute("accounts", accounts);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/path/to/account-management.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
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
