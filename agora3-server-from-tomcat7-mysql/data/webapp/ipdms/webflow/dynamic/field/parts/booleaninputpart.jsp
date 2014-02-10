<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="extraproperties" />
<c:if test="${not empty fieldInstance && fieldInstance.value}">
	<c:set var="extraproperties">${extraproperties} checked="checked"</c:set>
</c:if>
<c:if test="${not empty field.relations}">
	<c:set var="extraproperties">${extraproperties} onChange="${dfieldId}_changed();"</c:set>
</c:if>
<c:if test="${!field.enabled}">
	<c:set var="extraproperties">${extraproperties} disabled="true"</c:set>
</c:if>
<input type="checkbox" id="${dfieldId}" name="${dfieldId}" ${extraproperties}/>