package controller.Train;

import dal.AccountDAO;
import dal.CompartmentDAO;
import dal.SeatDAO;
import dal.DiscountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.cartinfo;
import model.seat;
import model.Discount;
import model.compartment;

public class AddtoCart extends HttpServlet {

    private DiscountDAO discountDAO;

    @Override
    public void init() throws ServletException {
        discountDAO = new DiscountDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("AccID") == null) {
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        String compartment = request.getParameter("compartment");
        if (compartment != null && !compartment.isEmpty()) {
            try {
                SeatDAO seatDAO = new SeatDAO();
                session.setAttribute("seats", seatDAO.getAllSeatFromComaprt(Integer.parseInt(compartment)));
            } catch (NumberFormatException e) {
                System.out.println("Error parsing compartment: " + e.getMessage());
            }
        }
        // Get parameters
        String discountCode = request.getParameter("discountCode");

        // Handle adding seat to cart first
        handleSeatAddition(request, session);

        // Calculate total
        List<cartinfo> cart = (List<cartinfo>) session.getAttribute("cart");
        int total = calculateTotal(cart);

        // Handle discount
        if (discountCode != null && !discountCode.trim().isEmpty()) {
            handleDiscount(discountCode, total, request, session);
        } else {
            request.setAttribute("total", total);
        }

        

        // Forward to JSP
        

        request.getRequestDispatcher("listseattest.jsp").forward(request, response);
    }

    private void handleSeatAddition(HttpServletRequest request, HttpSession session) {
        String seatId = request.getParameter("seatId");
        if (seatId == null || seatId.isEmpty()) {
            return;
        }

        try {
            CompartmentDAO comdao = new CompartmentDAO();
            AccountDAO accDAO = new AccountDAO();
            int compartment = Integer.parseInt(request.getParameter("compartment"));
            String seattype = request.getParameter("seatType");
            String seatNumber = request.getParameter("seatNumber");
            int status = Integer.parseInt(request.getParameter("availabilityStatus"));
            int accID = (int) session.getAttribute("AccID");
            compartment compa = comdao.getCompartbyID(compartment);
            List<cartinfo> cart = (List<cartinfo>) session.getAttribute("cart");
            if (cart == null) {
                cart = new ArrayList<>();
                session.setAttribute("cart", cart);
            }

            // Check if seat already exists in cart
            boolean exists = cart.stream()
                    .anyMatch(item -> item.getSeat().getSeatID() == Integer.parseInt(seatId));

            if (!exists) {
                seat newSeat = new seat(Integer.parseInt(seatId), compa,
                        seatNumber, seattype, status);
                if (newSeat.getAvailabilityStatus() == 1) {
                    cart.add(new cartinfo(newSeat, accID, accDAO.getAccountByID(accID)));
                    request.setAttribute("test", "Addd");
                }
            }
        } catch (NumberFormatException e) {
            System.out.println("Error parsing seat parameters: " + e.getMessage());
        }
    }

    private int calculateTotal(List<cartinfo> cart) {
        if (cart == null) {
            return 0;
        }
        return cart.stream()
                .mapToInt(item -> item.getSeat().getSeatType().equals("Economy") ? 10000 : 15000)
                .sum();
    }

    private void handleDiscount(String discountCode, int total,
            HttpServletRequest request, HttpSession session) {
        try {
            Discount discount = discountDAO.getDiscountByCode(discountCode);
            if (discount != null && discount.isValid()) {
                // Calculate discounted amount
                int discountAmount = discount.calculateDiscount(total);

                // Update usage in database
                if (discountDAO.updateDiscountUsage(discount.getDiscountID())) {
                    session.setAttribute("appliedDiscount", discount);
                    request.setAttribute("total", total - discountAmount);
                    request.setAttribute("discountMessage",
                            String.format("Đã áp dụng mã giảm giá %.0f%%", discount.getDiscountPercent()));
                } else {
                    request.setAttribute("total", total);
                    request.setAttribute("discountError", "Không thể áp dụng mã giảm giá");
                }
            } else {
                request.setAttribute("total", total);
                request.setAttribute("discountError",
                        "Mã giảm giá không hợp lệ hoặc đã hết hạn sử dụng");
            }
        } catch (Exception e) {
            request.setAttribute("total", total);
            request.setAttribute("discountError", "Có lỗi xảy ra khi áp dụng mã giảm giá");
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        // Tạo đối tượng DiscountDAO
        DiscountDAO discountDAO = new DiscountDAO();

        try {
            // Lấy danh sách tất cả mã giảm giá
            List<Discount> discountList = discountDAO.getAllDiscounts();

            if (discountList != null && !discountList.isEmpty()) {
                System.out.println("Danh sách tất cả mã giảm giá:");
                for (Discount discount : discountList) {
                    System.out.println("Mã: " + discount.getDiscountID()
                            + ", Phần trăm giảm giá: " + discount.getDiscountPercent() + "%"
                            + ", Tình trạng: " + (discount.isValid() ? "Hợp lệ" : "Không hợp lệ"));
                }
            } else {
                System.out.println("Không có mã giảm giá nào trong hệ thống.");
            }
        } catch (Exception e) {
            System.out.println("Có lỗi xảy ra khi lấy danh sách mã giảm giá: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
