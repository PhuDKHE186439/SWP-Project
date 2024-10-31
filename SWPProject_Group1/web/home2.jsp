<%-- 
    Document   : home2
    Created on : Oct 31, 2024, 5:32:42 AM
    Author     : P C
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, model.account, dal.AccountDAO, model.role, dal.RoleDAO"%>
<%@page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Sona Template">
        <meta name="keywords" content="Sona, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sona | Template</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/flaticon.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>

    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>






        <!-- Hero Section Begin -->
        <section class="hero-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="hero-text">
                            <h1>TRS - Better Price</h1>
                            <p>Here are the best Train Ticket Booking sites, including recommendations for in-national
                                travel and for finding low-priced tickets.</p>
                            <a href="#" class="primary-btn">Discover Now</a>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-5 offset-xl-2 offset-lg-1">
                        <div class="booking-form">
                            <h3>Booking Your Ticket</h3>
                            <form action="trains" method="GET">
                                <div class="check-date">
                                    <label for="ngayDi" class="form-label">Ngày đi</label>
                                    <input type="date" name="ngayDi"  id="ngayDi" oninput="enableNextField(this, 'ngayVe')" required>
                                </div>
                                <div class="check-date">
                                    <label for="ngayVe" class="form-label">Ngày về</label>
                                    <input name="ngayVe" type="date" id="ngayVe" oninput="enableNextField(this, 'gaDi')" required><br>
                                </div>
                                <div class="select-option">
                                    <label for="gaDi" class="form-label">Ga đi</label>
                                    <select class="form-select" id="gaDi" name="l1" oninput="enableNextField(this, 'gaDen')" required>
                                        <option value="-1" selected>Chọn ga đi</option>
                                        <c:forEach items="${locations1}" var="l1">
                                            <option value="${l1.locationID}">${l1.locationName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="select-option">
                                    <label for="gaDen" class="form-label">Ga đến</label>
                                    <select class="form-select" id="gaDen" name="l2" required>
                                        <option value="-1" selected>Chọn ga đến</option>
                                        <c:forEach items="${locations2}" var="l2">
                                            <option value="${l2.locationID}">${l2.locationName}</option>
                                        </c:forEach>
                                    </select>

                                </div>
                                <button type="submit">Check Availability</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hero-slider owl-carousel">
                <div class="hs-item set-bg" data-setbg="img/hero/hero-1.jpg"></div>
                <div class="hs-item set-bg" data-setbg="img/hero/hero-2.jpg"></div>
                <div class="hs-item set-bg" data-setbg="img/hero/hero-3.jpg"></div>
            </div>
        </section>
        <!-- Hero Section End -->

        <!-- About Us Section Begin -->
        <section class="aboutus-section spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="about-text">
                            <div class="section-title">
                                <span>About Us</span>
                                <h2>Train Reservation System <br />Best price</h2>
                            </div>
                            <p class="f-para">TRS (Train Reservation System) is a leading online platform for train ticket sales. We are passionate about providing the best travel experiences to our customers. Every day, TRS serves and inspires millions of travelers across various language platforms.

                            </p>
                            <p class="s-para">Whether you're looking for high-speed trains, long-distance routes, scenic train journeys, or special tourist trains, TRS is here to meet all your needs. We make booking train tickets easy, convenient, and faster than ever!






                            </p>
                            <a href="#" class="primary-btn about-btn">Read More</a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="about-pic">
                            <div class="row">
                                <div class="col-sm-6">
                                    <img src="img/about/about-1.jpg" alt="">
                                </div>
                                <div class="col-sm-6">
                                    <img src="img/about/about-2.jpg" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- About Us Section End -->

        <!-- Services Section End -->
        <section class="services-section spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <span>What We Do</span>
                            <h2>Discover Our Services</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-sm-6">
                        <div class="service-item">
                            <i class="flaticon-036-parking"></i>
                            <h4>Travel Plan</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                                labore et dolore magna.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="service-item">
                            <i class="flaticon-033-dinner"></i>
                            <h4>Catering Service</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                                labore et dolore magna.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="service-item">
                            <i class="flaticon-026-bed"></i>
                            <h4>Babysitting</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                                labore et dolore magna.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="service-item">
                            <i class="flaticon-024-towel"></i>
                            <h4>Laundry</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                                labore et dolore magna.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="service-item">
                            <i class="flaticon-044-clock-1"></i>
                            <h4>Hire Driver</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                                labore et dolore magna.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <div class="service-item">
                            <i class="flaticon-012-cocktail"></i>
                            <h4>Bar & Drink</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                                labore et dolore magna.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Services Section End -->

        <!-- Home Room Section Begin -->
        <section class="hp-room-section">
            <div class="container-fluid">
                <div class="hp-room-items">
                    <div class="row">
                        <div class="col-lg-3 col-md-6">
                            <div class="hp-room-item set-bg" data-setbg="img/room/room-b1.jpg">
                                <div class="hr-text">
                                    <h3>Double Room</h3>
                                    <h2>199$<span>/Pernight</span></h2>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td class="r-o">Size:</td>
                                                <td>30 ft</td>
                                            </tr>
                                            <tr>
                                                <td class="r-o">Capacity:</td>
                                                <td>Max persion 5</td>
                                            </tr>
                                            <tr>
                                                <td class="r-o">Bed:</td>
                                                <td>King Beds</td>
                                            </tr>
                                            <tr>
                                                <td class="r-o">Services:</td>
                                                <td>Wifi, Television, Bathroom,...</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <a href="#" class="primary-btn">More Details</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="hp-room-item set-bg" data-setbg="img/room/room-b2.jpg">
                                <div class="hr-text">
                                    <h3>Premium King Room</h3>
                                    <h2>159$<span>/Pernight</span></h2>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td class="r-o">Size:</td>
                                                <td>30 ft</td>
                                            </tr>
                                            <tr>
                                                <td class="r-o">Capacity:</td>
                                                <td>Max persion 5</td>
                                            </tr>
                                            <tr>
                                                <td class="r-o">Bed:</td>
                                                <td>King Beds</td>
                                            </tr>
                                            <tr>
                                                <td class="r-o">Services:</td>
                                                <td>Wifi, Television, Bathroom,...</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <a href="#" class="primary-btn">More Details</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="hp-room-item set-bg" data-setbg="img/room/room-b3.jpg">
                                <div class="hr-text">
                                    <h3>Deluxe Room</h3>
                                    <h2>198$<span>/Pernight</span></h2>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td class="r-o">Size:</td>
                                                <td>30 ft</td>
                                            </tr>
                                            <tr>
                                                <td class="r-o">Capacity:</td>
                                                <td>Max persion 5</td>
                                            </tr>
                                            <tr>
                                                <td class="r-o">Bed:</td>
                                                <td>King Beds</td>
                                            </tr>
                                            <tr>
                                                <td class="r-o">Services:</td>
                                                <td>Wifi, Television, Bathroom,...</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <a href="#" class="primary-btn">More Details</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="hp-room-item set-bg" data-setbg="img/room/room-b4.jpg">
                                <div class="hr-text">
                                    <h3>Family Room</h3>
                                    <h2>299$<span>/Pernight</span></h2>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td class="r-o">Size:</td>
                                                <td>30 ft</td>
                                            </tr>
                                            <tr>
                                                <td class="r-o">Capacity:</td>
                                                <td>Max persion 5</td>
                                            </tr>
                                            <tr>
                                                <td class="r-o">Bed:</td>
                                                <td>King Beds</td>
                                            </tr>
                                            <tr>
                                                <td class="r-o">Services:</td>
                                                <td>Wifi, Television, Bathroom,...</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <a href="#" class="primary-btn">More Details</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Home Room Section End -->

        <!-- Testimonial Section Begin -->
        <section class="testimonial-section spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <span>Testimonials</span>
                            <h2>What Customers Say?</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8 offset-lg-2">
                        <div class="testimonial-slider owl-carousel">
                            <div class="ts-item">
                                <p>"When our plans changed last minute, TRS was a lifesaver! As frequent travelers, my husband, son, and I are familiar with various transportation options, but booking through TRS made our journey seamless. From finding the perfect train route to quick ticket confirmation, TRS exceeded our expectations!"</p>
                                <div class="ti-author">
                                    <div class="rating">
                                        <i class="icon_star"></i>
                                        <i class="icon_star"></i>
                                        <i class="icon_star"></i>
                                        <i class="icon_star"></i>
                                        <i class="icon_star-half_alt"></i>
                                    </div>
                                    <h5> - Eimi Fukada</h5>
                                </div>
                                <img src="img/testimonial-logo.png" alt="">
                            </div>
                            <div class="ts-item">
                                <p>"We were in a hurry to visit family across the country, and TRS made everything so easy. My wife, our two kids, and I found the best seats on a high-speed train, and the booking process was a breeze. TRS saved us so much time, and we had a comfortable and memorable trip!"

                                </p>
                                <div class="ti-author">
                                    <div class="rating">
                                        <i class="icon_star"></i>
                                        <i class="icon_star"></i>
                                        <i class="icon_star"></i>
                                        <i class="icon_star"></i>
                                        <i class="icon_star"></i>
                                    </div>
                                    <h5> - Yua Mikami</h5>
                                </div>
                                <img src="img/testimonial-logo.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Testimonial Section End -->

        <!-- Blog Section Begin -->
        <section class="blog-section spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <span>Train News</span>
                            <h2>News</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="blog-item set-bg" data-setbg="img/blog/blog-1.jpg">
                            <div class="bi-text">
                                <span class="b-tag">Travel Trip</span>
                                <h4><a href="#">Tremblant In Canada</a></h4>
                                <div class="b-time"><i class="icon_clock_alt"></i> 15th April, 2019</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="blog-item set-bg" data-setbg="img/blog/blog-2.jpg">
                            <div class="bi-text">
                                <span class="b-tag">Camping</span>
                                <h4><a href="#">Choosing A Static Caravan</a></h4>
                                <div class="b-time"><i class="icon_clock_alt"></i> 15th April, 2019</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="blog-item set-bg" data-setbg="img/blog/blog-3.jpg">
                            <div class="bi-text">
                                <span class="b-tag">Event</span>
                                <h4><a href="#">Copper Canyon</a></h4>
                                <div class="b-time"><i class="icon_clock_alt"></i> 21th April, 2019</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="blog-item small-size set-bg" data-setbg="img/blog/blog-wide.jpg">
                            <div class="bi-text">
                                <span class="b-tag">Event</span>
                                <h4><a href="#">Trip To Iqaluit In Nunavut A Canadian Arctic City</a></h4>
                                <div class="b-time"><i class="icon_clock_alt"></i> 08th April, 2019</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="blog-item small-size set-bg" data-setbg="img/blog/blog-10.jpg">
                            <div class="bi-text">
                                <span class="b-tag">Travel</span>
                                <h4><a href="#">Traveling To Barcelona</a></h4>
                                <div class="b-time"><i class="icon_clock_alt"></i> 12th April, 2019</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Blog Section End -->



        <!-- Search model Begin -->
        <div class="search-model">
            <div class="h-100 d-flex align-items-center justify-content-center">
                <div class="search-close-switch"><i class="icon_close"></i></div>
                <form class="search-model-form">
                    <input type="text" id="search-input" placeholder="Search here.....">
                </form>
            </div>
        </div>
        <!-- Search model end -->
        <script>
            $("#menu-close").click(function (e) {
                e.preventDefault();
                $("#sidebar-wrapper").toggleClass("active");
            });
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#sidebar-wrapper").toggleClass("active");
            });
        </script>

        <script src="js/ziehharmonika.js"></script>

        <script>
            $(document).ready(function () {
                $('.ziehharmonika').ziehharmonika({
                    collapsible: true,
                    prefix: 'â˜…'
                });
            });
        </script>
        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
    </body>
    <jsp:include page="footer1.jsp" />

</html>
