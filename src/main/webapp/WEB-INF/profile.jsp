<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="../WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1>Welcome to your profile, ${sessionScope.user}.</h1>
    </div>

    <form action="/login" method="POST">
        <input type="hidden" name="logout">
        <button type="submit" value="submit" class="btn btn-danger">Logout</button>
    </form>

</body>
</html>
