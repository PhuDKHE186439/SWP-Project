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
                    <a href="index.html" class="navbar-brand mx-4 mb-3">
                        <h3 class="text-primary">Train Traveler</h3>
                    </a>
                    <div class="d-flex align-items-center ms-4 mb-4">
                        <div class="position-relative">
                            <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                            <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                        </div>
                        <div class="ms-3">
                            <h6 class="mb-0">John Doe</h6>
                            <span>Admin</span>
                        </div>
                    </div>
                    <div class="navbar-nav w-100">
                        <a href="Admin.jsp" class="nav-item nav-link"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                        <div class="nav-item dropdown">
<!--                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Elements</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="button.html" class="dropdown-item">Buttons</a>
                                <a href="typography.html" class="dropdown-item">Typography</a>
                                <a href="element.html" class="dropdown-item">Other Elements</a>
                            </div>-->
                        </div>
                        <a href="Admin2.jsp" class="nav-item nav-link active"><i class="fa fa-th me-2"></i>Update Account</a>
<!--                        <a href="form.html" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>Forms</a>
                        <a href="table.html" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Tables</a>
                        <a href="chart.html" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>Charts</a>-->
<!--                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Pages</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="signin.html" class="dropdown-item">Sign In</a>
                                <a href="signup.html" class="dropdown-item">Sign Up</a>
                                <a href="404.html" class="dropdown-item">404 Error</a>
                                <a href="blank.html" class="dropdown-item">Blank Page</a>
                            </div>
                        </div>
                    </div>-->
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
                        <input class="form-control border-0" type="search" placeholder="Search">
                    </form>
                    <div class="navbar-nav align-items-center ms-auto">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <i class="fa fa-envelope me-lg-2"></i>
                                <span class="d-none d-lg-inline-flex">Message</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <a href="#" class="dropdown-item">
                                    <div class="d-flex align-items-center">
                                        <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                        <div class="ms-2">
                                            <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                            <small>15 minutes ago</small>
                                        </div>
                                    </div>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">
                                    <div class="d-flex align-items-center">
                                        <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                        <div class="ms-2">
                                            <h6 class="fw-normal mb-0">Jhon send you a message</h6>
                                            <small>15 minutes ago</small>
                                        </div>
                                    </div>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">
                                    <div class="d-flex align-items-center">
                                        <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
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
                                <img class="rounded-circle me-lg-2" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                <span class="d-none d-lg-inline-flex">John Doe</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <a href="#" class="dropdown-item">My Profile</a>
                                <a href="#" class="dropdown-item">Settings</a>
                                <a href="#" class="dropdown-item">Log Out</a>
                            </div>
                        </div>
                    </div>
                </nav>
                <!-- Navbar End -->

                <!-- Account Update Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light text-center rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Account Management</h6>
                            <div class="d-flex align-items-center">
                                <button class="btn btn-success me-2" onclick="openCreateAccountModal()">Create New Account</button>
                                <button id="showAllBtn" class="btn btn-primary me-2" onclick="showAllAccounts()">Show All</button>
                                <button id="returnToNormalBtn" class="btn btn-primary" style="display: none;" onclick="returnToNormal()">Return to Normal</button>

                            </div>
                        </div>

                        <!-- Search Functionality -->
                        <div class="mb-4">
                            <div class="d-flex align-items-center">
                                <select id="searchCriteria" class="form-select" aria-label="Search Criteria" style="width: auto; margin-right: 10px;">
                                    <option value="username">Account Name</option>
                                    <option value="email">Email</option>
                                    <option value="phone">Phone Number</option>
                                    <option value="role">Role</option>
                                </select>
                                <input type="text" id="searchInput" placeholder="Search..." class="form-control" style="width: auto; margin-right: 10px;">
                                <button class="btn btn-primary" onclick="searchAccounts()">Search</button>
                            </div>
                        </div>

                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0">
                                <thead>
                                    <tr class="text-dark">
                                        <th scope="col">Account Name</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Phone Number</th>
                                        <th scope="col">Role</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody id="accountList">
                                    <% for (int i = 0; i < Math.min(10, accounts.size()); i++) { 
                                        account acc = accounts.get(i); 
                                        String roleName = ""; // Replace with method to retrieve role name by roleID
                                        for (role r : roles) {
                                            if (r.getRoleID() == acc.getRoleID()) {
                                                roleName = r.getRoleName();
                                                break;
                                            }
                                        } %>
                                    <tr>
                                        <td><%= acc.getUsername() %></td>
                                        <td><%= acc.getEmail() %></td>
                                        <td><%= acc.getPhoneNumber() %></td>
                                        <td><%= roleName %></td>
                                        <td>
                                            <button class="btn btn-sm btn-warning" onclick="openEditAccountModal(<%= acc.getAccountID() %>, '<%= acc.getUsername() %>', '<%= acc.getEmail() %>', '<%= acc.getPhoneNumber() %>', <%= acc.getRoleID() %>)">Edit</button>
                                            <form action="AccountEditServlet" method="post" style="display:inline;">
                                                <input type="hidden" name="accountID" value="<%= acc.getAccountID() %>">
                                                <input type="hidden" name="submitType" value="delete">
                                                <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this account?')">Delete</button>
                                            </form>

                                        </td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Create Account Modal -->
                <div class="modal fade" id="createAccountModal" tabindex="-1" aria-labelledby="createAccountModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="createAccountModalLabel">Create New Account</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form id="createAccountForm" action="CreateAccountServlet" method="POST"> <!-- Ensure action points to the servlet -->
                                    <div class="mb-3">
                                        <label for="modalAccountName" class="form-label">Account Name</label>
                                        <input type="text" class="form-control" name="username" id="modalAccountName" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="modalPassword" class="form-label">Password</label>
                                        <input type="password" class="form-control" name="password" id="modalPassword" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="modalEmail" class="form-label">Email</label>
                                        <input type="email" class="form-control" name="email" id="modalEmail" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="modalPhoneNumber" class="form-label">Phone Number</label>
                                        <input type="text" class="form-control" name="phoneNumber" id="modalPhoneNumber" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="modalRole" class="form-label">Role</label>
                                        <select class="form-select" name="roleID" id="modalRole" required>
                                            <option value="">Select Role</option>
                                            <% 
                                            if (roles != null) {
                                                for (role r : roles) { 
                                            %>
                                            <option value="<%= r.getRoleID() %>"><%= r.getRoleName() %></option>
                                            <% 
                                                }
                                            } 
                                            %>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Create Account</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Edit Account Modal -->
                <div class="modal fade" id="editAccountModal" tabindex="-1" aria-labelledby="editAccountModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editAccountModalLabel">Edit Account</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form id="editAccountForm" action="AccountEditServlet" method="POST">
                                    <input type="hidden" id="editAccountID" name="accountID">
                                    <div class="mb-3">
                                        <label for="editAccountName" class="form-label">Account Name</label>
                                        <input type="text" class="form-control" name="username" id="editAccountName" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="editEmail" class="form-label">Email</label>
                                        <input type="email" class="form-control" name="email" id="editEmail" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="editPhoneNumber" class="form-label">Phone Number</label>
                                        <input type="text" class="form-control" name="phoneNumber" id="editPhoneNumber" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="modalRole" class="form-label">Role</label>
                                        <select class="form-select" name="roleID" id="modalRole" required>
                                            <option value="">Select Role</option>
                                            <% 
                                            if (roles != null) {
                                                for (role r : roles) { 
                                            %>
                                            <option value="<%= r.getRoleID() %>"><%= r.getRoleName() %></option>
                                            <% 
                                                }
                                            } 
                                            %>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Update Account</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <script>
                    function openCreateAccountModal() {
                        const modal = new bootstrap.Modal(document.getElementById('createAccountModal'));
                        modal.show();
                    }

                    function openEditAccountModal(accountID, username, email, phoneNumber, roleID) {
                        document.getElementById('editAccountID').value = accountID;
                        document.getElementById('editAccountName').value = username;
                        document.getElementById('editEmail').value = email;
                        document.getElementById('editPhoneNumber').value = phoneNumber;
                        document.getElementById('modalRole').value = roleID; // Set the selected role
                        // Now open the modal
                        $('#editAccountModal').modal('show');
                    }


                    function searchAccounts() {
                        const searchCriteria = document.getElementById("searchCriteria").value;
                        const searchInput = document.getElementById("searchInput").value.toLowerCase();
                        const accountList = document.getElementById("accountList");
                        const rows = accountList.getElementsByTagName("tr");

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
                                    case "role":
                                        match = cells[3].textContent.toLowerCase().includes(searchInput);
                                        break;
                                }
                            }

                            rows[i].style.display = match ? "" : "none";
                        }
                    }

                    function showAllAccounts() {
                        const accountList = document.getElementById("accountList");
                        accountList.innerHTML = ""; // Clear existing accounts
                    <% 
                        for (account acc : accounts) { 
                            String roleName = ""; // Replace with method to retrieve role name by roleID
                            for (role r : roles) {
                                if (r.getRoleID() == acc.getRoleID()) {
                                    roleName = r.getRoleName();
                                    break;
                                }
                            } 
                    %>
                        accountList.innerHTML += `
    <tr>
        <td><%= acc.getUsername() %></td>
        <td><%= acc.getEmail() %></td>
        <td><%= acc.getPhoneNumber() %></td>
        <td><%= roleName %></td>
        <td>
            <button class="btn btn-sm btn-warning" onclick="openEditAccountModal(<%= acc.getAccountID() %>, '<%= acc.getUsername() %>', '<%= acc.getEmail() %>', '<%= acc.getPhoneNumber() %>', <%= acc.getRoleID() %>)">Edit</button>
            <form action="AccountEditServlet" method="post" style="display:inline;">
                <input type="hidden" name="accountID" value="<%= acc.getAccountID() %>">
                <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this account?')">Delete</button>
            </form>
        </td>
    </tr>
    `;
                    <% } %>

                        // Toggle button visibility
                        document.getElementById("showAllBtn").style.display = "none"; // Hide "Show All" button
                        document.getElementById("returnToNormalBtn").style.display = "inline"; // Show "Return to Normal" button
                    }

                    function returnToNormal() {
                        const accountList = document.getElementById("accountList");
                        accountList.innerHTML = ""; // Clear existing accounts
                    <% for (int i = 0; i < Math.min(10, accounts.size()); i++) { 
                        account acc = accounts.get(i); 
                        String roleName = ""; // Replace with method to retrieve role name by roleID
                        for (role r : roles) {
                            if (r.getRoleID() == acc.getRoleID()) {
                                roleName = r.getRoleName();
                                break;
                            }
                        } 
                    %>
                        accountList.innerHTML += `
            <tr>
                <td><%= acc.getUsername() %></td>
                <td><%= acc.getEmail() %></td>
                <td><%= acc.getPhoneNumber() %></td>
                <td><%= roleName %></td>
                <td>
                    <button class="btn btn-sm btn-warning" onclick="openEditAccountModal(<%= acc.getAccountID() %>, '<%= acc.getUsername() %>', '<%= acc.getEmail() %>', '<%= acc.getPhoneNumber() %>', <%= acc.getRoleID() %>)">Edit</button>
                    <form action="AccountEditServlet" method="post" style="display:inline;">
                        <input type="hidden" name="accountID" value="<%= acc.getAccountID() %>">
                        <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this account?')">Delete</button>
                    </form>
                </td>
            </tr>
    `       ;
                    <% } %>

                        // Toggle button visibility
                        document.getElementById("showAllBtn").style.display = "inline"; // Show "Show All" button
                        document.getElementById("returnToNormalBtn").style.display = "none"; // Hide "Return to Normal" button
                    }


                </script>



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
                                            <span>Short task goes here...</span>
                                            <button class="btn btn-sm"><i class="fa fa-times"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center border-bottom py-2">
                                    <input class="form-check-input m-0" type="checkbox">
                                    <div class="w-100 ms-3">
                                        <div class="d-flex w-100 align-items-center justify-content-between">
                                            <span>Short task goes here...</span>
                                            <button class="btn btn-sm"><i class="fa fa-times"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center border-bottom py-2">
                                    <input class="form-check-input m-0" type="checkbox" checked>
                                    <div class="w-100 ms-3">
                                        <div class="d-flex w-100 align-items-center justify-content-between">
                                            <span><del>Short task goes here...</del></span>
                                            <button class="btn btn-sm text-primary"><i class="fa fa-times"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center border-bottom py-2">
                                    <input class="form-check-input m-0" type="checkbox">
                                    <div class="w-100 ms-3">
                                        <div class="d-flex w-100 align-items-center justify-content-between">
                                            <span>Short task goes here...</span>
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
