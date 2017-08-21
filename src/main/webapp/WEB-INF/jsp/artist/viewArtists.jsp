
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<spring:url value="/" var="externalAddress"/>


<style>
#artistTable tr:nth-child(odd) {
	background: rgba(139, 176, 221, 0.3);
}

a:hover {
	 color: #0f3d63;
}

a {
	font-weight: 700; color: #245986;
	font-size:130%;
}

#artistHeader {
	text-align: center;
	margin-left: 25%;
	margin-right: 25%;
	margin-bottom: -1.5%;
	margin-top: -5%;
	width: 50%;
	background-color: rgba(255, 255, 255, 0.7);
}

#artistHeader h1 {
	font-weight: bold;
	font-size: 300%;
	padding: 1%;
}

#createArtistContainer {
	margin: 0 25%;
	width: 50%;
	background-color: rgba(255, 255, 255, 0.7);
	height: 100%;
	padding: 2%;
	overflow: auto;
	overflow-x: hidden;
}

input[type=button], input[type=hidden], input[type=submit] {
	width: 30%;
	display: inline-block
}

#nustiu {
	font-weight: 700;
	color: #245986;
}

#asd {
	margin-left: 30;
}

#Apasa-ma {
	margin-left: 30;
}

#artistNameCell {
	text-align: center;
	padding-left: 1%;
	width: 30%;
	font-weight: bold;
	font-size: 120%;
}


#artistImageCell {
	text-align: left;
	width: 30%;
	height: 10%;
}

#artistImage {
	display: block;
	width: 100%;
	vertical-align: bottom;
}

#artistButtonCell {
	width: 60%;
	text-align:center;
}
</style>

<br>
<div id="artistHeader">
	<h1>Line-up</h1>
</div>
<div class="col-sm-6" id="createArtistContainer">
	<center></center>
	<table align="center" id="artistTable">
		<c:forEach items="${artists}" var="artist">
			<tr id="${artist.id}">
				<td id="artistImageCell"><img id="artistImage"   src="${artist.imageBase64}"/></td>
				<td id="artistNameCell">${artist.name}</td>
				<td id="artistButtonCell"><a id="event" href="${externalAddress}event/getEventsByArtist/${artist.id}">
						View Events</a></td>
			</tr>
		</c:forEach>
	</table>
</div>



	


