<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../../tiles/includes.jsp" />
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <title>Update Artist</title>
</head>
<body>
 <form method="POST" action="/artist/updateArtist">
	<label>name: </label> <input name="name" name="name" />
	<input type="button" value="Update name" id="Apasa-ma"/>
</form>
</body>
</html>
