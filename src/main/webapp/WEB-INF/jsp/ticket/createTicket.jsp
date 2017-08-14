<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<body>
	<c:if test="${not empty errorMessage}">
		<label><b><center>${errorMessage}</center></b></label>
	</c:if>
	<form:form modelAttribute="ticket" action="/Eventim2.0/tickets/${ticket.event.id}/createTicket" method="POST">
		<label><b>User Name:</b></label> ${ticket.user.name} <br/>
		<input type="hidden" name="user" value="${ticket.user.id}" />
		<input type="hidden" name="event" value="${ticket.event.id}" />
		<label><b>Event:</b></label> ${ticket.event.name} 	<br/>
		<label><b>Price: ${ticket.event.price}</b></label> <%-- ${ticket.event.price} --%> <br/>
		<label><b>Quantity:</b></label><input name="quantity"/> <br/>
		<input type="submit" value="Buy"> <br/>
	</form:form>
</body>