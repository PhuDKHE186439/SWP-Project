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
        <!-- Css Styles -->





        <!-- Css Styles -->
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/flaticon.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">


        <link href="dcss/css/bootstrap.min.css" rel="stylesheet">
        <link href="dcss/css/global.css" rel="stylesheet">
        <link href="dcss/css/blog.css" rel="stylesheet">
        <link href="dcss/css/index.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="dcss/css/font-awesome.min.css" />
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
    </head>

    <style>
        .testimonial-section {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .testimonial-section .row {
            width: 100%;
            justify-content: center;
        }

        .testimonial-section .col-lg-8 {
            max-width: 800px;
        }

    </style>
    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>
        <jsp:include page = "header1.jsp"></jsp:include>






            <!-- Hero Section Begin -->
            <section class="hero-section">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="hero-text">
                                <h1 style="color: #0bc193;">TRS - Better Price</h1>
                                <p >Here are the best Train Ticket Booking sites, including recommendations for in-national
                                    travel and for finding low-priced tickets.</p>
                                <a href="#" class="primary-btn">Discover Now</a>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-5 offset-xl-2 offset-lg-1">
                            <div class="booking-form">
                                <h3>Booking Your Ticket</h3>
                                <form action="trains" method="GET" class="search-form" id="trainSearchForm" onsubmit="return validateForm()">
                                    <div class="form-container">
                                        <!-- Loại vé -->
                                        <div class="form-group">
                                            <label class="form-label">Type:</label>
                                            <div class="radio-group">
                                                <input type="radio" id="oneWay" name="tripType" value="oneWay" checked onchange="toggleReturnDate()">
                                                <label for="oneWay">One way</label>
                                                <input type="radio" id="roundTrip" name="tripType" value="roundTrip" onchange="toggleReturnDate()">
                                                <label for="roundTrip">Round Trip</label>
                                            </div>
                                        </div>

                                        <!-- Ngày đi và về -->
                                        <div class="date-container">
                                            <div class="form-group">
                                                <label for="departDate" class="form-label">Departure Date</label>
                                                <input type="date" name="ngayDi" id="departDate" class="form-control" 
                                                       min="" required>
                                            </div>
                                            <div class="form-group" id="returnDateGroup" style="display: none;">
                                                <label for="returnDate" class="form-label">Return Date</label>
                                                <input type="date" name="ngayVe" id="returnDate" class="form-control" 
                                                       min="">
                                            </div>
                                        </div>

                                        <!-- Ga đi và đến -->
                                        <div class="stations-container">
                                            <div class="form-group">
                                                <label for="departStation" class="form-label">Depart Station</label>
                                                <div class="input-with-suggestions">
                                                    <input type="text" id="departStation" class="form-control" 
                                                           placeholder="Please enter Depart Station..." 
                                                           oninput="suggest(this, 'departSuggestions')"
                                                           autocomplete="off">
                                                    <input type="hidden" name="l1" id="departStationId">
                                                    <div id="departSuggestions" class="suggestion-box"></div>
                                                </div>
                                            </div>

                                            <!-- Nút đổi ga -->


                                            <div class="form-group">
                                                <label for="arrivalStation" class="form-label">Arrival Station</label>
                                                <div class="input-with-suggestions">
                                                    <input type="text" id="arrivalStation" class="form-control" 
                                                           placeholder="Please enter Arrival Station..." 
                                                           oninput="suggest(this, 'arrivalSuggestions')"
                                                           autocomplete="off">
                                                    <input type="hidden" name="l2" id="arrivalStationId">
                                                    <div id="arrivalSuggestions" class="suggestion-box"></div>
                                                </div>
                                            </div>
                                        </div>

                                        <button type="submit" class="submit-btn">
                                            Search
                                        </button>
                                    </div>
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
                                    <span style="color: darkred;">About Us</span>
                                    <h2>Train Reservation System <br />Best price</h2>
                                </div>
                                <p class="f-para">TRS (Train Reservation System) is a leading online platform for train ticket sales. We are passionate about providing the best travel experiences to our customers. Every day, TRS serves and inspires millions of travelers across various language platforms.

                                </p>
                                <p class="s-para">Whether you're looking for high-speed trains, long-distance routes, scenic train journeys, or special tourist trains, TRS is here to meet all your needs. We make booking train tickets easy, convenient, and faster than ever!






                                </p>
                                <a href="#" class="primary-btn about-btn" style="color: darkred;">Read More</a>
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

            <!--         Services Section End 
            -->        <section class="services-section spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section-title">
                                <span style="color: darkred;">What We Do</span>
                                <h2>Discover Our Services</h2>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 col-sm-6">
                            <div class="service-item">
                                <i class="flaticon-036-parking" style="color: darkred;"></i>
                                <h4>Travel Plan</h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                                    labore et dolore magna.</p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            <div class="service-item">
                                <i class="flaticon-033-dinner" style="color: darkred;"></i>
                                <h4>Catering Service</h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                                    labore et dolore magna.</p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            <div class="service-item">
                                <i class="flaticon-026-bed" style="color: darkred;"></i>
                                <h4>Babysitting</h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                                    labore et dolore magna.</p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            <div class="service-item">
                                <i class="flaticon-024-towel" style="color: darkred;"></i>
                                <h4>Laundry</h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                                    labore et dolore magna.</p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            <div class="service-item">
                                <i class="flaticon-044-clock-1" style="color: darkred;"></i>
                                <h4>Hire Driver</h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                                    labore et dolore magna.</p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-6">
                            <div class="service-item">
                                <i class="flaticon-012-cocktail" style="color: darkred;"></i>
                                <h4>Bar & Drink</h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                                    labore et dolore magna.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section><!--
             Services Section End 
    
             Home Room Section Begin 
-->            <section class="hp-room-section">
                <div class="container-fluid">
                    <div class="hp-room-items">
                        <div class="row">
                            <div class="col-lg-3 col-md-6">
                                <div class="hp-room-item set-bg" data-setbg="img/room/room-b1.jpg">
                                    <div class="hr-text">
                                        <h3 style="color: darkseagreen;">Double Room</h3>
                                        <h2 style="color: darkred;">199$<span>/Pernight</span></h2>
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
                                        <h3 style="color: darkseagreen;">Premium King Room</h3>
                                        <h2 style="color: darkred;">159$<span>/Pernight</span></h2>
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
                                        <h3 style="color: darkseagreen;">Deluxe Room</h3>
                                        <h2 style="color: darkred;">198$<span>/Pernight</span></h2>
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
                                        <h3 style="color: darkseagreen;">Family Room</h3>
                                        <h2  style="color: darkred;">299$<span>/Pernight</span></h2>
                                        <table>
                                            <tbody style="color: black;">
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


                <div class="container"  >
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <div class="section-title">
                                <span style="color: darkred;">Testimonials</span>
                                <h2>What Customers Say?</h2>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            <div class="testimonial-slider owl-carousel" >
                                <div class="ts-item text-center">
                                    <p>"When our plans changed last minute, TRS was a lifesaver! As frequent travelers, my husband, son, and I are familiar with various transportation options, but booking through TRS made our journey seamless. From finding the perfect train route to quick ticket confirmation, TRS exceeded our expectations!"</p>
                                    <div class="ti-author">
                                        <div class="rating" style="color: darkred;">
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
                                <div class="ts-item text-center">
                                    <p>"We were in a hurry to visit family across the country, and TRS made everything so easy. My wife, our two kids, and I found the best seats on a high-speed train, and the booking process was a breeze. TRS saved us so much time, and we had a comfortable and memorable trip!"
                                    </p>
                                    <div class="ti-author">
                                        <div class="rating" style="color: darkred;">
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
                                <span style="color: darkred;">Train News</span>
                                <h2>News</h2>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="blog-item set-bg" data-setbg="img/blog/blog-1.jpg">
                                <div class="bi-text">
                                    <span class="b-tag" style="background-color: darkred; color: white; padding: 5px; border-radius: 5px;">Travel Trip</span>
                                    <h4><a href="#">Tremblant In Canada</a></h4>
                                    <div class="b-time"><i class="icon_clock_alt"></i> 15th April, 2019</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="blog-item set-bg" data-setbg="img/blog/blog-2.jpg">
                                <div class="bi-text">
                                    <span class="b-tag" style="background-color: darkred; color: white; padding: 5px; border-radius: 5px;">Camping</span>
                                    <h4><a href="#">Choosing A Static Caravan</a></h4>
                                    <div class="b-time"><i class="icon_clock_alt"></i> 15th April, 2019</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="blog-item set-bg" data-setbg="img/blog/blog-3.jpg">
                                <div class="bi-text">
                                    <span class="b-tag" style="background-color: darkred; color: white; padding: 5px; border-radius: 5px;">Event</span>
                                    <h4><a href="#">Copper Canyon</a></h4>
                                    <div class="b-time"><i class="icon_clock_alt"></i> 21th April, 2019</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="blog-item small-size set-bg" data-setbg="img/blog/blog-wide.jpg">
                                <div class="bi-text">
                                    <span class="b-tag" style="background-color: darkred; color: white; padding: 5px; border-radius: 5px;">Event</span>
                                    <h4><a href="#">Trip To Iqaluit In Nunavut A Canadian Arctic City</a></h4>
                                    <div class="b-time"><i class="icon_clock_alt"></i> 08th April, 2019</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="blog-item small-size set-bg" data-setbg="img/blog/blog-10.jpg">
                                <div class="bi-text">
                                    <span class="b-tag" style="background-color: darkred; color: white; padding: 5px; border-radius: 5px;">Travel</span>
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
            <script>
                // Set min date to today
window.onload = function() {
    const today = new Date().toISOString().split('T')[0];
    document.getElementById('departDate').min = today;
    document.getElementById('returnDate').min = today;
};

                function toggleReturnDate() {
                    const returnDateGroup = document.getElementById('returnDateGroup');
                    const returnDate = document.getElementById('returnDate');
                    const isRoundTrip = document.getElementById('roundTrip').checked;

                    returnDateGroup.style.display = isRoundTrip ? 'block' : 'none';
                    returnDate.required = isRoundTrip;

                    // Update return date min value when depart date changes
                    const departDate = document.getElementById('departDate');
                    departDate.addEventListener('change', function () {
                        returnDate.min = this.value;
                        if (returnDate.value && returnDate.value < this.value) {
                            returnDate.value = this.value;
                        }
                    });
                }

                function swapStations() {
                    // Swap display values
                    const departStation = document.getElementById('departStation');
                    const arrivalStation = document.getElementById('arrivalStation');
                    [departStation.value, arrivalStation.value] = [arrivalStation.value, departStation.value];

                    // Swap hidden ID values
                    const departStationId = document.getElementById('departStationId');
                    const arrivalStationId = document.getElementById('arrivalStationId');
                    [departStationId.value, arrivalStationId.value] = [arrivalStationId.value, departStationId.value];
                }

                let suggestionTimeout;

                function suggest(input, suggestionBoxId) {
                    clearTimeout(suggestionTimeout);

                    const keyword = input.value.trim();
                    const suggestionBox = document.getElementById(suggestionBoxId);

                    if (keyword.length < 2) {
                        suggestionBox.innerHTML = '';
                        return;
                    }

                    // Add loading indicator
                    suggestionBox.innerHTML = '<div class="suggestion-item">Đang tìm kiếm...</div>';

                    // Delay the API call by 300ms to prevent too many requests
                    suggestionTimeout = setTimeout(() => {
                        fetch('searchLocation?keyword=' + encodeURIComponent(keyword))
                                .then(response => response.json())
                                .then(data => {
                                    suggestionBox.innerHTML = '';
                                    if (data.length === 0) {
                                        suggestionBox.innerHTML = '<div class="suggestion-item">Không tìm thấy kết quả</div>';
                                        return;
                                    }

                                    data.forEach(location => {
                                        const div = document.createElement('div');
                                        div.className = 'suggestion-item';
                                        div.textContent = location.name;
                                        div.onclick = function () {
                                            input.value = location.name;
                                            if (suggestionBoxId === 'departSuggestions') {
                                                document.getElementById('departStationId').value = location.id;
                                            } else {
                                                document.getElementById('arrivalStationId').value = location.id;
                                            }
                                            suggestionBox.innerHTML = '';
                                        };
                                        suggestionBox.appendChild(div);
                                    });
                                })
                                .catch(error => {
                                    suggestionBox.innerHTML = '<div class="suggestion-item">Có lỗi xảy ra</div>';
                                    console.error('Error:', error);
                                });
                    }, 300);
                }

                // Close suggestion box when clicking outside
                document.addEventListener('click', function (e) {
                    if (!e.target.matches('.form-control')) {
                        document.querySelectorAll('.suggestion-box').forEach(box => {
                            box.innerHTML = '';
                        });
                    }
                });

                function validateForm() {
                    let isValid = true;
                    const departStationId = document.getElementById('departStationId').value;
                    const arrivalStationId = document.getElementById('arrivalStationId').value;
                    const departDate = document.getElementById('departDate').value;
                    const isRoundTrip = document.getElementById('roundTrip').checked;
                    const returnDate = document.getElementById('returnDate').value;

                    // Reset previous errors
                    document.querySelectorAll('.error-message').forEach(el => el.remove());
                    document.querySelectorAll('.error').forEach(el => el.classList.remove('error'));

                    // Validate departure station
                    if (!departStationId) {
                        showError('departStation', 'Vui lòng chọn ga đi');
                        isValid = false;
                    }

                    // Validate arrival station
                    if (!arrivalStationId) {
                        showError('arrivalStation', 'Vui lòng chọn ga đến');
                        isValid = false;
                    }

                    // Validate stations are different
                    if (departStationId && arrivalStationId && departStationId === arrivalStationId) {
                        showError('arrivalStation', 'Ga đi và ga đến không được trùng nhau');
                        isValid = false;
                    }

                    // Validate departure date
                    if (!departDate) {
                        showError('departDate', 'Vui lòng chọn ngày đi');
                        isValid = false;
                    }

                    // Validate return date for round trip
                    if (isRoundTrip) {
                        if (!returnDate) {
                            showError('returnDate', 'Vui lòng chọn ngày về');
                            isValid = false;
                        } else if (returnDate < departDate) {
                            showError('returnDate', 'Ngày về phải sau ngày đi');
                            isValid = false;
                        }
                    }

                    return isValid;
                }

                function showError(inputId, message) {
                    const input = document.getElementById(inputId);
                    const errorDiv = document.createElement('div');
                    errorDiv.className = 'error-message';
                    errorDiv.textContent = message;
                    input.parentNode.appendChild(errorDiv);
                    input.parentNode.classList.add('error');
                }

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