<%-- 
    Document   : UserProfiletest
    Created on : Sep 26, 2024, 9:07:20 AM
    Author     : My Asus
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <!-- META ============================================= -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="robots" content="" />

        <!-- DESCRIPTION -->
        <!--        <meta name="description" content="EduChamp : Education HTML Template" />-->

        <!-- OG -->
        <meta property="og:title" content="EduChamp : Education HTML Template" />
        <meta property="og:description" content="EduChamp : Education HTML Template" />
        <meta property="og:image" content="" />
        <meta name="format-detection" content="telephone=no">

        <!-- FAVICONS ICON ============================================= -->
        <!--        <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon" />
                <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />-->

        <!-- PAGE TITLE HERE ============================================= -->
        <title>TrainTravel  </title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--[if lt IE 9]>
        <script src="assets/js/html5shiv.min.js"></script>
        <script src="assets/js/respond.min.js"></script>
        <![endif]-->

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/assets.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="assets/css/color/color-1.css">

    </head>
    <body id="bg">
        <div class="page-wraper">
            <div id="loading-icon-bx"></div>
            <!-- Header Top ==== -->
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
                            <a href="logout" class="dropdown-item">Log Out</a>
                        </div>
                    </div>
                </div>
            </nav>

            <!-- header END ==== -->
            <!-- Content -->
            <div class="page-content bg-white">
                <!-- inner page banner -->
                <!-- Breadcrumb row -->
                <!-- Breadcrumb row END -->
                <!-- inner page banner END -->
                <div class="content-block">
                    <!-- About Us -->
                    <div class="section-area section-sp1">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-sm-12 m-b30">
                                    <div class="profile-bx text-center">
                                        <div class="user-profile-thumb" >
                                            <img src="https://th.bing.com/th/id/OIP.ItvA9eX1ZIYT8NHePqeuCgHaHa?w=188&h=188&c=7&r=0&o=5&pid=1.7" alt=""/>
                                        </div>
                                        <div class="profile-info">
                                            <h4>${profile.name}</h4>
                                            <span>${profile.email}</span>
                                        </div>
                                        <div class="profile-tabnav">
                                            <ul class="nav nav-tabs">
                                                <li class="nav-item">
                                                    <a class="nav-link active" data-toggle="tab" href="#courses"><i class="ti-book"></i>Your Profile</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" data-toggle="tab" href="#change-password"><i class="ti-lock"></i>Change Password</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" data-toggle="tab" href="#quiz-results"><i class="ti-bookmark-alt"></i>OTP Question </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" data-toggle="tab" href="#edit-profile"><i class="ti-pencil-alt"></i>Booking history</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-9 col-md-8 col-sm-12 m-b30">
                                    <div class="profile-content-bx">
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="courses">
                                                <div class="profile-head">
                                                    <p style="color: Red">${requestScope.passwordChange}</p>

                                                    <h3>Edit Profile</h3>
                                                </div>
                                                <form class="edit-profile" action="userprofile" method="post">
                                                    <div class="">
                                                        <div class="form-group row">
                                                            <div class="col-12 col-sm-9 col-md-9 col-lg-10 ml-auto">
                                                                <h3>1. Personal Details</h3>
                                                                <p style="color: Red">${requestScope.AccID}</p>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Full Name</label>
                                                            <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                                <input class="form-control" name="name" Value="${profile.name}" placeholder="${profile.name}" type="text"  required="">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Date Of Birth</label>
                                                            <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                                <input class="form-control" name="age" value="${profile.age}"  placeholder="${profile.age}" type="tel"  required="" pattern="[1-2]{1}[0-9]{3}">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Address</label>
                                                            <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                                <input class="form-control" name="address" value="${profile.address}" placeholder="${profile.address}" type="text"  required="">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Phone Number</label>
                                                            <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                                <input class="form-control" name="phone" value="${profile.phoneNumber}" placeholder="${profile.phoneNumber}" type="tel"  required="" pattern="[0-9]{10}">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Email Address</label>
                                                            <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                                <input class="form-control" name="email"  value="${profile.email}" placeholder="${profile.email}" type="email" id="email-4" data-ms-member="email" required="">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="">
                                                        <div class="">
                                                            <div class="row">
                                                                <div class="col-12 col-sm-3 col-md-3 col-lg-2">
                                                                </div>
                                                                <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                                    <button type="submit" class="btn">Save changes</button>
                                                                    <button type="reset" class="btn-secondry">Cancel</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>

                                            <div class="tab-pane" id="quiz-results">
                                                <c:if test="${requestScope.OTPCheck==true}">
                                                    <div class="profile-head">
                                                        <h3>OTP Question</h3>
                                                    </div>

                                                    <form class="edit-profile" action="changeotp" method="post">
                                                        <div class="form-group row">
                                                            <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">What is your favorite animal?</label>
                                                            <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                                <input class="form-control" name="changeotp1" Value="${OTP1}" placeholder="${OTP1}" type="text"  required="">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">What is Your Pet Name?</label>
                                                            <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                                <input class="form-control" name="changeotp2" Value="${OTP2}" placeholder="${OTP2}" type="text"  required="">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">What is Your Neighbor Name?</label>
                                                            <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                                <input class="form-control" name="changeotp3" Value="${OTP3}" placeholder="${OTP3}" type="text"  required="">
                                                            </div>
                                                        </div>
                                                        <div class="">
                                                            <div class="">
                                                                <div class="row">
                                                                    <div class="col-12 col-sm-3 col-md-3 col-lg-2">
                                                                    </div>
                                                                    <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                                        <button type="submit" class="btn">Save changes</button>
                                                                        <button type="reset" class="btn-secondry">Cancel</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </c:if>       
                                                <c:if test="${requestScope.OTPCheck==false}">
                                                    <div class="profile_form-header">
                                                        <div>
                                                            <a href="registerotp">Make Answer to OTP Question</a>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </div>
                                            <div class="tab-pane" id="change-password">
                                                <div class="profile-head">
                                                    <h3>Change Password</h3>
                                                </div>
                                                <form class="edit-profile" action="updateuserprofile" method="post">
                                                    <div class="">
                                                        <div class="form-group row">
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-12 col-sm-4 col-md-4 col-lg-3 col-form-label">Current Password</label>
                                                            <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                                                                <input class="form-control" type="password" value="" name="currentPassword">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-12 col-sm-4 col-md-4 col-lg-3 col-form-label">New Password</label>
                                                            <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                                                                <input class="form-control" type="password" value="" name="newPassword">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-12 col-sm-4 col-md-4 col-lg-3 col-form-label">Re Type New Password</label>
                                                            <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                                                                <input class="form-control" type="password" value="" name="rePassword">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-12 col-sm-4 col-md-4 col-lg-3">
                                                        </div>
                                                        <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                                                            <button type="submit" class="btn">Save changes</button>
                                                            <button type="reset" class="btn-secondry">Cancel</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="tab-pane" id="edit-profile">
                                                <div class="profile-head">
                                                    <h3>Booking History</h3>
                                                </div>
                                                <table class="entity">
                                                    <thead>
                                                        <tr>
                                                            <th>TicketID</th>
                                                            <th>TicketClass</th>
                                                            <th>Compartment</th>
                                                            <th>Seat</th>
                                                            <th>TimeArrive</th>
                                                            <th>Price</th>
                                                            <th>PruchaseDate</th>
                                                            <th>PurchaseMethod</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="i" items="${requestScope.CustomerHistory}">
                                                    <tr>
                                                        <td>${i.ticket.ticketID}</td>
                                                        <td>${i.ticket.ticketClass.categoryName}</td>
                                                        <td>${i.ticket.seat.compartment.compartmentNumber}</td>
                                                        <td>${i.ticket.seat.seatNumber}</td>
                                                        <td>${i.ticket.timeArrive}</td>
                                                        <td>${i.ticket.ticketPrice}</td>
                                                        <td>${i.ticket.purchaseDate}</td>
                                                        <td>${i.paymentMethod}</td>
                                                    </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>

                                            </div> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- contact area END -->
                </div>
                <!-- Content END-->
                <jsp:include page="Footer.jsp"></jsp:include>

                <!-- Footer END ==== -->
                <button class="back-to-top fa fa-chevron-up" ></button>
            </div>
            <!-- External JavaScripts -->
            <script src="assets/js/jquery.min.js"></script>
            <script src="assets/vendors/bootstrap/js/popper.min.js"></script>
            <script src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
            <script src="assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
            <script src="assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
            <script src="assets/vendors/magnific-popup/magnific-popup.js"></script>
            <script src="assets/vendors/counter/waypoints-min.js"></script>
            <script src="assets/vendors/counter/counterup.min.js"></script>
            <script src="assets/vendors/imagesloaded/imagesloaded.js"></script>
            <script src="assets/vendors/masonry/masonry.js"></script>
            <script src="assets/vendors/masonry/filter.js"></script>
            <script src="assets/vendors/owl-carousel/owl.carousel.js"></script>
            <script src="assets/js/functions.js"></script>
            <script src="assets/js/contact.js"></script>
            <script src='assets/vendors/switcher/switcher.js'></script>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script <script src="assets/js/navbar.js"></script>
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="bssets/lib/chart/chart.min.js"></script>
            <script src="bssets/lib/easing/easing.min.js"></script>
            <script src="bssets/lib/waypoints/waypoints.min.js"></script>
            <script src="bssets/lib/owlcarousel/owl.carousel.min.js"></script>
            <script src="bssets/lib/tempusdominus/js/moment.min.js"></script>
            <script src="bssets/lib/tempusdominus/js/moment-timezone.min.js"></script>
            <script src="bssets/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
    </body>
    <style>
        :root {
            --tripoveMainColor: rgb(71, 143, 192);
        }

        table.entity {
            border-collapse: collapse;
            border: 1px solid #ddd;
            font-family: Arial, sans-serif;
        }

        table.entity thead {
            background-color: #f2f2f2;
        }

        table.entity th,
        table.entity td {
            border: 1px solid #ddd;
            padding: 6px;
            text-align: center;
            padding-top: 10px;
            padding-bottom: 10px;
            word-wrap: break-word;
            font-size: 14px;
        }

        table.entity th {
            background-color: #f7b205;
            color: white;
        }

        table.entity td img {
            height: 80px;
            width: 80px;
            object-fit: cover;
        }

        table.entity td a {
            text-decoration: none;
            margin-right: 10px;
        }

        table.entity td a:hover {
            text-decoration: underline;
        }
        #left-column{
            text-align: center;
        }
        #left-column table{
            display: inline-block;
            margin: 0 auto;
        }
        #right-column{
            font-size: 14px
        }

        #right-column form{
            float:right;
        }

        .entity-update {
            padding: 8px;
            border-radius: 6px;
            border-color: white;
            color: white;
            background-color: #04aa6d;
            cursor: pointer
        }

        .entity-delete {
            padding: 8px;
            border-radius: 6px;
            border-color: white;
            color: white;
            background-color: #f44336;
            cursor: pointer
        }

        .entity-detail {
            padding: 8px;
            border-radius: 6px;
            border-color: white;
            color: white;
            background-color: #f7d017;
            cursor: pointer
        }

        .filterController{
            font-size: 14px;
            float:left
        }

        .filterController button{
            padding: 6px;
        }

        .filterElm{
            margin-right: 15px;
            padding: 0 3px
        }



    </style>
</html>