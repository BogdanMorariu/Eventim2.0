<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: info
  Date: 10.08.2017
  Time: 09:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class="table-bordered table-responsive">
    <c:forEach items="${users}" var="user">
        <tr>
            <form action="/users/updateUser" method="POST">
                <label>ID:${user.id}</label><input type="hidden" name="id" value="${user.id}"/>
                <label>Username:</label><input  name="name" class="form-control" value="${user.name}"/>
                <label>Password:</label><input name="password" class="form-control" value="${user.password}"/>
                <label>Email:</label><input name="email" value="${user.email}"/>
                <label>Type:</label><br>
                <input type="radio" name="type" value="a"> Administrator<br>
                <input type="radio" name="type" value="n" checked> User<br>
                <input type="hidden" name="tickets" value="${user.tickets}"/>
                <input type="submit" class="btn btn-default" value="Save"/><br>
            </form>
        </tr>
    </c:forEach>
</table>
