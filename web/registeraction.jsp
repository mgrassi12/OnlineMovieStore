<%@page import="oms.user.User"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Saving User</title>
    </head>
    <body>
        <%
               String name = request.getParameter("name");
               String email = request.getParameter("email");
               String password = request.getParameter("password");
               String phone = request.getParameter("phone");
               String address = request.getParameter("address");
               User user = new User(name,email,password,phone,address);
               session.setAttribute("user", user);
               response.sendRedirect("main.jsp");
        %>
    </body>
</html>
