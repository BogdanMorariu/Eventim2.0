<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Eventim 2.0 Administration</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
 	<ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Events<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href='<spring:url value="/event/createEvent"/>'>Create New Event</a></li>
              <li><a href='<spring:url value="/event/listEvents"/>'>Manage Events</a></li>
          </ul>
        </li>
 	</ul> 
 	 <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Artists<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href='<spring:url value="../artists/createArtist"/>'>Create New Artist</a></li>
              <li><a href='<spring:url value="../artists/listArtists"/>'>Manage Artists</a></li>
          </ul>
        </li>
 	</ul> 
 		 <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Categories<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href='<spring:url value="../categories/createCategory"/>'>Create New Category</a></li>
              <li><a href='<spring:url value="../categories/listCategories"/>'>Manage Categories</a></li>
          </ul>
        </li>
 	</ul> 
 	<ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Tickets<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href='<spring:url value="../tickets/createTicket"/>'>Create New Ticket</a></li>
              <li><a href='<spring:url value="../tickets/createTicket"/>'>Manage Tickets</a></li>
          </ul>
        </li>
 	</ul>
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Users<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href='<spring:url value="/users/updateUsers"/>'>Update Users</a></li>
            <li><a href='<spring:url value="/users/deleteUser"/>'>Delete Users</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>