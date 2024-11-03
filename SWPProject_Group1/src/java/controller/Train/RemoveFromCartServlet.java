package controller.Train;

import dal.SeatDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import model.cartinfo;

@WebServlet(name = "RemoveFromCartServlet", urlPatterns = {"/removefromcart"})
public class RemoveFromCartServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        // Check if user is logged in
        if (session.getAttribute("AccID") == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        String seatIdStr = request.getParameter("seatId");
        
        try {
            int seatId = Integer.parseInt(seatIdStr);
            List<cartinfo> cart = (List<cartinfo>) session.getAttribute("cart");
            
            if (cart != null) {
                // Remove the item from cart
                cart.removeIf(item -> item.getSeat().getSeatID() == seatId);
                
                // Update the cart in session
                session.setAttribute("cart", cart);
                
                // Recalculate total
                double total = cart.stream()
                    .mapToDouble(item -> item.getSeat().getSeatType().equals("Economy") ? 10000 : 15000)
                    .sum();
                
                // Update total in session and request
                session.setAttribute("total", total);
                request.setAttribute("total", total);
                
                // If there was a discount applied, recalculate it
                if (session.getAttribute("appliedDiscount") != null) {
                    // Remove the applied discount since cart has changed
                    session.removeAttribute("appliedDiscount");
                }
                
                // Update seat availability in database
                SeatDAO seatDAO = new SeatDAO();
                seatDAO.updateSeatStatus(seatId, 1); // 1 means available
                
                response.setStatus(HttpServletResponse.SC_OK);
            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            }
        } catch (NumberFormatException e) {
            System.out.println("Error parsing seat ID: " + e.getMessage());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        } catch (Exception e) {
            System.out.println("Error removing seat from cart: " + e.getMessage());
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}