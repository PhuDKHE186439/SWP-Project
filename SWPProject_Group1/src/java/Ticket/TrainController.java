/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Ticket;

import com.google.gson.Gson;
import dal.TrainDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.seat;
import model.ticket;
import model.train;

/**
 *
 * @author ThinkPro
 */
public class TrainController extends HttpServlet {

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
            out.println("<title>Servlet TrainController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TrainController at " + request.getContextPath() + "</h1>");
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
        String ngayDi = request.getParameter("ngayDi");
        String ngayVe = request.getParameter("ngayVe");
        String gaDi = request.getParameter("l1");
        String gaDen = request.getParameter("l2");

        if (ngayDi == null || ngayVe == null || gaDi == null || gaDen == null || gaDi.equals("-1") || gaDen.equals("-1")) {
            session.setAttribute("noti", "Vui lòng nhập đủ thông tin tìm kiếm");
            response.sendRedirect("home1");
        }

        TrainDAO td = new TrainDAO();
        try {
            List<train> trains = td.getTrains(ngayDi, ngayVe, gaDi, gaDen);
            if (trains.isEmpty()) {
                session.setAttribute("noti", "Không tìm thấy kết quả nào");
                response.sendRedirect("home1");
            } else {
                List<ticket> tickets = td.getTickets(ngayDi, ngayVe);
                int[] usedSeatNumber = new int[10000];
                //Map<Integer, List<Integer>> bookedSeats = new HashMap<>();
                Map<Integer, List<seat>> bookedSeats = new HashMap<>();
                for (int i = 0; i < trains.size(); i++) {
                    int count = 0;
                    // List<Integer> seatNumbers = new ArrayList<>();
                    List<seat> seatNumbers = new ArrayList<>();

                    for (int j = 0; j < tickets.size(); j++) {
                        if (trains.get(i).getTrainID()
                                == tickets.get(j).getSeat().getCompartment().getTrain().getTrainID() 
                                && tickets.get(j).getStatus() == 1) {
                            count++;
                            //seatNumbers.add(tickets.get(j).getSeat().getSeatNumber());
                            seatNumbers.add(tickets.get(j).getSeat());
                        }
                    }
                    usedSeatNumber[trains.get(i).getTrainID()] = count;
                    bookedSeats.put(trains.get(i).getTrainID(), seatNumbers);
                }
                String bookedSeatsJson = new Gson().toJson(bookedSeats);
                request.setAttribute("usedSeatNumber", usedSeatNumber);
                request.setAttribute("bookedSeats", bookedSeatsJson);
                request.setAttribute("tickets", tickets);
                request.setAttribute("trains", trains);
                request.getRequestDispatcher("searchTrainResult.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TrainController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
