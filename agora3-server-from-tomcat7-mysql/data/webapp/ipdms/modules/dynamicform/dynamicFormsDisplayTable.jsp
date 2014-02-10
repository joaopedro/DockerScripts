<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="/tags/html" prefix="html" %>

<fmt:message key="ipdms.seleccionar" var="seleccionar" />
<fmt:message key="ipdms.todos" var="todos" />
<fmt:message key="ipdms.nenhum" var="nenhum" />
<fmt:message key="ipdms.dynamicform.form.id" var="formId" />
<fmt:message key="ipdms.dynamicform.form.externalid" var="externalid" />
<fmt:message key="ipdms.dynamicform.form.description" var="description" />
<fmt:message key="ipdms.dynamicform.form.creationdate" var="creationdate" />
<fmt:message key="ipdms.dynamicform.field.numberofcampos" var="numcampos" />
<fmt:message key="ipdms.dynamicform.form.consultar" var="consultar" />
<fmt:message key="ipdms.forms.editar" var="editar" />
<fmt:message key="ipdms.dynamicform.form.criarQuestionario" var="criarQuestionario" />
<fmt:message key="ipdms.dynamicform.form.exportarXML" var="exportarXML" />
<fmt:message key="ipdms.dynamicform.form.exportarinstanciasformdyn" var="exportarInst_FD" />
<fmt:message key="ipdms.dynamicform.form.exportarinstanciasformdyn.xml" var="exportarInst_FDXML" />
<fmt:message key="ipdms.dynamicform.form.exportarinstanciasformdyn.xml.confirmMsg" var="exportarInst_FDXMLMsg" />
<fmt:message key="ipdms.dynamicform.form.exportarinstanciasformdyn.xls" var="exportarInst_FDXLS" />
<fmt:message key="ipdms.dynamicform.form.exportarinstanciasformdyn.xls.confirmMsg" var="exportarInst_FDXLSMsg" />
<fmt:message key="ipdms.forms.eliminar" var="eliminar" />
<fmt:message key="ipdms.dynamicform.form.designacaoplural" var="designacaoplural" />
<fmt:message key="ipdms.dynamicform.form.criarQuestionario.confirmMsg" var="criarMsg" />
<fmt:message key="ipdms.dynamicform.form.exportarXML.confirmMsg" var="exportMsg" />
<fmt:message key="ipdms.dynamicform.form.eliminar.confirmMsg" var="eliminarMsg" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />

<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/ConfirmCancel.js"></script>
<script>
//var dynaToDeleteId;

function Checkboxes(state) {
    $$('input[type="checkbox"]').each(function filter(item) {
        {
        item.checked=state;
        }
	});
}

var formId = '';
decisaoCreateQuestionario = function(btn){
	if(btn=='yes'){
		document.location.href = '${pageContext.request.contextPath}/dynamicFormModuleAction.do2?method=createQuestionario&formId=' + formId;
	} else{
		return false;
	}
}

decisaoExportXML= function(btn){
	if(btn=='yes'){
		window.open('${pageContext.request.contextPath}/exportDynamicFormAction.do2?dynamicFormId=' + formId, '_blank');
	} else{
		return false;
	}
}

//	dynamic form instances export
var accao = '';
decisaoExportInstances= function(btn){
	
	if(btn=='yes'){		
		var url = '${pageContext.request.contextPath}/' + accao + '.do2';
		var params = '?dynamicFormId=' + formId;
		window.open(url + params, '_blank');
	} else{
		return false;
	}
}


//if(${not empty delete}) {
//	Ext.example.msg('Formulários Dinâmicos', 'Formulários Dinâmicos removidos com sucesso!');		
//}
</script>

<span class="formlabel_select">
	${seleccionar} <a href="#" onclick="Checkboxes(true);" class="formlabel_select" title="${todos}">${todos}</a>,
				   <a href="#" onclick="Checkboxes(false);" class="formlabel_select" title="${nenhum}">${nenhum}</a>
</span><br/><br/>

