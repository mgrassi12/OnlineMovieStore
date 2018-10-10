<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="oms.user.User"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Updating account</title>
    </head>
    <body>
        
        <%-- Update user, redirect to ordersupdateaction --%>
        <%
            User user = (User) session.getAttribute("user");
            if (request.getParameter("email") != null) {
                 user.updateUser(request.getParameter("name"), request.getParameter("email"),
                    request.getParameter("password"), request.getParameter("phone"), request.getParameter("address"));
            }
            session.setAttribute("oldemail", request.getParameter("oldemail"));
            session.setAttribute("newemail", request.getParameter("email"));
            response.sendRedirect("ordersupdateaction.jsp");
        %>
    </body>
</html>
