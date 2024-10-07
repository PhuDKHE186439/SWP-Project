<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Responsive Navbar and Registration Form</title>

        <!-- Font Awesome Icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <!-- Google Font: Roboto -->
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/navbar.css"/>

        <style>
            body {
                font-family: 'Roboto', sans-serif;
                background-color: #f4f4f4;
                padding: 0;
                margin: 0;
            }
            .form-container {
                margin: 50px auto;
                width: 50%;
                padding: 20px;
                background-color: white;
                border-radius: 10px;
                box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
            }
            .form-container h2 {
                text-align: center;
                margin-bottom: 20px;
            }
            .form-group {
                margin-bottom: 15px;
            }
            .form-group label {
                display: block;
                margin-bottom: 5px;
            }
            .form-group input, .form-group select {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 14px;
            }
            .form-group input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                border: none;
                cursor: pointer;
            }
            .form-group input[type="submit"]:hover {
                background-color: #45a049;
            }
            /* Style for the Category select box */
            .form-group select {
                appearance: none; /* Remove default arrow */
                background-color: white;
                padding: 10px;
                border-radius: 5px;
                border: 1px solid #ccc;
                font-size: 14px;
                background-image: url('data:image/svg+xml;charset=UTF-8,%3Csvg viewBox="0 0 140 140" xmlns="http://www.w3.org/2000/svg"%3E%3Cpath d="M0 0h140v140H0z" fill="none"/%3E%3Cpath d="M105.93 55.94L75 86.91 44.07 55.94a5.88 5.88 0 0 1 8.31-8.31L75 70.29l22.63-22.63a5.88 5.88 0 0 1 8.31 8.31z" fill="%23333"/%3E%3C/svg%3E');
                background-repeat: no-repeat;
                background-position: right 10px center;
                background-size: 12px;
            }
            /* Focus state for select */
            .form-group select:focus {
                outline: none;
                border-color: #4CAF50;
            }
        </style>

    </head>

    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-custom navbar-mainbg">
            <a class="navbar-brand navbar-logo" href="#"></a>
            <button class="navbar-toggler" type="button" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fas fa-bars text-white"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <div class="hori-selector">
                        <div class="left"></div>
                        <div class="right"></div>
                    </div>
                    <li class="nav-item">
                        <a class="nav-link" href="javascript:void(0);"><i class="fas fa-tachometer-alt"></i>Dashboard</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="javascript:void(0);"><i class="far fa-address-book"></i>Address Book</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="javascript:void(0);"><i class="far fa-clone"></i>Components</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="javascript:void(0);"><i class="far fa-calendar-alt"></i>Calendar</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="javascript:void(0);"><i class="far fa-chart-bar"></i>Charts</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="javascript:void(0);"><i class="far fa-copy"></i>Manage Ticket</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Registration Form -->
        <div class="form-container">
            <h2>Registration Form</h2>
            <form action="ticketCreate" method="post">
                <input type="hidden" name="id" value="${requestScope.id}">
                <div class="form-group">
                    <label for="category">Category:</label>
                    <select name="Category" id="category" class="form-control">
                        <c:forEach var="i" items="${requestScope.ticket}">
                            <option value="${i.ticketClassID}">${i.categoryName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="email">Train Name:</label>
                    <select name="train" id="category" class="form-control">
                        <c:forEach var="i" items="${requestScope.train}">
                            <option value="${i.getTrainID()}">${i.getTrainName()}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="password">Seat Number</label>
                    <select name="seat" id="category" class="form-control">
                        <c:forEach var="i" items="${requestScope.seat}">
                            <option value="${i.seatID}">${i.seatNumber}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="password">Compartment</label>
                    <select name="compartment" id="category" class="form-control">
                        <c:forEach var="i" items="${requestScope.compartment}">
                            <option value="${i.compartmentID}">${i.compartmentNumber}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="confirm-password">CompartNumber</label>
                    <input type="number"  name="CompartNumber" >
                </div>
                <div class="form-group">
                    <label for="confirm-password">Time arrive</label>
                    <input type="date"  name="date" >
                </div>
                <div class="form-group">
                    <input type="submit" value="Create">
                </div>
            </form>
        </div>

        <!-- External JS Scripts -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="assets/js/navbar.js"></script>

    </body>
</html>