<display:table id="dinamicForms" name="${paginatedList}" htmlId="worklist"  requestURI="${originalMapping}.do2" style="cursor: pointer">
	<display:column title="${formId}" property="id" sortable="true"/>
	<display:column title="${externalid}" property="externalId" sortable="true"/>
	<display:column title="${description}" property="description" sortable="true"/>
	<display:column title="${creationdate}" sortable="true" sortProperty="creation">
		<fmt:formatDate value="${dinamicForms.creation.time}" pattern="dd-MM-yyyy HH:mm"/>
	</display:column>
	<display:column title="${numcampos}">
		${fn:length(dinamicForms.fields)}
	</display:column>
	<display:column title="${consultar}" style="text-align:center; width:5%">
		<a href="${pageContext.request.contextPath}/dynamicFormModuleAction.do2?method=view&dynamicFormId=${dinamicForms.id}">
			<img alt="${consultar} ${dinamicForms.description}" title="${consultar} ${dinamicForms.description}" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png">
		</a>
	</display:column>
	<display:column title="${editar}" style="text-align:center; width:5%">
		<a href="${pageContext.request.contextPath}/editDynamicForm.do2?formId=${dinamicForms.id}">
			<img alt="${editar} ${dinamicForms.description}" title="${editar} ${dinamicForms.description}" src="${pageContext.request.contextPath}/images/icon/icon-editar.png">
		</a>
	</display:column>
	<display:column title="${criarQuestionario}" style="text-align:center; width:5%">
		<img src="${pageContext.request.contextPath}/images/icon/icon-criarNovo.png"
				onclick="formId='${dinamicForms.id}'; cancelar(event,'${designacaoplural}','${criarMsg}',decisaoCreateQuestionario,'${sim}','${nao}');" 
				class="cursorMao" alt="${criarQuestionario}" title="${criarQuestionario}" />
	</display:column>

	<display:column title="${exportarXML}" style="text-align:center; width:5%">
		<img src="${pageContext.request.contextPath}/images/icon/icon-exportar.png"
				onclick="formId='${dinamicForms.id}'; cancelar(event,'${designacaoplural}','${exportMsg}',decisaoExportXML,'${sim}','${nao}');" 
				class="cursorMao" alt="${exportarXML}" title="${exportarXML}" />
	</display:column>
	
	<display:column title="${exportarInst_FD}" style="text-align:center; width:10%">
		<img src="${pageContext.request.contextPath}/images/icon/icon-exportar.png"
				onclick="formId='${dinamicForms.id}'; accao='exportInstancesToXML'; cancelar(event,'${designacaoplural}','${exportarInst_FDXMLMsg}',decisaoExportInstances,'${sim}','${nao}');" 
				class="cursorMao" alt="${exportarInst_FDXML}" title="${exportarInst_FDXML}" />
				
		<img src="${pageContext.request.contextPath}/images/icon/icon-exportar.png"
				onclick="formId='${dinamicForms.id}'; accao='exportInstancesToXLS'; cancelar(event,'${designacaoplural}','${exportarInst_FDXLSMsg}',decisaoExportInstances,'${sim}','${nao}');" 
				class="cursorMao" alt="${exportarInst_FDXLS}" title="${exportarInst_FDXLS}" />
								
	</display:column>
	
	
	
	<display:column title="${eliminar}" style="text-align:center; width:5%">
		<%--a id="xpto" href="#" onclick="dynaToDeleteId=${dinamicForms.id};cancelar(event,'Eliminar Formulário Dinâmico', 'Deseja realmente eliminar o formulário Dinâmico?',decisao);">
			<img alt="Eliminar" src="${pageContext.request.contextPath}/images/icon/icon-lixo.png">
		</a--%>
		<label for="removeRow_${dinamicForms.id}">
			<input type="checkbox" id="removeRow_${dinamicForms.id}" name="removeRow_${dinamicForms.id}" value="checked" class="radion" style="text-align:center; border:none;"/>
		</label>
	</display:column>
	
	<display:footer>
		<td colspan="10" class="tableFooter">&nbsp;</td>
		<td class="tableFooter alignCenter">
			<img src="${pageContext.request.contextPath}/images/icon/icon-lixo.png"
				onclick="cancelar(event,'${designacaoplural}','${eliminarMsg}',decisao,'${sim}','${nao}');" 
				class="cursorMao" alt="${eliminar} ${designacaoplural}"
				title="${eliminar} ${designacaoplural}" />
		</td>
	</display:footer>
</display:table>
