<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<jsp:include page="../../tiles/includes.jsp"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:if test="${not empty message}">
    <label>${message}</label><br>
</c:if>
<form:form modelAttribute="temporaryUser" action="/users/createUser" method="POST">
    <label>Username:</label><input  name="name" class="form-control" placeholder="Dorel42"/>
    <label>Password:</label><input name="password" type="password" class="form-control" title="Password:"/>
    <label>Email:</label><input name="email" class="form-control" title="Email:"/>
    <input type="submit" class="btn btn-default" value="Save"/>
</form:form>