<%-- 
    Document   : trainpagetest
    Created on : Oct 27, 2024, 3:59:20 PM
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
        <jsp:include page="header1.jsp"/>
    </head>

    <body>
        <div class="train-list">

            <h2>Available Trains</h2>
            <c:forEach items="${trains}" var="t">
                <form action="comparts" method="Post">
                    <div class="train-card">
                        <div class="train-info">
                            <h3 class="train-name">${t.trainName}</h3>
                            <p class="train-times">${t.trainScheduleTime}</p>
                        </div>
                        <input type="hidden" name="trainId" value="${t.trainID}">

                        <div class="train-price">
                            <button type = "submit"class="book-button">Choose now</button>
                        </div>
                    </div>
                </form>
            </c:forEach>

            <!-- Add more train cards as needed -->
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
        .train-list {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Heading */
        .train-list h2 {
            font-size: 1.8rem;
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        /* Train Card */
        .train-card {
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

        .train-card:hover {
            transform: scale(1.02);
        }

        /* Train Information */
        .train-info {
            flex-grow: 1;
        }

        .train-name {
            font-size: 1.4rem;
            color: #4CAF50;
            margin-bottom: 5px;
        }

        .train-times, .train-duration {
            font-size: 0.95rem;
            color: #666;
        }

        /* Price Section */
        .train-price {
            text-align: right;
        }

        .train-price p {
            font-size: 1rem;
            color: #333;
            margin-bottom: 8px;
        }

        /* Book Button */
        .book-button {
            padding: 8px 12px;
            font-size: 0.9rem;
            color: #fff;
            background-color: #4CAF50;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .book-button:hover {
            background-color: #45A049;
        }
    </style>
</html>
