<%@page contentType="text/html" pageEncoding="UTF-8" import="oms.user.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="oms.movie.*"%>
<!DOCTYPE html>
<html>
    <head class = "header">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clearing cart after successful order</title>
        <link rel="stylesheet" type="text/css" href="blockbuster.css">
    <img src="blockbusterlogo.png" alt="Blockbuster Logo" class="logo">
</head>

<body class = "body">
    <% String filePath = application.getRealPath("WEB-INF/movies.xml");%>
    <jsp:useBean id="movieApp" class="oms.movie.MovieApplication" scope="application">
        <jsp:setProperty name="movieApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
    <% 
       ArrayList<Movie> cart_movies = new ArrayList<Movie>();
       ArrayList<Movie> cart = (ArrayList<Movie>) session.getAttribute("cart");
       User user = (User) session.getAttribute("user");
       
       if(user != null){
            cart_movies = (ArrayList) user.getMovies().clone();
            user.clearCart();
        } else {
            cart_movies = (ArrayList) cart.clone();
            cart.clear();
            session.setAttribute("cart", cart);
        }
       
       response.sendRedirect("orderview.jsp");
    %>
</body>
</html>