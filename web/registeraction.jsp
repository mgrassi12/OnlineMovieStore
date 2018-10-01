<%@page import="oms.user.Users"%>
<%@page import="oms.user.User"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Saving User</title>
    </head>
    <body>
        <% String filePath = application.getRealPath("WEB-INF/users.xml"); %>
        <jsp:useBean id="movieStoreApp" class="oms.user.MovieStoreApplication" scope="application">
            <jsp:setProperty name="movieStoreApp" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>
        
        <%
            Users users = movieStoreApp.getUsers();
            if (users.checkEmail(request.getParameter("email")) == null) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String phone = request.getParameter("phone");
                String address = request.getParameter("address");
                User user = new User(name,email,password,phone,address);
                users.addUser(user);
                movieStoreApp.setUsers(users);
                session.setAttribute("user", user);
                response.sendRedirect("main.jsp");
            } else { %>
                <p>That email is already in use. <a href="register.jsp">Please try a different one</a>.</p>
         <% } %>
    </body>
</html>
