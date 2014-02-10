<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="extraproperties" />
<c:if test="${!field.enabled}">
	<c:set var="extraproperties">${extraproperties} disabled="true"</c:set>
</c:if>			
<select id="${dfieldId}" name="${dfieldId}" ${extraproperties}>
<option />
<c:forEach items="${field.values}" var="option">
	<c:set var="extrapropertiesoption" />
	<c:if test="${not empty fieldInstance && fieldInstance.value == option.value}">
		<c:set var="extrapropertiesoption">selected="selected"</c:set>
	</c:if>
	<option value="${option.value}" ${extrapropertiesoption}>${option.label}</option>			
</c:forEach>
</select>