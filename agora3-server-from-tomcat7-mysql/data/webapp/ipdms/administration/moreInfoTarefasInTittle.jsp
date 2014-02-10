<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:message key="ipdms.etapa.moreInfoTarefasInTittle.empty" var="emptyMsg" />

<c:choose>
	<c:when test="${not empty collectionName}">
		<c:set var="more_info" value=" &#10;&#10;"  scope="request"></c:set>
		<c:forEach items="${collectionName}" var="object">
			<c:set var="more_info" value="${more_info}> ${object.id.tarefa.titulo} (Ordem: ${object.ordem}, Tipo: ${object.tipo})&nbsp;&#10;<br />" scope="request"></c:set>
		</c:forEach>
		${more_info}
	</c:when>
	<c:otherwise>
		<c:set var="more_info" value="${emptyMsg}" scope="request"></c:set>
		${more_info}<br/>
	</c:otherwise>
</c:choose>