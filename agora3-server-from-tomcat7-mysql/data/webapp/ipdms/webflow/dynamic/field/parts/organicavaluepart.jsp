<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${not empty fieldInstance}">
	<c:if test="${not empty fieldInstance.relationObject}">
		${fieldInstance.relationObject.designacao}
	</c:if>
</c:if>