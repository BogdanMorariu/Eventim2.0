<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../tiles/includes.jsp" />
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<c:if test="${not empty errorMessage}">
	<label><b style="color:red"><center>${errorMessage}</center></b></label>
</c:if>
<form:form modelAttribute="event" action="../event/processEvent"
	method="POST">

	Name: <form:input path="name" />
	<br>
	Location: <form:input path="location" />
	<br>
	StartDate: <form:input path="startDate" />

	<br>
	EndDate: <form:input path="endDate" />

	<br>
	Artists: <form:select path="artists">
		<form:options items="${artists}" itemValue="id" itemLabel="name"></form:options>
	</form:select>
	<br>
	Categories: <form:select path="category">
		<form:options items="${categories}" itemValue="id" itemLabel="type"></form:options>
	</form:select>
	<br>
	<input type="submit" value="Submit" />
	<br>



</form:form>
