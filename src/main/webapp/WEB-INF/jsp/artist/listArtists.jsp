<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../tiles/includes.jsp"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table>
    <c:forEach items="${artists}" var="artist">
        <tr id="${artist.id}">
            <td>${artist.name}</td>
            <td>
	            <form action="../artists/removeArtist" method="POST">
		             <input type="hidden" name="idValue" value="${artist.id}">
		             <input type="button" value="Delete Artist" id = "Apasa-ma" class="btn-danger" onclick="deleteArtistById('${artist.id}')"/>
				 </form>
	   			<form action="../artists/updateArtist" method="POST">
		             <input type="hidden" name="idValue" value="${artist.id}">
		             <input type="submit" value="Update artist" class="btn-success"/>
	   			</form>
            </td>
        </tr>
   </c:forEach>
   	
</table>
   <script type="text/javascript">
   function deleteArtistById(id) {
	   $.ajax({
			url : "../artists/removeArtist",
			data : "idValue=" + id,
			success : function(result) {
				if (result.indexOf("success") != -1) {
					$("#" + id).remove();
					$("#artist-text").html("Artist has been deleted!");
				} else {
					$("#artist-text").html("Artist has not been deleted!");
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
        <button type="button" class="close" data-dismiss="modal">&times;</button>
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

