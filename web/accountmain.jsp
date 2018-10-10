<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="oms.user.User"%>
<%@page import="oms.order.*" import="java.util.*" %>
<%@page import="oms.movie.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<%-- Gets real path of xml file, sets path of xsl file --%>
<% String filePath = application.getRealPath("WEB-INF/history.xml");%>
<% String xslPath = "file:///" + application.getRealPath("xsl/main.xsl");%>

<%-- JavaBean --%>
<jsp:useBean id="orderApp" class="oms.order.OrderApplication" scope="application">
    <jsp:setProperty name="orderApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>

<!DOCTYPE html>
<html>
    <head class = "header">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main</title>
        <link rel="stylesheet" type="text/css" href="blockbuster.css">
    <img src="blockbusterlogo.png" alt="Blockbuster Logo" class="logo">

</head>

<body class = "body">

    <%-- If user does not exist in session, redirect to login page --%>
    <%
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
        }
    %>

    <h1>Main page</h1>

    <%-- Include the login status --%>
    <jsp:include page="loginstatus.jsp"/>

    <%-- Shows welcome message, provides links to edit account and view OMS movie inventory --%>
    <h2>Welcome, <%=user.getName()%></h2>
    <p>Click <a href="accountedit.jsp">here</a> to edit your account.<br></br>
        Click <a href="index.jsp">here</a> to view the movie inventory.</p>

    <%-- Gets the user's orders and puts them in an ArrayList of Order --%>
    <%
        Orders orders = orderApp.getOrders();
        ArrayList<Order> user_orders = orders.checkEmail(user.getEmail());
    %>

    <%-- Generates XML file with the user's orders --%>
    <c:set var = "xmltext"> 
    <history xmlns="http://www.uts.edu.au/31284/oms"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             xsi:schemaLocation="http://www.uts.edu.au/31284/oms history.xsd">
        <% for (Order order : user_orders) {%>
        <order>
            <id><%= order.getId()%></id>
                <% for (Movie movie : order.getMovies()) {%>
            <movie>
                <title><%= movie.getTitle()%></title>
                <genre><%= movie.getGenre()%></genre>
                <releasedate><%= movie.getReleasedate()%></releasedate>
                <price>$<%= movie.getPrice()%></price>
                <purchased><%= movie.getPurchased()%></purchased>
            </movie>
            <%}%>
            <name><%= order.getName()%></name>
            <email><%= order.getEmail()%></email>
            <paymentmethod><%= order.getPaymentmethod()%></paymentmethod>
            <saletotal><%= order.getSaletotal()%></saletotal>
            <status><%= order.getStatus()%></status>
        </order>
        <% }%>
    </history>
</c:set>

<%-- Transform this generated XML file with the provided XSL file --%>
<c:import url = "<%= xslPath%>" var = "xslt"/>
<x:transform xml = "${xmltext}" xslt = "${xslt}"></x:transform>
</body>
</html>
