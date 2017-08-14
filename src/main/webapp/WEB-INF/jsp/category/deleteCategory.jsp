<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../../tiles/includes.jsp" />
<table>
    <c:forEach items="${categories}" var="category">
        <tr>
            <td>
            	${category.type}
            </td>
            <td>
            <form action="../categories/removeCategory" method="POST">
            	<input type="hidden" name="idValue" value="${category.id}">
	            <input type="submit" value="Delete category" class="btn-danger"/>
			</form>
            </td>
        </tr>
    </c:forEach>
</table>


