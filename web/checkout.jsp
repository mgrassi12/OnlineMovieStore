<%-- 
    Document   : checkout
    Created on : 05/10/2018, 10:57:06 AM
    Author     : Domenic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String selectedmovie = request.getParameter("selectedmovie"); %>
        <h1>Hello World!</h1>
        <p>Selected movie: <%=selectedmovie%> </p>        
    </body>
</html>
