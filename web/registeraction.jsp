<%@page import="oms.user.*"%>
<%@page import="oms.validator.*"%>

<html>
    <head class = "head">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Saving User</title>
        <link rel="stylesheet" type="text/css" href="blockbuster.css">
    <img src="blockbusterlogo.png" alt="Blockbuster Logo" class="logo">
</head>

<body class = "body">
    <% String filePath = application.getRealPath("WEB-INF/users.xml");%>
    <jsp:useBean id="userApp" class="oms.user.UserApplication" scope="application">
        <jsp:setProperty name="userApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>

    <%
        Users users = userApp.getUsers();
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        User user = new User(name, email, password, phone, address);
        Validator validator = new Validator();

        if (users.checkEmail("email") != null) {
            response.sendRedirect("register.jsp");
            session.setAttribute("existError", "User is already registered!");
        } else {
            if (!validator.validateName(name)) {
                session.setAttribute("nameError", "Incorrect name format");
                response.sendRedirect("register.jsp");
            } else if (!validator.validateEmail(email)) {
                session.setAttribute("emailError", "Incorrect email format");
                response.sendRedirect("register.jsp");
            } else if (!validator.validatePassword(password)) {
                session.setAttribute("passwordError", "Incorrect password format");
                response.sendRedirect("register.jsp");
            } else if (!validator.validatePhone(phone)) {
                session.setAttribute("phoneError", "Incorrect phone format");
                response.sendRedirect("register.jsp");
            } else {
                users.addUser(user);
                session.setAttribute("user", user);
                userApp.setUsers(users);
                response.sendRedirect("accountmain.jsp");
            }
        }%>
</body>
</html>
