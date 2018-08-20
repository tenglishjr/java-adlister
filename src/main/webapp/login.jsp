<%@ page import="java.io.IOException" %><%--
  Created by IntelliJ IDEA.
  User: tenglishjr
  Date: 8/20/18
  Time: 12:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    try {
        if (request.getParameter("username").equals("admin") && request.getParameter("password").equals("password")) {
            response.sendRedirect("profile.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>


<html>
<head>
    <title>Login</title>
    <%@ include file="partials/stylesheets.html" %>
</head>
<body>
    <%@ include file="partials/navbar.html" %>

    <h1>Login</h1>

    <form action="login.jsp" method="POST">
        <label for="username">Username:  </label>
        <input type="text" placeholder="example: billybob123" id="username" name="username">
        <br>
        <label for="password">Password:  </label>
        <input type="password" id="password" name="password">
        <button type="submit" value="submit">Submit</button>
    </form>

    <br><br>
    <h6>User Logged In: ${param.username}</h6>

    <%@ include file="partials/scripts.html" %>
</body>
</html>
