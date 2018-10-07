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
    <%  String existError = (String) session.getAttribute("existError");
        String emailError = (String) session.getAttribute("emailError");
        String passwordError = (String) session.getAttribute("passwordError");
        String nameError = (String) session.getAttribute("nameError");
        String phoneError = (String) session.getAttribute("phoneError");
    %>
    <table>
        <tr><td><h1>Register</h1></td> <td><%=(existError != null ? existError : "")%> </td></tr>
    </table>
    <form action="registeraction.jsp" method="post">
        <table>
            <tr><td>Full Name</td><td><input size="32"type="text" name="name" required></td><td><%=(nameError != null ? nameError : "")%></td></tr>
            <tr><td>Email</td><td><input size="32" type="text" name="email" required></td><td><%=(emailError != null ? emailError : "")%></td></tr>
            <tr><td>Password</td><td><input size="32" type="password" name="password" required></td><td><%=(passwordError != null ? passwordError : "")%></td></tr>
            <tr><td>Phone Number</td><td><input size="16" type="text" name="phone" required></td><td><%=(phoneError != null ? phoneError : "")%></td></tr>
            <tr><td>Address</td><td><input size="64" type="text" name="address" required></td></tr>
            <tr><td></td><td><input type="submit" value="Register"> </td></tr>
        </table>
    </form>
    <%
        if (request.getParameter("submitted") != null) {
            existError = emailError = passwordError = nameError = phoneError = null;
        }
        session.invalidate();
    %>
    <p>Already have an account? Click <a href="login.jsp">here</a>.</p>
</body>
</html>