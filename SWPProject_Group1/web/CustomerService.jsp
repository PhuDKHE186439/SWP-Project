<%-- 
    Document   : TestDASHMIN
    Created on : Sep 23, 2024, 5:35:56 PM
    Author     : My Asus
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Customer service</title>
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
            <div class="sidebar pe-4 pb-3" style="width: 330px;"> <!-- Adjust width as needed -->
                <nav class="navbar bg-light navbar-light">
                    <a href="/SWPProject_Group1/feedback" class="navbar-brand mx-4 mb-3" style="white-space: nowrap;"> <!-- Prevent wrapping -->
                        <h3 class="text-primary" style="display: inline; margin: 0;"> <!-- Inline display to avoid line breaks -->
                            CUSTOMER SERVICES <!-- Removed the hashtag icon -->
                        </h3>
                    </a>

                    <div class="d-flex align-items-center ms-4 mb-4">
                        <div class="position-relative">
                            <img class="rounded-circle" src="bssets/img/user2.png" alt="" style="width: 40px; height: 40px;">
                            <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                        </div>
                        <div class="ms-3">
                            <h6 class="mb-0">Staff</h6>
                            <span>CustomerService</span>
                        </div>
                    </div>
                    <div class="navbar-nav w-100">
                        <a href="http://localhost:9999/SWPProject_Group1/feedback" class="nav-item nav-link active" style="white-space: nowrap;"><i class="fa fa-tachometer-alt me-2"></i>Feedback Management</a>
                        <a href="http://localhost:9999/SWPProject_Group1/news" class="nav-item nav-link" style="white-space: nowrap;"><i class="fa fa-th me-2"></i>News Management</a>
                        <a href="http://localhost:9999/SWPProject_Group1/discount-manage" class="nav-item nav-link" style="white-space: nowrap;"><i class="fa fa-keyboard me-2"></i>Discount Management</a>
                        
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
                    <!--                    <form class="d-none d-md-flex ms-4">
                                            <input class="form-control border-0" type="search" placeholder="Search">
                                        </form>-->
                    <div class="navbar-nav align-items-center ms-auto">
                       
                        
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <img class="rounded-circle me-lg-2" src="bssets/img/user2.png" alt="" style="width: 40px; height: 40px;">
                                <span class="d-none d-lg-inline-flex">Customer Service</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <a href="logout" class="dropdown-item">Log Out</a>
                            </div>
                        </div>
                    </div>
                </nav>
                <!-- Navbar End -->
                <%@ page contentType="text/html;charset=UTF-8" language="java" %>
                <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
                <html lang="en">
                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
                        <title>Customer Feedback</title>
                    </head>
                    <body>
                        <!-- Customer Feedback Section Start -->
                        <div class="container-fluid pt-4 px-4">
                            <div class="bg-light text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Customer Feedback</h6>
                                    <a href="feedback">Show All</a>
                                </div>

                                <!-- Search and Filter Section -->
                                <form action="feedback" method="get" class="mb-4" id="searchForm">
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
                                                <th scope="col">Feedback Type</th>
                                                <th scope="col">Passenger ID</th>
                                                <th scope="col">Submission Date</th>
                                                <th scope="col">Status</th>
                                                <th scope="col">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
    <c:forEach var="feedback" items="${feedbackList}">
        <c:if test="${feedback.feedbackType != 'Bugs'}">
            <tr>
                <td>${feedback.feedbackID}</td>
                <td>${feedback.message}</td>
                <td>${feedback.feedbackType}</td>
                <td>
                    <a href="#" class="passenger-id" data-passenger-id="${feedback.passengerID}" 
                       data-bs-toggle="modal" data-bs-target="#passengerInfoModal">
                        ${feedback.passengerID}
                    </a>
                </td>
                <td>${feedback.submissionDate}</td>
                <td>${feedback.status ? 'Resolved' : 'Pending'}</td>
                <td>
                    <a href="#" class="btn btn-warning btn-sm" 
                       data-bs-toggle="modal" 
                       data-bs-target="#editFeedbackModal" 
                       data-feedback-id="${feedback.feedbackID}"
                       data-status="${feedback.status}">Update Status</a>
                </td>
            </tr>
        </c:if>
    </c:forEach>
