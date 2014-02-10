<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="titulo2">
	<c:choose>
	<c:when test="${log != null}">
		<fmt:message key="guichetelectronico.homepage.welcome" bundle="${guichetBundle}"/> 
		${pageContext.request.username}&nbsp;&nbsp;
	</c:when>
	<c:otherwise><fmt:message key="guichetelectronico.homepage.mensagem" bundle="${guichetBundle}"/></c:otherwise>
	</c:choose>
</div>
<br />