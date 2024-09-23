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
    <script>
        function filterAccounts() {
            const searchInput = document.getElementById('searchInput').value.toLowerCase();
            const options = document.getElementById('accountSelect').options;

            for (let i = 0; i < options.length; i++) {
                const optionText = options[i].text.toLowerCase();
                options[i].style.display = optionText.includes(searchInput) ? 'block' : 'none';
            }
        }
    </script>
</head>
<body>
    <h2>Ban Account</h2>
    <form action="BanAccount" method="post">
        <label for="account">Select Account to Ban:</label><br>
        <input type="text" id="searchInput" placeholder="Search accounts..." onkeyup="filterAccounts()"><br>
        <select id="accountSelect" name="accountID" required size="5">
            <option value="" disabled selected>Select Account</option>
            <% for (account acc : accounts) { %>
                <option value="<%= acc.getAccountID() %>"><%= acc.getUsername() %> - <%= acc.getEmail() %></option>
            <% } %>
        </select><br>
        <input type="submit" value="Ban Account">
    </form>
</body>
</html>
