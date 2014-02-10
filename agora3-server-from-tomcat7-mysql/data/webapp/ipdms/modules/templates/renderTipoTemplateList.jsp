<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://ajaxtags.org/tags/ajax" prefix="ajax" %>

<fmt:message key="ipdms.modules.templates.tipotemplate.criar" var="criar" />
<fmt:message key="ipdms.seleccionar" var="seleccionar" />
<fmt:message key="ipdms.todos" var="todos" />
<fmt:message key="ipdms.nenhum" var="nenhum" />
<fmt:message key="ipdms.modules.templates.template.id" var="templateId" />
<fmt:message key="ipdms.forms.editar" var="editar" />
<fmt:message key="ipdms.forms.eliminar" var="eliminar" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />

<script type="text/javascript">

function deleteTipoTemplate(btn){

	if(btn=='yes')
		removeTipoTemplate();
	else
		false;
	}

</script>

<div class="alignLeft">
	<div class="left" onclick="editTipoTemplate();">
		<img src="${pageContext.request.contextPath}/images/icon/icon-criarNovo.png" class="cursorMao" alt="${criar}" title="${criar}" />
	</div>
	<div class="right" onclick="editTipoTemplate();">
		<div class="texto"><a href="#editTipoTemplatePane" title="${criar}">${criar}</a></div>
	</div>
</div>
<div id="editTipoTemplatePane"></div>
<c:choose>
	<c:when test="${not empty tiposTemplate}">
		<c:set var="descricaoTitle">
			<fmt:message key="ipdms.modules.templates.tipotemplate.descricao" />
		</c:set>
		<c:set var="designacaoTitle">
			<fmt:message key="ipdms.modules.templates.tipotemplate.designacao" />
		</c:set>
		&nbsp; 
		<span class="formlabel_select">
			${seleccionar} <a href="#" onclick="Checkboxes(true);" class="formlabel_select" title="${todos}">${todos}</a>,
				 		  <a href="#" onclick="Checkboxes(false);" class="formlabel_select" title="${nenhum}">${nenhum}</a>
		</span><br/><br/>
<div style="padding-left:1%;">		
		<ajax:displayTag id="displayTagFrameTD" baseUrl="${pageContext.request.contextPath}/templates/tipoTemplateAction.do2" parameters="method=list">

		<display:table id="tipo" name="${tiposTemplate}" htmlId="worklist" requestURI="" pagesize="10" style="width:98%">
			<display:column title="${templateId}" property="id" style="width:6%;"/>
			<display:column title="${designacaoTitle}" property="designacao" />
			<display:column title="${descricaoTitle}" property="descricao" />
			<display:column title="${editar}" style="width:6%; text-align:center;">
				<a href="#" onclick="editTipoTemplate('${tipo.id}');"> <img
					src="${pageContext.request.contextPath}/images/icon/icon-editar.png"
					class="cursorMao" alt="${editar}" title="${editar}" style="border:none" /> </a>
			</display:column>
			<display:column title="${eliminar}" style="width:6%;">
				<div class="alignCenter">
					<label for="removeRow_${tipo.id}">
					<input type="checkbox"
					id="removeRow_${tipo.id}" name="removeRow_${entidades.id}"
					value="checked" class="radion" style="border:0;" /></label></div>
			</display:column>
			<display:footer>
				<td colspan="4" class="tableFooter">&nbsp;</td>
				<td class="tableFooter alignCenter"><img
					src="${pageContext.request.contextPath}/images/icon/icon-lixo.png"
					onclick="cancelar(event,'<fmt:message key="ipdms.modules.templates.tipotemplate.titulo" />','<fmt:message key="ipdms.modules.templates.tipotemplate.removeconfirmation" />',deleteTipoTemplate,'${sim}','${nao}');" class="cursorMao" alt="${eliminar}"
					title="${eliminar}" /></td>
			</display:footer>
		</display:table>

		</ajax:displayTag>
		</div>
	</c:when>
	<c:otherwise>
		<span class="formlabel"> <fmt:message
			key="ipdms.modules.templates.tipotemplate.empty" /> </span>
	</c:otherwise>
</c:choose>
