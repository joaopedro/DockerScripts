<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${not empty fieldInstance}">
	<c:if test="${not empty fieldInstance.relationObject}">
		${fieldInstance.relationObject.designacao}
	</c:if>
</c:if>