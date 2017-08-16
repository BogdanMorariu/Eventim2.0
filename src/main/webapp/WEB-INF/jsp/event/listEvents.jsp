<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../../tiles/includes.jsp" />

<form:form modelAttribute="event" action="/events/createEvent">

	<table>
		<c:forEach items="${events}" var="event">
			<tr>

				<td>${event.name}</td>
				<td>
					<form action="../categories/updateEvent" method="POST">
						<input type="hidden" name="idValue" value="${event.id}">
						<input type="submit" value="Update event" class="btn-success" />
					</form>
					<form action="../categories/removeEvent" method="POST">
						<input type="hidden" name="idValue" value="${event.id}">
						<input type="submit" value="Delete event" class="btn-danger" />
					</form>

				</td>
			</tr>
		</c:forEach>
	</table>

</form:form>