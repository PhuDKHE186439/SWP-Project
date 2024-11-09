/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.FeedbackDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.feedback;

/**
 *
 * @author My Asus
 */
public class feedbackadmin extends HttpServlet {

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
            out.println("<title>Servlet feedbackadmin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet feedbackadmin at " + request.getContextPath() + "</h1>");
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
        if (session.getAttribute("account") != null) {
            FeedbackDAO dao = new FeedbackDAO();

            // Get current page, default to 1
            int currentPage = Integer.parseInt(request.getParameter("page") != null ? request.getParameter("page") : "1");
            int recordsPerPage = 10;
            // Get search and sort parameters with trimming
            String search = request.getParameter("search");
            search = (search != null) ? search.trim() : "";
            String sortOrder = request.getParameter("sortOrder");
            sortOrder = (sortOrder != null) ? sortOrder : "latest";

            // Get feedback records and total count
            int totalRecords = dao.getTotalFeedbackCount(search);
            int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
            List<feedback> feedbackList = dao.getFeedbackBySearchAndSortBugs(search, sortOrder, currentPage, recordsPerPage, "Bugs");
            // Set attributes for JSP
            request.setAttribute("feedbackList2", feedbackList);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("search", search);
            request.setAttribute("sortOrder", sortOrder);
            request.setAttribute("totalRecords", totalRecords);

            // Forward to JSP page
            RequestDispatcher dispatcher = request.getRequestDispatcher("Admin2.jsp");
            dispatcher.forward(request, response);
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("login");
            dispatcher.forward(request, response);
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
        String action = request.getParameter("action");
        String message = "";

        try {
            if (action != null) {
                int feedbackID = Integer.parseInt(request.getParameter("feedbackID"));
                FeedbackDAO dao = new FeedbackDAO();
                
                switch (action) {
                    case "In Order":
                        dao.updateFeedbackStatus(feedbackID, true); // Assuming true represents "In Order"
                        message = "Feedback marked as In Order.";
                        break;
                    case "Finish":
                        dao.updateFeedbackStatus(feedbackID, false); // Assuming false represents "Finished"
                        message = "Feedback marked as Finished.";
                        break;
                    case "updateFeedback":
                        updateFeedback(request);
                        message = "Feedback updated successfully.";
                        break;
                    default:
                        message = "Invalid action.";
                        break;
                }
            }
            
            request.setAttribute("message", message);
            
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid feedback ID format.");
        } catch (Exception e) {
            request.setAttribute("message", "An error occurred while processing the request.");
        }

        // Redirect back to the feedback page
        response.sendRedirect("feedback");
    }

    private void updateFeedback(HttpServletRequest request) {
        int feedbackID = Integer.parseInt(request.getParameter("feedbackID"));
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        new FeedbackDAO().updateFeedbackStatus(feedbackID, status);
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
