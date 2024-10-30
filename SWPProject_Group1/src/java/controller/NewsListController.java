package controller;

import dal.NewsDAO;
import model.News;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

@WebServlet(name = "NewsListController", urlPatterns = {"/UnewsList"})
public class NewsListController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        NewsDAO newsDAO = new NewsDAO();
        String action = request.getParameter("action");

        if (action == null) {
            action = "random"; // Default action to show random news
        }

        switch (action) {
//            case "latest":
//                latestNews(request, response, newsDAO);
//                break;
            case "view":
                viewNews(request, response, newsDAO);
                break;
            case "list":
            default:
                listNews(request, response, newsDAO);
                break;
        }
    }

//    private void latestNews(HttpServletRequest request, HttpServletResponse response, NewsDAO newsDAO)
//            throws ServletException, IOException {
//        News latestNews = newsDAO.getLatestNews(); // Fetch latest news
//        request.setAttribute("latestNews", latestNews); // Set the latest news in the request scope
//        HttpSession session = request.getSession(); // Get session
//        session.setAttribute("latestNews", latestNews); // Store in session
//        request.getRequestDispatcher("/NewsList.jsp").forward(request, response); // Forward to JSP
//    }

    private void listNews(HttpServletRequest request, HttpServletResponse response, NewsDAO newsDAO)
            throws ServletException, IOException {
        String search = request.getParameter("search");
        String sortOrder = request.getParameter("sortOrder");
        String status = request.getParameter("status");
        int page = 1;
        int recordsPerPage = 9;

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

        HttpSession session = request.getSession(); // Get session
        session.setAttribute("newsList", newsList); // Store in session for access later

        request.getRequestDispatcher("/NewsList.jsp").forward(request, response);
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
                    
                    HttpSession session = request.getSession(); // Get session
                    session.setAttribute("selectedNews", news); // Store selected news in session
                    
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
