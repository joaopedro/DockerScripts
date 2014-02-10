<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://ajaxtags.org/tags/ajax" prefix="ajax" %>

<fmt:message key="ipdms.modules.templates.template.criar" var="criar" />
<fmt:message key="ipdms.seleccionar" var="seleccionar" />
<fmt:message key="ipdms.todos" var="todos" />
<fmt:message key="ipdms.nenhum" var="nenhum" />
<fmt:message key="ipdms.modules.templates.template.id" var="templateId" />
<fmt:message key="ipdms.forms.editar" var="editar" />
<fmt:message key="ipdms.forms.eliminar" var="eliminar" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />


<script type="text/javascript">

 function deleteTemplate(btn){
	
	if(btn=='yes')
		removeTemplate();
	else
		false;
	}

 editTemplate = function(templateId) {
	 if(templateId) {
		 $('templateId').value = templateId;
	 }
	 $('editTemplateForm').submit();
 };
 
</script>

<div class="alignLeft">
	<div class="left" onclick="editTemplate();">
		<img src="${pageContext.request.contextPath}/images/icon/icon-criarNovo.png" class="cursorMao" alt="${criar}" title="${criar}" />
	</div>
	<div class="right" onclick="editTemplate();">
		<div class="texto"><a href="#" title="${criar}">${criar}</a></div>
	</div>
</div>
<c:choose>
	<c:when test="${not empty templates}">
		<c:set var="tipoTemplateTitle"><fmt:message key="ipdms.modules.templates.template.tipotemplate" /></c:set>
		<c:set var="tituloTitle"><fmt:message key="ipdms.modules.templates.template.titulo" /></c:set>
		<c:set var="ficheiroTitle"><fmt:message key="ipdms.modules.templates.template.ficheiro" /></c:set>
		
		&nbsp; 
		<span class="formlabel_select">
			${seleccionar} <a href="#" onclick="Checkboxes(true);" class="formlabel_select" title="${todos}">${todos}</a>,
				 		  <a href="#" onclick="Checkboxes(false);" class="formlabel_select" title="${nenhum}">${nenhum}</a>
		</span><br/><br/>

<div style="padding-left:1%;">				
		<ajax:displayTag id="displayTagFrameTemplates" baseUrl="${pageContext.request.contextPath}/templates/templatesAction.do2" parameters="method=list">

		<display:table id="tipo" name="${templates}" htmlId="worklist" requestURI="" pagesize="10" style="width:98%;">
			<display:column title="${templateId}" property="id" style="width:6%;" />
			<display:column title="${tipoTemplateTitle}" property="tipoTemplate.designacao" style="width:15%;"/>
			<display:column title="${tituloTitle}" property="titulo" />
			<display:column title="${ficheiroTitle}" property="nomeOriginalFicheiro" />
			<display:column title="${editar}" style="width:6%; text-align:center;">
				<a href="#" onclick="editTemplate('${tipo.id}');"> <img
					src="${pageContext.request.contextPath}/images/icon/icon-editar.png"
					class="cursorMao" alt="${editar}" title="${editar}" style="border:none" /> </a>
			</display:column>
			<display:column title="${eliminar}"  style="width:6%">
				<div class="alignCenter"><label for="removeRow_${tipo.id}"><input type="checkbox"
					id="removeRow_${tipo.id}" name="removeRow_${entidades.id}"
					value="checked" class="radion" style="border:0;" /></label></div>
			</display:column>

			<display:footer>
				<td colspan="6" class="tableFooter">&nbsp;</td>
				<td class="tableFooter alignCenter"><img
					src="${pageContext.request.contextPath}/images/icon/icon-lixo.png"
					onclick="cancelar(event,'<fmt:message key="ipdms.modules.templates.template.titulotab" />','<fmt:message key="ipdms.modules.templates.templates.removeconfirmation" />',deleteTemplate,'${sim}','${nao}');" class="cursorMao" alt="${eliminar}"
					title="${eliminar}" /></td>
			</display:footer>
		</display:table>

		</ajax:displayTag>
		</div>
	</c:when>
	<c:otherwise>
		<span class="formlabel"> <fmt:message
			key="ipdms.modules.templates.templates.empty" /> </span>
	</c:otherwise>
</c:choose>

<form action="templatesAction.do2" id="editTemplateForm">
	<input type="hidden" id="templateId" name="templateId" />
	<input type="hidden" name="method" value="edit" />
</form>
