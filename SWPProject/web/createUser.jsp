<%-- 
    Document   : createUser
    Created on : Sep 20, 2024, 8:51:22 PM
    Author     : Laptop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, model.role, dal.RoleDAO"%>
<%@page session="true"%>

<%
    RoleDAO roleDAO = new RoleDAO();
    List<role> roles = roleDAO.getAllRoles();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create New Account</title>
</head>
<body>
    <h2>Create New Account</h2>
    <form action="CreateAccountServlet" method="post">
        <label for="phoneNumber">Phone Number:</label>
        <input type="text" name="phoneNumber" required><br>

        <label for="username">Username:</label>
        <input type="text" name="username" required><br>

        <label for="password">Password:</label>
        <input type="password" name="password" required><br>

        <label for="email">Email:</label>
        <input type="email" name="email" required><br>

        <label for="role">Role:</label>
        <select name="roleID" required>
            <option value="" disabled selected>Select Role</option>
            <% for (role r : roles) { %>
                <option value="<%= r.getRoleID() %>"><%= r.getRoleName() %></option>
            <% } %>
        </select><br>

        <input type="submit" value="Create Account">
    </form>
</body>
</html>


