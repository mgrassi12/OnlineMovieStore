<%@page language="java" import="oms.user.User" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="oms.movie.Movie"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<!DOCTYPE html>
<html>
    <head class = "header">
        
        <%-- Gets real path of xml file, sets path of xsl file --%>
        <% String filePath = application.getRealPath("WEB-INF/movies.xml");%>
        <% String xslPath = "file:///" + application.getRealPath("xsl/moviescart.xsl");%>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <link rel="stylesheet" type="text/css" href="blockbuster.css">
    <img src="blockbusterlogo.png" alt="Blockbuster Logo" class="logo">
</head>

<%-- If user exists in session, make the cart equal to the movies associated with the user --%>
<%-- If user does not exist in session, make the cart equal to the cart in the session --%>
<%-- Creates two carts - cart without duplicates, and normal cart --%>
<%
    ArrayList<Movie> cart = new ArrayList<Movie>();
    User user = (User) session.getAttribute("user");

    if (user != null) {
        cart = user.getMovies();
    } else {
        cart = (ArrayList<Movie>) session.getAttribute("cart");
    }
    
    Set<Movie> cartwithoutduplicates = new HashSet<Movie>(cart);
    session.setAttribute("orderwithoutduplicates", cartwithoutduplicates);
    session.setAttribute("order", cart);
%>

<body class = "body">
    <h1>Your checkout cart</h1>
    
    <%-- Include the login status --%>
    <jsp:include page="loginstatus.jsp"/>
    
    <%-- Generate a XML file containing every movie in the cart without duplicates --%>
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

    <%-- Transform this generated XML file with the provided XSL file --%>
    <c:import url = "<%= xslPath%>" var = "xslt"/>
    <x:transform xml = "${xmltext}" xslt = "${xslt}"></x:transform>
    
    <%-- If the cart without duplicates contains a movie, show clear cart and finalise order buttons --%>
    <%-- If the cart without duplicates does not contain a movie, show continue shopping button --%>
    <p><% if(cartwithoutduplicates.size() > 0){ %>
        <a href="cartclearaction.jsp?previouspage=cart.jsp">Clear cart</a><br>
       <a href="cartcheckout.jsp">Finalize order</a><% } %><br>
       <a href="index.jsp">Continue shopping</a></p>
    </body>
</html>