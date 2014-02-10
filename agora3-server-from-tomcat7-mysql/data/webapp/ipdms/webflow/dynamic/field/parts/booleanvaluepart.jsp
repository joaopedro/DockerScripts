<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />

<c:if test="${not empty fieldInstance}">
	<c:choose>
		<c:when test="${fieldInstance.value}">${sim}</c:when>
		<c:otherwise>${nao}</c:otherwise>
	</c:choose>
</c:if>