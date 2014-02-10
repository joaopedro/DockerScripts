<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rowsSize" value="3" />
<c:if test="${not empty field.numberOfRows}">
	<c:set var="rowsSize" value="${field.numberOfRows}" />
</c:if>
<c:set var="columnsSize" value="40" />
<c:if test="${not empty field.numberOfColumns}">
	<c:set var="columnsSize" value="${field.numberOfColumns}" />
</c:if>
<c:set var="textAreaDisabled" />
<c:if test="${!field.enabled}">
	<c:set var="textAreaDisabled" value="readonly='readonly'" />
</c:if>
<textarea rows="${rowsSize}" cols="${columnsSize}" 
	id="${dfieldId}" name="${dfieldId}" ${textAreaDisabled}>${fieldInstance.value}</textarea>	