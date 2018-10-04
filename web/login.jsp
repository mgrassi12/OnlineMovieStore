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

    <%  String existErr = (String) session.getAttribute("existErr");
        String emailErr = (String) session.getAttribute("emailErr");
        String passwordErr = (String) session.getAttribute("passwordErr");
    %>
    <table>
        <tr><td><h1>Login</h1></td> <td><%=(existErr != null ? existErr : "")%> </td></tr>
    </table>
    <form action="loginaction.jsp" method="POST">
        <table>
            <tr><td>Email</td><td><input type="text" name="email" required</td><td><%=(emailErr != null ? emailErr : "")%></td></tr>
            <tr><td>Password</td><td><input type="password" name="password" required </td><td><%=(passwordErr != null ? passwordErr : "")%></td></tr>
            <tr><td></td><td><input type="submit" value="Login"></td></tr>
        </table>
    </form>
    <%
        if (request.getParameter("submitted") != null) {
            existErr = emailErr = passwordErr = null;
        }
        session.invalidate();
    %>
    <p>Don't have an account? Click <a href="register.jsp">here</a>.</p>

</body>
</html>