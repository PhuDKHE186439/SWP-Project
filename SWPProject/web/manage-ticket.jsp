<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, model.account, dal.AccountDAO, model.role, dal.RoleDAO"%>
<%@page session="true"%>
<%
    AccountDAO accountDAO = new AccountDAO();
    List<account> accounts = accountDAO.getAllAccount(); // Make sure this retrieves the accounts list
%>

<%
    RoleDAO roleDAO = new RoleDAO();
    List<role> roles = roleDAO.getAllRoles();
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>DASHMIN - Bootstrap Admin Template</title>
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
                    <a href="index.html" class="navbar-brand mx-4 mb-3">
                        <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>DASHMIN</h3>
                    </a>
                    <div class="d-flex align-items-center ms-4 mb-4">
                        <div class="position-relative">
                            <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                            <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                        </div>
                        <div class="ms-3">
                            <h6 class="mb-0">Jhon Doe</h6>
                            <span>Admin</span>
                        </div>
                    </div>
                    <div class="navbar-nav w-100">
                        <a href="index.html" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Elements</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="button.html" class="dropdown-item">Buttons</a>
                                <a href="typography.html" class="dropdown-item">Typography</a>
                                <a href="element.html" class="dropdown-item">Other Elements</a>
                            </div>
                        </div>
                        <a href="manage-ticket" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Quản lý tickets</a>

                        <a href="widget.html" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Widgets</a>
                        <a href="form.html" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>Forms</a>
                        <a href="table.html" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Tables</a>
                        <a href="chart.html" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>Charts</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Pages</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="signin.html" class="dropdown-item">Sign In</a>
                                <a href="signup.html" class="dropdown-item">Sign Up</a>
                                <a href="404.html" class="dropdown-item">404 Error</a>
                                <a href="blank.html" class="dropdown-item">Blank Page</a>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>      
            <!-- Sidebar End -->


            <!-- Content Start -->
            <div class="content">
                <!-- Navbar Start -->
                <div id="loading-icon-bx"></div>
            <!-- Header Top ==== -->
            <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
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
                            <i class="fa fa-bell me-lg-2"></i>
                            <span class="d-none d-lg-inline-flex">Notificatin</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                            <a href="#" class="dropdown-item">
                                <h6 class="fw-normal mb-0">Profile updated</h6>
                                <small>15 minutes ago</small>
                            </a>
                            <hr class="dropdown-divider">
                            <a href="#" class="dropdown-item">
                                <h6 class="fw-normal mb-0">New user added</h6>
                                <small>15 minutes ago</small>
                            </a>
                            <hr class="dropdown-divider">
                            <a href="#" class="dropdown-item">
                                <h6 class="fw-normal mb-0">Password changed</h6>
                                <small>15 minutes ago</small>
                            </a>
                            <hr class="dropdown-divider">
                            <a href="#" class="dropdown-item text-center">See all notifications</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <span class="d-none d-lg-inline-flex">Profile</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                            <a href="logout" class="dropdown-item">Log Out</a>
                        </div>
                    </div>
                </div>
            </nav>
                <!-- Navbar End -->


                <!-- Ban Function Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light text-center rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Ticket Management</h6>

                        </div>
                        <!-- Search Functionality -->
                        <div class="mb-4">
                            <div class="d-flex align-items-center">
                                <select id="searchCriteria" class="form-select" onchange="location = this.value;" 
                                        aria-label="Search Criteria" style="width: auto; margin-right: 10px;">
                                    <option value="manage-ticket?status=0" ${status eq 0 ? "Selected" : ""}>Trống</option>
                                    <option value="manage-ticket?status=1" ${status eq 1 ? "Selected" : ""}>Đã Đặt</option>
                                </select>
                                <form action="manage-ticket" method="get">
                                    <input type="text" id="searchInput" name="key" value="${key}" placeholder="Search..." class="form-control" style="width: auto; margin-right: 10px;">
                                    <input type="hidden" name="status" value="${status}"/>
                                    <button class="btn btn-primary" type="submit">Search</button>
                                </form>
                            </div>
                        </div>

                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0">
                                <thead>
                                    <tr class="text-dark">
                                        <th scope="col">Ticket ID</th>
                                        <th scope="col">PassengerID</th>
                                        <th scope="col">Purchage Date</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">SeatID</th>
                                        <th scope="col">TimeArrive</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody id="accountList">
                                    <c:forEach items="${listOfPage}" var="c" >
                                        <tr>
                                            <td>
                                                <a href="ticket-detail?id=${c.ticketID}">
                                                    ${c.ticketID}</a>
                                            </td>
                                            <td>${c.passengerID}</td>
                                            <td>${c.purchaseDate}</td>
                                            <td>${c.ticketPrice}</td>
                                            <td>${c.seatID}</td>
                                            <td>${c.timeArrive}</td>

                                            <td>
                                                <c:if test="${c.status == 0}">
                                                    <div class="row">
                                                        <a onclick="return confirm('Xác nhận?')" href="approve-ticket?ticket_id=${c.ticketID}&value=1" class="btn btn-success btn-lg active" role="button" aria-pressed="true" style="font-size: 12px">Xác nhận</a>
                                                    </div>
                                                </c:if>
                                                <c:if test="${c.status == 1}">
                                                    <div class="row">
                                                        <a onclick="return confirm('Hủy?')" href="approve-ticket?ticket_id=${c.ticketID}&value=0" class="btn btn-danger btn-lg active" role="button" aria-pressed="true" style="font-size: 12px">Hủy</a>
                                                    </div>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <c:if test="${listOfPage.size() != 0}">
                                <!-- pagination -->
                                <nav aria-label="..." class="pagination">
                                    <ul class="pagination">
                                        <li class="page-item">
                                            <a <c:if test="${pageIndex!=1}">                         
                                                    href="manage-ticket?index=${pageIndex-1}${historyKey}"
                                                </c:if> class="page-link" aria-label="Previous">
                                                <span  aria-hidden="true">«</span>
                                            </a>
                                        </li>

                                        <c:forEach begin="1" end="${endPage}" var="i">
                                            <li class="page-item ${i==pageIndex ?"active" : ""}">
                                                <a class="page-link" href="manage-ticket?index=${i}${historyKey}">${i}</a>
                                            </li>
                                        </c:forEach>

                                        <li class="page-item">
                                            <a <c:if test="${pageIndex != endPage}">
                                                    href="manage-ticke?index=${pageIndex+1}${historyKey}"
                                                </c:if> class="page-link" aria-label="Next">
                                                <span aria-hidden="true">»</span>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </c:if>
                        </div>
                    </div>
                </div>

                <script>
                    function showAll() {
                        // Show all accounts logic (same as before)
                    }

                    function returnToNormal() {
                        // Return to normal logic (same as before)
                    }

                    function searchAccounts() {
                        const searchCriteria = document.getElementById("searchCriteria").value;
                        const searchInput = document.getElementById("searchInput").value.toLowerCase();
                        const accountList = document.getElementById("accountList");
                        const rows = accountList.getElementsByTagName("tr");

                        // Loop through the rows and hide/show based on search
                        for (let i = 0; i < rows.length; i++) {
                            const cells = rows[i].getElementsByTagName("td");
                            let match = false;

                            if (cells.length > 0) {
                                switch (searchCriteria) {
                                    case "username":
                                        match = cells[0].textContent.toLowerCase().includes(searchInput);
                                        break;
                                    case "email":
                                        match = cells[1].textContent.toLowerCase().includes(searchInput);
                                        break;
                                    case "phone":
                                        match = cells[2].textContent.toLowerCase().includes(searchInput);
                                        break;
                                    case "status":
                                        match = cells[3].textContent.toLowerCase().includes(searchInput);
                                        break;
                                }
                            }

                            rows[i].style.display = match ? "" : "none"; // Show or hide the row
                        }
                    }
                </script>




                <script>
                    function openCreateAccountModal() {
                        const modal = new bootstrap.Modal(document.getElementById('createAccountModal'));
                        modal.show();
                    }

                    function createAccount() {
                        const accountName = document.getElementById("modalAccountName").value;
                        const password = document.getElementById("modalPassword").value;
                        const email = document.getElementById("modalEmail").value;
                        const phoneNumber = document.getElementById("modalPhoneNumber").value;
                        const role = document.getElementById("modalRole").value;

                        if (accountName && password && email && phoneNumber && role) {
                            const formData = new FormData();
                            formData.append("username", accountName);
                            formData.append("password", password);
                            formData.append("email", email);
                            formData.append("phoneNumber", phoneNumber);
                            formData.append("roleID", role);

                            fetch("CreateAccountServlet", {
                                method: "POST",
                                body: formData
                            })
                                    .then(response => {
                                        if (response.ok) {
                                            location.reload(); // Reload the page to see the new account
                                        } else {
                                            alert("Failed to create account");
                                        }
                                    })
                                    .catch(error => console.error('Error:', error));
                        } else {
                            alert("Please fill in all fields");
                        }
                    }

                    function showAll() {
                        const accountList = document.getElementById("accountList");
                        accountList.innerHTML = ""; // Clear the initial rows
                    <% for (account acc : accounts) { %>
                        accountList.innerHTML += `
                                <tr>
                                    <td><%= acc.getUsername() %></td>
                                    <td><%= acc.getEmail() %></td>
                                    <td><%= acc.getPhoneNumber() %></td>
                                    <td><%= acc.getStatus() %></td>
                                    <td>
                                        <form action="BanAccount" method="post" style="display:inline;">
                                            <input type="hidden" name="accountID" value="<%= acc.getAccountID() %>">
                                            <input type="hidden" name="action" value="<%= acc.getStatus().equals("Active") ? "ban" : "unban" %>">
                                            <button type="submit" class="btn btn-sm btn-primary" 
                                                onclick="return confirm('Are you sure you want to <%= acc.getStatus().equals("Active") ? "ban" : "unban" %> this account?')">
                    <%= acc.getStatus().equals("Active") ? "Ban" : "Unban" %>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            `;
                    <% } %>
                        document.getElementById('showAllBtn').style.display = "none"; // Hide "Show All"
                        document.getElementById('returnToNormalBtn').style.display = "inline"; // Show "Return to Normal"
                    }

                    function returnToNormal() {
                        const accountList = document.getElementById("accountList");
                        accountList.innerHTML = ""; // Clear the extended rows
                    <% for (int i = 0; i < Math.min(10, accounts.size()); i++) { 
                            account acc = accounts.get(i); %>
                        accountList.innerHTML += `
                                <tr>
                                    <td><%= acc.getUsername() %></td>
                                    <td><%= acc.getEmail() %></td>
                                    <td><%= acc.getPhoneNumber() %></td>
                                    <td><%= acc.getStatus() %></td>
                                    <td>
                                        <form action="BanAccount" method="post" style="display:inline;">
                                            <input type="hidden" name="accountID" value="<%= acc.getAccountID() %>">
                                            <input type="hidden" name="action" value="<%= acc.getStatus().equals("Active") ? "ban" : "unban" %>">
                                            <button type="submit" class="btn btn-sm btn-primary" 
                                                onclick="return confirm('Are you sure you want to <%= acc.getStatus().equals("Active") ? "ban" : "unban" %> this account?')">
                    <%= acc.getStatus().equals("Active") ? "Ban" : "Unban" %>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            `;
                    <% } %>
                        document.getElementById('showAllBtn').style.display = "inline"; // Show "Show All"
                        document.getElementById('returnToNormalBtn').style.display = "none"; // Hide "Return to Normal"
                    }
                </script>

                <!-- Show All Button Functionality -->
                <script>
                    document.getElementById('showAllBtn').addEventListener('click', function () {
                        const accountList = document.getElementById("accountList");
                        accountList.innerHTML = ""; // Clear the initial rows
                    <% for (account acc : accounts) { %>
                        accountList.innerHTML += `
                            <tr>
                                <td><%= acc.getUsername() %></td>
                                <td><%= acc.getEmail() %></td>
                                <td><%= acc.getPhoneNumber() %></td>
                                <td><%= acc.getStatus() %></td>
                                <td>
                                    <form action="BanAccount" method="post" style="display:inline;">
                                        <input type="hidden" name="accountID" value="<%= acc.getAccountID() %>">
                                        <input type="hidden" name="action" value="<%= acc.getStatus().equals("Active") ? "ban" : "unban" %>">
                                        <button type="submit" class="btn btn-sm btn-primary" 
                                            onclick="return confirm('Are you sure you want to <%= acc.getStatus().equals("Active") ? "ban" : "unban" %> this account?')">
                    <%= acc.getStatus().equals("Active") ? "Ban" : "Unban" %>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        `;
                    <% } %>
                        document.getElementById('showAllBtn').style.display = "none"; // Hide the button after click
                    });
                </script>

                <iframe id="footer-frame" src="Footer.jsp" style="width: 100%; border: none;" scrolling="no"></iframe>

                <script>
                    const iframe = document.getElementById('footer-frame');
                    iframe.onload = function () {
                        // Adjust the height of the iframe to fit its content
                        iframe.style.height = iframe.contentWindow.document.body.scrollHeight + 'px';
                    };
                </script>
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