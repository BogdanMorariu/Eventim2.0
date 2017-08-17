<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../tiles/includes.jsp" />
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<c:if test="${not empty errorMessage}">
	<label><b style="color: red"><center>${errorMessage}</center></b></label>
</c:if>
<style>
#eventCreateContainer{
	width:30%;
    margin-left:30%;
    font-size:110%
    
}

.col-sm-9{
	padding:1%
}

.col-sm-6{
	padding:1%
}

input[type=datetime-local]{
	
    
    border: none;
    border-radius: 4px;
    background-color: #f1f1f1;
}

input[type=text]{
	
    
    border: none;
    border-radius: 4px;
    background-color: #f1f1f1;
}

select {
    width: 100%;
   
    border: none;
    border-radius: 4px;
    background-color: #f1f1f1;
}

input[type=button], input[type=submit], input[type=reset] {
	background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 1%;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin-left:10%
}
</style>

<div class="col-sm-6" id="eventCreateContainer" >
	<center><h3 style="margin-bottom:5%;">Create New Event</h3></center>
	<form:form modelAttribute="event" action="../event/processEvent"
		method="POST" id="myForm" cssClass="form-horizontal">

		<div class="form-group">
			<label class="col-sm-3">Name:</label>
			<form:input path="name" cssClass="col-sm-9"/>
		</div>

		<br>
		
		<div class="form-group">
			<label class="col-sm-3">Location:</label>
			<form:input path="location" cssClass="col-sm-9"/>
		</div>
		
		<br>
		
		<div class="form-group">
			<label class="col-sm-3">Start Date:</label>
			<form:input type="datetime-local" path="startDate" cssClass="col-sm-9"/>
		</div>

		<br>
		
		<div class="form-group">
			<label class="col-sm-3">End Date:</label>
			<form:input type="datetime-local" path="endDate" cssClass="col-sm-9" />
		</div>
		
		<br>

		<div class="form-group">
			<label class="col-sm-3">Artists:</label>
			<form:select path="artists" cssClass="col-sm-9">
				<form:options items="${artists}" itemValue="id" itemLabel="name"></form:options>
			</form:select>
		</div>

		<br>

		<div class="form-group">
			<label class="col-sm-3">Categories:</label>
			<form:select path="category" cssClass="col-sm-9">
				<form:options items="${categories}" itemValue="id" itemLabel="type"></form:options>
			</form:select>
			
		</div>
		
		<br>
		
		<div class="form-group">
			<label class="col-sm-3">Price:</label>
			<form:input path="price" class="col-sm-9" />
		</div>
		<br>
		<br>
		<center><input type="button" value="Submit" id="Apasa-ma" id="submitButton"/></center>
		<br>

	</form:form>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		$("#Apasa-ma").click(function() {
			$.ajax({
				url : "../event/processEvent",
				data : $("#myForm").serialize(),
				success : function(result) {
					if (result.indexOf("success") != -1) {
						$("#event-text").html("Event has been saved!");
					} else {
						$("#event-text").html("Event has not been saved!");
					}
					$('#myModal').modal('show');
				}
			});
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
				<button type="button" value="Refresh Page" onClick="history.go(0)"
					class="btn btn-default" data-dismiss="modal">OK</button>
			</div>
		</div>
	</div>
</div>
