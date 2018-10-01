<%@page contentType="text/html" pageEncoding="UTF-8" import="oms.user.*"%>
<!DOCTYPE html>
<html>
    <head class = "header">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success!</title>
        <link rel="stylesheet" type="text/css" href="blockbuster.css">
        <img src="blockbusterlogo.png" alt="Blockbuster Logo" class="logo">
    </head>
    
    <body class = "body">
        <% String filePath = application.getRealPath("WEB-INF/users.xml"); %>
        <jsp:useBean id="movieStoreApp" class="oms.user.MovieStoreApplication" scope="application">
            <jsp:setProperty name="movieStoreApp" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>
        
        <% Users users = movieStoreApp.getUsers();
           String email = request.getParameter("email");
           String password = request.getParameter("password");
           User user = users.login(email, password); 
        
           if(user != null){
               session.setAttribute("user", user);
               response.sendRedirect("main.jsp");
            } else { %>
        <p>Password incorrect. Click <a href='login.jsp'>here</a> to try again.</p>
        <% } %>
    </body>
</html>
