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

	<style>
#eventCreateContainer {
	margin-left: 25%;
	margin-right: 25%;
	width: 55%
}
</style>
	<center>
		<h2 style="margin-left: -16%">
			Login
			</h3>
			<br>
			<br>
			<h4 style="margin-left: -28%">
				Enter your credentials to login
				</h3>
	</center>
	<div class="col-sm-6" id="eventCreateContainer">
		<form method="POST" action="j_spring_security_check"
			class="form-horizontal">
			<div class="form-group">
				<br /> <label class="col-sm-3">Username:</label> <input
					class="col-sm-6" name="userNameParam" type="text" />
			</div>
			<div class="form-group">
				<br /> <label class="col-sm-3">Password:</label> <input
					class="col-sm-6" name="userPasswordParam" type="password" /> <br>
				<br> <br> <input class="col-sm-2 col-sm-offset-3"
					type="submit" value="Login" />
			</div>

			<br>
			<div class="form-group">
				<div class="col-sm-offset-3">
					Forgot your password? <a href="changePassword"> Change password
						here!</a>
				</div>
				<br>
				<div class="col-sm-offset-3">
					Not a user yet? <a href="changePassword"> Register here!</a>
				</div>
			</div>
		</form>
	</div>
	<br />
	<br />
</body>
</html>