<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>TRS</title>
        <link href="dcss/css/bootstrap.min.css" rel="stylesheet">
        <link href="dcss/css/global.css" rel="stylesheet">
        <link href="dcss/css/blog.css" rel="stylesheet">
        <link href="dcss/css/index.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="dcss/css/font-awesome.min.css" />
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
        <!-- Move jQuery and Bootstrap JS to end of body -->
    </head>
    <body>
        <section id="header">
            <!-- Header content remains the same -->
            <div class="container">
                <div class="row">
                    <div class="header_1 clearfix">
                        <div class="col-sm-4">
                            <div class="header_1l clearfix">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="header_1m text-center clearfix">
                                <h1><a class="col_1" href="index.html">TRS</a></h1>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="header_1r text-right clearfix">
                                <h3 class="mgt"><a href="#"><i class="fa fa-phone col_1"></i> 09 6785 1513 <span>Call us now. Resistance is futile!</span></a></h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="menu" class="clearfix cd-secondary-nav">
            <nav class="navbar nav_t">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="index.html">APZ</a>
                    </div>

                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li><a class="m_tag" href="home1">Home</a></li>
                            <li><a class="m_tag" href="/SWPProject_Group1/userprofile">Profile</a></li>
                            <c:if test="${sessionScope.AccID!=null}">
                                <li><a class="m_tag" href="logout">LOGOUT</a></li>
                            </c:if>
                            <li><a class="m_tag" href="feedbackforcustomer">Make FeedBack</a></li>
                            
                            <!-- Politics Mega Menu -->
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle m_tag" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    Politics<span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-large row">
                                    <!-- Politics menu content remains the same -->
                                    <li class="col-sm-2 space_all">
                                        <ul>
                                            <li><a href="#"><img src="img/3.jpg" class="iw" alt="abc"></a></li>
                                            <li><a href="#">Minim Veniam</a></li>
                                            <li><a class="col_2" href="#"><i class="fa fa-calendar col_1"></i> March 29, 2019</a></li>
                                        </ul>
                                    </li>
                                    <!-- Add other menu items here -->
                                </ul>
                            </li>

                            <li><a class="m_tag" href="service.html">Services</a></li>
                            
                            <!-- News Dropdown -->
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle m_tag" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    News<span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="/SWPProject_Group1/Unews">News Spotlight</a></li>
                                    <li><a href="/SWPProject_Group1/UnewsList">All News</a></li>
                                </ul>
                            </li>
                            
                            <!-- Pages Dropdown -->
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle m_tag" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    Account<span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="logout">Login</a></li>
                                    <li><a href="logout">Logout</a></li>
                                    <li><a href="/SWPProject_Group1/userprofile">Profile</a></li>
                                </ul>
                            </li>
                        </ul>
                        
                        <!-- Search Form -->
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle m_tag" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    <span class="fa fa-search"></span>
                                </a>
                                <ul class="dropdown-menu" style="min-width: 300px; padding: 10px;">
                                    <li>
                                        <form class="navbar-form" role="search">
                                            <div class="input-group">
                                                <input type="text" class="form-control" placeholder="Search">
                                                <span class="input-group-btn">
                                                    <button class="btn btn-primary" type="button">Search</button>
                                                </span>
                                            </div>
                                        </form>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </section>

        <!-- Place scripts at end of body -->
        <script src="dcss/js/jquery-2.1.1.min.js"></script>
        <script src="dcss/js/bootstrap.min.js"></script>
        
        <!-- Fixed Menu Script -->
        <script>
            $(document).ready(function() {
                // Fixed header functionality
                var secondaryNav = $('.cd-secondary-nav'),
                    secondaryNavTopPosition = secondaryNav.offset().top;
                
                $(window).on('scroll', function() {
                    if($(window).scrollTop() > secondaryNavTopPosition) {
                        secondaryNav.addClass('is-fixed');
                        $("body").css("padding-top", secondaryNav.height());
                    } else {
                        secondaryNav.removeClass('is-fixed');
                        $("body").css("padding-top", 0);
                    }
                });

                // Initialize Bootstrap dropdowns
                $('.dropdown-toggle').dropdown();
            });
        </script>
    </body>
</html>