<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:if test="${includeItemAll == 'true'}">
	<option value="${includeItemAllValue}">
		<fmt:message key="ipdms.forms.todos"/>
	</option>
</c:if>
<c:forEach items="${variantes }" var="variante">
	<c:if test="${param.selected == variante.id.numeroConteudo}">
		<option value="${variante.id.numeroConteudo }" selected="selected">${variante.titulo }</option>
	</c:if>
	<c:if test="${param.selected != variante.id.numeroConteudo}">
		<option value="${variante.id.numeroConteudo }">${variante.titulo }</option>
	</c:if>

</c:forEach>