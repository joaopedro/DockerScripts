<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.tarefas.createTemplateDocument.criarTemplates" var="criarTemplates" />
<fmt:message key="ipdms.tarefas.createTemplateDocument.tipoTemplate" var="tipoTemplate" />
<fmt:message key="ipdms.tarefas.createTemplateDocument.templates" var="templates" />
<fmt:message key="ipdms.forms.anterior" var="anterior" />
<fmt:message key="ipdms.forms.anterior.title" var="anteriorTitle" />

<script type="text/javascript">	
		document.title = '${productName} - ${criarTemplates}';	 
	</script>
<div class="row" style="padding-top: 0px; text-align:left;">
<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
	<tbody>
		<tr>
			<td class="titulo1">${criarTemplates}</td>
		</tr>
	</tbody>
</table>
</div>
<br />
<div class="row formlabel_sf" style="margin-bottom:40px;">
	<div class="leftTab label" style="width: 15%; " title="${tipoTemplate}">${tipoTemplate}</div>
	<div class="label" style="width: 82%;" title="${tipoTemplate}">
		<select id="tipoTemplate" onchange="refreshListTemplates(this);">
			<option value=""></option>
			<c:forEach var="tipo" items="${tiposTemplate}">
				<option value="${tipo.id}" title="${tipo.designacao}">${tipo.designacao}</option>
			</c:forEach>
		</select>
	</div>
</div>
<fieldset>
	<legend>${templates}</legend>
	<div id="divlisTemplates"><jsp:include page="listTemplatesByTipoTemplate.jsp" /></div>
</fieldset>
<br />
<div class="buttonRow">
	<input type="button" onclick="window.location.href='${pageContext.request.contextPath}${retorno}';" class="btForm" value='${anterior}' title="${anteriorTitle}" />
</div>

<form id="templateForm" action="${pageContext.request.contextPath}/tarefas/emitirtemplate.do2">
<input type="hidden" id="urlAnterior" name="urlAnterior" value="${urlAnterior}" />
<input type="hidden" id="numero" name="numero" value="${numero}" />
<input type="hidden" id="etapa" name="etapa" value="${etapa}" />
<input type="hidden" id="templateId" name="templateId" value="" />
<input type="hidden" id="nid" name="nid" value="${nid}" />
</form>

<script>
refreshListTemplates = function(select) {
	var value = $F(select);
	new Ajax.Updater( {success: 'divlisTemplates'}, '${pageContext.request.contextPath}/createTemplateDocument.do2?method=listTemplates',  
						{method: 'get', parameters: 'tipoTemplateId=' + value, evalScripts: true} );
}

submitForm = function(templateId) {
	$('templateId').value = templateId;
	$('templateForm').submit();
}
</script>
