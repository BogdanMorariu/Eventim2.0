<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<jsp:include page="../../tiles/includes.jsp"/>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete ticket</title>
</head>
<body>
	<form:form modelAttribute="ticket" action="/tickets/deleteTicket">
		<form:input path="user" />
		<form:select path="ticket" id="ticketList">
			<c:forEach var="ticket" items="${ticketList}" >   
				<form:option value="${ticket.key}">${ticket.value}</form:option>
			</c:forEach>
		</form:select>
		<input type="submit" value="Delete" method="POST">
	</form:form>
</body>
</html>