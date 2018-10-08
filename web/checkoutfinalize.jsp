<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="oms.user.User"%>
<!DOCTYPE html>
<html>
    <head class = "header">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Finalize Order</title>
        <link rel="stylesheet" type="text/css" href="blockbuster.css">
    <img src="blockbusterlogo.png" alt="Blockbuster Logo" class="logo">
</head>

<body class = "body">
    <jsp:include page="loginstatus.jsp"/>
    <%  
        User user = (User) session.getAttribute("user");
        String email = new String();
        String name = new String();
        
        if(user != null){
            email = user.getEmail();
            name = user.getName();
        } else {
            email = "";
            name = "";
        }
    %>
    <table>
        <tr><td><h1>Confirm your order details</h1></td></tr>
    </table>
    <form action="checkoutaction.jsp" method="POST">
        <table>
            <tr><td>Email</td><td><input type="text" name="email" value="<%= email %>" </td></tr>
            <tr><td>Full Name</td><td><input type="text" name="name" value="<%= name %>" </td></tr>
            <tr><td>Payment Method</td><td><select name="paymentmethod">
               <option value="Credit Card">Credit Card</option>
               <option value="PayPal">PayPal</option>
            <tr><td></td><td><input type="submit" value="Place Order"></td></tr>
        </table>
    </form>
</body>
</html>