<%--
  Created by IntelliJ IDEA.
  User: tenglishjr
  Date: 8/22/18
  Time: 10:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ads</title>
    <jsp:include page="../partials/head.jsp" />
</head>
<body>
<jsp:include page="../partials/navbar.jsp" />
<h1>Ads List</h1>
<c:forEach items="${adsListed}" var="ad">
    <h3>${ad.title}</h3>
    <p>${ad.description}</p>
    <br>
</c:forEach>

</body>
</html>
