<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.forms.ajuda" var="ajuda" />
<fmt:message key="ipdms.forms.ocultarAjuda" var="ocultarAjuda" />
<fmt:message key="ipdms.loading" var="loading" />

<script src="${pageContext.request.contextPath}/ipdms/js/documentlock.js" type="text/javascript"></script>

<html:form styleId="emitirTemplateForm" action="/tarefas/savetemplate" method="post" enctype="multipart/form-data">
	<input type="hidden" name="method" value="saveAndExit">
	
	<nested:root name="emitirTemplateFormBean">
	<nested:hidden property="ncServicoOnline"/>
	<nested:hidden property="nid"/>
	<nested:hidden property="ncDocumento" styleId="ncDocumento"/>
	<nested:hidden property="numeroDocumento" styleId="numeroDocumento"/>
	<nested:hidden property="extensaoDocumento" styleId="extensaoDocumento"/>
	
	<script type="text/javascript">	
		document.title = '${productName} - <nested:write property="template.titulo"/>';	 
	</script>
	
	<%-- HELP CHUNK --%>
	<div id="ver_ajuda" class="row" style="padding-top:0px; text-align:left;">
		<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
			<tbody>
			  <tr>
			    <td class="titulo1"><nested:write property="template.titulo"/></td>
			    <td style="width:1.75em; vertical-align:top; text-align:center;">
			    	<img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('s');" class="cursorMao" alt="${ajuda}" title="${ajuda}" />
			    </td>
			  </tr>
			</tbody>
		</table>					
	</div>
	<div id="ajuda" class="info" style="padding-top:0px; display: none; text-align:left;">
		<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
			<tbody>
			  <tr>
			    <td class="titulo1"><nested:write property="template.titulo"/></td>
			    <td style="width:1.75em; vertical-align:top; text-align:center;">
			    	<img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" 
						onclick="Javascript:verAjuda('n');" class="cursorMao" alt="${ocultarAjuda}" title="${ocultarAjuda}" />
					</td>
			  </tr>
			</tbody>
		</table>	
		<fmt:message key="ipdms.emitirtemplate.help" />			
	</div>


	<%-- ERRORS DIV --%>
	<div id="MensagemErro">
		<html:errors/>
	</div>

	<%-- Setting display attribute if the form bean has a numero documento: Editing action--%>
	<c:set var="display">
		<c:choose>
			<c:when test="${emitirTemplateFormBean.ncDocumento > 0}"></c:when>
			<c:otherwise>none</c:otherwise>
		</c:choose>
	</c:set>
	
	
	<%-- TITLE TABLE --%>
	<table id="div_numdoc" style="border:none;display:${display}" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo2"><fmt:message key="ipdms.emitirtemplate.actualizacao" /> - <span id="span_numdoc">${emitirTemplateFormBean.uploadFile.description}</span></td>
		  </tr>
		</tbody>
	</table>	

	<div class="alignLeft" style="width: 90%" title="<fmt:message key='ipdms.obrigatorio' />">
	 	<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
	</div>
	
	<%-- CLEAN FORM --%>
	<%-- 	
	<div class="alignLeft" style="height:25px;" id="criaNovo">
		<div class="left">
			<img src="${pageContext.request.contextPath}/images/icon/icon-criarNovo.png" onclick="limpar();" class="cursorMao" alt="Criar novo" title="Criar novo" />
		</div>
		<div class="right">
			<div class="texto"><a href="#" onClick="limpar();" title="Limpa os dados do formulário e prepara o ecrã para gravar um novo Documento">Criar Novo</a></div>
		</div>
	</div>
	--%>

	<c:set var="display">
		<c:choose>
			<c:when test="${emitirTemplateFormBean.ncDocumento > 0}">none</c:when>
			<c:otherwise>inline</c:otherwise>
		</c:choose>
	</c:set>
	<div id="div_modelo" class="row formlabel_sf" style="height:25px;display:${display}">
		<div class="leftTab label" style="width: 25%; " title="<fmt:message key='ipdms.emitirtemplate.downloadtemplate' />">
			<fmt:message key="ipdms.emitirtemplate.downloadtemplate" />
	  	</div>
	  	<div class="label" style="width: 72%;" title="<fmt:message key='ipdms.emitirtemplate.downloadtemplate' />">
	  		<c:url var="downloadLink" value="/plugin/downloadPluginAction.do2">
	  			<c:param name="servicoOnlineId" value="${emitirTemplateFormBean.ncServicoOnline}" />
	  			<c:param name="nid" value="${emitirTemplateFormBean.nid}" />
	  			<c:param name="templateId" value="${emitirTemplateFormBean.template.id}" />
	  		</c:url>  	
	  		<a href="${downloadLink}" target="_blank">
				<img src="${pageContext.request.contextPath}/images/icon/icon-criarNovo.png" title="<fmt:message key='ipdms.emitirtemplate.downloadtemplate' />" alt="<fmt:message key='ipdms.emitirtemplate.downloadtemplate' />" class="cursorMao;" />
			</a>		
	  	</div>
	</div>

	<div id="div_docExistente" class="row formlabel_sf" style="height:25px;display:none">
		<div class="leftTab label" style="width: 25%; " title="<fmt:message key='ipdms.emitirtemplate.downloaddocumento' />">
	  		<fmt:message key="ipdms.emitirtemplate.downloaddocumento" />
	  	</div>
	  	<div class="label" style="width: 72%;" title="<fmt:message key='ipdms.emitirtemplate.downloaddocumento' />">
	  		<c:url var="downloadLink" value="/plugin/downloadPluginAction.do2">
	  			<c:param name="servicoOnlineId" value="${emitirTemplateFormBean.ncServicoOnline}" />
	  			<c:param name="nid" value="${emitirTemplateFormBean.nid}" />
	  		</c:url>  	
	  		<a href="${downloadLink}" name="editarlink" id="editarlink" target="_blank"></a>		
	  	</div>
	</div>

	<%-- EDIT FORM --%>
	<div class="row formlabel_sf" style="height:30px;">
		<div class="leftTab label" style="width: 25%; " title="<fmt:message key='ipdms.emitirtemplate.carregardocumento' />">
			<fmt:message key="ipdms.emitirtemplate.carregardocumento" /> *
		</div>
	  	<div class="label" style="width: 72%;" title="<fmt:message key='ipdms.emitirtemplate.carregardocumento' />">
	  		<nested:file property="uploadFile.formFile" styleId="uploadFile_formFile" size="35"/>
	  	</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 25%; " title="<fmt:message key='ipdms.emitirtemplate.designacao' />">
			<fmt:message key="ipdms.emitirtemplate.designacao" /> *
		</div>
	  	<div class="label" style="width: 72%;" title="<fmt:message key='ipdms.emitirtemplate.designacao' />">
	  		 <nested:text property="uploadFile.description" styleId="uploadFile.description" size="50" maxlength="60"/>
	  	</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 25%; " title="<fmt:message key='ipdms.emitirtemplate.comentario' />">
			<fmt:message key="ipdms.emitirtemplate.comentario" /> *
		</div>  	
	  	<div class="label" style="width: 72%;" title="<fmt:message key='ipdms.emitirtemplate.comentario' />">
	  		<nested:textarea property="uploadFile.comment" styleId="uploadFile.comment" rows="4" cols="60" />
	  	</div>
	</div>

	<div class="buttonRow">
		<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.anterior"/>"
			onclick="this.form.action='${pageContext.request.contextPath}/${urlAnterior}'; this.form.elements['method'].disabled=true; this.form.enctype=''; this.form.submit();"
			title="<fmt:message key='ipdms.forms.anterior.title'/>" />
	
		<input type="button" class="btForm" value="<fmt:message key='ipdms.emitirtemplate.actualizar'/>"
			onclick="actualizarLista();"
			title="<fmt:message key='ipdms.emitirtemplate.actualizar'/>" />
	
		<input type="button" class="btForm" value="<fmt:message key='ipdms.emitirtemplate.gravar'/>"
			onclick="this.form.elements['method'].value='save'; this.form.submit();"
			title="<fmt:message key='ipdms.emitirtemplate.gravar'/>" />
	
		<input type="submit" class="btForm" value="<fmt:message key='ipdms.emitirtemplate.gravarSair'/>"
			title="<fmt:message key='ipdms.emitirtemplate.gravarSair'/>" />
	</div>

	<div class="row formlabel_sf"  style="height:25px;">
		<div class="leftTab label" style="width: 97%; height:20px;">
	  		&nbsp;
	  	</div>
	</div>
	</nested:root>

	<%-- LIST EXISTING DOCUMENTS --%>
	<div id="documentos" style="text-align:center;">
		<jsp:include page="listardocstarefa.jsp" flush="true"/>
	</div>

