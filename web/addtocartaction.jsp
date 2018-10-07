<%@page contentType="text/html" pageEncoding="UTF-8" import="oms.user.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="oms.movie.*"%>
<!DOCTYPE html>
<html>
    <head class = "header">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adding movie to cart</title>
        <link rel="stylesheet" type="text/css" href="blockbuster.css">
    <img src="blockbusterlogo.png" alt="Blockbuster Logo" class="logo">
</head>

<body class = "body">
    <% String filePath = application.getRealPath("WEB-INF/users.xml");%>
    <jsp:useBean id="movieStoreApp" class="oms.user.MovieStoreApplication" scope="application">
        <jsp:setProperty name="movieStoreApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
    <% String filePath2 = application.getRealPath("WEB-INF/movies.xml");%>
    <jsp:useBean id="movieInventoryApp" class="oms.movie.MovieInventoryApplication" scope="application">
        <jsp:setProperty name="movieInventoryApp" property="filePath" value="<%=filePath2%>"/>
    </jsp:useBean>
    <% 
       User user = (User) session.getAttribute("user");
       String selectedmovie = request.getParameter("selectedmovie");
       Movies movies = movieInventoryApp.getMovies();
       Movie movie = movies.getTitleMatches(selectedmovie).get(0);
       if(user != null){
           user.addToCart(movie);
       } else {
           ArrayList<Movie> cart = (ArrayList<Movie>) session.getAttribute("cart");
           if(cart == null){
               cart = new ArrayList<Movie>();
           }
           cart.add(movie);
           session.setAttribute("cart", cart);
       }
       response.sendRedirect("checkout.jsp");
    %>
</body>
</html>