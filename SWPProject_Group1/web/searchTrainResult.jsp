<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, model.account, model.train, dal.AccountDAO, model.role, dal.RoleDAO, java.util.ArrayList"%>
<%@page session="true"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
    AccountDAO accountDAO = new AccountDAO();
    List<account> accounts = accountDAO.getAllAccount(); // Make sure this retrieves the accounts list
%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <jsp:include page="header1.jsp"/>
        <style>


            .train-head {
                display: flex;
                flex-direction: column;
                align-items: center;
                background-color: #444;
                border-radius: 15px 15px 0 0;
                position: relative;
                margin: 50px auto;
                border-bottom: 7.5px solid #333;
                padding: 10px;
                box-sizing: border-box;
                width: 250px;
                min-width: 210px;
                cursor: pointer;
            }

            .train-name {
                color: white;
                font-weight: bold;
                font-size: 16px;
                background-color: #222;
                border-radius: 5px;
                padding: 2px 5px;
                text-align: center;
                white-space: nowrap;
                margin-bottom: 10px;
            }


            .train-window {
                width: 100%;
                height: 120px;
                background-color: #87CEEB;
                border-radius: 5px;
                border: 2px solid #444;
                position: relative;
                padding: 10px;
                box-sizing: border-box;
                display: flex;
                flex-direction: column;
                justify-content: center;
                color: #333;
                margin-bottom: 23px;
            }

            .light {
                width: 30px;
                height: 30px;
                background-color: yellow;
                border-radius: 50%;
                position: absolute;
                bottom: 0px;
                box-shadow: 0 0 15px yellow;
            }

            .light.left {
                left: 45px;
            }

            .light.right {
                right: 45px;
            }

            .train-info {
                font-size: 14px;
                text-align: left;
                line-height: 0.7;
                margin: 0;
            }

        </style>
        <style>
            .seat-table {
                border-collapse: collapse;
                margin: 20px 0;
                width: 100%;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .seat {
                width: 60px;
                height: 60px;
                background-color: #4CAF50;
                color: white;
                text-align: center;
                line-height: 60px;
                margin: 5px;
                position: relative;
                cursor: pointer;
                border: none;
                border-radius: 5px;
            }
            .tooltip {
                visibility: hidden;
                width: 120px;
                background-color: #555;
                color: #fff;
                text-align: center;
                border-radius: 6px;
                padding: 5px;
                position: absolute;
                z-index: 1;
                bottom: 100%;
                left: 50%;
                margin-left: -60px;
                opacity: 0;
                transition: opacity 0.3s;
            }
            .seat:hover .tooltip {
                visibility: visible;
                opacity: 1; /* Hiển thị tooltip khi hover */
            }

            .reserved {
                background-color: red; /* Change the color as needed */
                color: white;
            }

            .seat {
                padding: 10px;
                margin: 5px;
                cursor: pointer;
            }

            .seat.booked {
                background-color: gray;
                color: red;
                pointer-events: none; /* Ngăn người dùng nhấp vào ghế */
                cursor: not-allowed; /* Thay đổi con trỏ để hiển thị ghế không thể nhấp */
            }

        </style>
        <style>
            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
            }

            .modal-content {
                background-color: #fefefe;
                margin: 15% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 600px;
            }

            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
        </style>
    </head>
    <body>   
        
        <div class="container-xxl position-relative bg-white d-flex p-0">
            <!--<div class="container-xxl position-relative bg-white d-flex p-0">-->
            <!-- Spinner Start -->
            <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!-- Spinner End -->


            <!-- Sidebar Start -->  
            <!-- Sidebar End -->
            <div class="content open">
                <!-- Navbar Start -->
               
                <!-- Navbar End -->
                <div class="form-container border p-4 rounded shadow">
                    <div class="d-flex flex-nowrap overflow-auto" style="gap: 10px;">
                        <c:forEach items="${trains}" var="t">
                            <div class="train-head" data-train-id="${t.getTrainID()}" data-seats="${t.numberOfSeat}" onclick="showSeats(this)">
                                <div class="train-name">
                                    ${t.trainName}
                                </div> <!-- Tên tàu dài -->
                                <div class="train-window">
                                    <div class="train-info">
                                        <p><strong>Thời gian khởi hành</strong> 
                                            ${t.trainScheduleTime}
                                        </p>
                                        <p><strong>Số chỗ ngồi trống:</strong> 
                                            ${t.numberOfSeat - usedSeatNumber[t.trainID]}
                                        </p>
                                        <p><strong>Tổng số chỗ:</strong> 
                                            ${t.numberOfSeat}
                                        </p>
                                    </div>
                                </div>

                                <div class="light left"></div> 
                                <div class="light right"></div> 
                            </div>
                        </c:forEach>
                    </div>
                    <div class="w-100"> <!-- w-100 để thẻ div rộng 100% theo thẻ cha -->
                        <table class="seat-table">
                            <tbody id="seatTableBody">
                                <!-- Hàng ghế sẽ được tạo động ở đây -->
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Footer Start -->
                


                <!-- Footer End -->
            </div>


            <!-- Back to Top -->
        </div>

        <div id="ticketModal" class="modal" style="display:none;">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <h2>Thông tin vé</h2>
                <p id="trainInfo"></p>
                <p id="routeInfo"></p>
                <p id="scheduleInfo"></p>
                <p id="seatInfo"></p>
                <p id="priceInfo"></p>
                <button class="btn btn-primary">
                    <a id="confirmLink" style="color: white; text-decoration: none;">Xác nhận đặt vé</a>
                </button>
            </div>
        </div>


        <script type="text/javascript">
            var bookedSeats = ${bookedSeats};
            function showSeats(trainElement) {
                // Lấy số lượng ghế từ thuộc tính data-seats của phần tử tàu
                var seatCount = trainElement.getAttribute("data-seats");
                var trainID = trainElement.getAttribute("data-train-id");
                renderSeats(seatCount, trainID);
            }

            function renderSeats(totalSeats, trainId) {
                var seatsPerRow = 10;
                var seatTableBody = document.getElementById("seatTableBody");
                // Xóa nội dung cũ nếu có
                seatTableBody.innerHTML = "";
                // Lấy danh sách ghế đã đặt cho tàu này
                var bookedSeatsForTrain = bookedSeats[trainId] || [];
                for (let i = 1; i <= totalSeats; i++) {
                    if (i % seatsPerRow === 1) {
                        var row = document.createElement("tr");
                        seatTableBody.appendChild(row);
                    }

                    var cell = document.createElement("td");
                    var seatDiv = document.createElement("div");
                    seatDiv.className = "seat";
                    seatDiv.innerText = i;
                    var seatInfo = bookedSeatsForTrain.find(seat => seat.seatNumber === i);
                    if (seatInfo) {
                        seatDiv.classList.add("booked");
                    }
                    // Tạo tooltip chi tiết cho ghế
                    var tooltip = document.createElement("span");
                    tooltip.className = "tooltip";
                    if (seatInfo) {
                        tooltip.innerHTML =
                                "Loại ghế: " + seatInfo.seatType + "<br>" +
                                "Trạng thái: " + (seatInfo.availabilityStatus === 1 ? "Đã đặt" : "Trống") + "<br>" +
                                "Số ghế: " + seatInfo.seatNumber + "<br>" +
                                "Giá: " + (seatInfo.seatType === 'First Class' ? "100" : "300");
                    } else {
                        tooltip.innerHTML =
                                "Loại ghế: First Class<br>" +
                                "Trạng thái: Trống<br>" +
                                "Số ghế: " + i + "<br>" +
                                "Giá: 100";
                    }
                    seatDiv.appendChild(tooltip);
                    seatDiv.onclick = function () {
                        if (!seatInfo) {
                            seatInfo = {
                                seatType: 'First Class',
                                price: 100,
                                seatNumber: i,
                                seatID: i
                            };
                        } else {
                            seatInfo = {
                                seatType: seatInfo.seatType,
                                price: (seatInfo.seatType === 'First Class' ? 100 : 300),
                                seatNumber: seatInfo.seatNumber,
                                seatID: seatInfo.seatID // Không cần getSeatID(), chỉ cần seatID
                            };
                        }
                        goToTicketInfo(trainId, seatInfo);
                    };
                    cell.appendChild(seatDiv);
                    row.appendChild(cell);
                }
            }

            function goToTicketInfo(trainId, seatInfo) {
                console.log("Train ID:", trainId);
                console.log("Seat Info:", seatInfo);
                var url = `/SWPProject_Group1/tickets?action=view&trainId=` + trainId +
                        `&seatType=` + seatInfo.seatType +
                        `&seatNumber=` + seatInfo.seatNumber +
                        `&price=` + seatInfo.price +
                        `&seatID=` + seatInfo.seatID;
                fetch(url)
                        .then(response => response.json())
                        .then(data => {
                            if (data.error) {
                                alert("Có lỗi xảy ra khi nhận dữ liệu từ ticket server: " + data.error);
                                return;
                            }
                            showModal(data);
                        })
                        .catch(error => {
                            console.error("Lỗi khi gửi yêu cầu:", error);
                        });
            }


            function showModal(data) {
                console.log("data: ", data);
                // Điền thông tin vào các phần tử trong modal
                document.getElementById("trainInfo").innerText = `Tên tàu:` + data.trainName + ` (ID:` + data.trainId + `)`;
                document.getElementById("routeInfo").innerText = `Hành trình:` + data.startLocation + ` - ` + data.endLocation;
                document.getElementById("scheduleInfo").innerText = `Ngày khởi hành:` + data.trainScheduleTime;
                document.getElementById("seatInfo").innerText = `Loại ghế:` + data.seatType + `, Số ghế:` + data.seatNumber + `,(Seat ID:` + data.seatID + `)`;
                document.getElementById("priceInfo").innerText = `Giá vé:` + data.price + ` VND`;

                // Tạo URL cho trang thanh toán
//                var paymentUrl = `/SWPProject_Group1/payment.jsp?trainId=` + data.trainId + `&price=` + data.price + `&seatID=` + data.seatID;
                var paymentUrl = `/SWPProject_Group1/vnpay?trainId=` + data.trainId + `&price=` + data.price + `&seatID=` + data.seatID;
                // Gán URL vào thuộc tính href của thẻ <a> trong nút
                document.getElementById("confirmLink").href = paymentUrl;

                // Hiển thị modal
                var modal = document.getElementById("ticketModal");
                modal.style.display = "block";
            }

            function closeModal() {
                var modal = document.getElementById("ticketModal");
                modal.style.display = "none";
            }


        </script>
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="bssets/lib/chart/chart.min.js"></script>
        <script src="bssets/lib/easing/easing.min.js"></script>
        <script src="bssets/lib/waypoints/waypoints.min.js"></script>
        <script src="bssets/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="bssets/lib/tempusdominus/js/moment.min.js"></script>
        <script src="bssets/lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="bssets/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="bssets/js/main.js"></script>
        <script src="assets/js/Admin.js"></script>
    </body>
        <jsp:include page="footer1.jsp"/>

</html>