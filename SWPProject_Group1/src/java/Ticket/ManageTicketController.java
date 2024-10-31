/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Ticket;

import dal.TicketDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.ticket;

/**
 *
 * @author ThinkPro
 */
@WebServlet(name = "ManageTicketController", urlPatterns = "/manage-ticket")

public class ManageTicketController extends HttpServlet {

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
            out.println("<title>Servlet ManageTicketController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageTicketController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    private final int record_per_page = 10;

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
        TicketDAO td = new TicketDAO();
        try {
            //        String key = request.getParameter("key");
//        String indexPage = request.getParameter("index");
//        if (indexPage == null) {
//            indexPage = "1";
//        }
//        if (key != null && !key.isEmpty()) {
//            request.setAttribute("historyKey", "&key=" + key);
//        }
//        int index = Integer.parseInt(indexPage);
            int status = 1;
            String str_status = request.getParameter("status");
            if (str_status != null) {
                status = Integer.parseInt(str_status);
            }
//        request.setAttribute("key", key);
            request.setAttribute("status", status);
//        request.setAttribute("pageIndex", index);
//
//        try {
//            List<ticket> list = td.getAllTicket(index, record_per_page, key, status);
//            int count = td.countByCondition(key, status);
//
//            //paging
//            int endPage = (count / record_per_page);
//            if (count % record_per_page != 0) {
//                endPage++;
//            }
//            System.out.println("size: " + list.size());
//            request.setAttribute("endPage", endPage);
//            request.setAttribute("listOfPage", list);
//            request.getRequestDispatcher("manage-ticket.jsp").forward(request, response);
//            return;
//        } catch (SQLException ex) {
//            Logger.getLogger(ManageTicketController.class.getName()).log(Level.SEVERE, null, ex);
//        }
            List<ticket> list = td.getAllTicket(status);
            request.setAttribute("listOfPage", list);
        } catch (SQLException ex) {
            Logger.getLogger(ManageTicketController.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.getRequestDispatcher("manage-ticket.jsp").forward(request, response);
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
        processRequest(request, response);
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
