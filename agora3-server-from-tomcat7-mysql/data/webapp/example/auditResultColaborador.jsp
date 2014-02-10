<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<LINK href='${pageContext.request.contextPath}/ipdms/themes/estilos.css' type=text/css rel=stylesheet>
<LINK href='${pageContext.request.contextPath}/ipdms/themes/forms.css' type=text/css rel=stylesheet>


<h1>Historico de Alterações:</h1>

<br/>
<c:forEach items="${result}" var="listOfChanges">
	<fieldset>
	<legend class="formlable">Data da Operação: <fmt:formatDate value="${listOfChanges.key.time}" pattern="dd-MM-yyyy hh:mm:ss"/> </legend>
	<c:forEach items="${listOfChanges.value}" var="auditRecord" varStatus="i">
		<table>
		<c:if test="${i.index == 0}">
			<tr>
				<td class="formlabel">Tipo Alteração: ${auditRecord.log.operation}, Utilizador: ${auditRecord.colaborador.titulo}</td>
			</tr>
		</c:if>	
			<tr>
				<table>
					<tr>
						<td class="formfield"> - <b>Campo:</b> <i>${auditRecord.log.property}</i>
						<b>de</b> ${auditRecord.log.oldValue} <b>para</b> ${auditRecord.log.newValue}
						</td>
					</tr>
				</table>
			</tr>
		</table> 
	</c:forEach>
	</fieldset>
</c:forEach>
<c:if test="${empty result}">
	<span class="formfield">Não existem alterações para este utilizador</span>
</c:if>