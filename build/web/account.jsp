<%@page import="oms.user.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head class = "header">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Account Information</title>
        <link rel="stylesheet" type="text/css" href="blockbuster.css">
        <img src="blockbuster_logo.png" alt="Blockbuster Logo" class="logo">
    </head>
    
    <body class = "body">
        <h1>Edit Account</h1>
        <br>
        <%
            User user = (User)session.getAttribute("user");
            if (request.getParameter("updated") != null) { 
                user.updateUser(request.getParameter("name"), request.getParameter("email"),
                        request.getParameter("password"), request.getParameter("phone"), request.getParameter("address"));
                session.setAttribute("user", user);
        %>
        <p> User details updated.</p>
        <% } %>
        <br>
        <form action="account.jsp" method="post">
            <table>
                <tr><td>Full Name</td><td><input size="32" type="text" name="name" value="<%=user.getName()%>"></td></tr>
                <tr><td>Email</td><td><input size="32" type="email" name="email" value="<%=user.getEmail()%>"></td></tr>
                <tr><td>Password</td><td><input size="32" type="password" name="password" value="<%=user.getPassword()%>"></td></tr>
                <tr><td>Phone Number</td><td><input size="16" type="tel" name="phone" value="<%=user.getPhone()%>"></td></tr>
                <tr><td>Address</td><td><input size="128" type="text" name="address" value="<%=user.getAddress()%>"></td></tr> 
                <tr><td><input type="hidden" value="updated" name="updated"></td></tr>
                <tr><td></td><td><input type="submit" value="Update"> </td></tr>
            </table>
        </form>     
        <p>Return to the <a href="main.jsp">Main Page</a>.</p>
    </body>
</html>
