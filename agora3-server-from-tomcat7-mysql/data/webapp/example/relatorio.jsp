<%@ taglib prefix="html" uri="/tags/html"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html:form action="applicationFlow" method="post">
<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">

<html:errors/>
<table width="100%" cellpadding="1" cellspacing="1" style="border:none">
	<tr><td>&nbsp;</td></tr>

	<c:if test="${empty savingDocumentExceptions and empty conversionDocumentExceptions}">
	<tr>
		<td class="formlabel">
			O seu pedido foi correctamente registado, com o numero ${teste.servicoOnline.idProcessoEntidade}.
		</td>
	</tr>
	</c:if>

	<tr>
		<td class="formlabel">
			O seu pedido foi registado, com o numero ${teste.servicoOnline.idProcessoEntidade}, <b>no entanto ocorreram alguns erros.</b>
		</td>
	</tr>
	<c:if test="${not empty savingDocumentExceptions}">
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td class="fomlabel">
				<fieldset>
					<legend>Erros na gravação:</legend>
					<table>
					<c:forEach items="${savingDocumentExceptions}" var="ex">
						<tr><td class="formfield">Ficheiro ${ex.filename} com descrição ${ex.description} não foi anexado ao processo.</td></tr>
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
					<legend>Erros na conversão:</legend>
					<table>
					<c:forEach items="${conversionDocumentExceptions}" var="ex1">
						<tr><td class="formfield">Documento ${ex1.documento.numeroConteudo}:${ex1.documento.versaoConteudo} não foi convertido para PDF nem assinado com certificado.</td></tr>
					</c:forEach>
					</table>
				</fieldset>
			</td>
		</tr>
	</c:if>	
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="formlabel">
			<c:if test="${teste.servicoOnline.workflowId==null}">
				O Processo não lançou Workflow! Na Administração, as variantes podem ser configuradas para lançar ou não workflow!
			</c:if>
			<c:if test="${teste.servicoOnline.workflowId!=null}">
				Para distribuir o processo clique 
				<a href="${pageContext.request.contextPath}/currentNotification.do2?processId=${teste.servicoOnline.workflowId}&processType=${teste.servicoOnline.variante.processo.codigoWorkflow}" class="webflow_link">aqui</a>
			</c:if>
		</td>
	</tr>
	<c:if test="${not empty teste.linkPDF }">
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="formlabel">
			Grave o resumo a partir do link 
			<a href="${pageContext.request.contextPath}/${teste.linkPDF}" class="webflow_link" target="_blank">
			${teste.servicoOnline.idProcessoEntidade}</a>.
		</td>
	</tr>
	</c:if>
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td colspan="2" style="text-align:center;">
			<html:submit property="_eventId_next" value="Terminar" styleClass="btForm" onclick="ajaxSubmitReferer(event,'${referer}');"/>
		</td>
	</tr>	
</table>
</html:form>