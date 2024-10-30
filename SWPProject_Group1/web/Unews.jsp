<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            /* Your existing styles */
            .center_home_1m1 img {
                width: 560px;
                height: 430px;
                object-fit: cover;
                display: block;
                margin: 0 auto;
            }
            .center_home_1m1 {
                margin-bottom: 20px;
            }
            .center_home_1lm1 img {
                width: 280px;
                height: 180px;
                object-fit: cover;
                display: block;
                margin: 0 auto;
            }
            .center_home_1lm1 {
                margin-bottom: 15px;
            }
            .truncate {
                display: -webkit-box;
                -webkit-box-orient: vertical;
                overflow: hidden;
                -webkit-line-clamp: 2;
                max-height: 3em;
                line-height: 1.5em;
                text-overflow: ellipsis;
            }
            
            /* New styles for search box */
            .search-container {
                background: #f8f9fa;
                padding: 20px 0;
                margin-bottom: 30px;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }
            
            .search-box {
                max-width: 600px;
                margin: 0 auto;
            }
            
            .search-box input[type="text"] {
                height: 45px;
                border-radius: 25px;
                padding: 0 20px;
                border: 1px solid #ddd;
                width: calc(100% - 120px);
                float: left;
            }
            
            .search-box button {
                height: 45px;
                border-radius: 25px;
                width: 100px;
                margin-left: 10px;
                background-color: #007bff;
                color: white;
                border: none;
                float: left;
            }
            
            .search-box button:hover {
                background-color: #0056b3;
            }
            
            .search-box::after {
                content: '';
                display: table;
                clear: both;
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
                                        <a href="Unews?action=view&id=${newsItem.id}">
                                            <img src="${newsItem.image}" class="iw" alt="${newsItem.title}" style="width: 280px; height: 180px;">
                                        </a>
                                        <h6 class="col_2">
                                            <span class="bold col_1">${newsItem.location}</span> / ${newsItem.created_at}
                                        </h6>
                                        <h5 class="bold">
                                            <a href="Unews?action=view&id=${newsItem.id}">${newsItem.title}</a>
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
                                            <a href="Unews?action=view&id=${newsItem.id}">
                                                <img src="${newsItem.image}" class="iw" alt="${newsItem.title}">
                                            </a>
                                        </div>
                                        <div class="center_home_1m1i1${status.first ? '' : 'o'}">
                                            <h6 class="col_3 mgt">
                                                <span class="bold col_1">${newsItem.location}</span> / ${newsItem.created_at}
                                            </h6>
                                            <h${status.first ? '1' : '3'}>
                                                <a class="col" href="Unews?action=view&id=${newsItem.id}">${newsItem.title}</a>
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

    <!-- Your existing scripts -->
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