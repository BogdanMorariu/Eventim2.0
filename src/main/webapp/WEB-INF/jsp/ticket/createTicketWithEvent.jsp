<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
#bigDiv {
	padding: 0;
	margin-left: 41%;
}

.buttonTicket {
	width: 73px;
	heigth: 21px;
	margin-left: 15%;
}

.labelQuantity {
	padding-top: 1%;
}

.flex-container {
 	display: flex;
	flex-direction: column;
}

h1 {
    margin-left: 38%;
}

.linkToTicketList {
	font-size: 25px;
}

</style>

<body>
	<c:if test="${not empty errorMessage}">
		<label class="col-sm-3"><b>${errorMessage}</b></label>
	</c:if>
	<h1>Buy your ticket now!</h1>
	<br/><br/>
	<c:if test="${response=='OK'}">
		<script>
			setTimeout(function() {
				setPopUp("Ticket bought!");
			}, 50);
		</script>
	</c:if>
	<c:if test="${response=='NO'}">
		<script>
			setTimeout(function() {
				setPopUp("Error! Quantity must be a positive number!");
			}, 50);
		</script>
	</c:if>
	<div class="flex-container">
		<div id="bigDiv" class="col-sm-5 col-sm-offset-4 flex-item">
			<form:form modelAttribute="ticket"
				action="/Eventim2.0/tickets/${ticket.event.id}/createTicket"
				method="POST" class="form-horizontal" id="myForm">
				<div class="form-group">
					<label class="col-sm-3">User Name:</label>
					<div class="col-sm-9">
						<label>${ticket.user.name}</label>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3">Event:</label>
					<div class="col-sm-9">
						<select id="eventSelect" onchange="setEventId();">
						    <option style="display:none">
							<c:forEach items="${event}" var="events" >
								<option value="${events.id}">${events.name}</option>
							</c:forEach>
						</select>						
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3">Price:</label>
					<div class="col-sm-9">
						<label id="price"></label>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3">Quantity:</label>
					<div class="col-sm-2 col-sm-offset-0.5">
						<form:input name="quantity" path="" cssClass="form-control" />
					</div>
				</div>
				<br />
				<input class="btn-success col-sm-3 col-sm-offset-1 buttonTicket" type="submit"
					value="Buy" onclick="changeActionUri();">
				<input class="col-sm-9" type="hidden" name="user"
					value="${ticket.user.id}" />
				<input class="col-sm-9" type="hidden" name="event" id="eventPlaceHolder"/>
			</form:form>
		</div>
		<div class="flex-item linkToTicketList">
			<a href="/Eventim2.0/tickets">List your tickets</a>
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