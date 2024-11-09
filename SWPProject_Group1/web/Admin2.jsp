<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, model.account, dal.AccountDAO, model.role, dal.RoleDAO"%>
<%@page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    AccountDAO accountDAO = new AccountDAO();
    List<account> accounts = accountDAO.getAllAccount(); // Make sure this retrieves the accounts list
%>

<%
    RoleDAO roleDAO = new RoleDAO();
    List<role> roles = roleDAO.getAllRoles();
%>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>DASHMIN</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

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
                    <a href="BanAccount" class="navbar-brand mx-4 mb-3">
                        <h3 class="text-primary">Train Traveler</h3>
                    </a>
                    <div class="d-flex align-items-center ms-4 mb-4">
                        <div class="position-relative">
                            <img class="rounded-circle me-lg-2" src="bssets/img/user2.png" alt="" style="width: 40px; height: 40px;">
                            <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                        </div>
                        <div class="ms-3">
                            <h6 class="mb-0">Admin</h6>
                        </div>
                    </div>
                    <div class="navbar-nav w-100">
                        <a href="BanAccount" class="nav-item nav-link"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                        <div class="nav-item dropdown">
                        </div>
                        <a href="Admin2.jsp" class="nav-item nav-link active"><i class="fa fa-th me-2"></i>Bugs Report</a>
                </nav>
            </div>      
            <!-- Sidebar End -->


            <!-- Content Start -->
            <div class="content">
                <!-- Navbar Start -->
                <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                    <a href="BanAccount" class="navbar-brand d-flex d-lg-none me-4">
                        <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                    </a>
                    <a href="#" class="sidebar-toggler flex-shrink-0">
                        <i class="fa fa-bars"></i>
                    </a>
                    <form class="d-none d-md-flex ms-4">
                        <input class="form-control border-0" type="search" placeholder="Search">
                    </form>
                    <div class="navbar-nav align-items-center ms-auto">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <img class="rounded-circle me-lg-2" src="bssets/img/user2.png" alt="" style="width: 40px; height: 40px;">
                                <span class="d-none d-lg-inline-flex">Admin</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <a href="logout" class="dropdown-item">Log Out</a>
                            </div>
                        </div>
                    </div>
                </nav>
                <!-- Navbar End -->

                <!-- Account Update Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light text-center rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Bugs Feedback</h6>
                            <a href="feedback">Show All</a>
                        </div>

                        <!-- Search and Filter Section -->
                        <form action="feedbackadmin" method="get" class="mb-4" id="searchForm">
                            <div class="row mb-3 align-items-center">
                                <div class="col-md-6">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Search Feedback" name="search" value="${param.search}">
                                        <button type="submit" class="btn btn-primary">Search</button>
                                    </div>
                                </div>
                                <div class="col-md-6 text-end">
                                    <select name="sortOrder" class="form-select d-inline-block w-auto" onchange="document.getElementById('searchForm').submit();">
                                        <option value="latest" ${param.sortOrder == 'latest' ? 'selected' : ''}>Latest</option>
                                        <option value="oldest" ${param.sortOrder == 'oldest' ? 'selected' : ''}>Oldest</option>
                                    </select>
                                </div>
                            </div>
                        </form>

                        <!-- Feedback Table -->
                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0">
                                <thead>
                                    <tr class="text-dark">
                                        <th scope="col">Feedback ID</th>
                                        <th scope="col">Message</th>
                                        <th scope="col">Submission Date</th>
                                        <th scope="col">Status</th>
                                                                <th scope="col">Actions</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="feedback" items="${feedbackList2}">
                                        <tr>
                                            <td>${feedback.feedbackID}</td>
                                            <td>${feedback.message}</td>
                                            <td>${feedback.submissionDate}</td>
                                            <td>${feedback.status ? "Finish" : "In Order"}</td>
                                            <td>
                                <form action="feedback" method="post" style="display: inline;">
                                    <input type="hidden" name="feedbackID" value="${feedback.feedbackID}">
                                    <c:choose>
                                        <c:when test="${!feedback.status}">
                                            <button type="submit" name="action" value="Finish" 
                                                    class="btn btn-sm btn-success">
                                                Mark as Finish
                                            </button>
                                        </c:when>
                                        <c:otherwise>
                                            <button type="submit" name="action" value="In Order" 
                                                    class="btn btn-sm btn-warning">
                                                Mark as In Order
                                            </button>
                                        </c:otherwise>
                                    </c:choose>
                                </form>
                            </td>
                                            
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>


                        <!-- Pagination Controls -->
                        <div class="mt-4 text-center">
                            <c:if test="${currentPage > 1}">
                                <a href="feedbackadmin?page=${currentPage - 1}&search=${param.search}&sortOrder=${param.sortOrder}" class="btn btn-primary">Previous</a>
                            </c:if>

                            <c:if test="${currentPage > 2}">
                                <a href="feedbackadmin?page=1&search=${param.search}&sortOrder=${param.sortOrder}" class="btn btn-outline-primary">1</a>
                                <c:if test="${currentPage > 3}">
                                    <span>...</span>
                                </c:if>
                            </c:if>

                            <c:if test="${currentPage > 1}">
                                <a href="feedbackadmin?page=${currentPage - 1}&search=${param.search}&sortOrder=${param.sortOrder}" class="btn btn-outline-primary">${currentPage - 1}</a>
                            </c:if>

                            <span class="btn btn-primary">${currentPage}</span>

                            <c:if test="${currentPage < totalPages}">
                                <a href="feedbackadmin?page=${currentPage + 1}&search=${param.search}&sortOrder=${param.sortOrder}" class="btn btn-outline-primary">${currentPage + 1}</a>
                            </c:if>

                            <c:if test="${currentPage < totalPages - 1}">
                                <c:if test="${currentPage < totalPages - 2}">
                                    <span>...</span>
                                </c:if>
                                <a href="feedbackadmin?page=${totalPages}&search=${param.search}&sortOrder=${param.sortOrder}" class="btn btn-outline-primary">${totalPages}</a>
                            </c:if>

                            <c:if test="${currentPage < totalPages}">
                                <a href="feedbackadmin?page=${currentPage + 1}&search=${param.search}&sortOrder=${param.sortOrder}" class="btn btn-primary">Next</a>
                            </c:if>

                            <div class="mt-2">
                                Page ${currentPage} of ${totalPages}
                            </div>
                        </div>

                    </div>
                </div>


                <!-- Account Update End -->

                <!-- Widgets Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-sm-12 col-md-6 col-xl-4">
                            <div class="h-100 bg-light rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Role Management</h6>
                                    <a href="">Show All</a>
                                </div>
                                <!-- Add Role -->
                                <div class="d-flex align-items-center mb-3">
                                    <form action="ManageRole" method="post" class="d-flex align-items-center">
                                        <input class="form-control bg-transparent" type="text" placeholder="Enter role name" name="roleName" required>
                                        <input type="hidden" name="action" value="add">
                                        <button type="submit" class="btn btn-primary ms-2">Add</button>
                                    </form>
                                </div>



                                <!-- Existing Roles -->
                                <% for (role r : roles) { %>
                                <div class="d-flex align-items-center border-bottom py-2">
                                    <div class="w-100 ms-3">
                                        <div class="d-flex w-100 justify-content-between align-items-center">
                                            <span><%= r.getRoleName() %></span>
                                            <div class="d-flex">
                                                <button class="btn btn-sm btn-warning ms-1" onclick="openEditPopup('<%= r.getRoleID() %>', '<%= r.getRoleName() %>')">Edit</button>
                                                <form action="ManageRole" method="post" class="d-inline" onsubmit="return confirm('Are you sure you want to delete this role?')">
                                                    <input type="hidden" name="action" value="delete">
                                                    <input type="hidden" name="roleID" value="<%= r.getRoleID() %>">
                                                    <button type="submit" class="btn btn-sm text-danger ms-1"><i class="fa fa-times"></i></button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <% } %>
                            </div>
                        </div>

                        <!-- Edit Role Popup -->
                        <div id="editRolePopup" style="display: none;" class="popup">
                            <div class="popup-content">
                                <span class="close" onclick="closeEditPopup()">&times;</span>
                                <form action="ManageRole" method="post">
                                    <input type="hidden" name="action" value="edit">
                                    <input type="hidden" id="editRoleID" name="roleID">
                                    <div class="input-wrapper">
                                        <label for="roleName" class="profile_label">New Role Name</label>
                                        <input type="text" id="editRoleName" name="roleName" placeholder="Enter new role name" required>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Confirm</button>
                                </form>
                            </div>
                        </div>

                        <script>
                            function openEditPopup(roleID, roleName) {
                                document.getElementById('editRoleID').value = roleID;
                                document.getElementById('editRoleName').value = roleName;
                                document.getElementById('editRolePopup').style.display = 'block';
                            }

                            function closeEditPopup() {
                                document.getElementById('editRolePopup').style.display = 'none';
                            }
                        </script>

                        <style>
                            .popup {
                                position: fixed;
                                z-index: 1;
                                left: 0;
                                top: 0;
                                width: 100%;
                                height: 100%;
                                overflow: auto;
                                background-color: rgba(0,0,0,0.4);
                                padding-top: 60px;
                                display: flex;
                                justify-content: center;
                                align-items: center;
                            }

                            .popup-content {
                                background-color: #fefefe;
                                padding: 20px;
                                border: 1px solid #888;
                                width: 80%;
                                max-width: 400px;
                                margin: auto;
                            }

                            .close {
                                color: #aaa;
                                float: right;
                                font-size: 28px;
                                font-weight: bold;
                            }

                            .close:hover,
                            .close:focus {
                                color: black;
                                text-decoration: none;
                                cursor: pointer;
                            }
                        </style>



                        <div class="col-sm-12 col-md-6 col-xl-4">
                            <div class="h-100 bg-light rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Calender</h6>
                                    <a href="">Show All</a>
                                </div>
                                <div id="calender"></div>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-6 col-xl-4">
                            <div class="h-100 bg-light rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">To Do List</h6>
                                    <a href="">Show All</a>
                                </div>
                                <div class="d-flex mb-2">
                                    <input class="form-control bg-transparent" type="text" placeholder="Enter task">
                                    <button type="button" class="btn btn-primary ms-2">Add</button>
                                </div>
                                <div class="d-flex align-items-center border-bottom py-2">
                                    <input class="form-check-input m-0" type="checkbox">
                                    <div class="w-100 ms-3">
                                        <div class="d-flex w-100 align-items-center justify-content-between">
                                            <span>Update Admin Page UI</span>
                                            <button class="btn btn-sm"><i class="fa fa-times"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center border-bottom py-2">
                                    <input class="form-check-input m-0" type="checkbox">
                                    <div class="w-100 ms-3">
                                        <div class="d-flex w-100 align-items-center justify-content-between">
                                            <span>Make Basic Function</span>
                                            <button class="btn btn-sm"><i class="fa fa-times"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center border-bottom py-2">
                                    <input class="form-check-input m-0" type="checkbox" checked>
                                    <div class="w-100 ms-3">
                                        <div class="d-flex w-100 align-items-center justify-content-between">
                                            <span><del>Add Role Manage</del></span>
                                            <button class="btn btn-sm text-primary"><i class="fa fa-times"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center border-bottom py-2">
                                    <input class="form-check-input m-0" type="checkbox">
                                    <div class="w-100 ms-3">
                                        <div class="d-flex w-100 align-items-center justify-content-between">
                                            <span>Can Show Bugs Type Report</span>
                                            <button class="btn btn-sm"><i class="fa fa-times"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center pt-2">
                                    <input class="form-check-input m-0" type="checkbox">
                                    <div class="w-100 ms-3">
                                        <div class="d-flex w-100 align-items-center justify-content-between">
                                            <span>Short task goes here...</span>
                                            <button class="btn btn-sm"><i class="fa fa-times"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Widgets End -->
                <!-- Footer Start -->
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
    </body>
</html>
