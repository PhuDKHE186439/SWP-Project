package Ticket;

import dal.TicketDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.ticket;

@WebServlet(name = "TrackTicketServlet", urlPatterns = {"/track-ticket"})
public class TrackTicketServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("track-ticket.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ticketCode = request.getParameter("ticketCode");
        String phone = request.getParameter("phone");
        
        TicketDAO ticketDAO = new TicketDAO();
        ticket ticket = ticketDAO.getTicketByCodeAndPhone(ticketCode, phone);
        
        if (ticket != null) {
            request.setAttribute("ticket", ticket);
        } else {
            request.setAttribute("errorMessage", "Không tìm thấy vé với thông tin đã nhập!");
        }
        
        request.getRequestDispatcher("track-ticket.jsp").forward(request, response);
    }
}