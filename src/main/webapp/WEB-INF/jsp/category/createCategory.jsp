<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../../tiles/includes.jsp" />
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<body>
<form method="POST" action="/categories/createCategory">
	<label>type: </label> <input type="type" type="text" />
</form>
</body>
