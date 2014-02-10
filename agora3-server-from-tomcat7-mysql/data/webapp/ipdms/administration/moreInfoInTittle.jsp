<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose>
	<c:when test="${not empty collectionName}">
	<c:set var="more_info" value="&#10;&#10;" scope="request"></c:set>
		<c:forEach items="${collectionName}" var="object"> 
			<c:set var="more_info" value=" ${more_info} > ${object.titulo}<br />" scope="request"></c:set>
		</c:forEach>	
	 ${more_info}
	</c:when>
	<c:otherwise>
		<c:set var="more_info" value="${noinfo}" scope="request"></c:set>
		${more_info}<br/>
	</c:otherwise>
</c:choose>

