/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Train;

import java.sql.Time;
import java.text.SimpleDateFormat;
import dal.TrainDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.train;

/**
 *
 * @author Admin
 */
public class CreateNewTrain extends HttpServlet {

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
            String id = request.getParameter("id");
            String schedule = request.getParameter("schedule");
            String name = request.getParameter("name");
            String seats = request.getParameter("seats");
            String startID = request.getParameter("startID");
            String endID = request.getParameter("endID");

            String startTimeStr = request.getParameter("startTime");
            String estimatedEndTimeStr = request.getParameter("estimatedEndTime");
            String numberOfCarriagesStr = request.getParameter("numberOfCarriages");

            // Set default status
            String status = "Active"; // mặc định khi tạo mới là active

            // Convert startTime and estimatedEndTime from String to Time
            Time startTime = null;
            Time estimatedEndTime = null;

            try {
                SimpleDateFormat sdf = new SimpleDateFormat("HH:mm"); // adjust format as needed
                startTime = new Time(sdf.parse(startTimeStr).getTime());
                estimatedEndTime = new Time(sdf.parse(estimatedEndTimeStr).getTime());

                // Check if estimatedEndTime is greater than startTime
                if (estimatedEndTime.before(startTime)) {
                    // Handle the case when estimatedEndTime is not greater than startTime
                    // You can throw an exception, return an error message, etc.
                    throw new IllegalArgumentException("Estimated end time must be after the start time.");
                }
            } catch (Exception e) {
                request.setAttribute("error", e.getMessage());
                request.getRequestDispatcher("trains").forward(request, response);
            }

            // Convert numberOfCarriages to int
            int numberOfCarriages = Integer.parseInt(numberOfCarriagesStr);

            train t = new train(Integer.parseInt(id), schedule, name, Integer.parseInt(seats), Integer.parseInt(startID), Integer.parseInt(endID), status, // set status
                    startTime, // set startTime
                    estimatedEndTime, // set estimatedEndTime
                    numberOfCarriages // set numberOfCarriages
            );
            TrainDAO trainDAO = new TrainDAO();
            trainDAO.insertTrain(t);
            response.sendRedirect("trains");
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
