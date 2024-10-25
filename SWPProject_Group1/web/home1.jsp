<%-- 
    Document   : home1.jsp
    Created on : Oct 21, 2024, 7:56:41 AM
    Author     : My Asus
--%>
<%@page import="java.util.List, model.account, dal.AccountDAO, model.role, dal.RoleDAO"%>
<%@page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Customized Bootstrap Stylesheet -->

        <!-- Template Stylesheet -->
        <jsp:include page = "header1.jsp"></jsp:include>

        </head>
        <body>
            <div class="row" style="display: flex;
        justify-content: center; /* Horizontal centering */
        align-items: center;     /* Vertical centering */
        height: 50vh;  ">
                <!-- Search Form Section -->
                <div class="col-md-4 form-container w-50 border p-4 " style="border: 2px solid #000; /* Adjust the thickness and color as needed */
    padding: 15px;         /* Space inside the box */
    margin: 10px;         /* Space outside the box */
    border-radius: 5px;   /* Optional: rounded corners */
    background-color: #f9">
                    <h3 class="text-center mb-4">Tìm kiếm vé tàu</h3>
                    <form action="searchTrainResult.jsp" method="GET">
                        <!-- Ga đi -->
                        <div class="mb-3">
                            <label for="gaDi" class="form-label">Ga đi</label>
                            <select class="form-select" id="gaDi" style="width: 200px; height: 35px">
                                <option selected>Chọn ga đi</option>
                            <c:forEach var="i" items="${requestScope.location}">
                                <option value="${i.locationID}">${i.locationName}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <!-- Ga đến -->
                    <div class="mb-3">
                        <label for="gaDen" class="form-label">Ga đến</label>
                        <select class="form-select" id="gaDen" style="width: 200px; height: 35px">
                            <option selected>Chọn ga đến</option>
                            <c:forEach var="i" items="${requestScope.location}">
                                <option value="${i.locationID}">${i.locationName}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <!-- Ngày đi -->
                    <div class="mb-3">
                        <label for="ngayDi" class="form-label">Ngày đi</label>
                        <input type="date" class="form-control" id="ngayDi">
                    </div>

                    <!-- Ngày về -->
                    <div class="mb-3">
                        <label for="ngayVe" class="form-label">Ngày về</label>
                        <input type="date" class="form-control" id="ngayVe">
                    </div>

                    <!-- Nút tìm kiếm -->
                    <button type="submit" class="btn btn-primary w-100">Tìm kiếm</button>
                </form>
            </div>
            <!-- Footer Start -->



            <!-- Footer End -->
        </div>
    </body>
    <jsp:include page = "Footer.jsp"></jsp:include>

</html>
