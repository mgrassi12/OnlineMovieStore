<%@page import="oms.user.User"%>
<%@page import="oms.user.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deleting User</title>
    </head>
    <body>
        <% String filePath = application.getRealPath("WEB-INF/users.xml"); %>
        <jsp:useBean id="movieStoreApp" class="oms.user.MovieStoreApplication" scope="application">
            <jsp:setProperty name="movieStoreApp" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>
        
        <%
            User user = (User) session.getAttribute("user");
            String email = user.getEmail();
            Users users = movieStoreApp.getUsers();
            session.invalidate();
            users.removeUser(user);
            movieStoreApp.setUsers(users);
            response.sendRedirect("cancelallordersaction.jsp?email=" + email);
        %>
    </body>
</html>
