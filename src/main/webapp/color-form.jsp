<%--
  Created by IntelliJ IDEA.
  User: tenglishjr
  Date: 8/21/18
  Time: 10:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Color Form</title>
</head>
<body>

    <h1>Favorite Color Form</h1>

    <form action="/pickcolor" method="POST">
        <label for="color">Enter your favorite color: </label>
        <input type="text" name="color" id="color" placeholder="Color:">
        <button type="submit" value=""submit>Submit</button>
    </form>

</body>
</html>
