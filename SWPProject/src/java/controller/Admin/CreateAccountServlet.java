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
import java.util.List;
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
        List<role> roles = roleDAO.getAllRoles(); // Ensure this matches the class name

        request.setAttribute("roles", roles); // Set the attribute correctly
        request.getRequestDispatcher("Admin.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @WebServlet("/CreateAccountServlet")
    public class CreateAccountServlet extends HttpServlet {

        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phoneNumber");
            String roleID = request.getParameter("roleID");

            // Create a new Account object (assuming you have an Account class)
            Account newAccount = new Account(username, password, email, phoneNumber, roleID);

            // Create an instance of your DAO (Data Access Object)
            AccountDAO accountDAO = new AccountDAO();

            // Insert the account into the database
            boolean isSuccess = accountDAO.createAccount(newAccount);

            if (isSuccess) {
                response.setStatus(HttpServletResponse.SC_OK); // Success
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // Failure
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
