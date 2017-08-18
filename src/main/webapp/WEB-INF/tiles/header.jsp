<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<spring:url value="/home"/>">Eventim
				2.0</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Events<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href='<spring:url value="/event/listEvents"/>'>View Events</a></li>
						<li><a href='<spring:url value="/event/listLocations"/>'>View Locations</a></li>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Artists<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href='<spring:url value="/artists/listArtists"/>'>View Artist</a></li>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle" 
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Categories<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href='<spring:url value="/categories/listCategories"/>'>View Categories</a></li>
					</ul></li>
			</ul>
			<c:if test="${pageContext['request'].userPrincipal.principal != null}">
				<div style="float: right;">
					<ul class="nav navbar-nav">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">Hello,
								${pageContext['request'].userPrincipal.principal.name}<span
								class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a href='<spring:url value="/users/updateUser"/>'>View
										Account</a></li>
								<li><a
									href='<spring:url value="/tickets/createTicketWithEvent"/>'>Purchase
										new Ticket</a></li>
								<li><a href='<spring:url value="/tickets"/>'>Refund
										Ticket</a></li>
							</ul></li>
					</ul>
					<ul class="nav navbar-nav">
						<li class="dropdown"><a href="<spring:url value="/logout"/>" class="dropdown-toggle" role="button" aria-haspopup="true"
							aria-expanded="false">Logout</a></li>
					</ul>
				</div>
			</c:if>
			<c:if test="${pageContext['request'].userPrincipal.principal == null}">
				<div style="float: right;">
					<ul class="nav navbar-nav">
						<li class="dropdown"><a
							href="<spring:url value="/loginUri"/>" class="dropdown-toggle"
							role="button" aria-haspopup="true" aria-expanded="false">Login</a>
						</li>
					</ul>
				</div>
			</c:if>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>