<%@page language="java" import="oms.user.User" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="oms.movie.Movie"%>
<%@page import="oms.validator.*"%>

<!DOCTYPE html>
<html>
    <head class = "header">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
        <link rel="stylesheet" type="text/css" href="blockbuster.css">
    <img src="blockbusterlogo.png" alt="Blockbuster Logo" class="logo">
</head>

<%
    User user = (User) session.getAttribute("user");
%>

<body class = "body">
    <h1>Movie Inventory</h1>
    <jsp:include page="loginstatus.jsp"/>
    <% ArrayList<Movie> cart = (ArrayList<Movie>) session.getAttribute("cart");
        if ((cart != null) || (user != null)) { %>
    <a href="checkout.jsp"> View cart </a>
    <%}%>

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

                <%
                    String searchparam = request.getParameter("searchparam");
                    String search = request.getParameter("search");
                    session.setAttribute("searchparam", searchparam);
                    session.setAttribute("search", search);

                    if (search != null && !search.isEmpty()) {%>
                <br>
                <h2> You searched for <%=searchparam%>: "<%=search%>" </h2>
                <p></p>
                <jsp:include page="results.jsp"/>
                <% }%>
            </td>
            <tr></tr>
        </table>
    </div>
</body>
</html>