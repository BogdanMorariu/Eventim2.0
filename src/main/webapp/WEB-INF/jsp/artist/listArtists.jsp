<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<style>
#createArtistContainer {
	margin-left: 30%;
	width: 40%;
	background-color: rgba(255, 255, 255, 0.7);
	height: auto;
	padding: 2%;
	overflow: auto;
	overflow-x: hidden;
}

#asd {
	margin-left: 30;
}

#Apasa-ma {
	margin-left: 30;
}

body {
	background-image:
		url('http://technext.github.io/Evento/images/demo/bg-slide-01.jpg');
	background-size: 100% 100%;
}
}
</style>

<br>
<div class="col-sm-6" id="createArtistContainer">
	<center>
	<h3>Line-up</h3>
</center>
	<table align="center">
		<c:forEach items="${artists}" var="artist">
			<tr id="${artist.id}">
				<td><img width="100" src="${artist.imageBase64}"/></td>
				<td>${artist.name}</td>
				<td>
					<div style="padding-top:10px">
						<form action="../artists/updateArtist" method="POST" style="display: inline;">
							<input type="hidden" name="idValue" value="${artist.id}"/>
							<input type="submit" value="Update artist" class="btn-success" id="asd"/>
						</form>

						<form action="../artists/removeArtist" method="POST" style="display: inline;">
							<input type="hidden" name="idValue" value="${artist.id}">
							<input type="button" value="Delete Artist" id="Apasa-ma" class="btn-danger" onclick="deleteArtistById('${artist.id}')" />
						</form>
					</div>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>


<script type="text/javascript">
	function deleteArtistById(id) {
		$.ajax({
			url : "../artists/removeArtist",
			data : "idValue=" + id,
			success : function(result) {
				if (result.indexOf("success") != -1) {
					$("#" + id).remove();
					$("#artist-text").html("The Artist has been deleted!");
				} else {
					$("#artist-text").html("The Artist has not been deleted!");
				}
				$('#myModal').modal('show');
			}
		});
	}
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

