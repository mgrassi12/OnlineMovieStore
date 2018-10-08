<%@page import="oms.user.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head class = "header">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main</title>
        <link rel="stylesheet" type="text/css" href="blockbuster.css">
        <img src="blockbusterlogo.png" alt="Blockbuster Logo" class="logo">
        
    </head>
    
    <body class = "body">
        <%
            User user = (User) session.getAttribute("user");
            if (user == null) {
               response.sendRedirect("login.jsp");
            }
        %>
        <h1>Main page</h1>
        <jsp:include page="loginstatus.jsp"/>
        <h2>Welcome, <%=user.getName()%></h2>
        <a href="account.jsp">Edit account</a>
        <a href="index.jsp">View movie inventory</a>
    </body>
</html>
