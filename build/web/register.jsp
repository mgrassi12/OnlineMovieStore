<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head class = "header">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User Registration</title>
        <link rel="stylesheet" type="text/css" href="blockbuster.css">
    <img src="blockbusterlogo.png" alt="Blockbuster Logo" class="logo">
</head>

<body class = "body">
    <%  String existErr = (String) session.getAttribute("existErr");
        String emailErr = (String) session.getAttribute("emailErr");
        String passwordErr = (String) session.getAttribute("passwordErr");
        String nameErr = (String) session.getAttribute("nameErr");
    %>
    <table>
        <tr><td><h1>Register</h1></td> <td><%=(existErr != null ? existErr : "")%> </td></tr>
    </table>
    <form action="registeraction.jsp" method="post">
        <table>
            <tr><td>Full Name</td><td><input size="32"type="text" name="name" required></td><td><%=(nameErr != null ? nameErr : "")%></td></tr>
            <tr><td>Email</td><td><input size="32" type="email" name="email" required></td><td><%=(emailErr != null ? emailErr : "")%></td></tr>
            <tr><td>Password</td><td><input size="32" type="password" name="password" required></td><td><%=(passwordErr != null ? passwordErr : "")%></td></tr>
            <tr><td>Phone Number</td><td><input size="16" type="tel" name="phone" required></td></tr>
            <tr><td>Address</td><td><input size="64" type="text" name="address" required></td></tr>
            <tr><td></td><td><input type="submit" value="Register"> </td></tr>
        </table>
    </form>
    <%
        if (request.getParameter("submitted") != null) {
            existErr = emailErr = passwordErr = null;
        }
        session.invalidate();
    %>
    <p>Already have an account? Click <a href="login.jsp">here</a>.</p>
</body>
</html>