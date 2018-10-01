<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head class = "header">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User Registration</title>
        <link rel="stylesheet" type="text/css" href="blockbuster.css">
        <img src="blockbuster_logo.png" alt="Blockbuster Logo" class="logo">
    </head>
    
    <body class = "body">
        <h1>Register</h1>
        <!-- needs to post to main.jsp, not account -->
        <form action="main.jsp" method="post">
            <table>
                <tr><td>Full Name</td><td><input size="32" type="text" name="name"></td></tr>
                <tr><td>Email</td><td><input size="32" type="email" name="email"></td></tr>
                <tr><td>Password</td><td><input size="32" type="password" name="password"></td></tr>
                <tr><td>Phone Number</td><td><input size="16" type="tel" name="phone"></td></tr>
                <tr><td>Address</td><td><input size="128" type="text" name="address"></td></tr>
                <tr><td></td><td><input type="submit" value="Register"> </td></tr>
            </table>
        </form>
    </body>
</html>