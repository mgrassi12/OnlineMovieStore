<%@page language="java" import="oms.user.User" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head class = "header">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
        <link rel="stylesheet" type="text/css" href="blockbuster.css">
    <img src="blockbusterlogo.png" alt="Blockbuster Logo" class="logo">
</head>

<%
    String log;
    String msg;
    User user = (User) session.getAttribute("user");

    if (user != null) {
        log = user.getName() + " &lt " + user.getEmail() + " &gt";
        msg = "You are logged in as " + log + ".";
    } else {
        log = "";
        msg = "You are not logged in.";
    }
%>

<body class = "body">
    <h1>Movie Inventory</h1>
    <div style="color: black; background: #eee; border: solid 1px #333; text-align: right; width: 100%;"><%=msg%></div>
    <% if (user != null) { %>
    <div style="text-align: right;"><a href="logout.jsp">Logout</a> or view your <a href="main.jsp">Account</a>.</div>
    <% } else { %>
    <div style="text-align: right;"><a href="register.jsp">Register</a> or <a href="login.jsp">Login</a> if you already have an account.</div>
    <% } %>

    <div>
        <table class="aligncenter">
            <td>
                <form action="index.jsp" method="post">
                    <input type="radio" name="searchparam" value="Title" checked> Title
                    <input type="radio" name="searchparam" value="Genre"> Genre
                    <input type="radio" name="searchparam" value="Years"> Years
                    <input type="text" name="search">
                    <input type="submit" value="Search">
                </form>

                <p>When searching by release years, do so in the form of (Earliest Year)-(Latest Year). For example: "1992-2007".</p>

                <%
                    String searchparam = request.getParameter("searchparam");
                    String search = request.getParameter("search");
                    session.setAttribute("searchparam", searchparam);
                    session.setAttribute("search", search);

                    if (search != null && !search.isEmpty()) {%>
                <br>
                <jsp:include page="results.jsp"/>
                <h2> You searched for <%=searchparam%>: "<%=search%>". </h2>
                <% }%>
            </td>
            <tr></tr>
        </table>
    </div>
</body>
</html>