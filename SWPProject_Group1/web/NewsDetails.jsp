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



    <section id="center" class="center_detail">
        <div class="container">
            <div class="row">
                <div class="center_blog_1 text-center clearfix">
                    <div class="col-sm-12">
                        <h4 class="head_bg mgt"><span>NEWS DETAIL</span></h4>
                    </div>
                </div>
                <div class="center_detail_1 clearfix">
                    <div class="col-sm-9">
                        <div class="center_detail_1lm clearfix">
                            <div class="center_detail_1lm clearfix">
                                <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                                <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                                <div class="center_detail_1lm1 clearfix">
                                    <h6 class="col_2">
                                        <span class="bold col_1">${selectedNews.location}</span> / 
                                        <fmt:formatDate value="${selectedNews.created_at}" pattern="yyyy"/>  / 
                                        <i class="fa fa-calendar col_1"></i> 
                                        <fmt:formatDate value="${selectedNews.created_at}" pattern="MMMM dd, yyyy"/>
                                    </h6>
                                    <h2>${selectedNews.title}</h2>

                                    <a href="#"><img src="${selectedNews.image}" class="iw" alt="${selectedNews.title}"></a>

                                    <!-- Wrapping description in a div for styling -->
                                    <div class="description">
                                        <p>${selectedNews.content}</p>
                                    </div>


                                </div>
                            </div>

                            <style>
                                .description {
                                    white-space: pre-wrap; /* Maintain whitespace and wrap lines */
                                    overflow-wrap: break-word; /* Allow long words to break and wrap */
                                    word-wrap: break-word; /* For compatibility with older browsers */
                                }
                            </style>

                        </div>
                    </div>
                    <div class="col-sm-3 space_left">
                        <div class="center_detail_1rm clearfix">
                            <div class="center_home_1lm1 mgt clearfix">
                                <jsp:include page="sidebar1.jsp" />

                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
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
<jsp:include page="footer1.jsp" />
