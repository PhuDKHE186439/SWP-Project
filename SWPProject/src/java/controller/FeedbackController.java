
import dal.FeedbackDAO;
import dal.OtpQuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.List;
import model.feedback;
/**
 *
 * @author P C
 */
@WebServlet("/feedback")
public class FeedbackController extends HttpServlet {
    // Method to get a connection from the connection pool
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {     
        FeedbackDAO dao = new FeedbackDAO();
        List list = dao.getAllFeedback();//        session.setAttribute("listfb", list);
        response.sendRedirect("CustomerService.jsp");
    }

    // Handle GET request to retrieve all feedback and display in JSP
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    // Handle POST request if needed in the future (e.g., for form submissions)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle form submissions or other POST logic here, if applicable
        //doGet(request, response);  // For now, simply call doGet
    }
    public static void main(String[] args) {
        FeedbackDAO dao = new FeedbackDAO();
        List list = dao.getAllFeedback();
        for (int i = 0; i < list.size(); i++) {
            System.out.println(i + ": " + list.get(i));
        }
    }

}