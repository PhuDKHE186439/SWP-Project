<%-- 
    Document   : compartmenttraintest
    Created on : Oct 27, 2024, 4:07:55 PM
    Author     : My Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List, model.account, model.train, dal.AccountDAO, model.role, dal.RoleDAO, java.util.ArrayList"%>
<%@page session="true"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="header1.jsp"/>

    </head>
    <body>
        <div class="compartment-list">
            <h2>Available Train Compartments</h2>
            <c:forEach items="${comparts}" var="t">
                <form action="seats" method="Post">

                    <div class="compartment-card">
                        <div class="compartment-info">
                            <h3 class="compartment-type">Compartment ID: ${t.compartmentID}</h3>
                            <p class="seats-info">Compartment Number: ${t.compartmentNumber}</p>
                        </div>
                        <input type="hidden" name="compartID" value="${t.compartmentID}">

                        <div class="compartment-action">
                            <button class="book-button">Choose now</button>
                        </div>
                    </div>
                </form>
            </c:forEach>
            <!-- Add more compartment cards as needed -->
        </div>

    </body>
    <jsp:include page="footer1.jsp"/>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        /* Main Container */
        .compartment-list {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #f1f1f1;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Heading */
        .compartment-list h2 {
            font-size: 1.8rem;
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        /* Compartment Card */
        .compartment-card {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px;
            margin-bottom: 15px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }

        .compartment-card:hover {
            transform: scale(1.02);
        }

        /* Compartment Information */
        .compartment-info {
            flex-grow: 1;
        }

        .compartment-type {
            font-size: 1.4rem;
            color: #007BFF;
            margin-bottom: 5px;
        }

        .seats-info, .amenities {
            font-size: 0.95rem;
            color: #666;
            margin-bottom: 3px;
        }

        /* Action Section */
        .compartment-action {
            text-align: right;
        }

        .compartment-action .price {
            font-size: 1.1rem;
            color: #333;
            margin-bottom: 8px;
        }

        /* Book Button */
        .book-button {
            padding: 8px 12px;
            font-size: 0.9rem;
            color: #fff;
            background-color: #007BFF;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .book-button:hover {
            background-color: #0056b3;
        }
    </style>
</html>
