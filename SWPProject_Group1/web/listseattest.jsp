<%-- 
    Document   : listseattest
    Created on : Oct 27, 2024, 4:22:02 PM
    Author     : My Asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, model.account, model.train, dal.AccountDAO, model.role, dal.RoleDAO, java.util.ArrayList"%>
<%@page session="true"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <jsp:include page = "header1.jsp"/>
    <style>
        .seat-container {
            max-width: 600px;
            text-align: center;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            margin: 20px auto;
            font-family: Arial, sans-serif;
        }
        .seat-container h2 {
            font-size: 1.5em;
            color: #333;
        }
        .seat-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 15px;
            margin-top: 20px;
        }
        .seat {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 15px;
            font-size: 1em;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            transition: transform 0.2s, background-color 0.2s;
        }
        .seat.available {
            background-color: #4CAF50;
            color: #fff;
        }
        .seat.available:hover {
            background-color: #45a049;
            transform: scale(1.05);
        }
        .seat.booked {
            background-color: #f44336;
            color: #fff;
            cursor: not-allowed;
        }
        .seat.selected {
            background-color: #ffc107;
            color: #333;
        }
        .container {
            display: flex; /* Use flexbox for layout */
            justify-content: space-between; /* Space between seat list and cart */
            width: 100%; /* Full width of the parent */
        }

        .seat-list {
            flex: 1; /* Take up remaining space */
            padding: 20px; /* Padding around seat list */
            overflow-y: auto; /* Allow scrolling if needed */
        }

        .cart {
            width: 250px; /* Fixed width for the cart */
            padding: 20px; /* Padding around cart */
            border-left: 2px solid #ccc; /* Left border to separate from seat list */
            background-color: #f9f9f9; /* Light background color */
            position: sticky; /* Keep it in view while scrolling */
            top: 0; /* Positioning at the top */
            height: calc(100vh - 40px); /* Full height minus padding */
            overflow-y: auto; /* Allow scrolling if needed */
        }

        .seat {
            border: 1px solid #ccc; /* Border for each seat */
            padding: 10px; /* Padding inside seat block */
            margin: 10px 0; /* Margin between seats */
            background-color: #fff; /* White background for seats */
        }

        h2 {
            margin-bottom: 10px; /* Space below headings */
        }

        table {
            width: 100%; /* Full width for the table */
            border-collapse: collapse; /* Collapse borders */
        }

        th, td {
            border: 1px solid #ccc; /* Border for table cells */
            padding: 8px; /* Padding inside cells */
            text-align: left; /* Left-align text */
        }

        #empty-cart {
            text-align: center; /* Center-align empty cart message */
            color: #999; /* Light grey color */
        }
    </style>
    <script>
        function redirectToPayment(seatId) {
            const price = seatId; // Set price as needed
            const paymentUrl = `http://localhost:9999/SWPProject_Group1/vnpay?price=100`;

            window.location.href = paymentUrl;
        }
    </script>
</head>
<body>

    <div class="seat-container">
        <h2>Select Your Seat</h2>
        <c:forEach items="${seats}" var="t">
            <div class="seat-grid">
                <form action="addtocart" method="Post" id="form${t.seatID}">
                    <!-- Available and Booked Seats with onclick for available seats -->
                    <div 
                        class="seat ${t.availabilityStatus == 1 ? 'available' : 'booked'}" 
                        onclick="${t.availabilityStatus == 1 ? '' : ''} if (${t.availabilityStatus} === 1)
            submitForm(${t.seatID});">
                        ${t.seatNumber}
                    </div>                    <input type="hidden" name="seatId" value="${t.seatID}">
                    <input type="hidden" name="compartment" value="${t.compartment.compartmentID}">
                    <input type="hidden" name="seatType" value="${t.seatType}">
                    <input type="hidden" name="seatNumber" value="${t.seatNumber}">
                    <input type="hidden" name="availabilityStatus" value="${t.availabilityStatus}">
                </form>
            </div>
        </c:forEach>

    </div>
    <div class="seat-container">
        <h2>Cart</h2>
        <table>
            <tr>
                <th>Seat ID</th>
                <th>seatType</th>
                <th>Price</th>
            </tr>
            <c:forEach var="item" items="${cart}">
                <tr>
                    <td>${item.seat.seatNumber} </td>
                    <td>${item.seat.seatType}</td>
                    <td>${item.seat.seatType=="Economy"?'100':'150'}</td>
                </tr>
            </c:forEach>
            <tr>
                Total Amount: ${requestScope.total}
            </tr>
        </table>
        <div class="checkout-container">
            <button onclick="goToCheckout()" class="checkout-button">Process to Checkout</button>
        </div>

        <!-- Styling -->
        <style>
            .checkout-container {
                padding: 20px;
                right: 20px;
                bottom: 20px;
            }
            .checkout-button {
                background-color: #28a745;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
            }
            .checkout-button:hover {
                background-color: #218838;
            }
        </style>

        <!-- JavaScript for Redirection -->
        <script>
            function goToCheckout() {
                // Set the checkout URL
                const checkoutUrl = 'http://localhost:9999/SWPProject_Group1/vnpay?price=${requestScope.total}';

                // Redirect to checkout page
                window.location.href = checkoutUrl;
            }
        </script>
    </div>

</body>
<jsp:include page = "footer1.jsp"/>
<script>
    function submitForm(id) {
        document.getElementById('form' + id).submit();
    }
</script>
</html>
