<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<body>
	<c:if test="${not empty errorMessage}">
		<label><b><center>${errorMessage}</center></b></label>
	</c:if>
	<select>
		<option value="${selected}" selected>${selected}</option>
		<c:forEach items="${tickets}" var="ticket">
			<option value="${ticket.id}">${ticket.id}</option>
		</c:forEach>
	</select>
</body>