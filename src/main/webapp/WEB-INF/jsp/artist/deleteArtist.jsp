<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table>
    <c:forEach items="${artists}" var="artist">
        <tr>
            
            <td>${artist.name}</td>
            <td>
            <form action="../artists/removeArtist" method="POST">
             <input type="hidden" name="idValue" value="${artist.id}">
             <input type="submit" value="Delete artist" class="btn-danger"/>
   </form>
            </td>
        </tr>
    </c:forEach>
   	
</table>

