<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:choose>
	<c:when test="${not empty recolhas}">
		<table class="centro" width="80%" cellspacing="1">
			<caption><fmt:message key="ipdms.tarefas.importrecolha.recolhas.title" /></caption>
			<tr class="listHeader">
				<th class="centro"><fmt:message key="ipdms.tarefas.importrecolha.recolhas.datarecolha" /></th>
				<th class="centro"><fmt:message key="ipdms.tarefas.importrecolha.recolhas.operador" /></th>
				<th class="centro"><fmt:message key="ipdms.tarefas.importrecolha.recolhas.observacoes" /></th>
				<th class="centro"><fmt:message key="ipdms.tarefas.importrecolha.recolhas.numerorespostas" /></th>				
			</tr>
			<c:forEach var="r" items="${recolhas}">
			<tr>
				<td class="centro">
					<a onclick="importRecolha(${r.id},event);">
						<fmt:formatDate value="${r.dataRecolha.time}" pattern="dd-MM-yyyy HH:mm" />
					</a>
				</td>
				<td class="centro">
					<a onclick="importRecolha(${r.id},event);">
						${r.operador.username}
					</a>
				</td>
				<td class="centro">${r.observacoes}</td>
				<td class="centro">${fn:length(r.respostas)}</td>
			</tr>
			</c:forEach>
		</table>
	</c:when>
	<c:otherwise>
		<br>&nbsp;&nbsp;<fmt:message key="ipdms.tarefas.importrecolha.recolhas.empty" /><br><br>
	</c:otherwise>
</c:choose>
