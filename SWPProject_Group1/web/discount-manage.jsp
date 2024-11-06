<%-- 
    Document   : TestDASHMIN
    Created on : Sep 23, 2024, 5:35:56 PM
    Author     : My Asus
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <a href="/SWPProject/feedback" class="navbar-brand mx-4 mb-3" style="white-space: nowrap;"> <!-- Prevent wrapping -->
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
                        <a href="http://localhost:9999/SWPProject_Group1/feedback" class="nav-item nav-link " style="white-space: nowrap;"><i class="fa fa-tachometer-alt me-2"></i>Feedback Management</a>
                        <a href="http://localhost:9999/SWPProject_Group1/news" class="nav-item nav-link" style="white-space: nowrap;"><i class="fa fa-th me-2"></i>News Management</a>
                        <a href="http://localhost:9999/SWPProject_Group1/discount-manage" class="nav-item nav-link active" style="white-space: nowrap;"><i class="fa fa-keyboard me-2"></i>Discount Management</a>
                     
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

                <!-- Search and Filter Form -->
                <div class="d-flex align-items-center justify-content-between mb-4">
  <form action="discount-manage" method="GET" class="d-flex align-items-center g-3" id="searchForm">
    <div class="me-3">
      <label class="form-label">.</label>
      <input type="text" class="form-control" name="searchCode" value="${searchCode}" placeholder="Enter code...">
    </div>
    <div class="me-3">
      <label class="form-label">.</label>
      <select class="form-select" name="status">
        <option value="">Tất cả</option>
        <option value="1" ${status == '1' ? 'selected' : ''}>Active</option>
        <option value="0" ${status == '0' ? 'selected' : ''}>Locked</option>
      </select>
    </div>
    <div>
      <label class="form-label">&nbsp;</label>
      <div class="d-flex">
        <button type="submit" class="btn btn-primary me-2">Search</button>
        <button type="button" class="btn btn-success me-2" onclick="showAll()">Show all</button>
        <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#discountModal">
          <i class="fas fa-plus"></i> Add
        </button>
      </div>
    </div>
  </form>
