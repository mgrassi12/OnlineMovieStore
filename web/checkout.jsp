<%@page language="java" import="oms.user.User" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="oms.movie.Movie"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<!DOCTYPE html>
<html>
    <head class = "header">
        <% String filePath = application.getRealPath("WEB-INF/movies.xml");%>
        <% String xslPath = "file:///" + application.getRealPath("xsl/moviescart.xsl");%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <link rel="stylesheet" type="text/css" href="blockbuster.css">
    <img src="blockbusterlogo.png" alt="Blockbuster Logo" class="logo">
</head>

<%
    String log;
    String msg;
    ArrayList<Movie> cart = new ArrayList<Movie>();
    User user = (User) session.getAttribute("user");

    if (user != null) {
        log = user.getName() + " &lt " + user.getEmail() + " &gt";
        msg = "You are logged in as " + log + ".";
        cart = user.getMovies();
    } else {
        log = "";
        msg = "You are not logged in.";
        cart = (ArrayList<Movie>) session.getAttribute("cart");
    }
    
    Set<Movie> cartwithoutduplicates = new HashSet<Movie>(cart);
%>

<body class = "body">
    <h1>Your checkout cart</h1>
    <div style="color: black; background: #eee; border: solid 1px #333; text-align: right; width: 100%;"><%=msg%></div>
    <% if (user != null) { %>
    <div style="text-align: right;"><a href="logout.jsp">Logout</a> or view your <a href="main.jsp">Account</a>.</div>
    <% } else { %>
    <div style="text-align: right;"><a href="register.jsp">Register</a> or <a href="login.jsp">Login</a> if you already have an account.</div>
    <% } %>
        
    <c:set var = "xmltext"> 
        <movies xmlns="http://www.uts.edu.au/31284/oms"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xsi:schemaLocation="http://www.uts.edu.au/31284/oms moviescart.xsd">
            <% for (Movie movie : cartwithoutduplicates) {%>
            <movie>
                <title><%= movie.getTitle()%></title>
                <genre><%= movie.getGenre()%></genre>
                <releasedate><%= movie.getReleasedate()%></releasedate>
                <price>$<%= movie.getPrice()%></price>
                <quantity><%= Collections.frequency(cart, movie) %> reserved / <%= movie.getAvailablecopies() %> more available </quantity>
            </movie>
            <%}%>
        </movies>
    </c:set>

    <c:import url = "<%= xslPath%>" var = "xslt"/>
    <x:transform xml = "${xmltext}" xslt = "${xslt}"></x:transform>
    <p><a href="clearcartaction.jsp?previouspage=checkout.jsp">Clear cart</a><br>
       <a href="index.jsp">Continue shopping</a><br>
       <a href="checkoutaction.jsp">Finalize order</a></p>
    </body>
</html>