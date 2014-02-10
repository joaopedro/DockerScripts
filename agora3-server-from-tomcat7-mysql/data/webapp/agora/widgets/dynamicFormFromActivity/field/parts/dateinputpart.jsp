<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="extraproperties" />
<c:if test="${not empty fieldInstance}">
	<c:set var="extraproperties">${extraproperties} value="${fieldInstance.value}"</c:set>
</c:if>
<c:if test="${not empty field.relations}">
	<c:set var="extraproperties">${extraproperties} onChange="${dfieldId}_changed();"</c:set>
</c:if>		
<c:if test="${!field.enabled}">
	<c:set var="extraproperties">${extraproperties} disabled="true"</c:set>
</c:if>

<input type="text" id="${dfieldId}" name="${dfieldId}" class="date" ${extraproperties} size="10" maxlength="10"/>
<script>
    Calendar.setup({ inputField : '${dfieldId}', ifFormat : '%d-%m-%Y', showsTime : false });
</script>