</div>

                <!-- Bảng danh sách mã giảm giá -->
                <div class="card">
                    <div class="card-header">
                        <h5>Discount code list</h5>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Code</th>
                                        <th>Discount Percent</th>
                                        <th>Start date</th>
                                        <th>End date</th>
                                        <th>Used</th>
                                        <th>Maxium</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${discountList}" var="discount">
                                        <tr>
                                            <td>${discount.discountID}</td>
                                            <td>${discount.code}</td>
                                            <td>${discount.discountPercent}%</td>
                                            <td>${discount.startDate}</td>
                                            <td>${discount.endDate}</td>
                                            <td>${discount.currentUsage}</td>
                                            <td>${discount.maxUsage}</td>
                                            <td>
                                                <span class="badge ${discount.status == 1 ? 'bg-success' : 'bg-danger'}">
                                                    ${discount.status == 1 ? 'Active' : 'Locked'}
                                                </span>
                                            </td>
                                            <td>
                                                <div class="btn-group">
                                                    <button class="btn btn-sm btn-warning me-1" onclick="editDiscount(${discount.discountID}, '${discount.code}', ${discount.discountPercent}, '${discount.startDate}', '${discount.endDate}', ${discount.maxUsage})">
                                                        <i class="fas fa-edit"></i>
                                                    </button>
                                                    <button class="btn btn-sm btn-danger me-1" onclick="deleteDiscount(${discount.discountID})">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                    <form action="discount-manage" method="POST" style="display: inline;">
                                                        <input type="hidden" name="action" value="toggle-status">
                                                        <input type="hidden" name="discountId" value="${discount.discountID}">
                                                        <button type="submit" class="btn btn-sm ${discount.status == 1 ? 'btn-danger' : 'btn-success'}">
                                                            ${discount.status == 1 ? 'Locked' : 'Unlock'}
                                                        </button>
                                                    </form>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                <!-- Pagination -->
                <c:if test="${totalPages > 1}">
                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center">
                            <c:if test="${currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="discount-manage?page=${currentPage - 1}&searchCode=${searchCode}&status=${status}">Previous</a>
                                </li>
                            </c:if>
                            
                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <li class="page-item ${currentPage == i ? 'active' : ''}">
                                    <a class="page-link" href="discount-manage?page=${i}&searchCode=${searchCode}&status=${status}">${i}</a>
                                </li>
                            </c:forEach>
                            
                            <c:if test="${currentPage < totalPages}">
                                <li class="page-item">
                                    <a class="page-link" href="discount-manage?page=${currentPage + 1}&searchCode=${searchCode}&status=${status}">Next</a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </c:if>
            </div>
        </div>
    </div>

    <!-- Discount Modal (Add/Edit) -->
    <div class="modal fade" id="discountModal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalTitle">Add new Discount code</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form action="discount-manage" method="POST" id="discountForm" onsubmit="return validateForm()">
                    <div class="modal-body">
                        <input type="hidden" name="action" value="add" id="formAction">
                        <input type="hidden" name="discountId" id="discountId">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label class="form-label">Discount code</label>
                                    <input type="text" class="form-control" name="code" id="code" required>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label class="form-label">Discount Percent</label>
                                    <input type="number" class="form-control" name="discountPercent" id="discountPercent" min="0" max="100" required>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label class="form-label">Maxium use</label>
                                    <input type="number" class="form-control" name="maxUsage" id="maxUsage" min="1" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Start Date</label>
                                    <input type="date" class="form-control" name="startDate" id="startDate" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">End Date</label>
                                    <input type="date" class="form-control" name="endDate" id="endDate" required>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary" id="submitBtn">Add new Discount Code</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Confirm to Delete</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    Are you sure to delete this code?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <form action="discount-manage" method="POST" style="display: inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="discountId" id="deleteDiscountId">
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        const discountModal = new bootstrap.Modal(document.getElementById('discountModal'));
        const deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
        const existingCodes = [
            <c:forEach items="${discountList}" var="discount" varStatus="status">
                '${discount.code}'${!status.last ? ',' : ''}
            </c:forEach>
        ];
        window.onload = function() {
    const today = new Date().toISOString().split('T')[0];
    document.getElementById('startDate').min = today;
    document.getElementById('endDate').min = today;
};

        function editDiscount(id, code, percent, startDate, endDate, maxUsage) {
    document.getElementById('modalTitle').textContent = 'Edit Discount';
    document.getElementById('formAction').value = 'edit';
    document.getElementById('discountId').value = id;
    document.getElementById('code').value = code;
    document.getElementById('code').readOnly = true;  // Make code field read-only in edit mode
    document.getElementById('discountPercent').value = percent;
    document.getElementById('startDate').value = startDate;
    document.getElementById('endDate').value = endDate;
    document.getElementById('maxUsage').value = maxUsage;
    document.getElementById('submitBtn').textContent = 'Update';
    
    discountModal.show();
}
document.getElementById('discountModal').addEventListener('hidden.bs.modal', function () {
    document.getElementById('discountForm').reset();
    document.getElementById('formAction').value = 'add';
    document.getElementById('discountId').value = '';
    document.getElementById('modalTitle').textContent = 'Add new Discount';
    document.getElementById('submitBtn').textContent = 'Add new Discount';
    document.getElementById('code').readOnly = false;  // Enable code field when adding a new discount
});

        function deleteDiscount(id) {
            document.getElementById('deleteDiscountId').value = id;
            deleteModal.show();
        }

        function showAll() {
            document.querySelector('input[name="searchCode"]').value = '';
            document.querySelector('select[name="status"]').value = '';
            document.getElementById('searchForm').submit();
        }

        // Reset form when modal is hidden
        document.getElementById('discountModal').addEventListener('hidden.bs.modal', function () {
            document.getElementById('discountForm').reset();
            document.getElementById('formAction').value = 'add';
            document.getElementById('discountId').value = '';
            document.getElementById('modalTitle').textContent = 'Add new Discount';
            document.getElementById('submitBtn').textContent = 'Add new Discount';
        });

        function validateForm() {
    const startDate = new Date(document.getElementById('startDate').value);
    const endDate = new Date(document.getElementById('endDate').value);
    const code = document.getElementById('code').value.trim();
    const formAction = document.getElementById('formAction').value;
    const currentId = document.getElementById('discountId').value;

    // Check for valid date range
    if (endDate < startDate) {
        alert('End date must be after start date');
        return false;
    }

    // Check if code has exactly 10 characters
    if (code.length !== 10) {
        alert('Discount code must be exactly 10 characters');
        return false;
    }

    // Check for duplicate code
    if (formAction === 'add' || (formAction === 'edit' && !existingCodes.includes(code))) {
        if (existingCodes.includes(code) && formAction !== 'edit') {
            alert('Discount code already exists');
            return false;
        }
    }

    return true;
}
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
