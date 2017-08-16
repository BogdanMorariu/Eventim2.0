<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../../tiles/includes.jsp" />
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${not empty errorMessage}">
	<label><b>${errorMessage}</b></label>
</c:if>


<form:form modelAttribute="artist" action="processUpdateArtist"
	id="myForm">
	<label>Artist: </label>
	<br>
	<label>New name: </label>
	<form:input path="name" />
	<input type="hidden" name="id" value="${artist.id}" />

	<input type="button" value="Update" id="Apasa-ma" />


	<script type="text/javascript">
		function redirect() {
			var url = "http://localhost:8080/Eventim2.0/artists/listArtists";
			window.location.href = url;
		}
	</script>
</form:form>

<script type="text/javascript">
	$(document).ready(function() {
		$("#Apasa-ma").click(function() {
			$.ajax({
				url : "processUpdateArtist",
				data : $("#myForm").serialize(),
				success : function(result) {
					if (result.indexOf("Succes") != -1) {
						$("#artist-text").html("Artist has been updated!");
					} else {
						$("#artist-text").html("Artist has not been updated!");
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
				<h4 class="modal-title">Succes</h4>
			</div>
			<div class="modal-body">
				<p id="artist-text"></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" onClick="redirect()">OK</button>
				<script type="text/javascript">
					function redirect() {
						var url = "../artists/listArtists";
						window.location.href = url;
					}
				</script>
			</div>
		</div>
	</div>
</div>


