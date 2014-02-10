<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${not empty fieldInstance}">
	<c:forEach items="${field.nivel.valoresDimensionaisActivos}" var="option">
		<c:if test="${option.numeroConteudo == fieldInstance.value}">${option.descricao}</c:if>
	</c:forEach>
</c:if>

