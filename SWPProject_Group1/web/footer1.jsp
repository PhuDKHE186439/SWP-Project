<%-- 
    Document   : NewsDetails
    Created on : Oct 14, 2024, 3:04:03 AM
    Author     : P C
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Apz News</title>
        <link href="dcss/css/bootstrap.min.css" rel="stylesheet">
        <link href="dcss/css/global.css" rel="stylesheet">
        <link href="dcss/css/blog.css" rel="stylesheet">
        <link href="dcss/css/index.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="dcss/css/font-awesome.min.css" />
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
        <script src="dcss/js/jquery-2.1.1.min.js"></script>
        <script src="dcss/js/bootstrap.min.js"></script>
    </head>

    <body>
<section id="footer" class="clearfix">
    <div class="container">
        <div class="row">
            <div class="footer_1 clearfix">
                <div class="col-sm-3">
                    <div class="footer_1i clearfix">
                        <h3 class="mgt"><a class="col_1" href="index.html"><i class="fa fa-train"></i> Train Ticket Hub</a></h3>
                        <p>Your one-stop solution for train ticket booking.</p>
                        <p>Experience seamless travel planning with our user-friendly platform.</p>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="footer_1i clearfix">
                        <h4 class="col_1">Customer Support</h4>
                        <ul>
                            <li><a href="#"><i class="fa fa-question-circle"></i> FAQs</a></li>
                            <li><a href="#"><i class="fa fa-phone"></i> Contact Us</a></li>
                            <li><a href="#"><i class="fa fa-ticket"></i> Manage Booking</a></li>
                            <li><a href="#"><i class="fa fa-pencil"></i> Feedback</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="footer_1i clearfix">
                        <h4 class="col_1">Travel Information</h4>
                        <ul>
                            <li><a href="#"><i class="fa fa-map"></i> Route Planner</a></li>
                            <li><a href="#"><i class="fa fa-clock"></i> Train Schedules</a></li>
                            <li><a href="#"><i class="fa fa-star"></i> Popular Destinations</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="footer_1i clearfix">
                        <h4 class="col_1">Follow Us</h4>
                        <ul class="social-network social-circle">
                            <li><a href="#" class="icoRss" title="RSS"><i class="fa fa-rss"></i></a></li>
                            <li><a href="#" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#" class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#" class="icoInstagram" title="Instagram"><i class="fa fa-instagram"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="footer_2 clearfix">
                <div class="col-sm-4">
                    <div class="footer_1i clearfix">
                        <h4 class="col_1">Payment Options</h4>
                        <ul>
                            <li><a href="#">Credit Card</a></li>
                            <li><a href="#">Debit Card</a></li>
                            <li><a href="#">UPI</a></li>
                            <li><a href="#">Net Banking</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="footer_1i clearfix">
                        <h4 class="col_1">Office Address</h4>
                        <p>18700 Orchard Lake Road, Suite 120 Farmington Hills, U.S.A.</p>
                        <h4 class="col_1"><span class="normal">Phone:</span> +01 2345 6789</h4>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="footer_1i clearfix">
                        <h4 class="col_1">Subscribe to Updates</h4>
                        <p>Stay updated with the latest offers and travel tips.</p>
                        <form action="#" method="post">
                            <input type="email" placeholder="Enter your email" required>
                            <button type="submit">Subscribe</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section id="footer_bottom">
    <div class="container">
        <div class="row">
            <div class="footer_b text-center clearfix">
                <div class="col-sm-12">
                    <p class="mgt col_2">© 2024 Train Ticket Hub. All Rights Reserved | Designed by <a class="col_1" href="http://www.templateonweb.com">TemplateOnWeb</a></p>
                </div>
            </div>
        </div>
    </div>
</section>

        </script>

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

    </body>

</html>
