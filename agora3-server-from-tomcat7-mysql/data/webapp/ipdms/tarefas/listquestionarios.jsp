<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<fmt:message key="ipdms.tarefas.importrecolha.recolhaSelecionada" var="recolhaSelecionada" />
<fmt:message key="ipdms.tarefas.importrecolha.removerRecolha" var="removerRecolha" />
<fmt:message key="ipdms.tarefas.importrecolha.importarRecolha" var="importarRecolha" />
<fmt:message key="ipdms.tarefas.importrecolha.confirmMsg" var="confirmMsg" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<SCRIPT type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ConfirmCancel.js"></SCRIPT>
<SCRIPT src='${JS_DIR}/swf-ajax-ext.js' type="text/javascript"></script>

<div id="ver_ajuda" class="row" style="padding-top:0px; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1"><fmt:message key="ipdms.tarefas.importrecolha.titulo" /></td>
		  </tr>
		</tbody>
	</table>					
</div>

<html:form action="${urlAnterior}&dontLoadDynamicForm=true">
	<html:errors/>

	<input type="hidden" name="method" value="prepare">
	<input type="hidden" id="recolhaId" name="recolhaId" value="" />

	<c:if test="${notificationForm.recolhaBeingProcessed != null}">
		<fieldset>
			<legend>${recolhaSelecionada}</legend>
			<div class="row formlabel_sf" >
				<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.tarefas.importrecolha.recolhas.datarecolha' />">
					<fmt:message key="ipdms.tarefas.importrecolha.recolhas.datarecolha" />
				</div>
			  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.tarefas.importrecolha.recolhas.datarecolha' />">
			  		<fmt:formatDate value="${notificationForm.recolhaBeingProcessed.dataRecolha.time}" pattern="dd-MM-yyyy HH:mm" />
		  		</div>
			</div>
			<div class="row formlabel_sf" >
				<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.tarefas.importrecolha.recolhas.operador' />">
					<fmt:message key="ipdms.tarefas.importrecolha.recolhas.operador" />
				</div>
			  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.tarefas.importrecolha.recolhas.operador' />">
			  		${notificationForm.recolhaBeingProcessed.operador.username}
		  		</div>
			</div>
			<div class="row formlabel_sf" >
				<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.tarefas.importrecolha.recolhas.observacoes' />">
					<fmt:message key="ipdms.tarefas.importrecolha.recolhas.observacoes" />
				</div>
			  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.tarefas.importrecolha.recolhas.observacoes' />">
			  		${notificationForm.recolhaBeingProcessed.observacoes}
		  		</div>
			</div>
			<div class="row formlabel_sf" >
				<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.tarefas.importrecolha.recolhas.numerorespostas' />">
					<fmt:message key="ipdms.tarefas.importrecolha.recolhas.numerorespostas" />
				</div>
			  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.tarefas.importrecolha.recolhas.numerorespostas' />">
			  		${fn:length(notificationForm.recolhaBeingProcessed.respostas)}
		  		</div>
			</div>
			<div class="row formlabel_sf" >
				<div class="leftTab label" style="width: 70%; ">
				<input type="submit" title="${removerRecolha}" value="${removerRecolha}" class="btForm" onclick="this.form.action='${pageContext.request.contextPath}/importRecolhaIntoNotification.do2?method=removeRecolha';">
				</div>
			</div>
		</fieldset>
	</c:if>
	
	<br/>
	<c:choose>
		<c:when test="${not empty questionarios}">
		<table border="0" cellpadding="0" cellspacing="0" class="headings">		
		
			<c:forEach items="${questionarios}" var="questionario">
			<c:set var="qId" value="${questionario.id}" />
			<c:set var="trtitle">${questionario.descricao} &nbsp;(<fmt:formatDate value="${questionario.dataCriacao.time}" pattern="dd-MM-yyyy"/>)</c:set>
			<tr id="${qId}_open">
				<td class="titulo2" style="width:3%;">
					<a href="#" onclick="openRecolhas('${qId}');">
						<img src="images/icon/seta_seccao_fecha.png" alt="${trtitle}" title="${trtitle}"/>
					</a>
				</td>
				<td class="titulo2">
					<a href="#" onclick="openRecolhas('${qId}');" class="formfield">
						${trtitle}
					</a>
				</td>
			</tr>
			<tr id="${qId}_close" style="display: none;">
				<td class="titulo2" style="width:3%;">
					<a href="#" onclick="closeRecolhas('${qId}');">
						<img src="images/icon/seta_seccao_abre.png" alt="${trtitle}" title="${trtitle}"/>
					</a>
				</td>
				<td class="titulo2">
					<a href="#" onclick="closeRecolhas('${qId}');" class="formfield">
						${trtitle}
					</a>
				</td>
			</tr>
			<tr id="${qId}_tr" style="display: none;">
				<td id="${qId}_td" colspan="2"></td>
			</tr>
			</c:forEach>
		</table>			
		</c:when>
		<c:otherwise>
			<p>
			&nbsp;&nbsp;<fmt:message key="ipdms.tarefas.importrecolha.questionarios.empty" />
			</p>
		</c:otherwise>
	</c:choose>
	<br />
	<div class="buttonRow">		
		<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.anterior" />" 
			title="<fmt:message key='ipdms.forms.anterior.title' />" />
	</div>		
</html:form>

<script>
openRecolhas = function (elementid) {
	$(elementid + '_close').show(); 
	$(elementid + '_open').hide();
	$(elementid + '_tr').show();
	//ajax call
	extAjaxRequest('importRecolhaIntoNotification.do2', 
			'method=listRecolha&questionarioId=' + elementid,
			'POST', elementid + '_td');
};

closeRecolhas = function (elementid) {
	$(elementid + '_close').hide(); 
	$(elementid + '_open').show();
	$(elementid + '_tr').hide();	
};


importRecolha = function (id, event) {
	$('recolhaId').value = id;
	cancelar(event,'${importarRecolha}', '${confirmMsg}', decisaoImportRecolha, '${sim}', '${nao}');
};


decisaoImportRecolha = function (btn) {
	if(btn=='yes') {
		window.location.href='${pageContext.request.contextPath}/importRecolhaIntoNotification.do2?method=importRecolha&recolhaId=' + $('recolhaId').value;
	} else {
		return false;
	}
};
</script>
