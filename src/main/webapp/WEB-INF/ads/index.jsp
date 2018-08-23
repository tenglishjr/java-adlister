<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">

    <h2 class="display-2">Here Are all the ads!</h2>


    <c:forEach var="ad" items="${ads}">
        <div class="col-sm-6">
            <h3 class="display-3">${ad.title}</h3>
            <p>${ad.description}</p>
        </div>
    </c:forEach>

</div>

</body>
</html>
