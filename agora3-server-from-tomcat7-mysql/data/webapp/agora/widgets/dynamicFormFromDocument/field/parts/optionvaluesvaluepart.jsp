<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${not empty fieldInstance}">
	<c:forEach items="${field.options}" var="option">
		<c:if test="${option.value == fieldInstance.value}">${option.label}</c:if>
	</c:forEach>
</c:if>