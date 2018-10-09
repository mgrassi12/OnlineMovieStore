<%@page import="oms.order.Order"%>
<%@page import="oms.movie.Movie"%>
<%@page language="java" import="java.util.*" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="oms.order.Orders"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<!DOCTYPE html>
<html>
    <head class = "header">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order placed</title>
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
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String paymentmethod = request.getParameter("paymentmethod");
        ArrayList<Movie> movies = (ArrayList<Movie>) session.getAttribute("order");
        Set<Movie> movieswithoutduplicates = (Set<Movie>) session.getAttribute("orderwithoutduplicates");
        ArrayList<Movie> moviesfinalized = new ArrayList<Movie>();
        double saletotal = 0;
        Random rand = new Random();
        int id = 0;
        int sentinel = 0;
        
        for(Movie movie: movieswithoutduplicates){
            Movie moviefinalized = new Movie();
            moviefinalized.setTitle(movie.getTitle());
            moviefinalized.setGenre(movie.getGenre());
            moviefinalized.setReleasedate(movie.getReleasedate());
            moviefinalized.setPrice(movie.getPrice() * Collections.frequency(movies, movie));
            saletotal = (saletotal + moviefinalized.getPrice());
            moviefinalized.setPurchased(Collections.frequency(movies, movie));
            moviesfinalized.add(moviefinalized);
        }
        
        while(sentinel != 1){
            id = (rand.nextInt(898) + 101);
            if(orders.checkId(id) == null){
                sentinel = 1;
            }
        }
        
        Order order = new Order(id, moviesfinalized, name, email, paymentmethod, saletotal, "Submitted");
        orders.addOrder(order);
        orderApp.setOrders(orders);
        session.setAttribute("lastorderid", id);
        response.sendRedirect("ordercartclearaction.jsp");
    %>
</body>
</html>