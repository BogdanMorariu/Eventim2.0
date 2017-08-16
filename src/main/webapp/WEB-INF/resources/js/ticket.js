function refundTicket(ticketId) {
	var help = document.getElementById("eventID").value;
	var urlHelp = "/Eventim2.0/tickets/"+help+"/deleteTicket";
	$.ajax({
		url: urlHelp,
  		type: "POST",
  		data:{id:ticketId},
  		dataType:"json",
 		success: function(response) {
 			$("#ticket-text").html("Ticket has been refunded!");
 			document.getElementById(ticketId).remove();
 		},
 	 	error: function(xhr) {
 	 		if (xhr.status = 200) {
 	 			$("#ticket-text").html("Ticket has been refunded!");
 	 			document.getElementById(ticketId).remove();
 	 		}
 	 		else {
 	 			$("#ticket-text").html("Ticket has not been refunded!");
 	 		}
        	$('#myModal').modal('show');
 	 	}
	});
}

function setPopUp(value) {
	console.log("asd:" + value);
	$("#ticket-text").html(value);
	$('#myModal').modal('show');
}