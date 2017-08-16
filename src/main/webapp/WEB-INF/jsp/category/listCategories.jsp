<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../../tiles/includes.jsp" />
<script type="text/javascript">
function deleteCategoryById(id){
	 $.ajax({
     	url: "../categories/removeCategory",
     	data: "idValue=" + id, 
     	success: function(result){
	        	if (result.indexOf("success") != -1) {
	        		$("#" + id).remove();
	        		$("#category-text").html("Category has been deleted!");
	        	} else {
	        		$("#category-text").html("Category has not been deleted!");
	        	}
	        	$('#myModal').modal('show');
     }});
}
</script>

<table>
    <c:forEach items="${categories}" var="category">
        <tr id="${category.id}">
            <td>
            	${category.type}
            </td>
            <td>
            <form action="../categories/updateCategory" method="POST">
            	<input type="hidden" name="idValue" value="${category.id}">
	            <input type="submit" value="Update category" class="btn-success"/>
			</form>
            <form action="../categories/removeCategory" method="POST">
            	<input type="hidden" name="idValue" value="${category.id}">
	            <input type="button" value="Delete category" class="btn-danger delete-category" onclick="deleteCategoryById('${category.id}')" />
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
        <h4 class="modal-title">Succes</h4>
      </div>
      <div class="modal-body">
        <p id="category-text"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
      </div>
    </div>
   </div>
</div>
