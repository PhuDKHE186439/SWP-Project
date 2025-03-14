/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Admin;

import dal.RoleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Laptop
 */
public class ManageRole extends HttpServlet {

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
            out.println("<title>Servlet ManageRole</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageRole at " + request.getContextPath() + "</h1>");
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        RoleDAO roleDAO = new RoleDAO();

        if ("add".equals(action)) {
        String roleName = request.getParameter("roleName");
        System.out.println("Adding role: " + roleName); // Debugging output

        if (roleName != null && !roleName.trim().isEmpty()) {
            roleDAO.addRole(roleName);
        } else {
            System.out.println("Role name is empty or null.");
        }
    } else if ("delete".equals(action)) {
            int roleID = Integer.parseInt(request.getParameter("roleID"));
            roleDAO.deleteRole(roleID);
        } else if ("edit".equals(action)) {
            int roleID = Integer.parseInt(request.getParameter("roleID"));
            String roleName = request.getParameter("roleName");

            if (roleName == null || roleName.trim().isEmpty()) {
                request.setAttribute("errorMessage", "Role name cannot be empty");
                request.getRequestDispatcher("Admin2.jsp").forward(request, response);
                return;
            }
            roleDAO.updateRole(roleID, roleName);
        }

        response.sendRedirect("Admin.jsp");
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
