<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: info
  Date: 16.08.2017
  Time: 09:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${not empty message}">
    <label>${message}</label><br>
</c:if>
<form:form modelAttribute="user" action="/users/updateUser" method="POST">
    <label>ID:${user.id}</label><input type="hidden" name="id" value="${user.id}"/>
    <label>Username:</label><input  name="name" class="form-control" value="${user.name}"/>
    <label>Password:</label><input name="password" class="form-control" value="${user.password}"/>
    <label>Email:</label><input name="email" value="${user.email}"/>
    <label>Type:</label><br>
    <input type="radio" name="type" value="ADMIN"> Administrator<br>
    <input type="radio" name="type" value="NORMAL" checked> User<br>
    <input type="submit" class="btn btn-default" value="Save"/><br>
</form:form>
</body>
</html>
