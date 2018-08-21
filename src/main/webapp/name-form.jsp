<%--
  Created by IntelliJ IDEA.
  User: tenglishjr
  Date: 8/21/18
  Time: 9:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Name Form</title>
</head>
<body>

    <h2>Name Form</h2>

    <form action="/name" method="POST">
        <label for="name">Name: </label>
        <input type="text" name="name" id="name" placeholder="Enter name">
        <button type="submit" value="submit">Submit</button>
    </form>

</body>
</html>
