<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="oms.user.User"%>

<!DOCTYPE html>
<html>
    <head class = "header">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Account Information</title>
        <link rel="stylesheet" type="text/css" href="blockbuster.css">
        <img src="blockbusterlogo.png" alt="Blockbuster Logo" class="logo">
    </head>
    
    <%-- Gets user from session --%>
    <body class = "body">
        <%
            User user = (User) session.getAttribute("user");
        %>

        <h1>Update Account Information</h1>
        <%-- Include the login status --%>
        <jsp:include page="loginstatus.jsp"/>
        
        <%-- Start of form for user to edit their details--%>
        <form action="accounteditaction.jsp" method="POST">

            <table>
                <tr><td>Name</td><td><input type="text" value="<%= user.getName()%>" name="name"></td></tr>
                <tr><td>Email</td><td><input type="text" value="<%= user.getEmail()%>" name="email"><input type="hidden" id="oldemail" name="oldemail" value="<%= user.getEmail()%>"></td></tr>
                <tr><td>Password</td><td><input type="password" value="<%= user.getPassword()%>" name="password"></td></tr>
                <tr><td>Phone</td><td><input type="text" value="<%= user.getPhone()%>" name="phone"></td></tr>
                <tr><td>Address</td><td><input type="text" value="<%= user.getAddress()%>" name="address"></td></tr>
                <tr><td></td><td><input type="submit" value="Save"></td></tr>
            </table>
        
        <%-- After the save button is pressed, if there is a value in the email field, display details updated. --%>
        <%
            if (request.getParameter("email") != null) {
        %>
        <p>Details updated.</p>
        <%
            }
        %>
        </form>    
        <%-- Links to main account page and delete page --%>
        <p>Click <a href="accountmain.jsp">here</a> to return to the Main Account Page</a>.</p>
        <p>Click <a href="accountdeleteaction.jsp">here</a> if you would like to delete your account.</p>
    </body>
</html>
