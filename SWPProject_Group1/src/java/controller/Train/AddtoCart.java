/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Train;

import dal.SeatDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.cartinfo;
import model.seat;
import model.compartment;

/**
 *
 * @author My Asus
 */
public class AddtoCart extends HttpServlet {

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
            out.println("<title>Servlet AddtoCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddtoCart at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        session.removeAttribute("cart");
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
        HttpSession session = request.getSession();
        if (session.getAttribute("AccID") == null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            String seatId = request.getParameter("seatId");
            String compartment = request.getParameter("compartment");
            String seattype = request.getParameter("seatType");
            String seatNumber = request.getParameter("seatNumber");
            String Status = request.getParameter("availabilityStatus");
            int AccID = (int) session.getAttribute("AccID");
            boolean check = false;
            int total = 0;
            // Create a cart if it doesn't exist
            List<cartinfo> cart = (List<cartinfo>) session.getAttribute("cart");
            if (cart == null) {
                cart = new ArrayList<>();
                session.setAttribute("cart", cart);
            }

            // Add the new item to the cart
            seat newItem = new seat(Integer.parseInt(seatId), Integer.parseInt(compartment), seatNumber, seattype, Integer.parseInt(Status));
            for (cartinfo cart1 : cart) {
                if (cart1.getSeat().getSeatID() == Integer.parseInt(seatId)) {
                    check = true;
                }
            }
            if (check == false && newItem.getAvailabilityStatus()==1) {
                cart.add(new cartinfo(newItem, AccID));
                request.setAttribute("hello", "HELLO");

            }
            for (cartinfo cart1 : cart) {
                if (cart1.getSeat().getSeatType().equals("Economy")) {
                    total = total + 10000;
                } else {
                    total = total + 15000;
                }
            }
            request.setAttribute("total", total);
            SeatDAO seat = new SeatDAO();
            request.setAttribute("seats", seat.getAllSeatFromComaprt(Integer.parseInt(compartment)));
            // Redirect to cart view or confirmation page
            request.getRequestDispatcher("listseattest.jsp").forward(request, response);
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
