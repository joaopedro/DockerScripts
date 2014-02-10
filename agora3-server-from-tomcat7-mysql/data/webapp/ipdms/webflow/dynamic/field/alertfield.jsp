<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${field.changeLine}">
		<c:if test="${not changeline}">
			</div>
		</c:if>
	    <c:set var="changeline" value="${field.changeLine}" scope="request" />
	</c:when>

</c:choose>