</html:form>


<script type="text/javascript">
function limpar() {

	//$("criaNovo").style.display="none";
	$("uploadFile.description").value = "";
	$("uploadFile.comment").value = "";
	
	$("ncDocumento").value = "";
	$("numeroDocumento").value = "";

	$("div_numdoc").hide();
	$("div_docExistente").hide();
	
	$("div_modelo").show();
	$("span_numdoc").innerHTML = "";
}

function actualizar(numero, versao, numdoc, designacao, comentario, ext)
{
	limpar();
	$("div_numdoc").show();
	$("div_docExistente").show();
	$("div_modelo").hide();
	$("ncDocumento").value = numero;
	$("numeroDocumento").value = numdoc;
	$("span_numdoc").innerHTML = designacao;
	$("uploadFile.comment").value = comentario;
	$("uploadFile.description").value = designacao;
	$("extensaoDocumento").value = ext;
	$("editarlink").innerHTML = designacao;

	$("editarlink").href = $("editarlink").href+"&ncDocumento="+numero+"&vcDocumento="+versao;
}
function actualizarLista()
{
	limpar();
	var params = "method=refreshDocumentList&ncServicoOnline=${emitirTemplateFormBean.ncServicoOnline}&templateId=${emitirTemplateFormBean.template.id}";
	$("documentos").innerHTML = "<br /><br />&nbsp;&nbsp;&nbsp;<img src='${pageContext.request.contextPath}/images/misc/loading.gif' alt='${loading}' title='${loading}' />";
	var myajax = new Ajax.Updater( {success: "documentos"},
									'${pageContext.request.contextPath}/tarefas/emitirtemplate.do2',
									{method: 'get', parameters: params} );
}
</script>