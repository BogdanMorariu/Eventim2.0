<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<jsp:include page="../../tiles/includes.jsp" flush="true" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>createTicket</title>
</head>
<body>
	<form:form modelAttribute="ticket" action="/tickets/createTicket" method="POST">
		User Name : ${ticket.user.name}
		Event: ${ticket.event.name}
		Price: ${ticket.event.price}
		<input name="quantity"/>
		<input type="submit" value="Buy">
	</form:form>
</body>
</html>