<%-- 
    Document   : UserProfile
    Created on : Sep 20, 2024, 4:59:36 PM
    Author     : Laptop
--%>

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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/UserProfile.css"/>
    </head>
    <body class="body">
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="page-wrapper">
                <div data-animation="default" data-collapse="medium" data-duration="400" data-easing="ease" data-easing2="ease" role="banner" class="dash_nav-bar w-nav"></div>
                <div class="dash_content">
                    <div class="dash_header">
                        <div>
                            <h1 class="dash_h1">Admin Settings</h1>
                        </div>
                    </div>
                    <div class="dash_contain">
                        <div class="relative">
                            <a data-ms-action="logout" href="login?logout=logout" class="dash_profile-nav-link is-logout w-inline-block">
                                <div class="button-icon w-embed"><svg xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 24 24" height="24px" viewbox="0 0 24 24" width="24px" fill="currentColor">
                                    <g>
                                    <path d="M0,0h24v24H0V0z" fill="none"></path>
                                    </g>
                                    <g>
                                    <g>
                                    <path d="M5,5h6c0.55,0,1-0.45,1-1v0c0-0.55-0.45-1-1-1H5C3.9,3,3,3.9,3,5v14c0,1.1,0.9,2,2,2h6c0.55,0,1-0.45,1-1v0 c0-0.55-0.45-1-1-1H5V5z"></path>
                                    <path d="M20.65,11.65l-2.79-2.79C17.54,8.54,17,8.76,17,9.21V11h-7c-0.55,0-1,0.45-1,1v0c0,0.55,0.45,1,1,1h7v1.79 c0,0.45,0.54,0.67,0.85,0.35l2.79-2.79C20.84,12.16,20.84,11.84,20.65,11.65z"></path>
                                    </g>
                                    </g>
                                    </svg></div>
                                <div>Log out</div>
                            </a>
                            <div data-current="Profile" data-easing="ease" data-duration-in="300" data-duration-out="100" class="dash_profile-tabs w-tabs">
                                <div class="dash_profile-menu w-tab-menu">
                                    <a data-w-tab="Profile" class="dash_profile-nav-link w-inline-block "href="Admin.jsp">
                                        <div>Ban Manager</div>
                                    </a>
                                    <a data-w-tab="Role" class="dash_profile-nav-link w-inline-block  " href="Admin2.jsp">
                                        <div>Role Manager</div>
                                    </a>
                                    <a data-w-tab="Preferences" class="dash_profile-nav-link w-inline-block w-tab-link w--current ">
                                        <div>Acc Manager</div>
                                    </a>
                                    <a data-w-tab="Tab" class="dash_profile-nav-link w-inline-block w-tab-link">
                                        <div>Random</div>
                                    </a>
                                    <a data-w-tab="Tab 2" class="dash_profile-nav-link w-inline-block w-tab-link">
                                        <div>Extra Something</div>
                                    </a>
                                </div>
                                <div class="_100 w-tab-content">
                                    <div data-w-tab="Profile" class="w-tab-pane w--tab-active">
                                        <div class="profile_form-header">
                                            <div>
                                                <div class="profile_h1">Account Manager</div>
                                            </div>
                                        </div>
                                        <div class="profile_section">
                                            <div class="profile_section-head">Account List</div>
                                            <div class="profile_flex"></div>
                                            <div>
                                                <div class="modal_open">
                                                    <a href="#" class="outline-button edit w-inline-block">
                                                        <div class="flex-row-outer">
                                                            <div>Search</div>
                                                            <div class="dash_icon edit w-embed">
                                                                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="currentColor">
                                                                <g>
                                                                <path d="M16.81,8.94l-3.75-3.75L4,14.25V18h3.75L16.81,8.94z M6,16v-0.92l7.06-7.06l0.92,0.92L6.92,16H6z"></path>
                                                                <path d="M19.71,6.04c0.39-0.39,0.39-1.02,0-1.41l-2.34-2.34C17.17,2.09,16.92,2,16.66,2c-0.25,0-0.51,0.1-0.7,0.29l-1.83,1.83 l3.75,3.75L19.71,6.04z"></path>
                                                                <rect height="4" width="20" x="2" y="20"></rect>
                                                                </g>
                                                                </svg>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                                <div class="dash_modal">
                                                    <div class="modal_close">
                                                        <div class="modal_close-icon w-embed">
                                                            <svg width="420" height="420" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                            <path d="M12 22C6.477 22 2 17.523 2 12C2 6.477 6.477 2 12 2C17.523 2 22 6.477 22 12C22 17.523 17.523 22 12 22ZM12 10.586L9.172 7.757L7.757 9.172L10.586 12L7.757 14.828L9.172 16.243L12 13.414L14.828 16.243L16.243 14.828L13.414 12L16.243 9.172L14.828 7.757L12 10.586Z" fill="currentColor"></path>
                                                            </svg>
                                                        </div>
                                                    </div>
                                                    <div class="w-form">
                                                        <!-- Account List Form -->
                                                        <form action="AccountList" id="wf-form-Account-List" method="post" class="modal_form">
                                                            <div class="profile_h1">Account List</div>

                                                            <div class="input-wrapper">
                                                                <label for="searchInput" class="profile_label is-modal">Search Accounts:</label>
                                                                <input class="input w-input" type="text" id="searchInput" name="searchInput" placeholder="Search by username..." required onkeyup="filterAccounts()">
                                                            </div>

                                                            <div class="input-wrapper">
                                                                <label for="accountSelect" class="profile_label is-modal">Select Account:</label>
                                                                <select class="input w-input" id="accountSelect" name="accountID" required size="5" style="width: 100%; height: auto;">
                                                                    <option value="" disabled selected>Select Account</option>
                                                                <% for (account acc : accounts) { %>
                                                                <option value="<%= acc.getAccountID() %>">
                                                                    <%= acc.getUsername() %> - <%= acc.getEmail() %> - <%= acc.getStatus() %>
                                                                </option>
                                                                <% } %>
                                                            </select>
                                                        </div>

                                                        <div class="spacer-s"></div>
                                                        <input type="hidden" name="action" value="view">
                                                        <input type="submit" data-wait="Please wait..." class="dash_button w-button" value="View Account">       
                                                    </form>
                                                            <script>
                                                                function filterAccounts() {
    const input = document.getElementById('searchInput');
    const filter = input.value.toLowerCase();
    const select = document.getElementById('accountSelect');
    const options = select.options;

    for (let i = 1; i < options.length; i++) { // Start from 1 to skip the first disabled option
        const username = options[i].text.toLowerCase();
        options[i].style.display = username.includes(filter) ? '' : 'none';
    }
}
                                                            </script>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <style>
                                        .modal_open {
                                            margin-bottom: 1rem;
                                        }

                                        .account-list {
                                            margin-top: 1rem;
                                        }

                                        .input-wrapper {
                                            margin-bottom: 1rem;
                                        }
                                    </style>
                                    <div class="profile_section">
                                        <div class="profile_section-head">Create Account</div>
                                        <div>
                                            <div class="modal_open">
                                                <a href="#" class="outline-button edit w-inline-block">
                                                    <div class="flex-row-outer">
                                                        <div>Edit</div>
                                                        <div class="dash_icon edit w-embed">
                                                            <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewbox="0 0 24 24" width="24px" fill="currentColor">
                                                            <g>
                                                            <path d="M16.81,8.94l-3.75-3.75L4,14.25V18h3.75L16.81,8.94z M6,16v-0.92l7.06-7.06l0.92,0.92L6.92,16H6z"></path>
                                                            <path d="M19.71,6.04c0.39-0.39,0.39-1.02,0-1.41l-2.34-2.34C17.17,2.09,16.92,2,16.66,2c-0.25,0-0.51,0.1-0.7,0.29l-1.83,1.83l3.75,3.75L19.71,6.04z"></path>
                                                            <rect height="4" width="20" x="2" y="20"></rect>
                                                            </g>
                                                            </svg>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="dash_modal">
                                                <div class="modal_close">
                                                    <div class="modal_close-icon w-embed">
                                                        <svg width="420" height="420" viewbox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M12 22C6.477 22 2 17.523 2 12C2 6.477 6.477 2 12 2C17.523 2 22 6.477 22 12C22 17.523 17.523 22 12 22ZM12 10.586L9.172 7.757L7.757 9.172L10.586 12L7.757 14.828L9.172 16.243L12 13.414L14.828 16.243L16.243 14.828L13.414 12L16.243 9.172L14.828 7.757L12 10.586Z" fill="currentColor"></path>
                                                        </svg>
                                                    </div>
                                                </div>
                                                <div class="w-form">
                                                    <form action="CreateAccountServlet" id="wf-form-Create-Account" method="post" class="modal_form">
                                                        <div class="profile_h1">Create New Account</div>
                                                        <div class="input-wrapper">
                                                            <label for="phoneNumber" class="profile_label is-modal">Phone Number</label>
                                                            <input class="input w-input" maxlength="256" name="phoneNumber" type="text" required>
                                                        </div>
                                                        <div class="input-wrapper">
                                                            <label for="username" class="profile_label is-modal">Username</label>
                                                            <input class="input w-input" maxlength="256" name="username" type="text" required>
                                                        </div>
                                                        <div class="input-wrapper">
                                                            <label for="password" class="profile_label is-modal">Password</label>
                                                            <input class="input w-input" maxlength="256" name="password" type="password" required>
                                                        </div>
                                                        <div class="input-wrapper">
                                                            <label for="email" class="profile_label is-modal">Email</label>
                                                            <input class="input w-input" maxlength="256" name="email" type="email" required>
                                                        </div>
                                                        <div class="input-wrapper">
                                                            <label for="roleID" class="profile_label is-modal">Role</label>
                                                            <select class="input w-input" name="roleID" required>
                                                                <option value="" disabled selected>Select Role</option>
                                                                <% for (role r : roles) { %>
                                                                <option value="<%= r.getRoleID() %>"><%= r.getRoleName() %></option>
                                                                <% } %>
                                                            </select>
                                                        </div>
                                                        <div class="spacer-s"></div>
                                                        <input type="submit" data-wait="Please wait..." class="dash_button w-button" value="Create Account" onclick="return confirm('Are you sure?')">
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div data-w-tab="Account" class="w-tab-pane"></div>
                            <div data-w-tab="Preferences" class="w-tab-pane"></div>
                            <div data-w-tab="Tab" class="w-tab-pane"></div>
                            <div data-w-tab="Tab 2" class="w-tab-pane"></div>
                            <div data-w-tab="Tab 3" class="w-tab-pane"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="delete-me">
        <div class="hide">
            <div data-w-id="0cb43e2f-5d10-d354-9968-decb3ee8a1ac" class="widget-wrapper">
                <div class="widget-container">
                    <div class="widget-embed w-embed w-iframe">
                        <div style="position: relative; padding-bottom: 62.5%; height: 0;"><iframe src="https://www.loom.com/embed/295b4d0c28e1418293db4da9b226b61f" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen="" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe></div>
                        <style>
                            .widget-wrapper:hover .double-click {
                                opacity: 1;
                            }
                            .widget-wrapper:hover .widget-move {
                                opacity: .50;
                            }
                            .widget-move:hover {
                                opacity: 1 !important;
                            }
                        </style>
                    </div>
                </div>
                <a data-w-id="0cb43e2f-5d10-d354-9968-decb3ee8a1af" href="#" class="widget-move right w-inline-block">
                    <div class="widget-svg-small w-embed"><svg xmlns="http://www.w3.org/2000/svg" height="auto" viewbox="0 0 24 24" width="1000px" fill="currentColor">
                        <g>
                        <rect fill="none" height="24" width="24"></rect>
                        </g>
                        <g>
                        <g>
                        <polygon points="6,17.59 7.41,19 12,14.42 16.59,19 18,17.59 12,11.59">
                        <polygon points="6,11 7.41,12.41 12,7.83 16.59,12.41 18,11 12,5">
                        </polygon></polygon></g>
                        </g>
                        </svg></div>
                </a>
                <a data-w-id="0cb43e2f-5d10-d354-9968-decb3ee8a1b1" href="#" class="widget-move left w-inline-block">
                    <div class="widget-svg-small w-embed"><svg xmlns="http://www.w3.org/2000/svg" height="auto" viewbox="0 0 24 24" width="1000px" fill="currentColor">
                        <g>
                        <rect fill="none" height="24" width="24"></rect>
                        </g>
                        <g>
                        <g>
                        <polygon points="6,17.59 7.41,19 12,14.42 16.59,19 18,17.59 12,11.59">
                        <polygon points="6,11 7.41,12.41 12,7.83 16.59,12.41 18,11 12,5">
                        </polygon></polygon></g>
                        </g>
                        </svg></div>
                </a>
                <a data-w-id="0cb43e2f-5d10-d354-9968-decb3ee8a1b3" href="#" class="widget-move down w-inline-block">
                    <div class="widget-svg-small w-embed"><svg xmlns="http://www.w3.org/2000/svg" height="auto" viewbox="0 0 24 24" width="1000px" fill="currentColor">
                        <g>
                        <rect fill="none" height="24" width="24"></rect>
                        </g>
                        <g>
                        <g>
                        <polygon points="6,17.59 7.41,19 12,14.42 16.59,19 18,17.59 12,11.59">
                        <polygon points="6,11 7.41,12.41 12,7.83 16.59,12.41 18,11 12,5">
                        </polygon></polygon></g>
                        </g>
                        </svg></div>
                </a>
                <a data-w-id="0cb43e2f-5d10-d354-9968-decb3ee8a1b5" href="#" class="widget-move w-inline-block">
                    <div class="widget-svg-small w-embed"><svg xmlns="http://www.w3.org/2000/svg" height="auto" viewbox="0 0 24 24" width="1000px" fill="currentColor">
                        <g>
                        <rect fill="none" height="24" width="24"></rect>
                        </g>
                        <g>
                        <g>
                        <polygon points="6,17.59 7.41,19 12,14.42 16.59,19 18,17.59 12,11.59">
                        <polygon points="6,11 7.41,12.41 12,7.83 16.59,12.41 18,11 12,5">
                        </polygon></polygon></g>
                        </g>
                        </svg></div>
                </a>
                <a data-w-id="0cb43e2f-5d10-d354-9968-decb3ee8a1b7" href="#" class="widget-close w-inline-block">
                    <div class="widget-svg-small w-embed"><svg xmlns="http://www.w3.org/2000/svg" height="auto" viewbox="0 0 24 24" width="1000px" fill="currentColor">
                        <path d="M0 0h24v24H0V0z" fill="none"></path>
                        <path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12 19 6.41z"></path>
                        </svg></div>
                </a>
                <div class="double-click">Double Click <br>to expand</div>
            </div>
            <div data-w-id="0cb43e2f-5d10-d354-9968-decb3ee8a1bd" class="widget-mobile">
                <div class="widget-svg play w-embed"><svg xmlns="http://www.w3.org/2000/svg" height="auto" viewbox="0 0 24 24" width="100px" fill="currentColor">
                    <path d="M8 6.82v10.36c0 .79.87 1.27 1.54.84l8.14-5.18c.62-.39.62-1.29 0-1.69L9.54 5.98C8.87 5.55 8 6.03 8 6.82z"></path>
                    </svg></div>
                <div class="widget-svg close w-embed"><svg xmlns="http://www.w3.org/2000/svg" height="auto" viewbox="0 0 24 24" width="1000px" fill="currentColor">
                    <path d="M0 0h24v24H0V0z" fill="none"></path>
                    <path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12 19 6.41z"></path>
                    </svg></div>
            </div>
        </div>
        <div>
            <div class="ms-iframe">
                <div class="hidden-embed w-embed w-script">

                </div>
            </div>
        </div>
    </div>
    <jsp:include page="Footer.jsp"></jsp:include>
    <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=66ed4a17c4f9443448dbb298" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="assets/js/UserProfile.js" type="text/javascript"></script>
    <script src="assets/js/Admin.js" type="text/javascript"></script>
</body>
</html>
