<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, model.account, model.train, dal.AccountDAO, model.role, dal.RoleDAO, java.util.ArrayList, dal.TrainDAO"%>
<%@page session="true"%>
<%
    AccountDAO accountDAO = new AccountDAO();
    List<account> accounts = accountDAO.getAllAccount(); // Make sure this retrieves the accounts list
%>

<%
    RoleDAO roleDAO = new RoleDAO();
    List<role> roles = roleDAO.getAllRoles();
    TrainDAO trainDAO = new TrainDAO();
    List<train> trainList = trainDAO.getAllTrain();
      
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
                            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <i class="fa fa-envelope me-lg-2"></i>
                                <span class="d-none d-lg-inline-flex">Make Feedback</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <a class="dropdown-item">
                                    <h6 class="fw-normal mb-0">FeedBack Message</h6>
                                    <form method="post" action="feedbackforcustomer">
                                        <input name="feedback"  type="text">
                                        <button name="submit" type="submit" value="Submit" class="btn button-md">Submit</button>
                                    </form>
                                </a>
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
                                <span class="d-none d-lg-inline-flex">Profile</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <a href="userprofile" class="dropdown-item">My Profile</a>
                                <a href="logout" class="dropdown-item">Log Out</a>
                            </div>
                        </div>
                    </div>
                </nav>
                <!-- Navbar End -->
                <div class="form-container border p-4 rounded shadow">
                    <div class="d-flex flex-nowrap overflow-auto" style="gap: 10px;">
                        <%
                        // Lặp qua danh sách tàu và truyền từng tàu vào trang trainInfomation.jsp
                        for (train t : trainList) {
                            // Truyền thông tin của từng tàu
                            int trainID = t.getTrainID(); // Thông tin ID tàu
                            String departureTime = t.getTrainScheduleTime(); // Thời gian đi
                            String trainName = t.getTrainName(); // Tên tàu
                            int totalSeats = t.getNumberOfSeat(); // Tổng số chỗ (chuyển đổi từ String sang int)
                            int availableSeats = totalSeats - 10; // Giả sử có 10 chỗ đã được đặt trước (số này cần được thay đổi theo logic thực tế)

                        %>
                        <!-- Hiển thị thông tin tàu -->
                        <jsp:include page="trainInfomation.jsp">
                            <jsp:param name="departureTime" value="<%= departureTime %>" />
                            <jsp:param name="arrivalTime" value="Chưa có thông tin" />
                            <jsp:param name="availableSeats" value="<%= availableSeats %>" />
                            <jsp:param name="totalSeats" value="<%= totalSeats %>" />
                            <jsp:param name="trainName" value="<%= trainName %>" />
                        </jsp:include>
                        <%
                            }
                        %>

                    </div>
                    <div class="w-100"> <!-- w-100 để thẻ div rộng 100% theo thẻ cha -->
                        <jsp:include page="seatInformation.jsp"/>
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