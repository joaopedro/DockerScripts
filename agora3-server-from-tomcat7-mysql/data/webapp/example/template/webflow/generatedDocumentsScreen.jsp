<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:errors/>
	
<html:form styleId="templateForm" action="applicationFlow" method="post" >
	<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">	
		
	<c:if test="${not empty templateFlow.docsGerados}">	
		<table cellspacing="0" cellpadding="0" width="100%" class="centro">
			<tr>
				<th class="centro" style="width:20%"><fmt:message key="ipdms.instrucao.entidade" /></th>
				<th class="centro" style="width:80%"><fmt:message key="ipdms.instrucao.documento" /></th>									
			</tr>
			<c:forEach items="${templateFlow.docsGerados}" var="doc">				
				<tr>
					<td class="centro">
						${doc.key.nome}								
					</td>					
					<td class="centro">						
						<a href="${pageContext.request.contextPath}/file/getDocumentoTemplateInstrucao.do2?tmpfile=${doc.value.file.formFile.fileName}" target="_blank">
							${doc.value.file.description}
						</a>
					</td>					
				</tr>
			</c:forEach>
		</table>				
	</c:if>
	
	
	<c:if test="${empty templateFlow.docsGerados}">
		<span class="formfield"><fmt:message key="ipdms.instrucao.template.nenhumdocumentogerado" /></span>
	</c:if>
				
	<div class="buttonRow">
		<html:submit property="_eventId_back" value="« Anterior" styleClass="btForm" onclick="webflowAjaxRequest(event);" title="Retroceder ao ecrã anterior"/>
		<html:submit property="_eventId_next" value="Seguinte »" styleClass="btForm" onclick="webflowAjaxRequest(event);" title="Avançar para o ecrã seguinte"/>
		<html:button property="_eventId_cancel" value="Cancelar" styleClass="btFormEscuro" onclick="cancelar(event,'Pedidos', 'Deseja cancelar pedido ?',decisao);" title="Cancelar a operação"/>			
	</div>		
</html:form>
