<%@ taglib prefix="html" uri="/tags/html"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html:form action="applicationFlow" method="post">
	<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">
	
	<html:errors/>
	<table width="100%" cellpadding="1" cellspacing="1" style="border:none">
		<tr><td>&nbsp;</td></tr>
	
		<c:choose>
			<c:when test="${empty savingDocumentExceptions and empty conversionDocumentExceptions}">
				<tr>
					<td class="formlabel">
						<fmt:message key="ipdms.instrucao.pedidoregistado" >
							<fmt:param value="${templateFlow.servicoOnline.idProcessoEntidade}" />
						</fmt:message>						
					</td>
				</tr>		
			</c:when>
			<c:otherwise>
				<tr>
					<td class="formlabel">
						<fmt:message key="ipdms.instrucao.pedidoregistado.erro" >
							<fmt:param value="${templateFlow.servicoOnline.idProcessoEntidade}" />
						</fmt:message>				
					</td>
				</tr>
			</c:otherwise>
		</c:choose>
		
		<c:if test="${not empty savingDocumentExceptions}">
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td class="fomlabel">
					<fieldset>
						<legend><fmt:message key="ipdms.instrucao.erroconversao" /></legend>
						<table>
						<c:forEach items="${savingDocumentExceptions}" var="ex">
							<tr>
								<td class="formfield">
									<fmt:message key="ipdms.instrucao.anexacao.erro">
										<fmt:param value="${ex.filename}" />
										<fmt:param value="${ex.description}" />
									</fmt:message> 
								</td>
							</tr>
						</c:forEach>
						</table>
					</fieldset>
				</td>
			</tr>
		</c:if>	
		<c:if test="${not empty conversionDocumentExceptions}">
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td class="fomlabel">
					<fieldset>
						<legend><fmt:message key="ipdms.instrucao.erroconversao" /></legend>
						<table>
						<c:forEach items="${conversionDocumentExceptions}" var="ex1">
							<tr>
								<td class="formfield">
									<fmt:message key="ipdms.instrucao.anexacao.erro.conversaopdfnemcertificado">
										<fmt:param value="${ex1.documento.numeroConteudo}" />
										<fmt:param value="${ex1.documento.versaoConteudo}" />
									</fmt:message>
								</td>
							</tr>
						</c:forEach>
						</table>
					</fieldset>
				</td>
			</tr>
		</c:if>	
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td class="formlabel"><fmt:message key="ipdms.instrucao.distribuirprocesso" /> 
			<a href="${pageContext.request.contextPath}/currentNotification.do2?processId=${templateFlow.servicoOnline.workflowId}&processType=${templateFlow.servicoOnline.variante.processo.codigoWorkflow}" class="webflow_link"><fmt:message key="ipdms.instrucao.distruirprocesso.aqui" /></a></td>
		</tr>
		<c:if test="${not empty teste.linkPDF }">
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td class="formlabel">
				<fmt:message key="ipdms.instrucao.gravarresumo" />
				<a href="${pageContext.request.contextPath}/${templateFlow.linkPDF}" class="webflow_link" target="_blank">
				${templateFlow.servicoOnline.idProcessoEntidade}</a>.
			</td>
		</tr>
		</c:if>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td colspan="2" style="text-align:center;">
				<html:button property="_eventId_next" value="Terminar" styleClass="btForm" onclick="window.location.href = '${referer}';"/>
			</td>
		</tr>	
	</table>
</html:form>