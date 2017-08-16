<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../../tiles/includes.jsp" />
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${not empty errorMessage}">
	<label><b>${errorMessage}</b></label>
</c:if>
<form:form modelAttribute="category"
	action="../categories/processCategory" method="POST" id="myForm">
	<label>Existing categories: </label>
	<form:select path="type">
		<form:options disabled="true" items="${categories}" itemValue="id" itemLabel="type"></form:options>
	</form:select>

	<br>
	<label>Type: </label>
	<form:input path="type" />
	<input type="button" value="Add" id="Apasa-ma"/>

</form:form>

<script type="text/javascript">
$(document).ready(function(){
    $("#Apasa-ma").click(function(){
        $.ajax({
        	url: "../categories/processCategory",
        	data: $("#myForm").serialize(), 
        	success: function(result){
	        	if (result.indexOf("success") != -1) {
	        		$("#category-text").html("Category has been saved!");
	        	} else {
	        		$("#category-text").html("Category has not been saved!");
	        	}
	        	$('#myModal').modal('show');
        }});
    });
});
</script>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">success</h4>
      </div>
      <div class="modal-body">
        <p id="category-text"></p>
      </div>
      <div class="modal-footer">
        <button type="button" value="Refresh Page" onClick="history.go(0)" class="btn btn-default" data-dismiss="modal">OK</button>
      </div>
    </div>
   </div>
</div>

