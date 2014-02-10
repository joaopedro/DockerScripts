<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:choose>
	<c:when test="${not empty templates}">		
		<c:forEach var="template" items="${templates}">
 			<div style="margin-left: 10px;">
				<input type="radio" name="template" id="template" value="${template.id}" >${template.titulo}</input>
			</div>		
		</c:forEach>
	</c:when>
	<c:otherwise>
		<span class="formfield"><fmt:message key="ipdms.instrucao.template.inexistentes" /></span>
	</c:otherwise>
</c:choose>