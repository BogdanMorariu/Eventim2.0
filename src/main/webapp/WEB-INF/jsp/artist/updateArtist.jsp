<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${not empty errorMessage}">
	<label><b>${errorMessage}</b></label>
</c:if>

<style>
#createArtistContainer {
	margin-left:30%;
	width: 40%;
	height: auto;
 	background-color:rgba(255,255,255,0.7);
}

body{
background-image:url('http://cdn01.androidauthority.net/wp-content/uploads/2015/07/Best-DJ-apps-for-Android-840x473.jpg');
background-size:100% 100%;}
}
</style>
<div class="col-sm-6" id="createArtistContainer">
<center><h3>Update Artist</h3></center><br>
	<form:form modelAttribute="artist" action="processUpdateArtist"
		id="myForm" cssClass="form-horizontal">
		<div class="form-group">
			<label class="col-sm-3 col-sm-offset-1">New name: </label>
			<form:input path="name" class="col-sm-7" />
		</div>

		<div class="form-group" >
			<label class="col-sm-3">Picture:</label>
			<form:input type="file" path="image" id="file"
				onchange="showPicture(this);" />
			<input type="hidden" name="imageBase64" id="realImageBase64"/>
			<img id="img" src="#"  />
		</div>

		<input type="hidden" name="id" value="${artist.id}" />

		<input type="submit" value="Update" class="btn-success" id="Apasa-ma" style="margin-left: 10%;"/>


		<script type="text/javascript">
			function redirect() {
				var url = "../artists/listArtists";
				window.location.href = url;
			}
		</script>
	</form:form>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		$("#Apasa-ma").click(function() {
			$.ajax({
				url : "processUpdateArtist",
				data : $("#myForm").serialize(),
				success : function(result) {
					if (result.indexOf("Succes") != -1) {
						$("#artist-text").html("The Artist has been updated!");
					} else {
						$("#artist-text").html("The Artist has not been updated!");
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
				<button type="button" class="btn btn-default" data-dismiss="modal"
					onClick="redirect()">OK</button>
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


