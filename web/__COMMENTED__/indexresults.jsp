<%@page import="oms.movie.*" import="java.util.*" import="oms.validator.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<%-- Gets real path of xml file, sets path of xsl file --%>
<% String filePath = application.getRealPath("WEB-INF/movies.xml");%>
<% String xslPath = "file:///" + application.getRealPath("xsl/movies.xsl");%>

<%-- JavaBean --%>
<jsp:useBean id="movieApp" class="oms.movie.MovieApplication" scope="application">
    <jsp:setProperty name="movieApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>

<%-- Validates input --%>
<%-- If input is not valid, return a header that displays the error --%>
<%-- If input is valid, put the matches in an ArrayList of Movie--%>
<%-- If input is valid, and no matches found, return a header that displays this --%>
<% String search = request.getParameter("search");
    String searchparam = request.getParameter("searchparam");
    Validator validator = new Validator();
    int flag = 0;
    if (searchparam.equals("Title")) {
        if (!validator.validateTitle(search)) {
%> <h2>Title format incorrect, please try again</h2> <%
            flag = 1;
        }
    }
    if (searchparam.equals("Genre")) {
        if (!validator.validateGenre(search)) {
%> <h2>Genre format incorrect, please try again</h2> <%
            flag = 1;
        }
    }
    if (searchparam.equals("Years")) {
        if (!validator.validateYear(search)) {
%> <h2>Date format incorrect, please try again</h2> <%
            flag = 1;
        }
    }
    if (flag == 0) {
        ArrayList< Movie> matches = new ArrayList<Movie>();
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

        if (matches.isEmpty()) { %>
<h2>No match found</h2>
<% } else {%>
<h3>Please select the movie you would like to add to your cart: </h3>

<%-- Generate XML file with the matched movies --%>
<c:set var = "xmltext"> 
    <movies xmlns="http://www.uts.edu.au/31284/oms"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://www.uts.edu.au/31284/oms movies.xsd">
        <% for (Movie movie : matches) { %>
        <% if (movie.getAvailablecopies() > 0) {%>
        <movie>
            <title><%= movie.getTitle()%></title>
            <genre><%= movie.getGenre()%></genre>
            <releasedate><%= movie.getReleasedate()%></releasedate>
            <price>$<%= movie.getPrice()%></price>
            <availablecopies><%= movie.getAvailablecopies()%></availablecopies>
        </movie>
        <%}%>
        <%}%>
    </movies> 
</c:set>

<%-- Transform this generated XML file with the provided XSL file --%>
<c:import url = "<%= xslPath%>" var = "xslt"/>
<x:transform xml = "${xmltext}" xslt = "${xslt}"></x:transform>   <%}
    }%>