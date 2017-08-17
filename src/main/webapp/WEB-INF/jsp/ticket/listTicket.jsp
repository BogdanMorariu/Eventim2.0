<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
.flex-container {
 	display: flex;
	flex-direction: column;
}

th, td {
	text-align: center;
	padding: 8px;
}

tr {
	background: rgba(0, 0, 0, 0.1);
}

tr:nth-child(even) {
	background: rgba(0, 0, 0, 0.3);
}

th {
	background-color: #272f3d;
	color: white;
}

</style>

<body>
	<h1>Your tickets</h1>
	<c:if test="${not empty errorMessage}">
		<label><b>${errorMessage}</b></label>
	</c:if>
	<div class="flex-container">
		<div class="myTicket flex-item col-sm-7 col-sm-offset-3">
			<table id="ticketTable">
				<tr>
					<th><b>Barcode</b></th>
					<th><b>Event Name</b></th>
					<th><b>Location</b></th>
					<th><b>Available until</b></th>
					<th><b>Price</b></th>
					<th></th>
				</tr>
				<c:forEach items="${tickets}" var="ticket">
					<tr id="${ticket.id}">
						<td>${ticket.barcode}</td>
						<td>${ticket.event.name}</td>
						<td>${ticket.event.location}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${ticket.event.endDate}" /></td>
						<td>${ticket.event.price}</td>
						<td><input type="button" value="Refund"
							onclick="refundTicket(${ticket.id});" /></td>
					</tr>
				</c:forEach>
			</table>
			<input type="hidden" id="eventID" value="${tickets[0].event.id}">
		</div>
		
		<div class="flex-item">
			<a href="/Eventim2.0/tickets/${tickets[0].event.id}/createTicket">Do you need more tickets?</a>
		</div>
	</div>

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
