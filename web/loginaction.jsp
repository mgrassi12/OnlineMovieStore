<%@page contentType="text/html" pageEncoding="UTF-8" import="oms.user.*"%>
<%@page import="oms.validator.*"%>
<!DOCTYPE html>
<html>
    <head class = "header">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success!</title>
        <link rel="stylesheet" type="text/css" href="blockbuster.css">
    <img src="blockbusterlogo.png" alt="Blockbuster Logo" class="logo">
</head>

<body class = "body">
    <% String filePath = application.getRealPath("WEB-INF/users.xml");%>
    <jsp:useBean id="userApp" class="oms.user.UserApplication" scope="application">
        <jsp:setProperty name="userApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>

    <% Users users = userApp.getUsers();

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = users.login(email, password);
        Validator validator = new Validator();

        if (!validator.validateEmail(email)) {
            session.setAttribute("emailError", "Incorrect email format");
            response.sendRedirect("login.jsp");
        } else if (!validator.validatePassword(password)) {
            session.setAttribute("passwordError", "Incorrect password format");
            response.sendRedirect("login.jsp");
        } else if (user != null) {
            session.setAttribute("user", user);
            response.sendRedirect("accountmain.jsp");
        } else {
            session.setAttribute("existError", "User does not exist!");
            response.sendRedirect("login.jsp");
        }
    %>
</body>
</html>
