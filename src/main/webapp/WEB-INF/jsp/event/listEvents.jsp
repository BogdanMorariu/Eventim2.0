<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../../tiles/includes.jsp" />

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

	<table>
		<c:forEach items="${events}" var="event">
			<tr id="${event.id}">

				<td>${event.name}</td>
				<td>
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

