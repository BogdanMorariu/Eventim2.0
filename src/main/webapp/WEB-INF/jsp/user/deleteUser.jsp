<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: info
  Date: 10.08.2017
  Time: 09:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table>
    <c:forEach items="${users}" var="user">
        <tr>
            <td>${user.name}</td>
            <td><button class="btn-danger">Delete</button></td>
        </tr>
    </c:forEach>
</table>

