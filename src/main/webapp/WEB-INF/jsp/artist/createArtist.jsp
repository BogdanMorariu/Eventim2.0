<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="../../tiles/includes.jsp"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form:form modelAttribute="artist" action="processArtist" id="myForm">
    <label>Artist name:</label><form:input path="name"/><br/>
    <input type="button" value="Save" id="Apasa-ma"/>
</form:form>
<script type="text/javascript">
$(document).ready(function(){
    $("#Apasa-ma").click(function(){
        $.ajax({
        	url: "processArtist",
        	data: $("#myForm").serialize(),
        	success: function(result){
	        	if (result.indexOf("Succes") != -1) {
	        		$("#artist-text").html("Artist has been saved!");
	        	} else {
	        		$("#artist-text").html("Artist has not been saved!");
	        	}
	        	$('#myModal').modal('show');
        }});
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
        <button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
      </div>
    </div>
   </div>
</div>

