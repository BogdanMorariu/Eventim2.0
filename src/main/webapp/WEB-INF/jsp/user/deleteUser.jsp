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
<table>
    <c:forEach items="${users}" var="user" >
        <tr id="${user.id}">
            <td>${user.name}</td>
            <td>
                <form method="POST">
                    <input type="hidden" name="id" class="form-control" value="${user.id}"/>
                    <input type="button" class="btn btn-danger" value="Delete" onclick="deleteUser(${user.id})"/>
                </form>
            </td>
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
                <button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>

