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
<c:if test="${not empty errorMessage}">
    <label>${errorMessage}</label>
</c:if>
<table>
    <c:forEach items="${users}" var="user" >
        <td>${user.name}</td>
        <td>
            <form action="/users/deleteUser" method="POST">
                <input type="hidden" name="id" class="form-control" value="${user.id}"/>
                <input type="submit" class="btn btn-danger" value="Delete"/>
            </form>
        </td>
    </c:forEach>
</table>

