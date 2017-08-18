<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

<style>
#categoryListContainer {
    margin-left: 30%;
	width: auto;
	font-size: 110%;
	background-color:rgba(255,255,255,0.6);
	heigth:auto%;
	padding:2%;
	
	overflow:auto;
	overflow-x:hidden;
}

body{
background-image:url(http://www.theransomnote.com/media/articles/electric-castle-announces-dixon-moderat-and-more-for-2017/960b0903-5e78-491e-90cc-0ef49f21a659.jpg);
background-size:100% 100%
}
.col-sm-3 {
	margin-top: -15%;
}

</style>
<div class="col-sm-6" id="categoryListContainer">
<center>
	<h3>List of Categories</h3>
</center>
<br>
<br>

	<table align="center">
		<c:forEach items="${categories}" var="category">
			<tr id="${category.id}">
				<td><br> <label class="col-sm-3"> ${category.type} <br></label>
				</td>
				<td>
				<div style="padding:10px">
					<form action="../categories/updateCategory" method="POST"
						style="display: inline;">
						<input type="hidden" name="idValue" value="${category.id}">
						<input type="submit" value="Update category" class="btn-success" />
					</form>
					<form action="../categories/removeCategory" method="POST"
						style="display: inline;">
						<input type="hidden" name="idValue" value="${category.id}">
						<input type="button" value="Delete category" class="btn-danger"
							onclick="deleteCategoryById('${category.id}')" />
					</form>
					</div>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Status</h4>
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
