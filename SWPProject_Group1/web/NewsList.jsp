<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                <jsp:include page="header1.jsp" />

 <style>
        /* Điều chỉnh kích thước container và ảnh */
        .center_home_1lm1 {
            height: 510px;
            border: 1px solid #eee;
            border-radius: 5px;
            overflow: hidden;
            position: relative; /* Ensures child elements can be positioned relative to this container */
        }
        
/*        .center_home_1lm1 a {
            display: block;
            width: 330px;
            height: 260px;
            overflow: hidden;
        }*/
        
        .center_home_1lm1 .iw {
            width: 330px;
            height: 260px;
            object-fit: cover;
        }
        
        Điều chỉnh hiển thị nội dung 
        .center_home_1lm1 p {
            height: 48px;
            overflow: hidden;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            text-overflow: ellipsis;
            margin: 10px 15px;
            line-height: 1.5;
        }
        
        /* Điều chỉnh các phần tử khác */
        .center_home_1lm1 h6 {
            padding: 10px 15px 0;
            margin: 0;
        }
        
        .center_home_1lm1 ul {
            padding: 5px 15px;
            margin: 0;
        }
        
        .center_home_1lm1 ul li {
            display: inline-block;
            margin-right: 15px;
            font-size: 14px;
            color: #666;
        }
        
        .center_home_1lm1 h5 {
            padding: 0 15px;
        }
        
        .center_home_1lm1 .button {
    display: inline-block;
    margin-top: 10px;
    position: absolute;
    bottom: 10px; /* Fixed distance from the bottom */
    left: 50%;
    
    transform: translateX(-60%); /* Center aligns the button horizontally */
    padding-bottom: 10px;
    transition: background-color 0.3s;
}
        
        
        .news-description {
            height: 48px; /* Approximately 2 lines */
            overflow: hidden;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            text-overflow: ellipsis;
            margin: 10px 0;
            margin-left: 12px;
            line-height: 1.5;
        }
        .h5 .mgt{
            margin-left: 30px;
        }
    </style>
    <script src="js/jquery-2.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </head>
  
<body>

<section id="center" class="center_blog">
 <div class="container">
  <div class="row">
    

    <div class="center_blog_1 text-center clearfix">
        <div class="col-sm-12">
          <h4 class="head_bg mgt mgb"><span>News</span></h4>
        </div>
    </div>
    <div class="col-sm-12 mb-4">
        <form action="UnewsList" method="GET" class="form-inline justify-content-center">
            <input type="hidden" name="action" value="list">
            <input type="text" name="search" value="${param.search}" class="form-control mr-2" placeholder="Search news...">
            <select name="sortOrder" class="form-control mr-2">
                <option value="newest" ${param.sortOrder == 'newest' ? 'selected' : ''}>Newest First</option>
                <option value="oldest" ${param.sortOrder == 'oldest' ? 'selected' : ''}>Oldest First</option>
            </select>
            <button type="submit" class="btn btn-primary">Search</button>
        </form>
    </div>
    <div class="center_blog_2 clearfix">
        <c:forEach var="newsItem" items="${newsList}">
            <div class="col-sm-4">
                <div class="center_home_1lm1 clearfix">
                    <a href="?action=view&id=${newsItem.id}">
                        <img src="${newsItem.image}" class="iw" alt="${newsItem.title}">
                    </a>
                    <h6 class="col_2">
                        <span class="bold col_1">${newsItem.title}</span> / ${newsItem.location}
                    </h6>
                    <ul>
                        <li><i class="fa fa-calendar"></i> <a href="#">${newsItem.created_at}</a></li>    
                    </ul>
                    <p class="news-description">${newsItem.content}...</p>
                        <h5 class="mgt"><a class="button" href="?action=view&id=${newsItem.id}">READ MORE</a></h5>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- Pagination -->
    <div class="product_1_last text-center clearfix">
        <div class="col-sm-12">
            <c:if test="${noOfPages > 1}">
                <ul>
                    <c:if test="${currentPage > 1}">
                        <li>
                            <a href="UnewsList?action=list&page=${currentPage - 1}&search=${param.search}&sortOrder=${param.sortOrder}">
                                <i class="fa fa-chevron-left"></i>
                            </a>
                        </li>
                    </c:if>
                    
                    <c:forEach begin="1" end="${noOfPages}" var="i">
                        <li class="${i == currentPage ? 'act' : ''}">
                            <a href="UnewsList?action=list&page=${i}&search=${param.search}&sortOrder=${param.sortOrder}">${i}</a>
                        </li>
                    </c:forEach>

                    <c:if test="${currentPage < noOfPages}">
                        <li>
                            <a href="UnewsList?action=list&page=${currentPage + 1}&search=${param.search}&sortOrder=${param.sortOrder}">
                                <i class="fa fa-chevron-right"></i>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </c:if>
        </div>
    </div>
  </div>
 </div>
</section>
        <jsp:include page="footer1.jsp" />

</body>
</html>