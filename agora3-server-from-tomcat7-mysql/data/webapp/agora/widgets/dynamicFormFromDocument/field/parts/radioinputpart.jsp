<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:forEach items="${field.orderedOptions}" var="option">
	<c:set var="extraproperties" />
	<c:if test="${option.value == fieldInstance.value}">
		<c:set var="extraproperties">CHECKED</c:set>
	</c:if>
	<c:if test="${not empty field.relations}">
		<c:set var="extraproperties">${extraproperties} onChange="${dfieldId}_changed();"</c:set>
	</c:if>
	<c:if test="${!field.enabled}">
		<c:set var="extraproperties">${extraproperties} disabled="true"</c:set>
	</c:if>
	<input type="radio" id="${dfieldId} "name="${dfieldId}" 
		value="${option.value}" ${extraproperties} class="radion"/> ${option.label}
</c:forEach>
