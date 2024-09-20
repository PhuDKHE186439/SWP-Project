<%-- 
    Document   : manageRole
    Created on : Sep 20, 2024, 8:53:47 PM
    Author     : Laptop
--%>

<%@ page import="java.sql.ResultSet" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Roles</title>
</head>
<body>
    <h1>Manage Roles</h1>
    <c:if test="${param.success == 'add'}">
        <p style="color:green;">Role added successfully!</p>
    </c:if>
    <c:if test="${param.error == 'add'}">
        <p style="color:red;">Error adding role. Please try again.</p>
    </c:if>
    <c:if test="${param.success == 'edit'}">
        <p style="color:green;">Role updated successfully!</p>
    </c:if>
    <c:if test="${param.error == 'edit'}">
        <p style="color:red;">Error updating role. Please try again.</p>
    </c:if>
    <c:if test="${param.success == 'delete'}">
        <p style="color:green;">Role deleted successfully!</p>
    </c:if>
    <c:if test="${param.error == 'delete'}">
        <p style="color:red;">Error deleting role. Please try again.</p>
    </c:if>

    <!-- List of Roles -->
    <table border="1">
        <tr>
            <th>Role ID</th>
            <th>Role Name</th>
            <th>Actions</th>
        </tr>
        <%
            ResultSet roles = (ResultSet) request.getAttribute("roles");
            while (roles != null && roles.next()) {
                int id = roles.getInt("RoleID");
                String name = roles.getString("RoleName");
        %>
        <tr>
            <td><%= id %></td>
            <td><%= name %></td>
            <td>
                <!-- Edit Role -->
                <form method="post" action="manageRole" style="display:inline;">
                    <input type="hidden" name="action" value="edit" />
                    <input type="hidden" name="roleId" value="<%= id %>" />
                    <input type="text" name="roleName" value="<%= name %>" required />
                    <input type="submit" value="Edit" />
                </form>
                
                <!-- Delete Role -->
                <form method="post" action="manageRole" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this role?');">
                    <input type="hidden" name="action" value="delete" />
                    <input type="hidden" name="roleId" value="<%= id %>" />
                    <input type="submit" value="Delete" />
                </form>
            </td>
        </tr>
        <%
            }
        %>
    </table>

    <!-- Add New Role -->
    <h2>Add New Role</h2>
    <form method="post" action="manageRole">
        <input type="hidden" name="action" value="add" />
        <label>Role Name:</label>
        <input type="text" name="roleName" required />
        <input type="submit" value="Add Role" />
    </form>
</body>
</html>

