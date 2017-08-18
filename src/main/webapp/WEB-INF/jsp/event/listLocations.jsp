<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: info
  Date: 17.08.2017
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table>
    <c:forEach items="${locations}" var="location">
        <tr id="${location}">
            <td>${location}</td>
            <td>
                <a href="../event/getEventsByLocation/${location}">View Events</a>
            </td>
        </tr>
    </c:forEach>
</table>
