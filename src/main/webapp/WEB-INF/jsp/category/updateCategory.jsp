<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../../tiles/includes.jsp" />
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${not empty errorMessage}">
	<label><b>${errorMessage}</b></label>
</c:if>
<form:form modelAttribute="category"
	action="../categories/processUpdateCategory" method="POST">
	<label>Category: </label>
	<br>
	<label>New type: </label>
	<form:input path="type"  />
	<input type="hidden" name="id" value="${category.id}"/>
	<input type="submit" value="Update" />

</form:form>
