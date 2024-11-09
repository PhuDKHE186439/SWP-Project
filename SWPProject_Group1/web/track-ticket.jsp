<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ticket Tracking | Train Ticket</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: Arial, sans-serif;
                line-height: 1.6;
                background-color: #f5f5f5;
            }

            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 40px 20px;
            }

            .card {
                background: #fff;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                width: 100%;
                max-width: 600px;
                margin: 0 auto;
                padding: 30px;
            }

            .card-title {
                text-align: center;
                color: #333;
                font-size: 24px;
                margin-bottom: 30px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-label {
                display: block;
                margin-bottom: 8px;
                color: #555;
                font-weight: 600;
            }

            .form-control {
                width: 100%;
                padding: 12px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
            }

            .form-control:focus {
                outline: none;
                border-color: #4A90E2;
                box-shadow: 0 0 0 2px rgba(74,144,226,0.2);
            }

            .btn {
                display: block;
                width: 100%;
                padding: 14px;
                background-color: #4A90E2;
                color: white;
                border: none;
                border-radius: 4px;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .btn:hover {
                background-color: #357ABD;
            }

            .alert {
                padding: 12px;
                border-radius: 4px;
                margin-top: 20px;
                background-color: #f8d7da;
                color: #721c24;
                border: 1px solid #f5c6cb;
            }

            .ticket-info {
                margin-top: 30px;
            }

            .ticket-info h4 {
                color: #333;
                margin-bottom: 20px;
            }

            .info-card {
                background: #f8f9fa;
                border-radius: 4px;
                padding: 20px;
            }

            .info-row {
                display: flex;
                margin-bottom: 12px;
                padding: 8px 0;
                border-bottom: 1px solid #eee;
            }

            .info-row:last-child {
                border-bottom: none;
            }

            .info-label {
                flex: 0 0 40%;
                font-weight: 600;
                color: #555;
            }

            .info-value {
                flex: 0 0 60%;
                color: #333;
            }

            @media (max-width: 768px) {
                .container {
                    padding: 20px 10px;
                }
                
                .card {
                    padding: 20px;
                }

                .info-row {
                    flex-direction: column;
                }

                .info-label {
                    margin-bottom: 4px;
                }
            }
        </style>
    </head>
    <jsp:include page="header1.jsp"></jsp:include>

    <body>
        <div class="container">
            <div class="card">
                <h3 class="card-title">Ticket Information Lookup</h3>
                
                <form action="track-ticket" method="POST">
                    <div class="form-group">
                        <label class="form-label" for="ticketCode">Ticket Code:</label>
                        <input type="text" class="form-control" id="ticketCode" name="ticketCode" 
                               required pattern="^[A-Za-z0-9]{20}$" title="Ticket code must be exactly 20 characters" 
                               placeholder="Enter ticket code (e.g., TK2405091233246656)">
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label" for="phone">Phone Number:</label>
                        <input type="tel" class="form-control" id="phone" name="phone" 
                               required pattern="^\d{10}$" title="Phone number must be 10 digits" 
                               placeholder="Enter phone number">
                    </div>
                    
                    <button type="submit" class="btn">Track Ticket</button>
                </form>
                
                <c:if test="${not empty errorMessage}">
                    <div class="alert" role="alert">
                        ${errorMessage}
                    </div>
                </c:if>
                
                <c:if test="${not empty ticket}">
                    <div class="ticket-info">
                        <h4>Ticket Information</h4>
                        <div class="info-card">
                            <div class="info-row">
                                <div class="info-label">Ticket Class:</div>
                                <div class="info-value">${ticket.ticketClass.categoryName}</div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Train:</div>
                                <div class="info-value">${ticket.seat.compartment.train.trainName}</div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Compartment:</div>
                                <div class="info-value">${ticket.seat.compartment.compartmentNumber}</div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Seat:</div>
                                <div class="info-value">${ticket.seat.seatNumber}</div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Departure Station:</div>
                                <div class="info-value">${ticket.seat.compartment.train.startLocation.locationName}</div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Arrival Station:</div>
                                <div class="info-value">${ticket.seat.compartment.train.arrivalLocation.locationName}</div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Time:</div>
                                <div class="info-value">${ticket.seat.compartment.train.trainScheduleTime}</div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Ticket Price:</div>
                                <div class="info-value">${String.format("%,.0f", ticket.ticketPrice)}</div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
        
        <jsp:include page="footer1.jsp"></jsp:include>
    </body>
</html>