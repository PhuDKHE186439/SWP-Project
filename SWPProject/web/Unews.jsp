<%-- 
    Document   : Unews
    Created on : Oct 13, 2024, 11:53:58 PM
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
        <link href="dcss/css/index.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="dcss/css/font-awesome.min.css" />
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
        <script src="js/jquery-2.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <jsp:include page="header1.jsp" />
        <style>
            .center_home_1m1 img {
                width: 560px;   /* Set the width of the image */
                height: 430px;  /* Set the height of the image */
                object-fit: cover; /* Ensures the image covers the area without distortion */
                display: block; /* Ensure the image behaves as a block element */
                margin: 0 auto; /* Center the image within its container */
            }
            .center_home_1m1 {
                margin-bottom: 20px; /* Adds some spacing between news items */
            }
            .center_home_1lm1 img {
                width: 280px;   /* Set the width of the image */
                height: 180px;  /* Set the height of the image */
                object-fit: cover; /* Ensures the image covers the area without distortion */
                display: block; /* Ensure the image behaves as a block element */
                margin: 0 auto; /* Center the image within its container */
            }
            .center_home_1lm1 {
                margin-bottom: 15px; /* Adds spacing between news items */
            }
            .truncate {
                display: -webkit-box;
                -webkit-box-orient: vertical;
                overflow: hidden;
                -webkit-line-clamp: 2; /* Limit to 2 lines */
                max-height: 3em; /* Adjust height according to line height */
                line-height: 1.5em; /* Adjust line height */
                text-overflow: ellipsis;
            }

        </style>

        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <section id="center" class="center_home">
        <div class="container">
            <div class="row">
                <div class="center_home_1 clearfix">
                    <div class="col-sm-3 space_right">
                        <div class="center_home_1lm clearfix">
                            <div class="center_home_1lm1 clearfix">
                                <c:forEach var="newsItem" items="${newsList}" begin="0" end="4">
                                    <c:if test="${newsItem.status != 2}">
                                        <a href="?action=view&id=${newsItem.id}">
                                            <img src="${newsItem.image}" class="iw" alt="${newsItem.title}" style="width: 280px; height: 180px;">
                                        </a>
                                        <h6 class="col_2">
                                            <span class="bold col_1">${newsItem.location}</span> / ${newsItem.created_at}
                                        </h6>
                                        <h5 class="bold">
                                            <a href="?action=view&id=${newsItem.id}">${newsItem.title}</a>
                                        </h5>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="center_home_1m clearfix">
                            <c:forEach var="newsItem" items="${newsList}" begin="7" end="9">
                                <c:if test="${newsItem.status != 2}">
                                    <div class="center_home_1m1 ${status.first ? 'mgt' : ''} clearfix">
                                        <div class="center_home_1m1i">
                                            <a href="?action=view&id=${newsItem.id}">
                                                <img src="${newsItem.image}" class="iw" alt="${newsItem.title}">
                                            </a>
                                        </div>
                                        <div class="center_home_1m1i1${status.first ? '' : 'o'}">
                                            <h6 class="col_3 mgt">
                                                <span class="bold col_1">${newsItem.location}</span> / ${newsItem.created_at}
                                            </h6>
                                            <h${status.first ? '1' : '3'}>
                                                <a class="col" href="?action=view&id=${newsItem.id}">${newsItem.title}</a>
                                            </h${status.first ? '1' : '3'}>
                                            <p class="col_3 truncate">${newsItem.content}</p>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div> 
                    <div class="center_home_1rm clearfix">

                        <jsp:include page="sidebar1.jsp" />
                    </div>
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="footer1.jsp" />


    <script>
        $(document).ready(function () {

            /*****Fixed Menu******/
            var secondaryNav = $('.cd-secondary-nav'),
                    secondaryNavTopPosition = secondaryNav.offset().top;
            $(window).on('scroll', function () {
                var navbar_height = document.querySelector('.navbar').offsetHeight;
                var top = 30;
                if ($(window).scrollTop() > secondaryNavTopPosition) {
                    secondaryNav.addClass('is-fixed');
                    $("body").css("padding-top", navbar_height);
                } else {
                    secondaryNav.removeClass('is-fixed');
                    $("body").css("padding-top", 0);
                }
            });

        });
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
