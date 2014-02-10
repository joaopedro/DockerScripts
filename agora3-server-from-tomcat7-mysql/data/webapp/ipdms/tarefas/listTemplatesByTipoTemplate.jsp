<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:message key="ipdms.tarefas.createTemplateDocument.templates.empty" var="templatesEmpty" />

<c:choose>
	<c:when test="${not empty templates}">
		<c:forEach var="template" items="${templates}">
			<p><a href="#" onclick="submitForm('${template.id}');" class="formfield">${template.titulo}</a></p>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<span class="formfield">${templatesEmpty}</span>
	</c:otherwise>
</c:choose>
