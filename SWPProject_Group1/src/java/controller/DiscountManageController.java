/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DiscountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date; // Thêm import này
import java.util.List;
import model.Discount;

/**
 *
 * @author P C
 */
@WebServlet("/discount-manage")
public class DiscountManageController extends HttpServlet {
    private DiscountDAO discountDAO; // Bạn cần tạo class DAO này

    @Override
    public void init() throws ServletException {
        discountDAO = new DiscountDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        List<Discount> discountList = discountDAO.getAllDiscounts();
        request.setAttribute("discountList", discountList);
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
            discount.setCurrentUsage(0);
            discount.setStatus(1);

            discountDAO.addDiscount(discount);
            
            response.sendRedirect(request.getContextPath() + "/discount-manage");
        } catch (Exception e) {
            // Xử lý lỗi
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
}