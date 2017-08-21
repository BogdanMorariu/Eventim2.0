<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<jsp:include page="../../tiles/includes.jsp"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<h3 class="col-md-offset-5">Register</h3>
<c:if test="${not empty message}">
    <label>${message}</label><br>
</c:if>
<div class="col-sm-4 offset5">
    <form:form modelAttribute="temporaryUser" action="../users/createUser" method="POST" class="form-hotizontal">
        <div class="form-group">
            <label class="col-sm-2" for="name">Username:</label>
            <div class="col-sm-9">
                <input id="name" name="name" class="form-control" placeholder="username"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2" for="password">Password:</label>
            <div class="col-sm-9">
                <input id="password" name="password" type="password" class="form-control col-sm-9" title="Password:" placeholder="password"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2" for="email">Email:</label>
            <div class="col-sm-9">
                <input id="email" name="email" class="form-control col-sm-9" title="Email:" placeholder="example@yahoo.com"/>
            </div>
        </div>
        <input type="submit" style="margin-left: 2%; margin-top: 2%" class="btn btn-success col-sm-3" value="Register"/>
    </form:form>
</div>