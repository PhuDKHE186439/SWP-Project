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
                 ">
              
            <!-- Footer Start -->
    <div class="page-wrapper"> 
                <div data-animation="default" data-collapse="medium" data-duration="400" data-easing="ease" data-easing2="ease" role="banner" class="dash_nav-bar w-nav"></div>
                <div class="dash_content">
                    <div class="dash_header">
                        <div>
                            <h1 class="dash_h1">Trains Schedule</h1>
                        </div>

                    </div>
                    <form action="trains-schedule" method="get">
                        <div style="display: flex; margin-bottom: 20px;align-items: flex-end;">
                            <div>
                                <label for="recipient-seats" class="col-form-label">Location Start</label>
                                <select name="startID" class="form-control">
                                    <option value="">All</option>
                                <c:forEach items="${locations}" var="i">
                                    <option value="${i.locationID}" ${startID == i.locationID ? 'selected' : ''}>${i.locationName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div style="margin-left: 16px">
                            <label for="recipient-seats" class="col-form-label">Location End</label>
                            <select name="endID" class="form-control">
                                <option value="">All</option>
                                <c:forEach items="${locations}" var="i">
                                    <option value="${i.locationID}" ${endID == i.locationID ? 'selected' : ''}>${i.locationName}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div style="margin-left: 16px">
                            <button type="submit" class="btn btn_get btn_get_two" class="form-control">Search</button>
                        </div>

                    </div>
                </form>
                <div class="dash_contain">
                    <div class="relative">
                        
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Schedule Time</th>
                                    <th>Name</th>
                                    <th>Location Start</th>
                                    <th>Location Arrival</th>
                                    <th>Start Time</th>
                                    <th>Estimated End Time</th>
                                    <th>Number Of Carriages</th>
                                    <th>Number Of Seats</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${list}" var="item">
                                    <tr>
                                        <td>${item.trainID}</td>
                                        <td>${item.trainScheduleTime}</td>
                                        <td>${item.trainName}</td>
                                        <td>${item.startLocation.locationName}</td>
                                        <td>${item.arrivalLocation.locationName}</td>

                                        <td>${item.startTime}</td>
                                        <td>${item.estimatedEndTime}</td>
                                        <td>${item.numberOfCarriages}</td>
                                        <td>${item.numberOfSeat}</td>
                                        <td>${item.status}</td>
                                        <td><a href="trains?tripType=oneWay&ngayDi=${item.trainScheduleTime}&ngayVe=&l1=${item.startLocationID}&l2=${item.arrivalLocationID}" class="btn btn-primary">Booking</a></td>

                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        
                    </div></div>
                    
                    <div class="row">
                                <div class="col-12">
                                    <nav aria-label="navigation">
                                        <ul class="pagination justify-content-end mt-50" id="paging">
                                            <c:forEach begin="1" end="${totalPage}" var="i">
                                                <li class="page-item ${i == pageIndex ? 'active' : ''}">
                                                    <a href="trains-schedule?pageIndex=${i}&startID=${startID}&endID=${endID}" data-page="${i}" class="page-link">${i}</a>
                                                </li>

                                            </c:forEach>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                    
            </div>
        </div>


            <!-- Footer End -->
        </div>
    </body>
    <jsp:include page = "Footer.jsp"></jsp:include>

</html>
