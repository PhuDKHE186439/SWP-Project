<%-- 
    Document   : ListTrain
    Created on : Sep 25, 2024, 9:12:12 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Bootstrap Example</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>

        <div class="container mt-3">
            <h2>List Train</h2>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addTrain">
                Add Train
            </button>        
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Schedule Time</th>
                        <th>Name</th>
                        <th>Number Of Seats</th>
                        <th>Location Start</th>
                        <th>Location Arrival</th>
                        <th colspan="2">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="item">
                        <tr>
                            <td>${item.trainID}</td>
                            <td>${item.trainScheduleTime}</td>
                            <td>${item.trainName}</td>
                            <td>${item.numberOfSeat}</td>
                            <td>${item.start.locationName}</td>
                            <td>${item.end.locationName}</td>
                            <td>
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#updateTrain${item.trainID}">
                                    Update
                                </button> 
                            </td>
                            <td><a href="${pageContext.request.contextPath}/admin/delete?id=${item.trainID}">Delete</a></td>
                    <div class="modal fade" id="updateTrain${item.trainID}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Update Train</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <form action="${pageContext.request.contextPath}/admin/update" method="post">
                                    <div class="modal-body">
                                        <input type="hidden" name="id" value="${item.trainID}" >
                                        <div class="mb-3">
                                            <label for="recipient-time" class="col-form-label">Schedule Time</label>
                                            <input type="date" class="form-control" id="recipient-time" required="" name="schedule" value="${item.trainScheduleTime}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="recipient-name" class="col-form-label">Name</label>
                                            <input type="text" class="form-control" id="recipient-name" required="" name="name" value="${item.trainName}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="recipient-seats" class="col-form-label">Number Of Seats</label>
                                            <input type="number" min="1" class="form-control" id="recipient-seats" name="seats" required="" value="${item.numberOfSeat}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="recipient-seats" class="col-form-label">Location Start</label>
                                            <select name="startID" required="">
                                                <c:forEach items="${locations}" var="i">
                                                    <option value="${i.locationID}" ${item.start.locationID == i.locationID ? 'selected' : ''}>${i.locationName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="recipient-seats" class="col-form-label">Location End</label>
                                            <select name="endID" required="">
                                                <c:forEach items="${locations}" var="i">
                                                    <option value="${i.locationID}" ${item.end.locationID == i.locationID ? 'selected' : ''}>${i.locationName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Update</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="modal fade" id="addTrain" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add New Train</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="${pageContext.request.contextPath}/admin/create" method="post">
                        <div class="modal-body">
                            <input type="hidden" name="id" value="${size + 1}" >
                            <div class="mb-3">
                                <label for="recipient-time" class="col-form-label">Schedule Time</label>
                                <input type="date" class="form-control" id="recipient-time" required="" name="schedule">
                            </div>
                            <div class="mb-3">
                                <label for="recipient-name" class="col-form-label">Name</label>
                                <input type="text" class="form-control" id="recipient-name" required="" name="name">
                            </div>
                            <div class="mb-3">
                                <label for="recipient-seats" class="col-form-label">Number Of Seats</label>
                                <input type="number" class="form-control" id="recipient-seats" name="seats" required=""> 
                            </div>
                            <div class="mb-3">
                                <label for="recipient-seats" class="col-form-label">Location Start</label>
                                <select name="startID" required="">
                                    <c:forEach items="${locations}" var="i">
                                        <option value="${i.locationID}">${i.locationName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="recipient-seats" class="col-form-label">Location End</label>
                                <select name="endID" required="">
                                    <c:forEach items="${locations}" var="i">
                                        <option value="${i.locationID}">${i.locationName}</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Create</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
