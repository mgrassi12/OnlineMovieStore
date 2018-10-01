<%@page import="oms.user.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head class = "header">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main</title>
        <link rel="stylesheet" type="text/css" href="blockbuster.css">
        <img src="blockbuster_logo.png" alt="Blockbuster Logo" class="logo">
        <%
               String name = request.getParameter("name");
               String email = request.getParameter("email");
               String password = request.getParameter("password");
               String phone = request.getParameter("phone");
               String address = request.getParameter("address");
               User user = new User(name,email,password,phone,address);
               session.setAttribute("user", user);
        %>
    </head>
    
    <body class = "body">
        <p>Click <a href="account.jsp">here</a> to proceed to your Account Information page.</p>
        <p>Click <a href="index.jsp">here</a> to proceed to our Movie Inventory.</p>
    </body>
</html>
