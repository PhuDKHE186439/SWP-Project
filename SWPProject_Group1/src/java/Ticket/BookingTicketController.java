package Ticket;

import dal.SeatDAO;
import dal.TicketDAO;
import dal.TrainDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.account;
import model.cartinfo;
import model.seat;
import model.train;
import model.ticket;

public class BookingTicketController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BookingTicketController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingTicketController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        try {
//            // Lấy các tham số từ request
//            String trainID = request.getParameter("trainId");
//            String price_raw = request.getParameter("price");
//            String seatID_raw = request.getParameter("seatID");
//            String fullName = request.getParameter("fullName");
//            String email = request.getParameter("email");
//            String phone = request.getParameter("phone");
//
//            // Khởi tạo các DAO
//            TrainDAO trd = new TrainDAO();
//            TicketDAO td = new TicketDAO();
//
//            // Lấy thông tin ghế
//            seat s = trd.getSeatById(Integer.parseInt(seatID_raw));
//            int compartmentID = 1;
//            int compartmentNumber = 1;
//            if (s != null && s.getCompartment() != null) {
//                compartmentID = s.getCompartment().getCompartmentID();
//                compartmentNumber = s.getCompartment().getCompartmentNumber();
//            }
//
//            // Kiểm tra đăng nhập
//            HttpSession session = request.getSession();
//            account acc = (account) session.getAttribute("acc");
//            if (acc == null) {
//                response.sendRedirect(request.getContextPath() + "/login");
//                return;
//            }
//
//            // Lấy thông tin tàu
//            train t = trd.getAllTrainByID(Integer.parseInt(trainID));
//            if (t == null) {
//                session.setAttribute("noti", "Không tìm thấy thông tin tàu!");
//                response.sendRedirect("home");
//                return;
//            }
//
//            // Tạo vé mới (đã bao gồm TicketCode)
//            int ticketID = td.CreateTicket(
//                acc.getAccountID(), 
//                price_raw, 
//                Integer.parseInt(seatID_raw),
//                t.getTrainScheduleTime(),
//                1  // ticketClass
//            );
//
//            if (ticketID == -1) {
//                session.setAttribute("noti", "Có lỗi xảy ra khi tạo vé!");
//                response.sendRedirect("home");
//                return;
//            }
//
//            // Lấy thông tin vé vừa tạo để hiển thị mã vé
//            ticket newTicket = td.getTicketbyTicketID(ticketID);
//            if (newTicket != null) {
//                session.setAttribute("noti", "Đăng ký đặt vé thành công! Mã vé của bạn là: " + 
//                                           newTicket.getTicketCode());
//            } else {
//                session.setAttribute("noti", "Đăng ký đặt vé thành công, vui lòng chờ xác nhận!");
//            }
//
//            response.sendRedirect("home");
//
//        } catch (NumberFormatException e) {
//            Logger.getLogger(BookingTicketController.class.getName()).log(Level.SEVERE, "Lỗi xử lý số", e);
//            request.getSession().setAttribute("noti", "Có lỗi xảy ra trong quá trình xử lý!");
//            response.sendRedirect("home");
//        } catch (Exception e) {
//            Logger.getLogger(BookingTicketController.class.getName()).log(Level.SEVERE, "Lỗi không xác định", e);
//            request.getSession().setAttribute("noti", "Có lỗi xảy ra trong quá trình xử lý!");
//            response.sendRedirect("home");
//        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}