package controller;

import dal.FeedbackDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.feedback;

import java.io.IOException;
import java.util.List;

@WebServlet("/feedback")
public class FeedbackController extends HttpServlet {

    // Method to process requests for feedback
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FeedbackDAO dao = new FeedbackDAO();
        
        // Get current page, default to 1
        int currentPage = Integer.parseInt(request.getParameter("page") != null ? request.getParameter("page") : "1");
        int recordsPerPage = 5;

        // Get search and sort parameters with trimming
        String search = request.getParameter("search");
        search = (search != null) ? search.trim() : "";
        
        String sortOrder = request.getParameter("sortOrder");
        sortOrder = (sortOrder != null) ? sortOrder : "latest";

        // Get feedback records and total count
        int totalRecords = dao.getTotalFeedbackCount(search);
        int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
        List<feedback> feedbackList = dao.getFeedbackBySearchAndSort(search, sortOrder, currentPage, recordsPerPage);
        // Set attributes for JSP
        request.setAttribute("feedbackList", feedbackList);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("search", search);
        request.setAttribute("sortOrder", sortOrder);
        request.setAttribute("totalRecords", totalRecords);

        // Forward to JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("CustomerService.jsp");
        dispatcher.forward(request, response);
    }

    // Handle GET request to retrieve all feedback and display in JSP
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    // Handle POST request for add, update, and delete operations
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "addFeedback":
                addFeedback(request);
                break;
            case "updateFeedback":
                updateFeedback(request);
                break;
            case "deleteFeedback":
                deleteFeedback(request);
                break;
            default:
                break;
        }

        response.sendRedirect("feedback"); // Redirect back to feedback page
    }

    private void addFeedback(HttpServletRequest request) {
        String message = request.getParameter("message");
        int passengerID = Integer.parseInt(request.getParameter("passengerID"));
        String submissionDate = request.getParameter("submissionDate");
        String feedbacktype = request.getParameter("feedbacktype");
        boolean status = Boolean.parseBoolean("status");
        feedback newFeedback = new feedback(0, message, passengerID, submissionDate,feedbacktype,status);
        new FeedbackDAO().createFeedback(newFeedback);
    }

    private void updateFeedback(HttpServletRequest request) {
        int feedbackID = Integer.parseInt(request.getParameter("feedbackID"));
        String message = request.getParameter("message");
        int passengerID = Integer.parseInt(request.getParameter("passengerID"));
        String submissionDate = request.getParameter("submissionDate");
        String feedbacktype = request.getParameter("feedbacktype");
        boolean status = Boolean.parseBoolean("status");

        feedback updatedFeedback = new feedback(feedbackID, message, passengerID, submissionDate,feedbacktype,status);
        new FeedbackDAO().updateFeedback(updatedFeedback);
    }

    private void deleteFeedback(HttpServletRequest request) {
        int feedbackID = Integer.parseInt(request.getParameter("feedbackID"));
        new FeedbackDAO().deleteFeedback(feedbackID);
    }

    // Main method for testing purposes
    public static void main(String[] args) {
        FeedbackDAO dao = new FeedbackDAO();
        List<feedback> list = dao.getAllFeedback(); // For testing purposes
        
        // Print all feedback items
        for (int i = 0; i < list.size(); i++) {
            System.out.println(i + ": " + list.get(i)); // Ensure Feedback class has a proper toString() method
        }
    }
}
