<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="extraproperties" />
<c:if test="${not empty field.relations}">
	<c:set var="extraproperties">onChange="${dfieldId}_changed();"</c:set>
</c:if>
<c:if test="${!field.enabled}">
	<c:set var="extraproperties">${extraproperties} disabled="true"</c:set>
</c:if>

<select id="${dfieldId}" name="${dfieldId}" ${extraproperties}>
<option />

<c:forEach items="${field.orderedOptions}" var="option">
	<c:set var="extrapropertiesoption" />
	<c:if test="${not empty fieldInstance && fieldInstance.value == option.value}">
		<c:set var="extrapropertiesoption">selected="selected"</c:set>
	</c:if>
	<option value="${option.value}" ${extrapropertiesoption}>${option.label}</option>			
</c:forEach>
</select>