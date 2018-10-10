<%@page contentType="text/html" pageEncoding="UTF-8" import="oms.user.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="oms.movie.*"%>
<!DOCTYPE html>
<html>
    <head class = "header">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clearing cart</title>
        <link rel="stylesheet" type="text/css" href="blockbuster.css">
    <img src="blockbusterlogo.png" alt="Blockbuster Logo" class="logo">
</head>

<body class = "body">
    <%-- JavaBean --%>
    <% String filePath = application.getRealPath("WEB-INF/movies.xml");%>
    <jsp:useBean id="movieApp" class="oms.movie.MovieApplication" scope="application">
        <jsp:setProperty name="movieApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>

    <%-- Removes all movies from the cart and increases their availability counters. --%>
    <%
        ArrayList<Movie> cart_movies = new ArrayList<Movie>();
        Movies all_movies = movieApp.getMovies();
        ArrayList<Movie> cart = (ArrayList<Movie>) session.getAttribute("cart");
        String previouspage = request.getParameter("previouspage");
        User user = (User) session.getAttribute("user");

        // If there is no user logged in or no anonymous cart active, redirect
        // the user to the previous page. Otherwise, remove all movies in the 
        // cart. 
        if ((user != null) || (cart != null)) {
            if (user != null) {
                cart_movies = (ArrayList) user.getMovies().clone();
                user.clearCart();
            } else {
                cart_movies = (ArrayList) cart.clone();
                cart.clear();
                session.setAttribute("cart", cart);
            }

            // For all the movies removed from the cart: remove them from 
            // movieApp, raise their availability counter, and parse them back 
            // into movieApp to update the XML. 
            for (Movie movie : cart_movies) {
                all_movies.removeMovie(movie);
                movie.setAvailablecopies(movie.getAvailablecopies() + 1);
            }

            for (Movie movie : cart_movies) {
                if ((all_movies.getList().contains(movie)) == false) {
                    all_movies.addMovie(movie);
                }
            }

            movieApp.setMovies(all_movies);
        }

        response.sendRedirect(previouspage);
    %>
</body>
</html>