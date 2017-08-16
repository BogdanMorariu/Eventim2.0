<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt"%>

<body>
	<c:if test="${not empty errorMessage}">
		<label><b><center>${errorMessage}</center></b></label>
	</c:if>
	<c:if test="${response=='OK'}">
		<script>
			setTimeout(function(){ setPopUp("Ticket bought!"); }, 50);
		</script>
	</c:if>
		<c:if test="${response=='NO'}">
		<script>
			setTimeout(function(){ setPopUp("Error! Quantity must be a positive number!"); }, 50);
		</script>
	</c:if>
	<form:form modelAttribute="ticket" action="/Eventim2.0/tickets/${ticket.event.id}/createTicket" method="POST">
		<label><b>User Name:</b></label> ${ticket.user.name} <br/>
		<input type="hidden" name="user" value="${ticket.user.id}" />
		<input type="hidden" name="event" value="${ticket.event.id}" />
		<label><b>Event:</b></label> ${ticket.event.name} 	<br/>
		<label><b>Price: ${ticket.event.price}</b></label> <%-- ${ticket.event.price} --%> <br/>
		<label><b>Quantity:</b></label><input name="quantity"/> <br/>
		<input type="submit" value="Buy"> <br/>
	</form:form>
	<a href="/Eventim2.0/tickets/${ticket.event.id}">List your tickets</a>
</body>

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
        <p id="ticket-text"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
      </div>
    </div>
   </div>
</div>