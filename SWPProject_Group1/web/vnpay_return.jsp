<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="vnpay.Config"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="dal.SeatDAO"%>
<%@page import="dal.TicketDAO"%>
<%@page import="model.*"%>
<%@page import="email.Email"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>KẾT QUẢ THANH TOÁN</title>
        <!-- Bootstrap core CSS -->     
        <link href="assets/bootstrap.min.css" rel="stylesheet"/>
        <!-- Custom styles for this template -->
        <link href="assets/jumbotron-narrow.css" rel="stylesheet"> 
        <script src="assets/jquery-1.11.3.min.js"></script>
        <jsp:include page="header1.jsp" />
    </head>
    <body>
        <%
            //Begin process return from VNPAY
            Map fields = new HashMap();
            for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    fields.put(fieldName, fieldValue);
                }
            }

            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            if (fields.containsKey("vnp_SecureHashType")) {
                fields.remove("vnp_SecureHashType");
            }
            if (fields.containsKey("vnp_SecureHash")) {
                fields.remove("vnp_SecureHash");
            }
            String signValue = Config.hashAllFields(fields);

        %>
        <!--Begin display -->
        <div class="container">
            <div class="header clearfix"></div>
            <h3 class="text-center">KẾT QUẢ THANH TOÁN</h3>
            <div class="header clearfix"></div>
            <div class="table-responsive">
                <div class="form-group">
                    <label >Mã giao dịch thanh toán:</label>
                    <label><%=request.getParameter("vnp_TxnRef")%></label>
                </div>    
                <div class="form-group">
                    <label >Số tiền:</label>
                    <label><%=request.getParameter("vnp_Amount").substring(0,request.getParameter("vnp_Amount").length()-2)%></label>
                </div>  
                <div class="form-group">
                    <label >Mô tả giao dịch:</label>
                    <label><%=request.getParameter("vnp_OrderInfo")%></label>
                </div> 
                <div class="form-group">
                    <label >Mã lỗi thanh toán:</label>
                    <label><%=request.getParameter("vnp_ResponseCode")%></label>
                </div> 
                <div class="form-group">
                    <label >Mã giao dịch tại CTT VNPAY-QR:</label>
                    <label><%=request.getParameter("vnp_TransactionNo")%></label>
                </div> 
                <div class="form-group">
                    <label >Mã ngân hàng thanh toán:</label>
                    <label><%=request.getParameter("vnp_BankCode")%></label>
                </div> 
                <div class="form-group">
                    <label >Thời gian thanh toán:</label>
                    <label><%=request.getParameter("vnp_PayDate")%></label>
                </div> 
                <div class="form-group">
                    <label >Tình trạng giao dịch:</label>
                    <label>
                        <%
                            if (signValue.equals(vnp_SecureHash)) {
                                if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                                    out.print("Thành công");
                                    
                                    //send mail;Bạn
Email e = new Email();
account acc = (account)session.getAttribute("accInfo");
e.sendEmail2(acc.getEmail(), "BẠN ĐÃ BOOK VÉ THÀNH CÔNG <br>" +" <div class=\"form-group\">\n" +
"                    <label >Mã giao dịch thanh toán:</label>\n" +
"                    <label>" + request.getParameter("vnp_TxnRef")+"</label>\n" +
"                </div>    \n" +
"                <div class=\"form-group\">\n" +
"                    <label >Số tiền:</label>\n" +
"                    <label>" + request.getParameter("vnp_Amount").substring(0,request.getParameter("vnp_Amount").length()-2)+ "</label>\n" +
"                </div>  \n" +
"                <div class=\"form-group\">\n" +
"                    <label >Mô tả giao dịch:</label>\n" +
"                    <label>"+request.getParameter("vnp_OrderInfo")+"</label>\n" +
"                </div> \n" +
"                <div class=\"form-group\">\n" +
"                    <label >Mã lỗi thanh toán:</label>\n" +
"                    <label>"+request.getParameter("vnp_ResponseCode")+"</label>\n" +
"                </div> \n" +
"                <div class=\"form-group\">\n" +
"                    <label >Mã giao dịch tại CTT VNPAY-QR:</label>\n" +
"                    <label>"+request.getParameter("vnp_TransactionNo")+"</label>\n" +
"                </div> \n" +
"                <div class=\"form-group\">\n" +
"                    <label >Mã ngân hàng thanh toán:</label>\n" +
"                    <label>"+request.getParameter("vnp_BankCode")+"</label>\n" +
"                </div> \n" +
"                <div class=\"form-group\">\n" +
"                    <label >Thời gian thanh toán:</label>\n" +
"                    <label>"+request.getParameter("vnp_PayDate")+"</label>\n" +
"                </div> ");

                                     List<cartinfo> cart = (List<cartinfo>) session.getAttribute("cart");
                                      for (cartinfo cart1 : cart) {
               //update status
               
                           SeatDAO sdao = new SeatDAO();
                           TicketDAO ticketDAO = new TicketDAO();
            sdao.updateStatusSeat(cart1.getSeat().getSeatID(), 0);
                           ticketDAO.CreateTicket(cart1.getAcc().getPassengerID(), cart1.getSeat().getSeatType().equals("Economy") ? "10000" : "15000", cart1.getSeat().getSeatID(), cart1.getSeat().getCompartment().getTrain().getTrainScheduleTime(), cart1.getSeat().getSeatType().equals("Economy") ? 2 : 1);
            ticketDAO.CreatePayment(ticketDAO.getNewestTicketCreated(cart1.getAcc().getPassengerID()).getTicketID(), "Bank", cart1.getAcc().getPassengerID(), cart1.getSeat().getSeatType().equals("Economy") ? "10000" : "15000");
                        %><%

            }
//clear cart
session.removeAttribute("cart");
                                } else {
                                    out.print("Không thành công");
                                }

                            } else {
                                out.print("invalid signature");
                            }
                        %></label>
                </div> 
                <div class="form-group">
                    <button class="btn btn-success me-2" onclick="window.location.href = 'home1';">Return HomePage</button>
                </div> 
            </div>
            <p>
                &nbsp;
            </p>

            <script>
                $(document).ready(function () {

                    /*****Fixed Menu******/
                    var secondaryNav = $('.cd-secondary-nav'),
                            secondaryNavTopPosition = secondaryNav.offset().top;
                    $(window).on('scroll', function () {
                        var navbar_height = document.querySelector('.navbar').offsetHeight;
                        var top = 30;
                        if ($(window).scrollTop() > secondaryNavTopPosition) {
                            secondaryNav.addClass('is-fixed');
                            $("body").css("padding-top", navbar_height);
                        } else {
                            secondaryNav.removeClass('is-fixed');
                            $("body").css("padding-top", 0);
                        }
                    });

                });
                $("#menu-close").click(function (e) {
                    e.preventDefault();
                    $("#sidebar-wrapper").toggleClass("active");
                });
                $("#menu-toggle").click(function (e) {
                    e.preventDefault();
                    $("#sidebar-wrapper").toggleClass("active");
                });

                $(document).ready(function () {
                    $('.ziehharmonika').ziehharmonika({
                        collapsible: true,
                        prefix: 'â˜…'
                    });
                });
            </script>
            <script src="js/ziehharmonika.js"></script>
        </div>
    </body>
    <jsp:include page="footer1.jsp" />
</html>
