<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: info
  Date: 17.08.2017
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<spring:url value="/" var="externalAddress"/>
<h1 class="offset7"><u>Events:</u></h1>
<div class="col-sm-8 offset2">
    <table class="table table-striped table-hover" style="background:ghostwhite; opacity: 75%">
        <thead>
            <td>Image</td>
            <td>Event</td>
            <td>Location</td>
            <td>StartDate - EndDate</td>
            <td>Performers</td>
            <td>Price</td>
            <td>Tickets</td>
        </thead>
        <c:forEach items="${events}" var="event">

            <tr>
                <td width="200"><img width="200" src="${event.imageBase64}"/></td>
                <td>${event.name}</td>
                <td>${event.location}</td>
                <td><fmt:formatDate pattern = "yyyy-MM-dd" value = "${event.startDate}"/>
                    <b> - </b>
                    <fmt:formatDate pattern = "yyyy-MM-dd" value = "${event.endDate}"/>
                </td>
                <td>
                    <a href="${externalAddress}artists/viewArtistsByEvent/${event.id}">View Upcoming Performers</a>
                </td>
                <td>${event.price}</td>
                <td>
                    <a href="../tickets/${event.id}/createTicket">Buy Tickets</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
