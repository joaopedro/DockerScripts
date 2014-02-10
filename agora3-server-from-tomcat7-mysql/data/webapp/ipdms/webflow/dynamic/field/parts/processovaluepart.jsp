<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${not empty fieldInstance}">
	<c:if test="${not empty fieldInstance.relationObject}">${fieldInstance.relationObject.idProcessoEntidade} ${fieldInstance.relationObject.variante.titulo}</c:if>
</c:if>