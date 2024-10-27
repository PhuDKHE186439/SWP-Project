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
import java.util.List;

@WebServlet(name = "UserNewsController", urlPatterns = {"/Unews"})
public class UserNewsController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        NewsDAO newsDAO = new NewsDAO();
        String action = request.getParameter("action");

        if (action == null) {
            action = "list"; // Default action to show list of news
        }

        switch (action) {
            case "latest":
                latestNews(request, response, newsDAO);
                break;
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
        News latestNews = newsDAO.getLatestNews(); // Fetch the latest news
        if (latestNews != null) {
            request.setAttribute("latestNews", latestNews); // Set the latest news in the request scope
            HttpSession session = request.getSession();
            session.setAttribute("latestNews", latestNews); // Store in session
            request.getRequestDispatcher("/Unews.jsp").forward(request, response); // Forward to JSP
        } else {
            // Handle case where no latest news is available
            response.sendRedirect("error.jsp?message=No%20Latest%20News%20Found");
        }
    }

    private void listNews(HttpServletRequest request, HttpServletResponse response, NewsDAO newsDAO)
            throws ServletException, IOException {
        String search = request.getParameter("search");
        String sortOrder = request.getParameter("sortOrder");
        String status = request.getParameter("status");
        int page = 1;
        int recordsPerPage = 10;

        if (request.getParameter("page") != null) {
            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (NumberFormatException e) {
                page = 1; // Fallback to default page if invalid input
            }
        }

        // Retrieve filtered news based on search and sorting
        List<News> newsList = newsDAO.getNewsBySearchAndSort(search, sortOrder, status, page, recordsPerPage);
        int noOfRecords = newsDAO.getTotalNewsCount(search, status);
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

        request.setAttribute("newsList", newsList);
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("search", search);
        request.setAttribute("sortOrder", sortOrder);
        request.setAttribute("status", status);

        HttpSession session = request.getSession();
        session.setAttribute("newsList", newsList); // Store in session for pagination
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

                    // Get additional news for the sidebar
                    List<News> otherNews = newsDAO.getAllNews();
                    otherNews.removeIf(n -> n.getId() == id); // Exclude the selected news from the list
                    request.setAttribute("otherNews", otherNews);

                    HttpSession session = request.getSession();
                    session.setAttribute("selectedNews", news); // Store selected news in session
                    request.getRequestDispatcher("/NewsDetails.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                // Log invalid news ID
                System.err.println("Invalid news ID: " + idParam);
            }
        }
        // Redirect if news not found or invalid ID
        response.sendRedirect(request.getContextPath() + "/Unews?action=list");
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
