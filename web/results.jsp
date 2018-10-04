<%@page import="oms.movie.*" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<% String filePath = application.getRealPath("WEB-INF/movies.xml");%>
<% String xslPath = "file:///" + application.getRealPath("xsl/movies.xsl");%>

<jsp:useBean id="movieApp" class="oms.movie.MovieInventoryApplication" scope="application">
    <jsp:setProperty name="movieApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>

<%
    ArrayList<Movie> matches = new ArrayList<Movie>();
    Movies movies = movieApp.getMovies();
    if (request.getParameter("search").equals("showall")) {
        matches = movies.getList();
    } else if (request.getParameter("searchparam").equals("Title")) {
        matches = movies.getTitleMatches(request.getParameter("search"));
    } else if (request.getParameter("searchparam").equals("Genre")) {
        matches = movies.getGenreMatches(request.getParameter("search"));
    } else if (request.getParameter("searchparam").equals("Years")) {
        matches = movies.getDateMatches(request.getParameter("search"));
    }
%>

<%
    if (matches.isEmpty()) { %>
        <h2>No match found</h2>
  <%} else {%>
        <h3>Please select the movie you would like to add to your checkout cart: </h3>

<c:set var = "xmltext"> 
    <movies xmlns="http://www.uts.edu.au/31284/oms"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://www.uts.edu.au/31284/oms movies.xsd">
        <% for (Movie movie : matches) {%>
        <movie>
            <title><%= movie.getTitle()%></title>
            <genre><%= movie.getGenre()%></genre>
            <releasedate><%= movie.getReleasedate()%></releasedate>
            <price>$<%= movie.getPrice()%></price>
            <availablecopies><%= movie.getAvailablecopies()%></availablecopies>
        </movie>
        <%}%>
    </movies>
</c:set>

<c:import url = "<%= xslPath%>" var = "xslt"/>
<x:transform xml = "${xmltext}" xslt = "${xslt}"></x:transform>   <%}%>