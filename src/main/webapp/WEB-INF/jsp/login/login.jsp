<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<jsp:include page="../../tiles/includes.jsp" />
<title>Insert title here</title>
</head>
<body>
	<c:if test="${not empty param.failed}">
		<div class="errors">
			<p>
				<c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
			</p>
		</div>
	</c:if>
	<form method="POST" action="j_spring_security_check">
		<br /> <label>Username:</label> <input name="userNameParam"
			type="text" /> 
		<br /> <label>Password:</label> <input name="userPasswordParam"
			type="password" /> <input type="submit" value="Login" />
	</form>
	Forgot your password?
	<a href="changePassword"> Click here!</a>
	<br /><br />
</body>
</html>