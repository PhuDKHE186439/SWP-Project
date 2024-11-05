<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List, model.account, model.train, dal.AccountDAO, model.role, dal.RoleDAO, java.util.ArrayList"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Train Compartment Selection</title>
    <jsp:include page="header1.jsp"/>
    <style>
        :root {
            --primary-color: #2563eb;
            --secondary-color: #1e40af;
            --background-color: #f3f4f6;
            --card-background: #ffffff;
            --text-primary: #1f2937;
            --text-secondary: #4b5563;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Arial, sans-serif;
        }

        body {
            background-color: var(--background-color);
            min-height: 100vh;
        }

        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
        }

        .page-title {
            text-align: center;
            color: var(--text-primary);
            margin: 2rem 0;
            font-size: 2.5rem;
            font-weight: 600;
        }

        .trip-info {
            background-color: var(--card-background);
            padding: 1rem;
            border-radius: 0.5rem;
            margin-bottom: 2rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .trip-info p {
            color: var(--text-secondary);
            margin: 0.5rem 0;
        }

        .compartment-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 1.5rem;
            padding: 1rem 0;
        }

        .compartment-card {
            background-color: var(--card-background);
            border-radius: 1rem;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease-in-out;
        }

        .compartment-card:hover {
            transform: translateY(-4px);
        }

        .compartment-header {
            background-color: var(--primary-color);
            color: white;
            padding: 1rem;
            text-align: center;
        }

        .compartment-body {
            padding: 1.5rem;
        }

        .compartment-info {
            margin-bottom: 1rem;
        }

        .info-item {
            display: flex;
            justify-content: space-between;
            margin: 0.5rem 0;
            color: var(--text-secondary);
        }

        .book-button {
            width: 100%;
            padding: 0.75rem;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 0.5rem;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        .book-button:hover {
            background-color: var(--secondary-color);
        }

        @media (max-width: 768px) {
            .container {
                padding: 0 0.5rem;
            }

            .page-title {
                font-size: 2rem;
            }

            .compartment-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="page-title">Select Your Compartment</h1>
        
        <div class="trip-info">
            <p><strong>Trip Type:</strong> ${sessionScope.tripType}</p>
            <p><strong>Departure Date:</strong> ${sessionScope.ngayDi}</p>
            <c:if test="${sessionScope.tripType eq 'roundtrip'}">
                <p><strong>Return Date:</strong> ${sessionScope.ngayVe}</p>
            </c:if>
        </div>

        <div class="compartment-grid">
            <c:forEach items="${comparts}" var="t">
                <form action="seats" method="Post">
                    <div class="compartment-card">
                        <div class="compartment-header">
                            <h3>Compartment ${t.compartmentNumber}</h3>
                        </div>
                        <div class="compartment-body">
                            <div class="compartment-info">
                                <div class="info-item">
                                    <span>Compartment ID:</span>
                                    <span>${t.compartmentID}</span>
                                </div>
                                <div class="info-item">
                                    <span>Class:</span>
                                    <span>Standard</span>
                                </div>
                                <div class="info-item">
                                    <span>Status:</span>
                                    <span class="status-available">Available</span>
                                </div>
                            </div>
                            <input type="hidden" name="compartID" value="${t.compartmentID}">
                            <button type="submit" class="book-button">Select Seats</button>
                        </div>
                    </div>
                </form>
            </c:forEach>
        </div>
    </div>

    <jsp:include page="footer1.jsp"/>
</body>
</html>