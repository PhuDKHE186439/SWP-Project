<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, model.account, dal.AccountDAO, model.role, dal.RoleDAO"%>
<%@page session="true"%>
<%
    AccountDAO accountDAO = new AccountDAO();
    List<account> accounts = accountDAO.getAllAccount(); // Make sure this retrieves the accounts list
%>

<%
    RoleDAO roleDAO = new RoleDAO();
    List<role> roles = roleDAO.getAllRoles();
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
    <c:if test="${sessionScope.noti !=null}">
        <div class="alert ${noti.toLowerCase().contains("thành công") ? "alert-success" : "alert-danger"} alert-dismissible fade show " role="alert" style=" position: fixed; z-index: 15 ; margin-left: 80%; margin-top: 5%;">
            <strong>${noti}</strong>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <c:remove var="noti" scope="session" />

    </c:if>
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
                        <a href="myticket" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>Vé của tôi</a>
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
                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0" style="width: 100%;">
                            <thead>
                                <tr class="text-dark">
                                    <th scope="col">Ticket ID</th>
                                    <th scope="col">Purchage Date</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">SeatID</th>
                                    <th scope="col">TimeArrive</th>
                                </tr>
                            </thead>
                            <tbody id="accountList">
                                <c:forEach items="${list}" var="c" >
                                    <tr>
                                        <td>
                                            <a href="ticket-detail?id=${c.ticketID}">
                                                ${c.ticketID}</a>
                                        </td>
                                        <td>${c.purchaseDate}</td>
                                        <td>${c.ticketPrice}</td>
                                        <td>${c.seatID}</td>
                                        <td>${c.timeArrive}</td>
                                    </tr>
                                </c:forEach>
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

        <script>
                    function enableNextField(currentField, nextFieldId) {
                        const nextField = document.getElementById(nextFieldId);
                        if (currentField.value) {
                            nextField.disabled = false;
                        } else {
                            nextField.disabled = true;
                            clearFollowingFields(nextField);
                        }
                    }

                    function clearFollowingFields(field) {
                        field.value = "";
                        const allFields = ["ngayDi", "ngayVe", "gaDi", "gaDen"];
                        const startIndex = allFields.indexOf(field.id);
                        for (let i = startIndex + 1; i < allFields.length; i++) {
                            const followingField = document.getElementById(allFields[i]);
                            followingField.disabled = true;
                            followingField.value = "";
                        }
                    }
        </script>
        <script>
            if (document.querySelector('.alert')) {
                document.querySelectorAll('.alert').forEach(function ($el) {
                    setTimeout(() => {
                        $el.classList.remove('show');
                    }, 3000);
                });
            }
        </script>
    </body>

</html>