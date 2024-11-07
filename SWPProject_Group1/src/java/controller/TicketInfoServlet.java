/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.AccountDAO;
import dal.TicketDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ticket;

/**
 *
 * @author My Asus
 */
@WebServlet("/viewticketinfo")

public class TicketInfoServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet TicketInfoServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TicketInfoServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // Get PassengerID from URL
        String ticketIDParam = request.getParameter("ticketID");

        // Validate passengerID
        if (ticketIDParam == null || ticketIDParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Ticket ID is required");
            return;
        }

        int TicketID;
        try {
            TicketID = Integer.parseInt(ticketIDParam);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Ticket ID format");
            return;
        }

        // Call DAO to retrieve passenger information
        TicketDAO ticketDAO = new TicketDAO();
        ticket ticket = ticketDAO.getTicketbyTicketID(TicketID);

        if (ticket != null) {
            // Construct HTML response with passenger information
            StringBuilder htmlResponse = new StringBuilder();
            htmlResponse.append("<div><strong>Purchase Date ID:</strong> ").append(ticket.getPurchaseDate()).append("</div>");
            htmlResponse.append("<div><strong>Ticket Price</strong> ").append(ticket.getTicketPrice()).append("</div>");
            htmlResponse.append("<div><strong>Status</strong> ").append(ticket.getStatus()==1? "Available":"Traveled").append("</div>");
            htmlResponse.append("<div><strong>Ticket Class</strong> ").append(ticket.getTicketClass().getCategoryName()).append("</div>");
            htmlResponse.append("<div><strong>Ticket Prices</strong> ").append(ticket.getTicketPrice()).append("</div>");

            // Add more fields as necessary

            // Set the response type to HTML
            response.setContentType("text/html");
            response.getWriter().write(htmlResponse.toString());
        } else {
            // If passenger not found, return a 404 error
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Ticket not found");
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
