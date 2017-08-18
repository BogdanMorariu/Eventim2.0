<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: info
  Date: 18.08.2017
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table>
    <c:forEach items="${categories}" var="category">
        <tr>
            <td>${category.type}</td>
            <td>
                <a href="/event/getEventsByCategory/${category.id}">View Events</a>
            </td>
        </tr>
    </c:forEach>
</table>