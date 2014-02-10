<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<table class="centro" width="900px" cellspacing="1">
	<tr>			
		<th class="centro"><fmt:message key="ipdms.administration.import.error.type" /></th>
		<th class="centro"><fmt:message key="ipdms.administration.import.error.line" /></th>
		<th class="centro"><fmt:message key="ipdms.administration.import.error.object" /></th>
		<th class="centro"><fmt:message key="ipdms.administration.import.error.detail" /></th>
	</tr>
<c:forEach items="${importErrors}" var="error">
	<tr>
		<td class="centro">${error.objectTypeName}</td>
		<td class="centro">
			<c:if test="${error.index > 0}">${error.index}</c:if>
		</td>
		<td class="centro">${error.importObject}</td>
		<td class="centro">
			<c:choose>
				<c:when test="${not empty error.exceptionError}">${error.exceptionError}</c:when>
				<c:otherwise>${error.message}</c:otherwise>
			</c:choose>
		</td>
	</tr>
</c:forEach>
</table>				
