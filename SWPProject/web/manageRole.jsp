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
    <title>Manage Roles</title>
</head>
<body>
    <h2>Manage Roles</h2>

    <h3>Add Role</h3>
    <form action="AddRoleServlet" method="post">
        <label for="roleName">Role Name:</label>
        <input type="text" name="roleName" required><br>
        <input type="submit" value="Add Role">
    </form>

    <h3>Edit/Delete Role</h3>
    <table border="1">
        <thead>
            <tr>
                <th>Role ID</th>
                <th>Role Name</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% for (role r : roles) { %>
                <tr>
                    <td><%= r.getRoleID() %></td>
                    <td><%= r.getRoleName() %></td>
                    <td>
                        <form action="EditRoleServlet" method="post" style="display:inline;">
                            <input type="hidden" name="roleID" value="<%= r.getRoleID() %>">
                            <input type="submit" value="Edit">
                        </form>
                        <form action="DeleteRoleServlet" method="post" style="display:inline;">
                            <input type="hidden" name="roleID" value="<%= r.getRoleID() %>">
                            <input type="submit" value="Delete">
                        </form>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
