<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, model.account, dal.AccountDAO"%>
<%@page session="true"%>

<%
    AccountDAO accountDAO = new AccountDAO();
    List<account> accounts = accountDAO.getAllAccount();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ban Account</title>
</head>
<body>
    <h2>Ban Account</h2>
    <form action="BanAccountServlet" method="post">
        <label for="account">Select Account to Ban:</label>
        <select name="accountID" required>
            <option value="" disabled selected>Select Account</option>
            <% for (account acc : accounts) { %>
                <option value="<%= acc.getAccountID() %>"><%= acc.getUsername() %> - <%= acc.getEmail() %></option>
            <% } %>
        </select><br>

        <input type="submit" value="Ban Account">
    </form>
</body>
</html>
