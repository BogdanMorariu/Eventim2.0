<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<jsp:include page="includes.jsp"/>
<table style="width:100%">
    <tr>
        <td>
            <tiles:insertAttribute name="header" />
        </td>
    </tr>
    <tr>
        <td>
            <tiles:insertAttribute name="body" />
        </td>
    </tr>
    <tr>
        <td>
            <tiles:insertAttribute name="footer" />
        </td>
    </tr>
</table>