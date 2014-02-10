<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${not empty fieldInstance}">
	<c:forEach items="${field.values}" var="option">
		<c:if test="${option.value == fieldInstance.value}">${option.label}</c:if>
	</c:forEach>
</c:if>