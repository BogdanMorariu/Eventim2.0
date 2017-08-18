<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<jsp:include page="includes.jsp" />
<style>
body {
	background-image:
		url('https://www.pixelstalk.net/wp-content/uploads/2016/06/Lovely-bright-wallpaper-hd-wallpapers.jpg');
	background-size: 100% 100%;
	width: 100%;
}
</style>
<table style="width: 100%; height: 100%;">
	<tr style="vertical-align: top;">
		<td><tiles:insertAttribute name="header" /></td>
	</tr>
	<tr style="height: 80%; vertical-align: top;">
		<td><tiles:insertAttribute name="body" /></td>
	</tr>
	<tr>
		<td><tiles:insertAttribute name="footer" /></td>
	</tr>
</table>