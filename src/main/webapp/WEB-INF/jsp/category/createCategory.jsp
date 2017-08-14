<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../../tiles/includes.jsp" />
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${not empty errorMessage}">
	<label><b>${errorMessage}</b></label>
</c:if>
<form:form modelAttribute="category"
	action="../categories/processCategory" method="POST">
	<label>Existing categories: </label>
	<form:select path="type">
		<form:options disabled="true" items="${categories}"></form:options>
	</form:select>

	<br>
	<label>Type: </label>
	<form:input path="type" />
	<input type="submit" value="Add" />

</form:form>
