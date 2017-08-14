<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="../../tiles/includes.jsp"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <form:form modelAttribute="temporaryUser" action="/users/createUser" method="POST">
        <label>Username:</label><input  name="name" class="form-control" placeholder="Dorel42"/>
        <input name="password" type="password" class="form-control" title="Password:"/>
        <input name="email" class="form-control" title="Email:"/>
        <input type="submit" class="btn btn-default" value="Save"/>
    </form:form>