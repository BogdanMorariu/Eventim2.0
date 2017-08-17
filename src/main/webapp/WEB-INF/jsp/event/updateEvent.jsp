<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${not empty errorMessage}">
	<label><b>${errorMessage}</b></label>
</c:if>


<style>
	
</style>
<div >
<form:form modelAttribute="event" action="../event/processUpdateEvent"
	method="POST" id="myForm" cssClass="form-horizontal">
	
	
	<label>Event: </label>
	<br>
	<div class="form-group">
	<label class="col-sm-3">New Name: </label>
	<form:input path="name" cssClass="col-sm-9"/>
	<input type="hidden" name="id" value="${event.id}" />
	</div>
	<br>
	
	<label class="col-sm-3">Start Date: </label>
	<form:input path="startDate" cssClass="col-sm-9"/>
	
	<br>
	<label class="col-sm-3">Location:</label>
	<form:input path="location" cssClass="col-sm-9"/>
	<br>
	
	<label class="col-sm-3">End Date: </label>
	<form:input path="endDate" cssClass="col-sm-9"/>

	<br>

	<label class="col-sm-3">Artists: </label>
	<form:select path="artists" cssClass="col-sm-9">
		<form:options items="${artists}" itemValue="id" itemLabel="name"></form:options>
	</form:select>

	<br>

	<label class="col-sm-3">Categories: </label>
	<form:select path="category" cssClass="col-sm-9">
		<form:options items="${categories}" itemValue="id" itemLabel="type"></form:options>
	</form:select>

	<br>

	<label class="col-sm-3">Price: </label>
	<form:input path="price" cssClass="col-sm-9"/>
	
	<br>
	
	<input type="button" value="Update" id="Apasa-ma"/>
	
	
</form:form>
</div>

<script type="text/javascript">
$(document).ready(function(){
    $("#Apasa-ma").click(function(){
        $.ajax({
        	url: "../event/processUpdateEvent",
        	data: $("#myForm").serialize(), 
        	success: function(result){
	        	if (result.indexOf("success") != -1) {
	        		$("#event-text").html("Event has been updated!");
	        	} else {
	        		$("#event-text").html("Event has not been updated!");
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
        <p id="event-text"></p>
      </div>
      <div class="modal-footer">
        <button type="button" onclick="reload()" class="btn btn-default" data-dismiss="modal">OK</button>
        <script type="text/javascript">
		function reload(){
				window.location.href = "../event/listEvents";
		}
		</script>
      </div>
    </div>
   </div>
</div>
