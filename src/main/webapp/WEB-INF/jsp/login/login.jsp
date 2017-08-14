<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../../tiles/includes.jsp" />
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="POST" action="/j_spring_security_check">
		<label>Username:</label> <input name="userNameParam" type="text" />
		Password: <input name="userPasswordParam" type="password" />
		<input type="submit" value="Login" />
	</form>
	Forgot your password? <a href="login/changePassword.jsp">Click here!</a>
</body>
</html>