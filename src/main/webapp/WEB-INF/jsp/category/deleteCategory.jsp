<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../../tiles/includes.jsp" />
<table>
    <c:forEach items="${categories}" var="category">
        <tr>
            <td>${category.type}</td>
            <td><button class="btn-danger">Delete</button></td>
        </tr>
    </c:forEach>
</table>

