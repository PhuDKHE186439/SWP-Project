// DiscountManageController.java
package controller;

import dal.DiscountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import model.Discount;

@WebServlet("/discount-manage")
public class DiscountManageController extends HttpServlet {
    private DiscountDAO discountDAO;
    private static final int ITEMS_PER_PAGE = 5;

    @Override
    public void init() throws ServletException {
        discountDAO = new DiscountDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Get filter parameters
        String searchCode = request.getParameter("searchCode");
        String status = request.getParameter("status");
        int page = request.getParameter("page") != null ? 
                  Integer.parseInt(request.getParameter("page")) : 1;

        // Get total items for pagination
        int totalItems = discountDAO.getTotalDiscounts(searchCode, status);
        int totalPages = (int) Math.ceil((double) totalItems / ITEMS_PER_PAGE);

        // Get filtered and paginated list
        List<Discount> discountList = discountDAO.getDiscounts(
            searchCode, status, page, ITEMS_PER_PAGE
        );

        // Set attributes for JSP
        request.setAttribute("discountList", discountList);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("searchCode", searchCode);
        request.setAttribute("status", status);

        request.getRequestDispatcher("/discount-manage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        switch (action) {
            case "add":
                handleAddDiscount(request, response);
                break;
            case "edit":
                handleEditDiscount(request, response);
                break;
            case "delete":
                handleDeleteDiscount(request, response);
                break;
            case "toggle-status":
                handleToggleStatus(request, response);
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/discount-manage");
        }
    }

    private void handleAddDiscount(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            Discount discount = getDiscountFromRequest(request);
            discount.setCurrentUsage(0);
            discount.setStatus(1);
            discountDAO.addDiscount(discount);
            response.sendRedirect(request.getContextPath() + "/discount-manage");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/discount-manage?error=true");
        }
    }

    private void handleEditDiscount(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            int discountId = Integer.parseInt(request.getParameter("discountId"));
            Discount discount = getDiscountFromRequest(request);
            discount.setDiscountID(discountId);
            discountDAO.updateDiscount(discount);
            response.sendRedirect(request.getContextPath() + "/discount-manage");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/discount-manage?error=true");
        }
    }

    private void handleDeleteDiscount(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            int discountId = Integer.parseInt(request.getParameter("discountId"));
            discountDAO.deleteDiscount(discountId);
            response.sendRedirect(request.getContextPath() + "/discount-manage");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/discount-manage?error=true");
        }
    }

    private void handleToggleStatus(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            int discountId = Integer.parseInt(request.getParameter("discountId"));
            discountDAO.toggleDiscountStatus(discountId);
            response.sendRedirect(request.getContextPath() + "/discount-manage");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/discount-manage?error=true");
        }
    }

    private Discount getDiscountFromRequest(HttpServletRequest request) {
        String code = request.getParameter("code");
        double discountPercent = Double.parseDouble(request.getParameter("discountPercent"));
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        Date endDate = Date.valueOf(request.getParameter("endDate"));
        int maxUsage = Integer.parseInt(request.getParameter("maxUsage"));

        Discount discount = new Discount();
        discount.setCode(code);
        discount.setDiscountPercent(discountPercent);
        discount.setStartDate(startDate);
        discount.setEndDate(endDate);
        discount.setMaxUsage(maxUsage);
        return discount;
    }
}