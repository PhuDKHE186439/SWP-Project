/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.TrainDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.train;
import org.json.JSONObject;

/**
 *
 * @author ThinkPro
 */
public class TicketController extends HttpServlet {

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
            out.println("<title>Servlet TicketController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TicketController at " + request.getContextPath() + "</h1>");
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
        // Lấy các tham số từ URL
        String action = request.getParameter("action");
        String trainId = request.getParameter("trainId");
        String seatType = request.getParameter("seatType");
        String seatNumber = request.getParameter("seatNumber");
        String price = request.getParameter("price");
        String seatID = request.getParameter("seatID");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();
        try {
            if ("view".equals(action)) {
                TrainDAO td = new TrainDAO();
                train t = td.getTrainById(Integer.parseInt(trainId));

                // Xây dựng đối tượng JSON để phản hồi lại JavaScript
                jsonResponse.put("trainId", t.getTrainID());
                jsonResponse.put("startLocation", t.getStartLocation().getLocationName());
                jsonResponse.put("endLocation", t.getArrivalLocation().getLocationName());
                jsonResponse.put("trainName", t.getTrainName());
                jsonResponse.put("trainScheduleTime", t.getTrainScheduleTime());
                jsonResponse.put("seatType", seatType);
                jsonResponse.put("seatNumber", seatNumber);
                jsonResponse.put("price", price);
                jsonResponse.put("seatID", seatID);
                response.setStatus(HttpServletResponse.SC_OK);
            } else {
                jsonResponse.put("error", "Action không hợp lệ");
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            }

        } catch (Exception e) {
            jsonResponse.put("error", "Đã xảy ra lỗi trong quá trình xử lý dữ liệu: " + e.getMessage());
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }

        // Gửi phản hồi JSON về cho client
        out.print(jsonResponse.toString());
        out.flush();

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
