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
            <li><a href='<spring:url value="/updateMilestones"/>'>Create new Event</a></li>
              <li><a href='<spring:url value="/updateMilestones"/>'>Update Event</a></li>
                <li><a href='<spring:url value="/updateMilestones"/>'>Delete Event</a></li>
          </ul>
        </li>
 	</ul> 
 	 <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Artists<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href='<spring:url value="/updateMilestones"/>'>Create new Artist</a></li>
              <li><a href='<spring:url value="/updateMilestones"/>'>Update Artist</a></li>
                <li><a href='<spring:url value="/updateMilestones"/>'>Delete Artist</a></li>
          </ul>
        </li>
 	</ul> 
 		 <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Categories<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href='<spring:url value="/updateMilestones"/>'>Create new Category</a></li>
              <li><a href='<spring:url value="/updateMilestones"/>'>Update Category</a></li>
                <li><a href='<spring:url value="/updateMilestones"/>'>Delete Category</a></li>
          </ul>
        </li>
 	</ul> 
 	<ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Tickets<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href='<spring:url value="/updateMilestones"/>'>Create new Ticket</a></li>
              <li><a href='<spring:url value="/updateMilestones"/>'>Update Ticket</a></li>
                <li><a href='<spring:url value="/updateMilestones"/>'>Delete Ticket</a></li>
          </ul>
        </li>
 	</ul>
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Users<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href='<spring:url value="/users/updateUser"/>'>Update Users</a></li>
            <li><a href='<spring:url value="/users/deleteUser"/>'>Delete Users</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>