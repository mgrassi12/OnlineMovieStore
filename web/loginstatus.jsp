<%@page language="java" import="oms.user.User" contentType="text/html" pageEncoding="UTF-8"%>

<%-- Gets user --%>
<%-- If user exists in session, show user is logged in --%>
<%-- If user does not exist in session, show you are not logged in--%>
<%
    String log;
    String msg;
    User user = (User) session.getAttribute("user");

    if (user != null) {
        log = user.getName() + " &lt " + user.getEmail() + " &gt";
        msg = "You are logged in as " + log + ".";
    } else {
        log = "";
        msg = "You are not logged in.";
    }
%>

<%-- If user exists in session, display Logout and Account buttons--%>
<%-- If user does not exist in session, display Register and Login buttons --%>
<div style="color: black; background: #eee; border: solid 1px #333; text-align: right; width: 100%;"><%=msg%></div>
<% if (user != null) { %>
<div style="text-align: right;"><a href="logout.jsp">Logout</a> or view your <a href="accountmain.jsp">Account</a>.</div>
<% } else { %>
<div style="text-align: right;"><a href="cartclearaction.jsp?previouspage=register.jsp">Register</a> or <a href="cartclearaction.jsp?previouspage=login.jsp">Login</a> if you already have an account.</div>
<% }%>