<%@page import="oms.user.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head class = "header">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Account Information</title>
        <link rel="stylesheet" type="text/css" href="blockbuster.css">
        <img src="blockbusterlogo.png" alt="Blockbuster Logo" class="logo">
    </head>
    
    <body class = "body">
        <%
            User user = (User) session.getAttribute("user");
            if (request.getParameter("email") != null) {
                 user.updateUser(request.getParameter("name"), request.getParameter("email"),
                    request.getParameter("password"), request.getParameter("phone"), request.getParameter("address"));
            }
        %>

        <h1>Update Account Information</h1>

        <form action="account.jsp" method="POST">

            <table>
                <tr><td>Name</td><td><input type="text" value="<%= user.getName()%>" name="name"></td></tr>
                <tr><td>Email</td><td><input type="text" value="<%= user.getEmail()%>" name="email"></td></tr>
                <tr><td>Password</td><td><input type="password" value="<%= user.getPassword()%>" name="password"></td></tr>
                <tr><td>Phone</td><td><input type="text" value="<%= user.getPhone()%>" name="phone"></td></tr>
                <tr><td>Address</td><td><input type="text" value="<%= user.getAddress()%>" name="address"></td></tr>
                <tr><td></td><td><input type="submit" value="Save"></td></tr>
            </table>
                
        <%
            if (request.getParameter("email") != null) {
        %>
        <p>Details updated.</p>
        <%
            }
        %>
        </form>    
        <p>Return to the <a href="main.jsp">Main Account Page</a>.</p>
    </body>
</html>
