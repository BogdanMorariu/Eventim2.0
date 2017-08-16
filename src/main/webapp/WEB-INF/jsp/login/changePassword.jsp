<%--
  Created by Eclipse.
  User: info
  Date: 10.08.2017
  Time: 12:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#click")
								.click(
										function() {
											$
													.ajax({
														url : "forgotPassword",
														data : $("#myForm")
																.serialize(),
														success : function(
																result) {
															if (result
																	.indexOf("Success") != -1) {
																$(
																		"#artist-text")
																		.html(
																				"An eMail with the new password has been sent.");
															} else {
																$(
																		"#artist-text")
																		.html(
																				"Password change was unsuccessful. Try again or register.");
															}
															$('#myModal')
																	.modal(
																			'show');
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
				<h4 class="modal-title">Success</h4>
			</div>
			<div class="modal-body">
				<p id="artist-text"></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
			</div>
		</div>
	</div>
</div>

<body>
	<form method="POST" action="forgotPassword" id="myForm">
		<br /> <label>Introduceti eMailul pentru a primi o parola
			noua:</label> <input type="email" name="email" /> <input type="button"
			value="Send" id="click" /> <br />
		<br /> <a href="loginUri"> Go Back to login page</a>
	</form>
</body>