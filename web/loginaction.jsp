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

    <%
        //Sets variables to be used for validation checking
        Users users = userApp.getUsers();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = users.login(email, password);
        Validator validator = new Validator();
        
        //Checks to see if the email has already been used
        if (!validator.validateEmail(email)) {
            session.setAttribute("emailError", "Incorrect email format");
            response.sendRedirect("login.jsp");
        }  //Checks to see if the password has already been used
        else if (!validator.validatePassword(password)) {
            session.setAttribute("passwordError", "Incorrect password format");
            response.sendRedirect("login.jsp");
        } //Checks to see if the user exists  
        else if (user != null) {
            session.setAttribute("user", user);
            response.sendRedirect("accountmain.jsp");
        } else {
            session.setAttribute("existError", "Email or password is incorrect");
            response.sendRedirect("login.jsp");
        }
    %>
</body>
</html>
