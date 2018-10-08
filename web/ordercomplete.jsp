<%@page import="oms.order.*" import="java.util.*" %>
<%@page import="oms.movie.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<% String filePath = application.getRealPath("WEB-INF/history.xml");%>
<% String xslPath = "file:///" + application.getRealPath("xsl/history.xsl");%>

<jsp:useBean id="orderApp" class="oms.order.OrderApplication" scope="application">
    <jsp:setProperty name="orderApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>

<!DOCTYPE html>
<html>
    <head class = "header">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order complete</title>
        <link rel="stylesheet" type="text/css" href="blockbuster.css">
        <img src="blockbusterlogo.png" alt="Blockbuster Logo" class="logo">
    </head>
    
    <body class = "body">
        <jsp:include page="loginstatus.jsp"/>
        <%
            int lastorderid = (Integer) session.getAttribute("lastorderid");
            Orders orders = orderApp.getOrders();
            Order order = orders.checkId(lastorderid);            
        %>

        <c:set var = "xmltext"> 
            <history xmlns="http://www.uts.edu.au/31284/oms"
                    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                    xsi:schemaLocation="http://www.uts.edu.au/31284/oms history.xsd">
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
            </history>
        </c:set>

        <c:import url = "<%= xslPath%>" var = "xslt"/>
        <x:transform xml = "${xmltext}" xslt = "${xslt}"></x:transform>
       <a href="index.jsp">Continue shopping</a>
    </body>
</html>
