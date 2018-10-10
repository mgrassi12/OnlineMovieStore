<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head class = "header">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="blockbuster.css">
    <img src="blockbusterlogo.png" alt="Blockbuster Logo" class="logo">
</head>

<body class = "body">

    <%  //Sets the errors to the session attributes defined in loginaction.jsp
        String existError = (String) session.getAttribute("existError");
        String emailError = (String) session.getAttribute("emailError");
        String passwordError = (String) session.getAttribute("passwordError");
    %>
    <h1>Login</h1>
    <p class="aligncenter"></p>
    <jsp:include page="loginstatus.jsp"/>
    <!-- A form where users input their login information to login -->
    <form action="loginaction.jsp" method="POST">
        <table>
            <tr><td>Email</td><td><input type="text" name="email" required</td><td></td></tr>
            <tr><td>Password</td><td><input type="password" name="password" required </td><td></td></tr>
            <tr><td></td><td><input type="submit" value="Login"></td></tr>
        </table>
    </form>
    <% 
        if (request.getParameter("submitted") != null) {
            existError = emailError = passwordError = null;
        }
        session.invalidate();
    %>
    <!-- Displays the error messages if there are any -->
    <br>
    <%=(existError != null ? existError : "")%>
    <%=(emailError != null ? emailError : "")%>
    <%=(passwordError != null ? passwordError : "")%>
    <br>
    <p>Don't have an account? Click <a href="register.jsp">here</a>.</p>

</body>
</html>