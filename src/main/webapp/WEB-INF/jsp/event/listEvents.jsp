<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<script type="text/javascript">
function deleteEvent(id){
	 $.ajax({
     	url: "../event/removeEvent",
     	data: "idValue=" + id, 
     	success: function(result){
	        	if (result.indexOf("success") != -1) {
	        		$("#" + id).remove();
	        		$("#event-text").html("Event has been deleted!");
	        	} else {
	        		$("#event-text").html("Event has not been deleted!");
	        	}
	        	$('#myModal').modal('show');
     }});
}
</script>

<style>
body {
	width: 100%;
	background-image:
		url('http://www.clujulcultural.ro/wp-content/uploads/2015/06/Electric-Castle-ziua-2-foto-Vlad-Gabriel.jpg');
	background-size: 100% 100%
}

h3 {
	margin-bottom: 2%;
	margin-top: -2%;
}

#manageEventsContainer {
	width: 60%;
	margin-top: auto;
	margin-left: auto;
	margin-right: auto;
	background-color: rgba(255, 255, 255, 0.7);
	height: 100%;
	padding: 2%;
	overflow: auto;
	overflow-x: hidden;
}

form {
	display: inline;
}

.col-sm-3 {
	margin-top: -10%;
}
</style>


<div id="manageEventsContainer">
<h3 align="center">List of Events</h3>
<table align="center">
		<c:forEach items="${events}" var="event">
			<tr id="${event.id}">
				<td><img width="100" src="${event.imageBase64}"/></td>
				<td class="left" ><br><label class="col-sm-3">${event.name}</label></td>
				<td class="right">
					<form action="../event/updateEvent" method="POST">
						<input type="hidden" name="idValue" value="${event.id}">
						<input type="submit" value="Update event" class="btn-success" />
					</form>
					<form action="../event/removeEvent" method="POST">
						<input type="hidden" name="idValue" value="${event.id}">
						<input type="button" value="Delete event" class="btn-danger" onclick="deleteEvent('${event.id}')"/>
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>

<!-- Modal -->

</div>
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
        <button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
      </div>
    </div>
   </div>
   </div>

