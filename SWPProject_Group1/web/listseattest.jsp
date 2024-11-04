<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, model.account, model.train, dal.AccountDAO, model.role, dal.RoleDAO, java.util.ArrayList"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Train Seat Selection</title>
    <style>
        .countdown {
            color: #dc3545;
            font-size: 0.9em;
            margin-left: 10px;
        }

        .remove-button {
            background: #dc3545;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 3px;
            cursor: pointer;
            font-size: 0.8em;
        }

        .remove-button:hover {
            background: #c82333;
        }

        .cart-table td {
            vertical-align: middle;
        }

        .main-container {
            display: flex;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            gap: 20px;
        }

        .seat-container {
            flex: 2;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .cart-container {
            flex: 1;
            position: sticky;
            top: 20px;
            height: fit-content;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .train-layout {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 15px;
            margin: 20px 0;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 8px;
            position: relative;
        }

        .train-section {
            margin-bottom: 30px;
        }

        .train-section-title {
            font-size: 1.2em;
            color: #2c3e50;
            margin-bottom: 10px;
            padding-bottom: 5px;
            border-bottom: 2px solid #e0e0e0;
        }

        .seat {
            position: relative;
            padding: 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-align: center;
        }

        .seat.available {
            background-color: #4CAF50;
            color: white;
        }

        .seat.window {
            background-color: #2196F3;
            color: white;
        }

        .seat.aisle {
            background-color: #9C27B0;
            color: white;
        }

        .seat.booked {
            background-color: #f44336;
            color: white;
            cursor: not-allowed;
        }

        .seat-info {
            position: absolute;
            bottom: -20px;
            left: 50%;
            transform: translateX(-50%);
            font-size: 0.8em;
            white-space: nowrap;
        }

        .legend {
            display: flex;
            gap: 15px;
            justify-content: center;
            margin: 20px 0;
            flex-wrap: wrap;
        }

        .legend-item {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .legend-color {
            width: 20px;
            height: 20px;
            border-radius: 3px;
        }

        .cart-table {
            width: 100%;
            border-collapse: collapse;
            margin: 15px 0;
        }

        .cart-table th,
        .cart-table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .cart-table th {
            background: #f5f5f5;
        }

        .discount-section {
            margin: 20px 0;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 5px;
        }

        .discount-section input {
            width: 100%;
            padding: 8px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .checkout-button {
            width: 100%;
            padding: 12px;
            background: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .checkout-button:hover {
            background: #218838;
        }

        .alert {
            padding: 10px;
            margin: 10px 0;
            border-radius: 4px;
        }

        .alert-success {
            background: #d4edda;
            color: #155724;
        }

        .alert-danger {
            background: #f8d7da;
            color: #721c24;
        }
    </style>
</head>
<body>
    <jsp:include page="header1.jsp"/>
    
    <div class="main-container">
        <div class="seat-container">
            <h2>Select Your Seat</h2>
            
            <div class="legend">
                <div class="legend-item">
                    <div class="legend-color" style="background: #4CAF50;"></div>
                    <span>Available</span>
                </div>
                <div class="legend-item">
                    <div class="legend-color" style="background: #2196F3;"></div>
                    <span>Window Seat</span>
                </div>
                <div class="legend-item">
                    <div class="legend-color" style="background: #9C27B0;"></div>
                    <span>Aisle Seat</span>
                </div>
                <div class="legend-item">
                    <div class="legend-color" style="background: #f44336;"></div>
                    <span>Booked</span>
                </div>
            </div>

            <div class="train-layout">
                <c:forEach items="${seats}" var="t" varStatus="status">
                    <form action="addtocart" method="Post" id="form${t.seatID}">
                        <div class="seat ${t.availabilityStatus == 1 ? 
                            (status.index % 4 == 0 || status.index % 4 == 3 ? 'window' : 
                             status.index % 4 == 1 || status.index % 4 == 2 ? 'aisle' : 'available') 
                            : 'booked'}"
                            onclick="if (${t.availabilityStatus} === 1) submitForm(${t.seatID});">
                            ${t.seatNumber}
                            <span class="seat-info">
                                ${status.index % 4 == 0 || status.index % 4 == 3 ? 'Window' : 
                                 status.index % 4 == 1 || status.index % 4 == 2 ? 'Aisle' : ''}
                            </span>
                        </div>
                        <input type="hidden" name="seatId" value="${t.seatID}">
                        <input type="hidden" name="compartment" value="${t.compartment.compartmentID}">
                        <input type="hidden" name="seatType" value="${t.seatType}">
                        <input type="hidden" name="seatNumber" value="${t.seatNumber}">
                        <input type="hidden" name="availabilityStatus" value="${t.availabilityStatus}">
                    </form>
                </c:forEach>
            </div>
        </div>

        <div class="cart-container">
            <h2>Your Selected Seats</h2>
            
            <c:if test="${not empty cart}">
                <table class="cart-table">
                    <tr>
                        <th>Seat Number</th>
                        <th>Type</th>
                        <th>Price</th>
                                                <th>Time Remaining</th>

                        <th>Action</th>
                    </tr>
                    <c:forEach var="item" items="${cart}">
                        <tr id="seat-row-${item.seat.seatID}">
                            <td>${item.seat.seatNumber}</td>
                            <td>${item.seat.seatType}</td>
 <td>${item.seat.seatType=="Economy"?'10000':'15000'}</td>                            <td>
                                <span class="countdown" id="countdown-${item.seat.seatID}">5:00</span>
                            </td>
                            <td>
                                <button class="remove-button" onclick="removeSeat(${item.seat.seatID})">Remove</button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>

            

            <div class="discount-section">
                <form action="addtocart" method="post">
                    <label for="discountCode">Discount Code:</label>
                    <input type="text" name="discountCode" id="discountCode">
                    <button type="submit" class="checkout-button">Apply Code</button>
                </form>
            </div>

            <c:if test="${not empty discountMessage}">
                <div class="alert alert-success">${discountMessage}</div>
            </c:if>
            <c:if test="${not empty discountError}">
                <div class="alert alert-danger">${discountError}</div>
            </c:if>

            <div class="total-section">
                <h3>Final Total: ${requestScope.total}</h3>
            </div>
                <c:if test="${requestScope.total!=null}">
            <button onclick="goToCheckout()" class="checkout-button">Proceed to Checkout</button>
            </c:if>
            <c:if test="${requestScope.total==null}">
                <button onclick="goToCheckout()" class="checkout-button" disabled="true">Proceed to Checkout</button>
            </c:if>
        </div>
    </div>

    <jsp:include page="footer1.jsp"/>

    <script>
        // Store timers for each seat
        const seatTimers = {};

        // Initialize countdown timers for each seat
        function initializeCountdown(seatId) {
            let timeLeft = 10; // 5 minutes in seconds
            
            function updateTimer() {
                const minutes = Math.floor(timeLeft / 60);
                const seconds = timeLeft % 60;
                const display = `${minutes}:${seconds.toString().padStart(2, '0')}`;
                
                const countdownElement = document.getElementById(`countdown-${seatId}`);
                if (countdownElement) {
                    countdownElement.textContent = display;
                }

                if (timeLeft === 0) {
                    clearInterval(seatTimers[seatId]);
                    removeSeat(seatId);
                } else {
                    timeLeft--;
                }
            }

            // Update immediately and then every second
            updateTimer();
            seatTimers[seatId] = setInterval(updateTimer, 1000);
        }

        // Initialize timers for all seats in cart
        document.addEventListener('DOMContentLoaded', function() {
            const seatRows = document.querySelectorAll('[id^="seat-row-"]');
            seatRows.forEach(row => {
                const seatId = row.id.replace('seat-row-', '');
                initializeCountdown(seatId);
            });
        });

        // Function to remove seat from cart
        async function removeSeat(seatId) {
            try {
                // Make an AJAX call to remove the seat from the server-side cart
                const response = await fetch('removefromcart', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: `seatId=${seatId}`
                });

                if (response.ok) {
                    // Clear the timer
                    if (seatTimers[seatId]) {
                        clearInterval(seatTimers[seatId]);
                        delete seatTimers[seatId];
                    }

                    // Remove the row from the table
                    const row = document.getElementById(`seat-row-${seatId}`);
                    if (row) {
                        row.remove();
                    }

                    // Refresh the page to update the seat availability
                    location.reload();
                } else {
                    console.error('Failed to remove seat from cart');
                }
            } catch (error) {
                console.error('Error removing seat:', error);
            }
        }

        function submitForm(id) {
            document.getElementById('form' + id).submit();
        }

        function goToCheckout() {
            window.location.href = 'http://localhost:9999/SWPProject_Group1/vnpay?price=${requestScope.total}';
        }
    </script>
</body>
</html>