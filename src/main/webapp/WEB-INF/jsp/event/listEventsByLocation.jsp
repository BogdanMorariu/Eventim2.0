<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: info
  Date: 17.08.2017
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table>
    <c:forEach items="${events}" var="event">
        <tr>
            <td><img width="100" src="${event.imageBase64}"/></td>
            <td>${event.name}</td>
            <td>
                <a href="../tickets/${event.id}/createTicket">Buy Tickets</a>
            </td>
        </tr>
    </c:forEach>
</table>
