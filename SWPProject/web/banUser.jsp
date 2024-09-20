<%-- 
    Document   : banUser
    Created on : Sep 20, 2024, 8:53:11 PM
    Author     : Laptop
--%>

<%@ page import="java.sql.ResultSet" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Ban User Account</title>
    </head>
    <body>
        <h1>Ban User Account</h1>
        <c:if test="${param.success == 'true'}">
            <p style="color:green;">Account banned successfully!</p>
        </c:if>
        <c:if test="${param.error == 'true'}">
            <p style="color:red;">Error banning account. Please try again.</p>
        </c:if>
        <table border="1">
            <tr>
                <th>Account ID</th>
                <th>Username</th>
                <th>Email</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            <%
                ResultSet accounts = (ResultSet) request.getAttribute("accounts");
                while (accounts != null && accounts.next()) {
                    int id = accounts.getInt("AccountID");
                    String username = accounts.getString("Username");
                    String email = accounts.getString("Email");
                    String status = accounts.getString("Status");
            %>
            <tr>
                <td><%= id %></td>
                <td><%= username %></td>
                <td><%= email %></td>
                <td><%= status %></td>
                <td>
                    <% if (!"Banned".equalsIgnoreCase(status)) { %>
                    <form method="post" action="banUser">
                        <input type="hidden" name="accountId" value="<%= id %>" />
                        <input type="submit" value="Ban" />
                    </form>
                    <% } else { %>
                    Already Banned
                    <% } %>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>