</tbody>
                                    </table>
                                </div>

                                <!-- Pagination Controls -->
                                <div class="mt-4 text-center">
                                    <c:if test="${currentPage > 1}">
                                        <a href="feedback?page=${currentPage - 1}&search=${param.search}&sortOrder=${param.sortOrder}" class="btn btn-primary">Previous</a>
                                    </c:if>

                                    <c:if test="${currentPage > 2}">
                                        <a href="feedback?page=1&search=${param.search}&sortOrder=${param.sortOrder}" class="btn btn-outline-primary">1</a>
                                        <c:if test="${currentPage > 3}">
                                            <span>...</span>
                                        </c:if>
                                    </c:if>

                                    <c:if test="${currentPage > 1}">
                                        <a href="feedback?page=${currentPage - 1}&search=${param.search}&sortOrder=${param.sortOrder}" class="btn btn-outline-primary">${currentPage - 1}</a>
                                    </c:if>

                                    <span class="btn btn-primary">${currentPage}</span>

                                    <c:if test="${currentPage < totalPages}">
                                        <a href="feedback?page=${currentPage + 1}&search=${param.search}&sortOrder=${param.sortOrder}" class="btn btn-outline-primary">${currentPage + 1}</a>
                                    </c:if>

                                    <c:if test="${currentPage < totalPages - 1}">
                                        <c:if test="${currentPage < totalPages - 2}">
                                            <span>...</span>
                                        </c:if>
                                        <a href="feedback?page=${totalPages}&search=${param.search}&sortOrder=${param.sortOrder}" class="btn btn-outline-primary">${totalPages}</a>
                                    </c:if>

                                    <c:if test="${currentPage < totalPages}">
                                        <a href="feedback?page=${currentPage + 1}&search=${param.search}&sortOrder=${param.sortOrder}" class="btn btn-primary">Next</a>
                                    </c:if>

                                    <div class="mt-2">
                                        Page ${currentPage} of ${totalPages}
                                    </div>
                                </div>

                                <!-- Edit Feedback Modal -->
                                <div class="modal fade" id="editFeedbackModal" tabindex="-1" aria-labelledby="editFeedbackModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editFeedbackModalLabel">Update Feedback Status</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editFeedbackForm" action="feedback?action=updateFeedback" method="post">
                    <input type="hidden" name="feedbackID" id="feedbackID" value="">
                    <div class="mb-3">
                        <label for="editStatus" class="form-label">Status</label>
                        <select class="form-select" id="editStatus" name="status" required>
                            <option value="true">Resolved</option>
                            <option value="false">Pending</option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary" form="editFeedbackForm">Update Status</button>
            </div>
        </div>
    </div>
</div>

                                <!-- Passenger Info Modal -->
                                <div class="modal fade" id="passengerInfoModal" tabindex="-1" aria-labelledby="passengerInfoModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="passengerInfoModalLabel">Passenger Information</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <div id="passengerInfoContent">
                                                    <!-- Passenger information will be loaded here -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- Customer Feedback Section End -->

                        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
                        <script>
                                                                        document.addEventListener('DOMContentLoaded', function () {
                                                                            var editFeedbackModal = document.getElementById('editFeedbackModal');

                                                                            editFeedbackModal.addEventListener('show.bs.modal', function (event) {
                                                                                var button = event.relatedTarget;
                                                                                var feedbackID = button.getAttribute('data-feedback-id');
                                                                                var message = button.getAttribute('data-message');
                                                                                var passengerID = button.getAttribute('data-passenger-id');
                                                                                var submissionDate = button.getAttribute('data-submission-date');
                                                                                var feedbackType = button.getAttribute('data-feedback-type');

                                                                                document.getElementById('feedbackID').value = feedbackID;
                                                                                document.getElementById('editMessage').value = message;
                                                                                document.getElementById('editPassengerID').value = passengerID;
                                                                                document.getElementById('editSubmissionDate').value = submissionDate;
                                                                                document.getElementById('editFeedbackType').value = feedbackType;
                                                                            });

                                                                            // Load passenger information when clicking on Passenger ID
                                                                            document.querySelectorAll('.passenger-id').forEach(function (element) {
                                                                                element.addEventListener('click', function (e) {
                                                                                    e.preventDefault();
                                                                                    var passengerID = this.getAttribute('data-passenger-id');
                                                                                    var modal = document.getElementById('passengerInfoModal');
                                                                                    var contentDiv = modal.querySelector('#passengerInfoContent');

                                                                                    contentDiv.innerHTML = 'Loading passenger information...';

                                                                                    fetch('viewPassengerInfo?passengerID=' + passengerID)
                                                                                            .then(response => {
                                                                                                if (!response.ok) {
                                                                                                    throw new Error('HTTP error ' + response.status);
                                                                                                }
                                                                                                return response.text();
                                                                                            })
                                                                                            .then(html => {
                                                                                                contentDiv.innerHTML = html;
                                                                                            })
                                                                                            .catch(error => {
                                                                                                contentDiv.innerHTML = 'Error fetching passenger information: ' + error.message;
                                                                                                console.error('Error:', error);
                                                                                            });
                                                                                });
                                                                            });
                                                                        });
                                                                        
                                                                        
                                                                        document.addEventListener('DOMContentLoaded', function () {
    var editFeedbackModal = document.getElementById('editFeedbackModal');
    
    editFeedbackModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget;
        var feedbackID = button.getAttribute('data-feedback-id');
        var status = button.getAttribute('data-status');
        
        document.getElementById('feedbackID').value = feedbackID;
        document.getElementById('editStatus').value = status;
    });
});
                        </script>
                    </body>
                </html>

            </div>
            <!-- Content End -->
            <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
            <df-messenger
                intent="WELCOME"
                chat-title="TrainSupportAI"
                agent-id="b97fb560-b522-4b67-a79f-1dd5d8471965"
                language-code="vi"
                ></df-messenger>

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
