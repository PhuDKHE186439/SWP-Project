<%-- 
    Document   : profiletest
    Created on : Oct 17, 2024, 4:51:17 PM
    Author     : My Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="header1.jsp"></jsp:include>

        </head>
        <body>

            <div class="page-content bg-white" style="margin: 30px">
                <!-- inner page banner -->
                <!-- Breadcrumb row -->
                <!-- Breadcrumb row END -->
                <!-- inner page banner END -->
                <div class="content-block">
                    <!-- About Us -->

                    <div class="section-area section-sp1">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-sm-12 m-b30">
                                    <div class="profile-bx text-center">
                                        <div class="user-profile-thumb" >
                                            <img src="https://th.bing.com/th/id/OIP.ItvA9eX1ZIYT8NHePqeuCgHaHa?w=188&h=188&c=7&r=0&o=5&pid=1.7" alt=""/>
                                        </div>
                                        <div class="profile-info">
                                            <h4>${profile.name}</h4>
                                        <span>${profile.email}</span>
                                    </div>
                                    <div class="profile-tabnav">
                                        <ul class="nav nav-tabs">
                                            <li class="nav-item">
                                                <a class="nav-link active" data-toggle="tab" href="#courses"><i class="ti-book"></i>Your Profile</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#change-password"><i class="ti-lock"></i>Change Password</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#edit-profile"><i class="ti-pencil-alt"></i>Booking history</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-9 col-md-8 col-sm-12 m-b30">
                                <div class="profile-content-bx">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="courses">
                                            <div class="profile-head">
                                                <p style="color: Red">${requestScope.passwordChange}</p>
                                                <p style="color: Red">${sessionScope.mess}</p>
                                            </div>
                                            <form class="edit-profile" action="userprofile" method="post">
                                                <div class="">
                                                    <div class="form-group row">
                                                        <div class="col-12 col-sm-9 col-md-9 col-lg-10 ml-auto">
                                                            <h3>1. Personal Details</h3>
                                                            <p style="color: Red">${requestScope.AccID}</p>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Full Name</label>
                                                        <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                            <input class="form-control" name="name" Value="${profile.name}" placeholder="${profile.name}" type="text"  required="">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Date Of Birth</label>
                                                        <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                            <input class="form-control" name="age" value="${profile.age}"  placeholder="${profile.age}" type="date"  required="" max="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date(System.currentTimeMillis() - 13L * 365 * 24 * 60 * 60 * 1000)) %>">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Address</label>
                                                        <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                            <input class="form-control" name="address" value="${profile.address}" placeholder="${profile.address}" type="text"  required="">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Phone Number</label>
                                                        <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                            <input class="form-control" name="phone" value="${profile.phoneNumber}" placeholder="${profile.phoneNumber}" type="tel"  required="" pattern="[0-9]{10}">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-12 col-sm-3 col-md-3 col-lg-2 col-form-label">Email Address</label>
                                                        <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                            <input class="form-control" name="email"  value="${profile.email}" placeholder="${profile.email}" type="email" id="email-4" data-ms-member="email" required="">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="">
                                                    <div class="">
                                                        <div class="row">
                                                            <div class="col-12 col-sm-3 col-md-3 col-lg-2">
                                                            </div>
                                                            <div class="col-12 col-sm-9 col-md-9 col-lg-7">
                                                                <button type="submit" class="btn">Save changes</button>
                                                                <button type="reset" class="btn-secondry">Cancel</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="tab-pane" id="change-password">
                                            <div class="profile-head">
                                                <h3>Change Password</h3>
                                            </div>
                                            <form class="edit-profile" action="updateuserprofile" method="post">
                                                <div class="">
                                                    <div class="form-group row">
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-12 col-sm-4 col-md-4 col-lg-3 col-form-label">Current Password</label>
                                                        <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                                                            <input class="form-control" type="password" value="" name="currentPassword">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-12 col-sm-4 col-md-4 col-lg-3 col-form-label">New Password</label>
                                                        <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                                                            <input class="form-control" type="password" value="" name="newPassword">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-12 col-sm-4 col-md-4 col-lg-3 col-form-label">Re Type New Password</label>
                                                        <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                                                            <input class="form-control" type="password" value="" name="rePassword">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-12 col-sm-4 col-md-4 col-lg-3">
                                                    </div>
                                                    <div class="col-12 col-sm-8 col-md-8 col-lg-7">
                                                        <button type="submit" class="btn">Save changes</button>
                                                        <button type="reset" class="btn-secondry">Cancel</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="tab-pane" id="edit-profile">
                                            <div class="profile-head">
                                                <h3>Booking History</h3>
                                            </div>
                                            <table class="entity">
                                                <thead>
                                                    <tr>
                                                        <th>TicketID</th>
                                                        <th>TicketCode</th>
                                                        <th>TicketClass</th>
                                                        <<th>Train</th>
                                                        <th>Compartment</th>
                                                        <th>Seat</th>
                                                        <th>TimeArrive</th>
                                                        <th>Price</th>
                                                        <th>PruchaseDate</th>
                                                        <th>PurchaseMethod</th>
                                                        <th>Status</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="i" items="${requestScope.CustomerHistory}">
                                                        <tr>
                                                            <td>${i.ticket.ticketID}</td>
                                                            <td>${i.ticket.ticketCode}</td>
                                                            <td>${i.ticket.ticketClass.categoryName}</td>
                                                            <td>${i.ticket.seat.compartment.train.trainName}</td>
                                                            <td>${i.ticket.seat.compartment.compartmentNumber}</td>
                                                            <td>${i.ticket.seat.seatNumber}</td>
                                                            <td>${i.ticket.timeArrive}</td>
                                                            <td>${i.ticket.ticketPrice}</td>
                                                            <td>${i.ticket.purchaseDate}</td>
                                                            <td>${i.paymentMethod}</td>
                                                            <c:set var="status" value="${i.ticket.status}"/>  

                                                            <td><form action="refundc" method="POST">
                                                                    ${i.ticket.status == 1 ? '<button type="button" onclick="showModal()">Refund</button>' : 'Traveled'}
                                                                    <input type="hidden" name="ticketid" value="${i.ticket.ticketID}">
                                                                    <input type="hidden" name="passengerid" value="${i.ticket.passengerID}">
                                                                    <input type="hidden" name="refundMessage" value="">
                                                                </form></td>

                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            <div id="refundModal" style="display:none;">
                                                <div class="modal-content">
                                                    <span class="close" onclick="closeModal()">&times;</span>
                                                    <h4>Refund Request</h4>
                                                    <textarea name="message" id="refundMessageInput" placeholder="Enter your message here...Please Also include your Bank Account/ Digital Wallet so we can Refund You"></textarea>
                                                    <button id="submitRefund">Submit</button>
                                                </div>
                                            </div>
                                            <div class="mt-4 text-left">
                                                <c:if test="${currentPage > 1}">
                                                    <a href="userprofile?page=${currentPage - 1}" class="btn btn-primary">Previous</a>
                                                </c:if>
                                                <c:if test="${currentPage > 2}">
                                                    <a href="userprofile?page=1" class="btn btn-outline-primary">1</a>
                                                    <c:if test="${currentPage > 3}">
                                                        <span>...</span>
                                                    </c:if>
                                                </c:if>

                                                <c:if test="${currentPage > 1}">
                                                    <a href="userprofile?page=${currentPage - 1}" class="btn btn-outline-primary">${currentPage - 1}</a>
                                                </c:if>

                                                <span class="btn btn-primary">${currentPage}</span>

                                                <c:if test="${currentPage < totalPages}">
                                                    <a href="userprofile?page=${currentPage + 1}" class="btn btn-outline-primary">${currentPage + 1}</a>
                                                </c:if>

                                                <c:if test="${currentPage < totalPages - 1}">
                                                    <c:if test="${currentPage < totalPages - 2}">
                                                        <span>...</span>
                                                    </c:if>
                                                    <a href="userprofile?page=${totalPages}" class="btn btn-outline-primary">${totalPages}</a>
                                                </c:if>

                                                <c:if test="${currentPage < totalPages}">
                                                    <a href="userprofile?page=${totalPages}" class="btn btn-primary">Next</a>
                                                </c:if>

                                                <div class="mt-2">
                                                    Page ${currentPage} of ${totalPages}
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- contact area END -->
            </div>
        </div>
    </body>
    <jsp:include page="footer1.jsp"></jsp:include>
    <script>
        function confirmRefund(form) {
            var message = prompt("Please enter your refund request message/Please indluce your bank account so we can able to refund you:");
            if (message !== null) {
                var messageInput = document.createElement("input");
                messageInput.type = "hidden";
                messageInput.name = "refundMessage"; // Add this field to your form
                messageInput.value = message;
                form.appendChild(messageInput);
                return true; // Allow form submission
            }
            return false; // Prevent form submission if user cancels
        }
    </script>

    <style>
        #refundModal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5); /* Slightly darker background */
            padding-top: 100px; /* Space from the top */
        }

        /* Modal content */
        .modal-content {
            background-color: #fefefe;
            margin: auto; /* Centering */
            padding: 20px;
            border: 1px solid #888;
            width: 600px; /* Set width to 600px for larger size */
            border-radius: 5px; /* Rounded corners */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Slight shadow for depth */
        }

        /* Close button style */
        .close {
            color: #aaa;
            float: right;
            font-size: 24px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        /* Textarea style */
        #refundMessageInput {
            width: 100%; /* Full width of the modal */
            height: 120px; /* Set height for the textarea */
            margin-top: 10px; /* Space above */
            padding: 5px; /* Inner padding */
            border: 1px solid #ccc; /* Border style */
            border-radius: 3px; /* Rounded corners */
            resize: none; /* Disable resizing */
        }

        /* Button style */
        #submitRefund {
            background-color: #4CAF50; /* Green background */
            color: white; /* White text */
            padding: 10px 15px; /* Padding */
            border: none; /* No border */
            border-radius: 3px; /* Rounded corners */
            cursor: pointer; /* Pointer on hover */
            margin-top: 10px; /* Space above */
        }

        #submitRefund:hover {
            background-color: #45a049; /* Darker green on hover */
        }
    </style>
    <script>
        function showModal() {
            document.getElementById("refundModal").style.display = "block";
        }

        function closeModal() {
            document.getElementById("refundModal").style.display = "none";
        }

        document.getElementById("submitRefund").onclick = function () {
            var message = document.getElementById("refundMessageInput").value;
            if (message) {
                // Here you can handle form submission
                var form = document.querySelector('form[action="refundc"]'); // Adjust if necessary
                form.elements["refundMessage"].value = message; // Set the refund message
                form.submit(); // Submit the form
            } else {
                alert("Please enter a message.");
            }
        };
    </script>
    <style>
        #change-password {
            border: 2px solid #000; /* Adjust the thickness and color as needed */
            padding: 15px;         /* Space inside the box */
            margin: 10px;         /* Space outside the box */
            border-radius: 5px;   /* Optional: rounded corners */
            background-color: #f9f9f9; /* Optional: background color */
        }
        #quiz-results {
            border: 2px solid #000; /* Adjust the thickness and color as needed */
            padding: 15px;         /* Space inside the box */
            margin: 10px;         /* Space outside the box */
            border-radius: 5px;   /* Optional: rounded corners */
            background-color: #f9f9f9; /* Optional: background color */
        }
        #courses {
            border: 2px solid #000; /* Adjust the thickness and color as needed */
            padding: 15px;         /* Space inside the box */
            margin: 10px;         /* Space outside the box */
            border-radius: 5px;   /* Optional: rounded corners */
            background-color: #f9f9f9; /* Optional: background color */
        }
        #edit-profile {
            border: 2px solid #000; /* Adjust the thickness and color as needed */
            padding: 15px;         /* Space inside the box */
            margin: 10px;         /* Space outside the box */
            border-radius: 5px;   /* Optional: rounded corners */
            background-color: #f9f9f9;
            width: 1050px;           /* Set the desired width */
            height: 500px;/* Optional: background color */
        }
        :root {
            --tripoveMainColor: rgb(71, 143, 192);
        }

        table.entity {
            border-collapse: collapse;
            border: 1px solid #ddd;
            font-family: Arial, sans-serif;
        }

        table.entity thead {
            background-color: #f2f2f2;
        }

        table.entity th,
        table.entity td {
            border: 1px solid #ddd;
            padding: 6px;
            text-align: center;
            padding-top: 10px;
            padding-bottom: 10px;
            word-wrap: break-word;
            font-size: 14px;
        }

        table.entity th {
            background-color: #f7b205;
            color: white;
        }

        table.entity td img {
            height: 80px;
            width: 80px;
            object-fit: cover;
        }

        table.entity td a {
            text-decoration: none;
            margin-right: 10px;
        }

        table.entity td a:hover {
            text-decoration: underline;
        }
        #left-column{
            text-align: center;
        }
        #left-column table{
            display: inline-block;
            margin: 0 auto;
        }
        #right-column{
            font-size: 14px
        }

        #right-column form{
            float:right;
        }

        .entity-update {
            padding: 8px;
            border-radius: 6px;
            border-color: white;
            color: white;
            background-color: #04aa6d;
            cursor: pointer
        }

        .entity-delete {
            padding: 8px;
            border-radius: 6px;
            border-color: white;
            color: white;
            background-color: #f44336;
            cursor: pointer
        }

        .entity-detail {
            padding: 8px;
            border-radius: 6px;
            border-color: white;
            color: white;
            background-color: #f7d017;
            cursor: pointer
        }

        .filterController{
            font-size: 14px;
            float:left
        }

        .filterController button{
            padding: 6px;
        }

        .filterElm{
            margin-right: 15px;
            padding: 0 3px
        }



    </style>

</html>
