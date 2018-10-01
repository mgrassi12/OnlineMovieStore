<%@page import="oms.user.User" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head class = "header">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
        <link rel="stylesheet" type="text/css" href="blockbuster.css">
        <img src="blockbuster_logo.png" alt="Blockbuster Logo" class="logo">
    </head>
    
     <%
        String log;
        String msg;
        User user = (User)session.getAttribute("user");

        if (user != null) {
            log = user.getName() + " &lt " + user.getEmail() + " &gt";
            msg = "You are logged in as " + log;
        } else {
            log = "";
            msg = "You are not logged in";
        }
    %>
    
    <body class = "body">
        <h1>Movie Inventory</h1>
        <div style="background: #eee; border: solid 1px #333; text-align: right; width: 100%;"><%=msg%></div>
        <% if (user != null) { %>
        <div style="text-align: right;"><a href="logout.jsp">Logout</a></div>
        <br>
        <li><a href="edit_user.jsp">My Account</a></li>
        <% } else { %>
        <div style="text-align: right;"><a href="register.jsp">Register</a></div>
        <% } %>
    </body>
</html>
