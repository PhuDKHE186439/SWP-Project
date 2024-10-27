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

<%
    RoleDAO roleDAO = new RoleDAO();
    List<role> roles = roleDAO.getAllRoles();
    List<train> trainList = new ArrayList<>();
      
    trainList.add(new train(1, "08:00", "Train A", "50", 1, 2));
    trainList.add(new train(2, "09:00", "Train B", "60", 1, 3));
    
    trainList.add(new train(2, "09:00", "Train B", "60", 1, 3));
    trainList.add(new train(3, "10:00", "Train C", "70", 2, 3));
    trainList.add(new train(2, "09:00", "Train B", "60", 1, 3));
    trainList.add(new train(3, "10:00", "Train C", "70", 2, 3));
    trainList.add(new train(3, "10:00", "Train C", "70", 2, 3));
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Train Traveler</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="bssets/img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="bssets/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="bssets/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="bssets/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="bssets/css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/Footer.css" />
        <style>
            body {
                font-family: Arial, sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                background-color: #f0f0f0;
            }

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
            <div class="sidebar pe-4 pb-3">
                <nav class="navbar bg-light navbar-light">
                    <a href="home.jsp" class="navbar-brand mx-4 mb-3">
                        <h3 class="text-primary"> <i class="fa fa-hashtag me-2"></i>Train Traveler</h3>
                    </a>
                    <div class="d-flex align-items-center ms-4 mb-4">
                        <div class="position-relative">
                            <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                            <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                        </div>
                        <div class="ms-3">
                            <h6 class="mb-0"><%= session.getAttribute("userName") %></h6>
                            <span><%= session.getAttribute("userRole") %></span>
                        </div>

                    </div>
                    <div class="navbar-nav w-100">
                        <a href="index.html" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Elements</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="button.html" class="dropdown-item">Buttons</a>
                                <a href="typography.html" class="dropdown-item">Typography</a>
                                <a href="element.html" class="dropdown-item">Other Elements</a>
                            </div>
                        </div>
                        <a href="widget.html" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Widgets</a>
                        <a href="form.html" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>Forms</a>
                        <a href="table.html" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Tables</a>
                        <a href="chart.html" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>Charts</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Pages</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="signin.html" class="dropdown-item">Sign In</a>
                                <a href="signup.html" class="dropdown-item">Sign Up</a>
                                <a href="404.html" class="dropdown-item">404 Error</a>
                                <a href="blank.html" class="dropdown-item">Blank Page</a>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>      
            <!-- Sidebar End -->
            <div class="content">
                <!-- Navbar Start -->
                <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                    <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                        <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                    </a>
                    <a href="#" class="sidebar-toggler flex-shrink-0">
                        <i class="fa fa-bars"></i>
                    </a>
                    <form class="d-none d-md-flex ms-4">
                        <input class="form-control border-0" type="search" placeholder="Search">
                    </form>
                    <div class="navbar-nav align-items-center ms-auto">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <i class="fa fa-envelope me-lg-2"></i>
                                <span class="d-none d-lg-inline-flex">Message</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <a href="#" class="dropdown-item">
                                    <div class="d-flex align-items-center">
                                        <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                        <div class="ms-2">
                                            <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                            <small>15 minutes ago</small>
                                        </div>
                                    </div>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">
                                    <div class="d-flex align-items-center">
                                        <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                        <div class="ms-2">
                                            <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                            <small>15 minutes ago</small>
                                        </div>
                                    </div>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">
                                    <div class="d-flex align-items-center">
                                        <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                        <div class="ms-2">
                                            <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                            <small>15 minutes ago</small>
                                        </div>
                                    </div>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item text-center">See all message</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <i class="fa fa-bell me-lg-2"></i>
                                <span class="d-none d-lg-inline-flex">Notificatin</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <a href="#" class="dropdown-item">
                                    <h6 class="fw-normal mb-0">Profile updated</h6>
                                    <small>15 minutes ago</small>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">
                                    <h6 class="fw-normal mb-0">New user added</h6>
                                    <small>15 minutes ago</small>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">
                                    <h6 class="fw-normal mb-0">Password changed</h6>
                                    <small>15 minutes ago</small>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item text-center">See all notifications</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <img class="rounded-circle me-lg-2" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                <span class="d-none d-lg-inline-flex">John Doe</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <a href="#" class="dropdown-item">My Profile</a>
                                <a href="#" class="dropdown-item">Settings</a>
                                <a href="#" class="dropdown-item">Log Out</a>
                            </div>
                        </div>
                    </div>
                </nav>
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
                <iframe id="footer-frame" src="Footer.jsp" style="width: 100%; border: none;" scrolling="no"></iframe>

                <script>
                    const iframe = document.getElementById('footer-frame');
                    iframe.onload = function () {
                        // Adjust the height of the iframe to fit its content
                        iframe.style.height = iframe.contentWindow.document.body.scrollHeight + 'px';
                    };
                </script>


                <!-- Footer End -->
            </div>


            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
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
                var url = `/SWPProject/tickets?action=view&trainId=` + trainId +
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
                var paymentUrl = `/SWPProject/payment.jsp?trainId=` + data.trainId + `&price=` + data.price + `&seatID=` + data.seatID;
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

</html>