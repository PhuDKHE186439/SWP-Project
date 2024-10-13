package controller;

import dal.NewsDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.News;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

@WebServlet("/news/*")
public class NewsController extends HttpServlet {
    private NewsDAO newsDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        newsDAO = new NewsDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getPathInfo();
        if (action == null) {
            action = "/";
        }

        try {
            switch (action) {
                case "/list":
                case "/":
                case "/search":
                    searchNews(request, response);
                    break;
                case "/view":
                    viewNews(request, response);
                    break;
                default:
                    searchNews(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getPathInfo();
        if (action == null) {
            action = "/";
        }

        try {
            switch (action) {
                case "/create":
                    createNews(request, response);
                    break;
                case "/update":
                    updateNews(request, response);
                    break;
                case "/delete":
                    deleteNews(request, response);
                    break;
                default:
                    searchNews(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void searchNews(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
    String search = request.getParameter("search");
    String sortOrder = request.getParameter("sortOrder");
    String status = request.getParameter("status"); // Get status filter from request

    if (sortOrder == null) {
        sortOrder = "latest"; // Default sort order
    }
    int page = 1;
    try {
        page = Integer.parseInt(request.getParameter("page"));
    } catch (NumberFormatException e) {
        // If page is not a valid number, default to 1
    }
    int recordsPerPage = 5; // You can make this configurable

    // Pass the status parameter to the DAO method
    List<News> searchResults = newsDAO.getNewsBySearchAndSort(search, sortOrder, status, page, recordsPerPage);
    int totalRecords = newsDAO.getTotalNewsCount(search, status); // Update total count query to consider status

    request.setAttribute("newsList", searchResults);
    request.setAttribute("currentPage", page);
    request.setAttribute("totalPages", (int) Math.ceil((double) totalRecords / recordsPerPage));
    request.setAttribute("search", search);
    request.setAttribute("sortOrder", sortOrder);
    request.setAttribute("status", status); // Set status in the request
    request.getRequestDispatcher("/NewsManagement.jsp").forward(request, response);
}


    private void viewNews(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        News news = newsDAO.read(id);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(convertNewsToJson(news));
    }

    private void createNews(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String image = request.getParameter("image");
        String location = request.getParameter("location");
        int status = Integer.parseInt(request.getParameter("status"));
        
        News news = new News();
        news.setTitle(title);
        news.setContent(content);
        news.setImage(image);
        news.setLocation(location);
        news.setStatus(status);
        news.setCreated_at(new Timestamp(System.currentTimeMillis()));
        news.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        
        newsDAO.create(news);
        response.sendRedirect(request.getContextPath() + "/news/list");
    }

    private void updateNews(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String image = request.getParameter("image");
        String location = request.getParameter("location");
        int status = Integer.parseInt(request.getParameter("status"));
        
        News news = newsDAO.read(id);
        news.setTitle(title);
        news.setContent(content);
        news.setImage(image);
        news.setLocation(location);
        news.setStatus(status);
        news.setUpdated_at(new Timestamp(System.currentTimeMillis()));
        
        newsDAO.update(news);
        response.sendRedirect(request.getContextPath() + "/news/list");
    }

    private void deleteNews(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        newsDAO.delete(id);
        response.sendRedirect(request.getContextPath() + "/news/list");
    }

    private String convertNewsToJson(News news) {
        return String.format(
            "{\"id\": %d, \"title\": \"%s\", \"content\": \"%s\", \"image\": \"%s\", \"location\": \"%s\", \"status\": %d, \"created_at\": \"%s\", \"updated_at\": \"%s\"}",
            news.getId(),
            escapeJson(news.getTitle()),
            escapeJson(news.getContent()),
            escapeJson(news.getImage()),
            escapeJson(news.getLocation()),
            news.getStatus(),
            news.getCreated_at().toString(),
            news.getUpdated_at().toString()
        );
    }

    private String escapeJson(String input) {
        if (input == null) {
            return "";
        }
        return input.replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "\\r");
    }
}