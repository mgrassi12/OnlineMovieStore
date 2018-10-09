<%@page language="java" import="java.util.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="oms.order.Order"%>
<%@page import="oms.order.Orders"%>

<!DOCTYPE html>
<html>
    <head class = "header">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All orders updated</title>
        <link rel="stylesheet" type="text/css" href="blockbuster.css">
    <img src="blockbusterlogo.png" alt="Blockbuster Logo" class="logo">
</head>

<body class = "body">
    <% String filePath = application.getRealPath("WEB-INF/history.xml");%>
    <jsp:useBean id="orderApp" class="oms.order.OrderApplication" scope="application">
        <jsp:setProperty name="orderApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
    <% 
        Orders orders = orderApp.getOrders();
        String oldemail = (String) session.getAttribute("oldemail");
        String newemail = (String) session.getAttribute("newemail");
        ArrayList<Order> userorders = orders.checkEmail(oldemail);
        for (Order order : userorders){
            orders.removeOrder(order);
            order.setEmail(newemail);        
            orders.addOrder(order);
            orderApp.setOrders(orders);
        }
        response.sendRedirect("accountedit.jsp?email="+newemail);
    %>
</body>
</html>