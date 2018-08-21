<%--
  Created by IntelliJ IDEA.
  User: tenglishjr
  Date: 8/21/18
  Time: 10:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Guess Form</title>
    <style>
        .warning {
            background-color: rgba(255,190,190,1);
            color: rgba(163,0,21,0.84);
            border: 1px solid rgba(163,0,21,0.84);
            border-radius: 5px;
            padding: .5em;
            margin: 1em .5em;
            width: 230px;
        }
    </style>
</head>
<body>

    <h1>Guess Form</h1>

    <c:choose>
        <c:when test="${guess < random}">
            <div class="warning">Guess is too low. Please try again.</div>
        </c:when>
        <c:when test="${guess > random}">
            <div class="warning">Guess is too high. Please try again.</div>
        </c:when>
    </c:choose>

    <form action="/guess" method="POST">
        <label for="number">Enter a number between 1 and 100: </label>
        <input type="number" min="1" max="100" placeholder="e.g. 42" id="number" name="guess">
        <button type="submit" value="submit">Submit</button>
    </form>

</body>
</html>
