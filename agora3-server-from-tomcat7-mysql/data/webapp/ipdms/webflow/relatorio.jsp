<%@ taglib prefix="html" uri="/tags/html"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html:form action="applicationFlow" method="post">
<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">

<html:errors/>

<fmt:message key='ipdms.forms.terminar' var="terminar" />
<fmt:message key='ipdms.forms.terminar.title' var="terminarTitle" />

<bean:define id="id" name="webflowActionForm" property="servicoOnline.idProcessoEntidade"  />
<logic:present name="webflowActionForm" property="servicoOnline.workflowId">
	<bean:define id="workflowId" name="webflowActionForm" property="servicoOnline.workflowId"/>
	<bean:define id="workflowType" name="webflowActionForm" property="servicoOnline.variante.processo.codigoWorkflow"  />
</logic:present>
<logic:notEmpty name="webflowActionForm" property="servicoOnline.workflowId">
</logic:notEmpty>


<table width="100%" cellpadding="1" cellspacing="1" style="border:none;">
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="formlabel">
 			<fmt:message key='ipdms.instrucao.pedidoregistado'/> ${id}.
		</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<c:if test="${empty flowExecutionContext.activeSession.parent}">
		<tr>
			<td class="formlabel">
			<logic:notPresent name="webflowActionForm" property="servicoOnline.workflowId">
				<fmt:message key='ipdms.instrucao.workflow.notPresent'/>
			</logic:notPresent>
			<logic:present name="webflowActionForm" property="servicoOnline.workflowId">
				<fmt:message key='ipdms.instrucao.distribuirprocesso'/> 
	 				<a href="${pageContext.request.contextPath}/currentNotification.do2?processId=${workflowId}&processType=${workflowType}" class="webflow_link"><fmt:message key='ipdms.instrucao.distruirprocesso.aqui'/> </a>
			</logic:present>
			</td>
		</tr>
	</c:if>
	<c:if test="${not empty linkPDF }">
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="formlabel">
			<fmt:message key='ipdms.instrucao.gravarresumo'/> 
			<a href="${pageContext.request.contextPath}/${linkPDF}" class="webflow_link" target="_blank">
				${id}
			</a>.
		</td>
	</tr>
	</c:if>
</table>

<div class="buttonRow">
	<html:submit property="_eventId_next" value="${terminar}" styleClass="btForm" onclick="ajaxSubmitReferer(event,'${referer}');" title="${terminarTitle}"/>
</div>
</html:form>
