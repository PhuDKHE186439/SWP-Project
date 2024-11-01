Admin.jsp<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, model.account, dal.AccountDAO, model.role, dal.RoleDAO"%>
<%@page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    AccountDAO accountDAO = new AccountDAO();
    List<account> accounts = accountDAO.getAllAccount(); // Make sure this retrieves the accounts list
%>

<%
    RoleDAO roleDAO = new RoleDAO();
    List<role> roles = roleDAO.getAllRoles();
%>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>DASHMIN</title>
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
    </head>
    <body>
        <div class="container-xxl position-relative bg-white d-flex p-0">
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
                    <a href="index.html" class="navbar-brand mx-4 mb-3">
                        <h3 class="text-primary">Train Traveler</h3>
                    </a>
                    <div class="d-flex align-items-center ms-4 mb-4">
                        <div class="position-relative">

                            <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                        </div>
                        <div class="ms-3">
                            <h6 class="mb-0">Manager</h6>
                            <span>Admin</span>
                        </div>
                    </div>
                    <div class="navbar-nav w-100">
                        <a href="manage-ticket" class="nav-item nav-link" ><i class="fa fa-th me-2"></i>Quản lý tickets</a>
                        <div class="nav-item dropdown">
                        </div>
                        <a href="refundlist" class="nav-item nav-link active"><i class="fa fa-th me-2"></i>Refund Requests</a>
                </nav>
            </div>      
            <!-- Sidebar End -->


            <!-- Content Start -->
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

                                        <div class="ms-2">
                                            <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                            <small>15 minutes ago</small>
                                        </div>
                                    </div>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">
                                    <div class="d-flex align-items-center">

                                        <div class="ms-2">
                                            <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                            <small>15 minutes ago</small>
                                        </div>
                                    </div>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">
                                    <div class="d-flex align-items-center">

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

                                <span class="d-none d-lg-inline-flex">Manager</span>
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

                <!-- Account Update Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light text-center rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">refund requests Feedback</h6>
                        </div>

                        <!-- Search and Filter Section -->
                        <form action="feedbackadmin" method="get" class="mb-4" id="searchForm">
                            <div class="row mb-3 align-items-center">
                            </div>
                        </form>

                        <!-- Feedback Table -->
                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0">
                                <thead>
                                    <tr class="text-dark">
                                        <th scope="col">Refund ID</th>
                                        <th scope="col">Ticket ID</th>
                                        <th scope="col">Passenger ID</th>
                                        <th scope="col">Refund Status</th>
                                        <th scope="col">Message/Reason</th>
                                        <th scope="col">Action</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="feedback" items="${refundlist}">
                                        <tr>
                                            <td>${feedback.refundID}</td>
                                            <td>
                                                <a href="#" class="ticket-id" data-ticket-id="${feedback.ticketID}" data-bs-toggle="modal" data-bs-target="#ticketInfoModal">
                                                    ${feedback.ticketID}
                                                </a>
                                            </td>
                                            <td>
                                                <a href="#" class="passenger-id" data-passenger-id="${feedback.passengerID}" data-bs-toggle="modal" data-bs-target="#passengerInfoModal">
                                                    ${feedback.passengerID}
                                                </a>
                                            </td>
                                            <td>${feedback.status==1? 'pending': (feedback.status == 0 ? 'Rejected' : 'Accepted')}</td>
                                            <td>${feedback.message}</td>
                                            <td>
                                                <form action="rejectrefund" method="post">
                                                    <input type="hidden" name="ticketid" value="${feedback.ticketID}">
                                                    <button type="submit">Reject</button>
                                                </form>
                                                <form  action="acceptrefund" method="post">
                                                    <input type="hidden" name="ticketid" value="${feedback.ticketID}">
                                                    <button type="submit">Accepted</button>
                                                </form>

                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal fade" id="passengerInfoModal" tabindex="-1" aria-labelledby="passengerInfoModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="passengerInfoModalLabel">Passenger Information</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div id="passengerInfoContent">
                                            <!-- Passenger information will be loaded here -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="ticketInfoModal" tabindex="-1" aria-labelledby="ticketInfoModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="ticketInfoModalLabel">Ticket Information</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div id="ticketInfoContent">
                                            <!-- Ticket information will be loaded here -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>


                <!-- Account Update End -->
                <script>
                    function openEditPopup(roleID, roleName) {
                        document.getElementById('editRoleID').value = roleID;
                        document.getElementById('editRoleName').value = roleName;
                        document.getElementById('editRolePopup').style.display = 'block';
                    }

                    function closeEditPopup() {
                        document.getElementById('editRolePopup').style.display = 'none';
                    }
                </script>

                <style>
                    .popup {
                        position: fixed;
                        z-index: 1;
                        left: 0;
                        top: 0;
                        width: 100%;
                        height: 100%;
                        overflow: auto;
                        background-color: rgba(0,0,0,0.4);
                        padding-top: 60px;
                        display: flex;
                        justify-content: center;
                        align-items: center;
                    }

                    .popup-content {
                        background-color: #fefefe;
                        padding: 20px;
                        border: 1px solid #888;
                        width: 80%;
                        max-width: 400px;
                        margin: auto;
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




            </div>
            <!-- Widgets End -->
            <!-- Footer Start -->
            <!-- Footer End -->
        </div>
        <!-- Content End -->
        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <script>
                    document.addEventListener('DOMContentLoaded', function () {

                        // Load passenger information when clicking on Passenger ID
                        document.querySelectorAll('.passenger-id').forEach(function (element) {
                            element.addEventListener('click', function (e) {
                                e.preventDefault();
                                var passengerID = this.getAttribute('data-passenger-id');
                                var modal = document.getElementById('passengerInfoModal');
                                var contentDiv = modal.querySelector('#passengerInfoContent');

                                contentDiv.innerHTML = 'Loading passenger information...';

                                fetch('viewPassengerInfo?passengerID=' + passengerID)
                                        .then(response => {
                                            if (!response.ok) {
                                                throw new Error('HTTP error ' + response.status);
                                            }
                                            return response.text();
                                        })
                                        .then(html => {
                                            contentDiv.innerHTML = html;
                                        })
                                        .catch(error => {
                                            contentDiv.innerHTML = 'Error fetching passenger information: ' + error.message;
                                            console.error('Error:', error);
                                        });
                            });
                        });

                        document.querySelectorAll('.ticket-id').forEach(function (element) {
                            element.addEventListener('click', function (d) {
                                d.preventDefault();
                                var ticketID = this.getAttribute('data-ticket-id');
                                var modal = document.getElementById('ticketInfoModal');
                                var contentDiv = modal.querySelector('#ticketInfoContent');

                                contentDiv.innerHTML = 'Loading ticket information...';

                                fetch('viewticketinfo?ticketID=' + ticketID)
                                        .then(response => {
                                            if (!response.ok) {
                                                throw new Error('HTTP error ' + response.status);
                                            }
                                            return response.text();
                                        })
                                        .then(html => {
                                            contentDiv.innerHTML = html;
                                        })
                                        .catch(error => {
                                            contentDiv.innerHTML = 'Error fetching ticket information: ' + error.message;
                                            console.error('Error:', error);
                                        });
                            });
                        });
                    });
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
