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
                        <div class="legend-color" style="background: #2196F3;"></div>
                        <span>First Class</span>
                    </div>
                    <div class="legend-item">
                        <div class="legend-color" style="background: #9C27B0;"></div>
                        <span>Economy</span>
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
                                 onclick="if (${t.availabilityStatus} === 1)
                                             submitForm(${t.seatID});">
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
                                <td>${item.seat.seatType=="Economy"?'10000':'15000'}</td>                           
                                <td>
                                    
    <div class="countdown">
        <div class="time-unit">
            <span id="seconds">360</span>
            <span class="label">Giây</span>
        </div>
    </div>
                                </td>
                                <td>
                                    <form action="removecart" method="post">
                                        <button class="remove-button" type="submit">Remove</button>
                                        <input type="hidden" name="cartseatID" value="${item.seat.seatID}">
                                        <input type="hidden" name="compartment" value="${item.seat.compartment.compartmentID}">

                                    </form>
                                </td>

                            </tr>
                        </c:forEach>
                    </table>
                </c:if>



                <div class="discount-section">
    <form action="addtocart" method="post" id="discountForm" onsubmit="return validateDiscountCode()">
        <label for="discountCode">Discount Code:</label>
        <input type="text" 
               name="discountCode" 
               id="discountCode" 
               pattern="^[A-Za-z0-9]+$"
               title="Discount code should only contain letters and numbers"
               oninput="this.value = this.value.replace(/[^A-Za-z0-9]/g, '')"
               maxlength="20">
        <div id="discountError" class="alert alert-danger" style="display: none;"></div>
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
            

                        function submitForm(id) {
                            document.getElementById('form' + id).submit();
                        }

                        function goToCheckout() {
                            window.location.href = 'http://localhost:9999/SWPProject_Group1/vnpay?price=${requestScope.total}';
                        }
        </script>
        <script>
            
            function validateDiscountCode() {
    const discountInput = document.getElementById('discountCode');
    const errorDiv = document.getElementById('discountError');
    
    // Trim any whitespace
    const code = discountInput.value.trim();
    
    // Update the input value without spaces
    discountInput.value = code;
    
    // Check if empty after trimming
    if (!code) {
        errorDiv.textContent = "Please enter a discount code";
        errorDiv.style.display = "block";
        return false;
    }
    
    // Check for valid characters (letters and numbers only)
    if (!/^[A-Za-z0-9]+$/.test(code)) {
        errorDiv.textContent = "Discount code should only contain letters and numbers";
        errorDiv.style.display = "block";
        return false;
    }
    
    // Hide error message if validation passes
    errorDiv.style.display = "none";
    return true;
}

// Clean input as user types
document.getElementById('discountCode').addEventListener('input', function(e) {
    // Remove spaces and special characters immediately
    this.value = this.value.replace(/[^A-Za-z0-9]/g, '');
});

        // Store countdown data in session storage to persist across reloads
var seatTimers = {};

function initializeCountdown(seatId) {
    // Check if there's existing timer data in session storage
    let storedTimer = sessionStorage.getItem('timer_' + seatId);
    let initialTime;
    
    if (storedTimer) {
        // If timer exists in storage, calculate remaining time
        let storedData = JSON.parse(storedTimer);
        let elapsedTime = Math.floor((Date.now() - storedData.startTime) / 1000);
        initialTime = Math.max(0, storedData.initialTime - elapsedTime);
    } else {
        // If no stored timer, start new countdown from 360 seconds
        initialTime = 360;
        // Store initial timer data
        sessionStorage.setItem('timer_' + seatId, JSON.stringify({
            startTime: Date.now(),
            initialTime: initialTime
        }));
    }
    
    if (seatTimers[seatId]) {
        clearInterval(seatTimers[seatId].timer);
    }
    
    seatTimers[seatId] = {
        timeLeft: initialTime,
        timer: null
    };
    
    function updateCountdown() {
        var timerElement = document.querySelector('#seat-row-' + seatId + ' .countdown #seconds');
        if (!timerElement) {
            clearInterval(seatTimers[seatId].timer);
            return;
        }
        
        timerElement.innerText = seatTimers[seatId].timeLeft;
        
        if (seatTimers[seatId].timeLeft <= 0) {
            clearInterval(seatTimers[seatId].timer);
            var countdownElement = document.querySelector('#seat-row-' + seatId + ' .countdown');
            if (countdownElement) {
                countdownElement.innerHTML = '<h2>Timeout</h2>';
            }
            // Clear the stored timer when it expires
            sessionStorage.removeItem('timer_' + seatId);
            // You might want to add an AJAX call here to notify the server about the timeout
            return;
        }
        
        seatTimers[seatId].timeLeft -= 1;
        
        // Update stored timer data
        sessionStorage.setItem('timer_' + seatId, JSON.stringify({
            startTime: Date.now() - ((360 - seatTimers[seatId].timeLeft) * 1000),
            initialTime: 360
        }));
    }
    
    // Start the countdown
    updateCountdown();
    seatTimers[seatId].timer = setInterval(updateCountdown, 1000);
}

// Initialize countdown for all existing seats when page loads
window.onload = function() {
    var seatRows = document.querySelectorAll('[id^="seat-row-"]');
    for(var i = 0; i < seatRows.length; i++) {
        var seatId = seatRows[i].id.replace('seat-row-', '');
        initializeCountdown(seatId);
    }
};

function submitForm(id) {
    document.getElementById('form' + id).submit();
}

function goToCheckout() {
    window.location.href = 'http://localhost:9999/SWPProject_Group1/vnpay?price=${requestScope.total}';
}

// Clean up function to remove expired timers from session storage
function cleanupExpiredTimers() {
    for (let i = 0; i < sessionStorage.length; i++) {
        let key = sessionStorage.key(i);
        if (key.startsWith('timer_')) {
            let storedData = JSON.parse(sessionStorage.getItem(key));
            let elapsedTime = Math.floor((Date.now() - storedData.startTime) / 1000);
            if (elapsedTime >= storedData.initialTime) {
                sessionStorage.removeItem(key);
            }
        }
    }
}

// Run cleanup on page load
cleanupExpiredTimers();
    </script>

    </body>
</html>