<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../../tiles/includes.jsp" />
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<body>
<form>
</form>
<form:form modelAttribute="category"
	action="../categories/deleteCategory">
	<label>Categories: </label>
	<form:select path="type">
	<form:option value="NONE"> --SELECT-- </form:option>
		<form:options items="${categories}"></form:options>
	</form:select>
	<input type="submit" value="Delete" />

</form:form>
