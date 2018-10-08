<%@page language="java" import="oms.user.User" contentType="text/html" pageEncoding="UTF-8"%>

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


<div style="color: black; background: #eee; border: solid 1px #333; text-align: right; width: 100%;"><%=msg%></div>
<% if (user != null) { %>
<div style="text-align: right;"><a href="logout.jsp">Logout</a> or view your <a href="main.jsp">Account</a>.</div>
<% } else { %>
<div style="text-align: right;"><a href="clearcartaction.jsp?previouspage=register.jsp">Register</a> or <a href="clearcartaction.jsp?previouspage=login.jsp">Login</a> if you already have an account.</div>
<% }%>