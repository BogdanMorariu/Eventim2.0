<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../tiles/includes.jsp" />
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<c:if test="${not empty errorMessage}">
	<label><b style="color:red"><center>${errorMessage}</center></b></label>
</c:if>
<form:form modelAttribute="event" action="../event/processEvent"
	method="POST" id="myForm">

	Name: <form:input path="name" />
	<br>
	Location: <form:input path="location" />
	<br>
	StartDate: <form:input path="startDate" />

	<br>
	EndDate: <form:input path="endDate" />

	<br>
	Artists: <form:select path="artists">
		<form:options items="${artists}" itemValue="id" itemLabel="name"></form:options>
	</form:select>
	<br>
	Categories: <form:select path="category">
		<form:options items="${categories}" itemValue="id" itemLabel="type"></form:options>
	</form:select>
	<br>
	Price: <form:input path="price"/>
	<br>
	<input type="button" value="Submit" id="Apasa-ma"/>
	<br>
	
</form:form>

<script type="text/javascript">
$(document).ready(function(){
    $("#Apasa-ma").click(function(){
        $.ajax({
        	url: "../event/processEvent",
        	data: $("#myForm").serialize(), 
        	success: function(result){
	        	if (result.indexOf("success") != -1) {
	        		$("#event-text").html("Event has been saved!");
	        	} else {
	        		$("#event-text").html("Event has not been saved!");
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
        <button type="button" value="Refresh Page" onClick="history.go(0)" class="btn btn-default" data-dismiss="modal">OK</button>
      </div>
    </div>
   </div>
</div>
