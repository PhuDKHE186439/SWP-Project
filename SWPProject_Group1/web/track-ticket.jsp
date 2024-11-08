<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tra cứu vé | Train Ticket</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container-fluid py-5" style="min-height: 80vh;">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card shadow" style="background-color: #f9f9f9; border: 2px solid #000; border-radius: 5px;">
                        <div class="card-body">
                            <h3 class="card-title text-center mb-4">Tra cứu thông tin vé</h3>
                            
                            <form action="track-ticket" method="POST">
                                <div class="mb-3">
                                    <label for="ticketCode" class="form-label">Mã vé:</label>
                                    <input type="text" class="form-control" id="ticketCode" name="ticketCode" 
                                           required placeholder="Nhập mã vé (VD: TK240509123)">
                                </div>
                                
                                <div class="mb-3">
                                    <label for="phone" class="form-label">Số điện thoại:</label>
                                    <input type="tel" class="form-control" id="phone" name="phone" 
                                           required placeholder="Nhập số điện thoại">
                                </div>
                                
                                <div class="d-grid">
                                    <button type="submit" class="btn btn-primary w-100">Tra cứu</button>
                                </div>
                            </form>
                            
                            <c:if test="${not empty errorMessage}">
                                <div class="alert alert-danger mt-3" role="alert">
                                    ${errorMessage}
                                </div>
                            </c:if>
                            
                            <c:if test="${not empty ticket}">
                                <div class="mt-4">
                                    <h4 class="mb-3">Thông tin vé</h4>
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="row mb-2">
                                                <div class="col-5 fw-bold">Mã vé:</div>
                                                <div class="col-7">${ticket.ticketCode}</div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-5 fw-bold">Hạng vé:</div>
                                                <div class="col-7">${ticket.ticketClass.categoryName}</div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-5 fw-bold">Tàu:</div>
                                                <div class="col-7">${ticket.seat.compartment.train.trainName}</div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-5 fw-bold">Toa:</div>
                                                <div class="col-7">${ticket.seat.compartment.compartmentNumber}</div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-5 fw-bold">Ghế:</div>
                                                <div class="col-7">${ticket.seat.seatNumber}</div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-5 fw-bold">Ga đi:</div>
                                                <div class="col-7">${ticket.seat.compartment.train.startLocation.locationName}</div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-5 fw-bold">Ga đến:</div>
                                                <div class="col-7">${ticket.seat.compartment.train.arrivalLocation.locationName}</div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-5 fw-bold">Thời gian:</div>
                                                <div class="col-7">${ticket.seat.compartment.train.trainScheduleTime}</div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-5 fw-bold">Giá vé:</div>
                                                <div class="col-7">${String.format("%,.0f", ticket.ticketPrice)} VNĐ</div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-5 fw-bold">Trạng thái:</div>
                                                <div class="col-7">
                                                    <c:choose>
                                                        <c:when test="${ticket.status == 0}">
                                                            <span class="badge bg-warning">Chờ thanh toán</span>
                                                        </c:when>
                                                        <c:when test="${ticket.status == 1}">
                                                            <span class="badge bg-success">Đã thanh toán</span>
                                                        </c:when>
                                                        <c:when test="${ticket.status == 2}">
                                                            <span class="badge bg-danger">Đã hủy</span>
                                                        </c:when>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <jsp:include page = "footer1.jsp"></jsp:include>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js"></script>
    </body>
</html>