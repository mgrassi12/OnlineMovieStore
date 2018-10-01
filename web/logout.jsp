<%-- 
    Document   : logout.jsp
    Created on : 01/10/2018, 8:57:12 PM
    Author     : Alan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head class = "header">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
        <link rel="stylesheet" type="text/css" href="blockbuster.css">
        <img src="blockbuster_logo.png" alt="Blockbuster Logo" class="logo">        
    </head>
    
    <body>
        <% session.invalidate(); %>
        <p>You have been logged out. Click <a href="index.jsp">here</a> to return to the index page.</p>
    </body>
</html>
