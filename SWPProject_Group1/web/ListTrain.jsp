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
            <c:if test="${error != null}">
                <p style="color: red">${error}</p>
            </c:if>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addTrain">
                Add Train
            </button>        
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
                        <th colspan="2">Action</th>
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

                            <td>
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#updateTrain${item.trainID}">
                                    Update
                                </button> 
                            </td>
                            <td><a href="${pageContext.request.contextPath}/tm/delete?id=${item.trainID}" onclick="return confirmDelete();">Delete</a></td>
                    <div class="modal fade" id="updateTrain${item.trainID}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Update Train</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <form action="${pageContext.request.contextPath}/tm/update" method="post">
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
                                            <label for="recipient-seats" class="col-form-label">Location Start</label>
                                            <select name="startID" required=""  class="form-control">
                                                <c:forEach items="${locations}" var="i">
                                                    <option value="${i.locationID}" ${item.startLocation.locationID == i.locationID ? 'selected' : ''}>${i.locationName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="recipient-seats" class="col-form-label">Location End</label>
                                            <select name="endID" required=""  class="form-control">
                                                <c:forEach items="${locations}" var="i">
                                                    <option value="${i.locationID}" ${item.arrivalLocation.locationID == i.locationID ? 'selected' : ''}>${i.locationName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <div class="mb-3">
                                            <label for="recipient-startTime" class="col-form-label">Start Time</label>
                                            <input type="time" class="form-control" id="recipient-startTime" name="startTime" required="" value="${item.startTime}">
                                        </div>

                                        <div class="mb-3">
                                            <label for="recipient-estimatedEndTime" class="col-form-label">Estimated End Time</label>
                                            <input type="time" class="form-control" id="recipient-estimatedEndTime" name="estimatedEndTime" required="" value="${item.estimatedEndTime}">
                                        </div>

                                        <div class="mb-3">
                                            <label for="recipient-numberOfCarriages" class="col-form-label">Number Of Carriages</label>
                                            <input type="number" class="form-control" id="recipient-numberOfCarriages" name="numberOfCarriages" required="" value="${item.numberOfCarriages}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="recipient-seats" class="col-form-label">Number Of Seats</label>
                                            <input type="number" min="1" class="form-control" id="recipient-seats" name="seats" required="" value="${item.numberOfSeat}">
                                        </div>

                                        <div class="mb-3">
                                            <label for="recipient-status" class="col-form-label">Status</label>
                                            <select name="status" class="form-control" id="recipient-status" required="">
                                                <option value="Active" <c:if test="${item.status == 'Active'}">selected</c:if>>Active</option>
                                                <option value="Waiting for Departure" <c:if test="${item.status == 'Waiting for Departure'}">selected</c:if>>Waiting for Departure</option>
                                                <option value="Under Maintenance" <c:if test="${item.status == 'Under Maintenance'}">selected</c:if>>Under Maintenance</option>
                                                <option value="Delayed" <c:if test="${item.status == 'Delayed'}">selected</c:if>>Delayed</option>
                                                <option value="Cancelled" <c:if test="${item.status == 'Cancelled'}">selected</c:if>>Cancelled</option>
                                                <option value="Completed" <c:if test="${item.status == 'Completed'}">selected</c:if>>Completed</option>
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
                    <form action="${pageContext.request.contextPath}/tm/create" method="post">
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
                                <label for="recipient-seats" class="col-form-label">Location Start</label>
                                <select name="startID" required=""  class="form-control" >
                                    <c:forEach items="${locations}" var="i">
                                        <option value="${i.locationID}">${i.locationName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="recipient-seats" class="col-form-label">Location End</label>
                                <select name="endID" required=""  class="form-control">
                                    <c:forEach items="${locations}" var="i">
                                        <option value="${i.locationID}">${i.locationName}</option>
                                    </c:forEach>
                                </select>
                            </div>


                            <div class="mb-3">
                                <label for="recipient-startTime" class="col-form-label">Start Time</label>
                                <input type="time" class="form-control" id="recipient-startTime" name="startTime" required="">
                            </div>

                            <div class="mb-3">
                                <label for="recipient-estimatedEndTime" class="col-form-label">Estimated End Time</label>
                                <input type="time" class="form-control" id="recipient-estimatedEndTime" name="estimatedEndTime" required="">
                            </div>

                            <div class="mb-3">
                                <label for="recipient-numberOfCarriages" class="col-form-label">Number Of Carriages</label>
                                <input type="number" class="form-control" id="recipient-numberOfCarriages" name="numberOfCarriages" required="">
                            </div>
                            <div class="mb-3">
                                <label for="recipient-seats" class="col-form-label">Number Of Seats</label>
                                <input type="number" class="form-control" id="recipient-seats" name="seats" required=""> 
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
                            <script>
                                function confirmDelete(){
                                    return confirm("Are you sure you want to delete this item?")
                                }
                            </script>       
    </body>
</html>