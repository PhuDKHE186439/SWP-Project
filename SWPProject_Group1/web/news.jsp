<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" type="image/png" href="image/logo-icon.png" />
    <title>Tin tức</title>
    <style>
body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .box {
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
        }
        .search-form {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .search-form input,
        .search-form select,
        .search-form button {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .search-form button {
            background-color: #3498db;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .search-form button:hover {
            background-color: #2980b9;
        }
        .news-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 100px;
        }
        .news-item {
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
            cursor: pointer;
        }
        .news-item:hover {
            transform: translateY(-5px);
        }
        .news-item img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .news-item h2 {
            font-size: 1.2em;
            margin: 10px;
        }
        .news-time {
            font-size: 0.8em;
            color: #7f8c8d;
            margin: 10px;
        }
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .pagination a, .pagination span {
            padding: 8px 16px;
            margin: 0 4px;
            border: 1px solid #ddd;
            color: #2c3e50;
            text-decoration: none;
            border-radius: 4px;
        }
        .pagination a:hover {
            background-color: #f1f1f1;
        }
        .pagination .current-page {
            background-color: #3498db;
            color: white;
            border-color: #3498db;
        }
        .selected-news {
            background-color: #fff;
            padding: 60px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .selected-news img {
            max-width: 80%;
            height: auto;
            margin-bottom: 20px;
                        margin-left: 120px;

        }
        .selected-news-content {
            white-space: pre-wrap; /* Giữ nguyên các khoảng trắng và ngắt dòng */
            font-size: 1.1em;
            line-height: 1.6;
            margin-top: 20px;
        }
        .news-list {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .news-item-small {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            cursor: pointer;
        }
        .news-item-small img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            margin-right: 10px;
            border-radius: 4px;
        }
        .news-item-small h4 {
            margin: 0;
            font-size: 1em;
        }    </style>
</head>
<body>
    <div class="box">
        <h1>Tin tức</h1>

        <!-- Search Form -->
        <form action="Unews" method="get" class="search-form">
            <input type="hidden" name="action" value="list">
            <input type="text" name="search" value="${search}" placeholder="Tìm kiếm tin tức...">
            
            <!-- Sort Order Dropdown -->
            <select name="sortOrder">
                <option value="newest" ${sortOrder == 'newest' ? 'selected' : ''}>Mới nhất</option>
                <option value="oldest" ${sortOrder == 'oldest' ? 'selected' : ''}>Cũ nhất</option>
            </select>

            <!-- Status Dropdown -->
            <select name="status">
                <option value="" ${status == '' ? 'selected' : ''}>Tất cả</option>
                <option value="published" ${status == 'published' ? 'selected' : ''}>Đã xuất bản</option>
                <option value="draft" ${status == 'draft' ? 'selected' : ''}>Nháp</option>
            </select>

            <button type="submit">Tìm kiếm</button>
        </form>

        <c:choose>
            <c:when test="${empty selectedNews}">
                <div class="news-container">
                    <c:forEach items="${newsList}" var="news">
                        <div class="news-item" onclick="viewNews('${news.id}');">
                            <img src="${news.image}" alt="${news.title}">
                            <h2>${news.title}</h2>
                            <div class="news-time">
                                <p><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${news.created_at}"/></p>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!-- Pagination -->
                <div class="pagination">
                    <c:if test="${currentPage != 1}">
                        <a href="Unews?action=list&page=${currentPage - 1}&search=${search}&sortOrder=${sortOrder}&status=${status}">Trước</a>
                    </c:if>
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <c:choose>
                            <c:when test="${currentPage eq i}">
                                <span class="current-page">${i}</span>
                            </c:when>
                            <c:otherwise>
                                <a href="Unews?action=list&page=${i}&search=${search}&sortOrder=${sortOrder}&status=${status}">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${currentPage lt totalPages}">
                        <a href="Unews?action=list&page=${currentPage + 1}&search=${search}&sortOrder=${sortOrder}&status=${status}">Tiếp</a>
                    </c:if>
                </div>
            </c:when>

            <c:otherwise>
                <div class="row">
                    <div class="col-md-8">
                        <div class="selected-news">
                            <h1>${selectedNews.title}</h1>
                            <p><fmt:formatDate pattern="dd/MM/yyyy HH:mm" value="${selectedNews.created_at}"/></p>
                            <img src="${selectedNews.image}" alt="${selectedNews.title}">
                            <div class="selected-news-content">${selectedNews.content}</div> <!-- Áp dụng CSS -->
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="news-list">
                            <h3>Tin tức khác</h3>
                            <c:forEach items="${otherNews}" var="news">
                                <div class="news-item-small" onclick="viewNews('${news.id}');">
                                    <img src="${news.image}" alt="${news.title}">
                                    <h4>${news.title}</h4>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <script>
        function viewNews(newsId) {
            window.location.href = 'Unews?action=view&id=' + newsId;
        }
    </script>
</body>
</html>
