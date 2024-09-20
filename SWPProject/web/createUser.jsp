<%-- 
    Document   : createUser
    Created on : Sep 20, 2024, 8:51:22 PM
    Author     : Laptop
--%>

<%@ page import="java.sql.ResultSet" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Create User</title>
    </head>
    <body>
        <h1>Create New User</h1>
        <c:if test="${param.success == 'true'}">
            <p style="color:green;">User created successfully!</p>
        </c:if>
        <c:if test="${param.error == 'true'}">
            <p style="color:red;">Error creating user. Please try again.</p>
        </c:if>
        <form method="post" action="createUser">
            <label>Phone Number:</label>
            <input type="text" name="phoneNumber" required /><br/>

            <label>Username:</label>
            <input type="text" name="username" required /><br/>

            <label>Password:</label>
            <input type="password" name="password" required /><br/>

            <label>Email:</label>
            <input type="email" name="email" required /><br/>

            <label>Role:</label>
            <select name="roleId" required>
                <%
                    ResultSet roles = (ResultSet) request.getAttribute("roles");
                    while (roles != null && roles.next()) {
                        int id = roles.getInt("RoleID");
                        String name = roles.getString("RoleName");
                %>
                <option value="<%= id %>"><%= name %></option>
                <%
                    }
                %>
            </select><br/>

            <input type="submit" value="Create User" />
        </form>
    </body>
</html>

