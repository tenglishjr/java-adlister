<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tenglishjr
  Date: 8/24/18
  Time: 11:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Register | Adlister</title>
        <jsp:include page="/WEB-INF/partials/head.jsp">
            <jsp:param name="title" value="Your Profile" />
        </jsp:include>
    </head>
    <body>
        <jsp:include page="/WEB-INF/partials/navbar.jsp" />

        <div class="container">
            <h1 class="display-1">Register</h1>
            <c:if test="${error != null}">
                <div class="alert alert-warning" role="alert">${error}</div>
            </c:if>
            <form class="w-80" action="/register" method="POST">
                <div class="form-group w-40">
                    <label for="username">Username</label>
                    <input type="text" class="form-control" id="username" aria-describedby="emailHelp" placeholder="Enter username" name="username" value="${sessionScope.username}">
                </div>
                <c:if test="${userExists != null}">
                    <div class="alert alert-danger" role="alert">${userExists}</div>
                </c:if>
                <div class="form-group w-40">
                    <label for="email">Email address</label>
                    <input type="text" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email" name="email" value="${sessionScope.email}">
                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                    <c:if test="${emailError != null}">
                        <div class="alert alert-danger" role="alert">${emailError}</div>
                    </c:if>
                </div>
                <div class="form-group w-40">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" placeholder="Password" name="password" value="${sessionScope.password}">
                </div>
                <div class="form-group w-40">
                    <label for="confirm">Confirm Password</label>
                    <input type="password" class="form-control" id="confirm" placeholder="Password" name="confirm">
                </div>
                <c:if test="${passError != null}">
                    <div class="alert alert-danger" role="alert">${passError}</div>
                </c:if>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </body>
</html>
