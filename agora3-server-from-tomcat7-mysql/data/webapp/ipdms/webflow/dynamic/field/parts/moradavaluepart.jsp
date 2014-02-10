<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${not empty fieldInstance}">
	<input type="hidden" id="${dfieldId}" name="${dfieldId}" value="${fieldInstance.value}"/>
	<span id="${dfieldId}_label">${fieldInstance.relationObject.moradaDescription}</span>
</c:if>