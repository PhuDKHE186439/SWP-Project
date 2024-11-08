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
        <meta charset="utf-8">
        <title>DASHMIN - Bootstrap Admin Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
<base href="${pageContext.request.contextPath}/">
        <!-- Favicon -->
        <link href="bssets/img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="bssets/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="bssets/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="bssets/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="bssets/css/style.css" rel="stylesheet">
    </head>
    <body>
        <div class="container-xxl position-relative bg-white d-flex p-0">
            <!-- Spinner Start -->
            <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!-- Spinner End -->


            <!-- Sidebar Start -->
            <div class="sidebar pe-4 pb-3">
                <nav class="navbar bg-light navbar-light">
                    <a href="#" class="navbar-brand mx-4 mb-3">
                        <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>Manager</h3>
                    </a>
                    <div class="d-flex align-items-center ms-4 mb-4">
                        <div class="position-relative">
                            <img class="rounded-circle me-lg-2" src="bssets/img/user2.png" alt="" style="width: 40px; height: 40px;">
                            <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                        </div>
                        <div class="ms-3">
                            <h6 class="mb-0">Train Manager</h6>
                            <span>${sessionScope.accInfo.username}</span>
                        </div>
                    </div>
                    <div class="navbar-nav w-100">                        
                        <a href="tm/trains" class="nav-item nav-link active" ><i class="fa fa-th me-2"></i>Train Manager</a>
                    </div>
                </nav>
            </div>      
            <!-- Sidebar End -->


            <!-- Content Start -->
            <div class="content">
                <!-- Navbar Start -->
                <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                    <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                        <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                    </a>
                    <a href="#" class="sidebar-toggler flex-shrink-0">
                        <i class="fa fa-bars"></i>
                    </a>
                    <form class="d-none d-md-flex ms-4">
                        <!--<input class="form-control border-0" type="search" placeholder="Search">-->
                    </form>
                    <div class="navbar-nav align-items-center ms-auto">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link" data-bs-toggle="dropdown">
                                <i class="fa fa-envelope me-lg-2"></i>
                                <span class="d-none d-lg-inline-flex">Message</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">
                                    <div class="d-flex align-items-center">
                                        <img class="rounded-circle me-lg-2" src="bssets/img/user2.png" alt="" style="width: 40px; height: 40px;">
                                        <div class="ms-2">
                                            <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                            <small>15 minutes ago</small>
                                        </div>
                                    </div>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item text-center">See all message</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link" >
                                <i class="fa fa-bell me-lg-2"></i>
                                <span class="d-none d-lg-inline-flex">Notification</span>
                            </a>
                            
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <img class="rounded-circle me-lg-2" src="bssets/img/user2.png" alt="" style="width: 40px; height: 40px;">
                                <span class="d-none d-lg-inline-flex">${sessionScope.accInfo.username}</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <a href="logout" class="dropdown-item">Log Out</a>
                            </div>
                        </div>
                    </div>
                </nav>
                <!-- Navbar End -->

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
                
                 <div class="row">
                                <div class="col-12">
                                    <nav aria-label="navigation">
                                        <ul class="pagination justify-content-end mt-50" id="paging">
                                            <c:forEach begin="1" end="${totalPage}" var="i">
                                                <li class="page-item ${i == pageIndex ? 'active' : ''}">
                                                    <a href="tm/trains?pageIndex=${i}" data-page="${i}" class="page-link">${i}</a>
                                                </li>

                                            </c:forEach>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                
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
                              
   
                <!-- Footer End -->
            </div>
            <!-- Content End -->
            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        </div>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="bssets/lib/chart/chart.min.js"></script>
        <script src="bssets/lib/easing/easing.min.js"></script>
        <script src="bssets/lib/waypoints/waypoints.min.js"></script>
        <script src="bssets/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="bssets/lib/tempusdominus/js/moment.min.js"></script>
        <script src="bssets/lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="bssets/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="bssets/js/main.js"></script>
        <script src="assets/js/Admin.js"></script>
         <script>
                                function confirmDelete(){
                                    return confirm("Are you sure you want to delete this item?")
                                }
                            </script>    
    </body>

</html>