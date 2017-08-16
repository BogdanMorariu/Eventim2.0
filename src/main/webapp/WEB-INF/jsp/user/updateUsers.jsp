<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: info
  Date: 10.08.2017
  Time: 09:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="../../resources/js/user.js"></script>
<c:if test="${not empty message}">
    <label>${message}</label><br>
</c:if>
<table class="table-bordered table-responsive">
    <c:forEach items="${users}" var="user">
        <tr>
            <form method="POST" id="form${user.id}">
                <label>ID:${user.id}</label><br><input type="hidden" name="id" value="${user.id}"/>
                <label>Username:</label><input  name="name" class="form-control" value="${user.name}"/>
                <label>Password:</label><input name="password" class="form-control" value="${user.password}"/>
                <label>Email:</label><input name="email" value="${user.email}"/>
                <label>Type:</label><br>
                <input type="radio" name="type" value="ADMIN"> Administrator<br>
                <input type="radio" name="type" value="NORMAL" checked> User<br>
                <input type="button" class="btn btn-default" value="Save" onclick="updateUser(${user.id})"/><br>
            </form>
        </tr>
    </c:forEach>
</table>


<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Success</h4>
            </div>
            <div class="modal-body">
                <p id="user-text"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" onclick="redir('../users/updateUsers')" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>
