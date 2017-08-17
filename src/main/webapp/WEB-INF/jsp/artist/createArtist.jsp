<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>


<style>
#createArtistContainer {
	margin-left: 30%;
	background-color: rgba(255, 255, 255, 0.7);
	height: 100%;
	padding: 2%;
	overflow: auto;
	overflow-x: hidden;
}

body {
	background-image:
		url('http://technext.github.io/Evento/images/demo/bg-slide-01.jpg');
	background-size: 100% 100%;
}
}
</style>
<div class="col-sm-6" id="createArtistContainer">
	<center><h3>Create new Artist</h3></center><br>
	<form:form modelAttribute="artist" action="processArtist" id="myForm">
		<div class="form-group">
			<label class="col-sm-3">Artist name:</label>
			<form:input path="name" cssClass="col-sm-9" />
			<br />
		</div>
		<br />
		<input type="button" value="Save"  class="btn-success" id="Apasa-ma" style="margin-left: 32px;" />
	</form:form>

</div>


<script type="text/javascript">
	$(document).ready(function() {
		$("#Apasa-ma").click(function() {
			$.ajax({
				url : "processArtist",
				data : $("#myForm").serialize(),
				success : function(result) {
					if (result.indexOf("Succes") != -1) {
						$("#artist-text").html("The Artist has been saved!");
					} else {
						$("#artist-text").html("The Artist has not been saved!");
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
				
				<h4 class="modal-title">Succes</h4>
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

