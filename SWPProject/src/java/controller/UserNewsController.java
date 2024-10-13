package controller;

import dal.NewsDAO;
import model.News;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

@WebServlet(name = "UserNewsController", urlPatterns = {"/Unews"})
public class UserNewsController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    
    NewsDAO newsDAO = new NewsDAO();
    String action = request.getParameter("action");
    
    if (action == null) {
        action = "random"; // Default action to show random news
    }
    
    switch (action) {
        case "latest":
            latestNews(request, response, newsDAO); // New action case for latest news
            break;
//        case "random":
//            randomNews(request, response, newsDAO); // Call to random news method
//            break;
        case "view":
            viewNews(request, response, newsDAO);
            break;
        case "list":
        default:
            listNews(request, response, newsDAO);
            break;
    }
}

    private void latestNews(HttpServletRequest request, HttpServletResponse response, NewsDAO newsDAO)
            throws ServletException, IOException {
        News latestNews = newsDAO.getLatestNews(); // Fetch latest news
        request.setAttribute("latestNews", latestNews); // Set the latest news in the request scope
        request.getRequestDispatcher("/Unews.jsp").forward(request, response); // Forward to JSP
    }

    private void listNews(HttpServletRequest request, HttpServletResponse response, NewsDAO newsDAO)
            throws ServletException, IOException {
        String search = request.getParameter("search");
        String sortOrder = request.getParameter("sortOrder");
        String status = request.getParameter("status");
        int page = 1;
        int recordsPerPage = 10;
        
        // Get page number from request
        if (request.getParameter("page") != null) {
            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (NumberFormatException e) {
                // Default to page 1 if parsing fails
                page = 1;
            }
        }
        
        // Retrieve news based on search and sorting criteria
        List<News> newsList = newsDAO.getNewsBySearchAndSort(search, sortOrder, status, page, recordsPerPage);
        int noOfRecords = newsDAO.getTotalNewsCount(search, status);
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
        
        // Set attributes for the JSP page
        request.setAttribute("newsList", newsList);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("search", search);
        request.setAttribute("sortOrder", sortOrder);
        request.setAttribute("status", status);
        
        request.getRequestDispatcher("/Unews.jsp").forward(request, response);
    }

    private void viewNews(HttpServletRequest request, HttpServletResponse response, NewsDAO newsDAO)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam != null && !idParam.isEmpty()) {
            try {
                int id = Integer.parseInt(idParam);
                News news = newsDAO.read(id);
                if (news != null) {
                    request.setAttribute("selectedNews", news);
                    
                    // Get a list of other news for the sidebar
                    List<News> otherNews = newsDAO.getAllNews();
                    otherNews.removeIf(n -> n.getId() == id); // Exclude the selected news
                    request.setAttribute("otherNews", otherNews);
                    
                    request.getRequestDispatcher("/NewsDetails.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                // Log the error
                System.err.println("Invalid news ID: " + idParam);
            }
        }
        // If we get here, either the ID was invalid or the news wasn't found
        response.sendRedirect(request.getContextPath() + "/news");
    }
//    private void randomNews(HttpServletRequest request, HttpServletResponse response, NewsDAO newsDAO)
//        throws ServletException, IOException {
//    List<News> newsList = newsDAO.getAllNews(); // Fetch all news items
//    Collections.shuffle(newsList); // Shuffle the list to randomize the order
//    List<News> randomNewsList = newsList.subList(0, Math.min(5, newsList.size())); // Get first 5 items or less if less available
//
//    request.setAttribute("newsList", randomNewsList); // Set the random news list in the request scope
//    request.getRequestDispatcher("/Unews.jsp").forward(request, response); // Forward to JSP
//}

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "User News Controller Servlet";
    }
}
