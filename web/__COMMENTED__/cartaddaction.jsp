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
    
    <%-- JavaBean --%>
    <% String filePath = application.getRealPath("WEB-INF/movies.xml");%>
    <jsp:useBean id="movieApp" class="oms.movie.MovieApplication" scope="application">
        <jsp:setProperty name="movieApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
    
    <%-- If user exists in session, add the movie to the user's cart --%>
    <%-- If user does not exist in session, create a new cart, and add the movie to the cart --%>
    <%-- Update available copies --%>
    <% 
       Movie movie = new Movie();
       User user = (User) session.getAttribute("user");
       String selectedmovie = request.getParameter("selectedmovie");
       Movies movies = movieApp.getMovies();
       movie = movies.getTitleMatches(selectedmovie).get(0);
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
       movies.removeMovie(movie);
       movie.setAvailablecopies(movie.getAvailablecopies()-1);
       movies.addMovie(movie);
       movieApp.setMovies(movies);
       response.sendRedirect("cart.jsp");
    %>
</body>
</html>