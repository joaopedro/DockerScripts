<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.colaborador.multiplos" var="multiplos" />
<fmt:message key="ipdms.forms.ajuda" var="ajuda" />
<fmt:message key="ipdms.forms.ocultarAjuda" var="ocultarAjuda" />
<fmt:message key="ipdms.comunicacaoparecer.criarComunicacao.help" var="criarComunicacaoHelp" />
<fmt:message key="ipdms.comunicacaoparecer.solicitarParecer.help" var="solicitarParecerHelp" />
<fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.alerta" var="alerta" />
<fmt:message key="ipdms.forms.pesquisar" var="pesquisar" />
<fmt:message key="ipdms.accoes.anexar.titulo" var="nomeFicheiro" />
<fmt:message key="ipdms.accoes.anexar.ficheiro" var="ficheiro" />
<fmt:message key="ipdms.tarefas.anexarDocs.anexados" var="anexados" />
<fmt:message key="ipdms.tarefas.anexarDocs.formato" var="formato" />

<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/ipdms/themes" />
<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<c:set var="IMAGE_DIR" value="${pageContext.request.contextPath}/images/icon" />

<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/column-tree.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/CustomToolbar.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/ColumnNodeUI.css" />
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ColumnNodeUI.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/Window_Iframe.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/IPDMSTreePanel.js"></script>

<script>
function fnchama(){
	var action = "${pageContext.request.contextPath}/ajaxListOrganicaWithColaboradores.do2";
	paramts  = "valuePlaceOlder=comunic_idOrganica";
	paramts += "&descPlaceOlder=comunic_nomeDestinatario";
	paramts += "&window=winchoose";
	paramts += "&multiple=true";
	ExtWindow('${multiplos}',action,paramts,'ext');
	
}
</script>

<c:choose>
	<c:when test="${tipo == 'C'}">
		<script type="text/javascript">	
			document.title = '${productName} - <fmt:message key="ipdms.comunicacaoparecer.criar.titulo" />';	 
		</script>
		<div id="ver_ajuda" class="row" style="padding-top:0px; text-align:left;">
			<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
				<tbody>
				  <tr>
				    <td class="titulo1"><fmt:message key="ipdms.comunicacaoparecer.criar.titulo" /></td>
				    <td style="width:1.75em; vertical-align:top; text-align:center;">
				    	<img src="${IMAGE_DIR}/icon-ajuda.png" onclick="Javascript:verAjuda('s');" class="cursorMao" alt="${ajuda}" title="${ajuda}" />
				    </td>
				  </tr>
				</tbody>
			</table>					
		</div>
		<div id="ajuda" class="info" style="padding-top:0px; display: none; text-align:left;">
			<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
				<tbody>
				  <tr>
				    <td class="titulo1"><fmt:message key="ipdms.comunicacaoparecer.criar.titulo" /></td>
				    <td style="width:1.75em; vertical-align:top; text-align:center;">
				    	<img src="${IMAGE_DIR}/icon-ajuda.png" onclick="Javascript:verAjuda('n');" class="cursorMao" alt="${ocultarAjuda}" title="${ocultarAjuda}" />
				    </td>
				  </tr>
				</tbody>
			</table>	
			${criarComunicacaoHelp}				
		</div>
	</c:when>
	<c:otherwise>
		<div id="ver_ajuda" class="row" style="padding-top:0px; text-align:left;">
			<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
				<tbody>
				  <tr>
				    <td class="titulo1"><fmt:message key="ipdms.comunicacaoparecer.criar.solicitarParecer" /></td>
				    <td style="width:1.75em; vertical-align:top; text-align:center;">
				    	<img src="${IMAGE_DIR}/icon-ajuda.png" onclick="Javascript:verAjuda('s');" class="cursorMao" alt="${ajuda}" title="${ajuda}" />
				    </td>
				  </tr>
				</tbody>
			</table>					
		</div>
		<div id="ajuda" class="info" style="padding-top:0px; display: none; text-align:left;">
			<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
				<tbody>
				  <tr>
				    <td class="titulo1"><fmt:message key="ipdms.comunicacaoparecer.criar.solicitarParecer" /></td>
				    <td style="width:1.75em; vertical-align:top; text-align:center;">
				    	<img src="${IMAGE_DIR}/icon-ajuda.png" onclick="Javascript:verAjuda('n');" class="cursorMao" alt="${ocultarAjuda}" title="${ocultarAjuda}" />
				    </td>
				  </tr>
				</tbody>
			</table>	
			${solicitarParecerHelp}		
		</div>
	</c:otherwise>
</c:choose>

<div id="comunicPareceresErrorDiv">
	<html:errors />
</div>


<div class="row" style="padding-bottom:2%;">
	<div class="leftTab label" style="width: 90%; " title="<fmt:message key='ipdms.obrigatorio'  />">
  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio"  /></span>
  	</div>
</div>

<html:form action="/tarefas/criarComunicacao" method="post" enctype="multipart/form-data">
	<input type="hidden" name="method" value="save">
	<html:hidden property="nid"/>
	<html:hidden property="numero"/>
	<input type="hidden" name="urlAnterior" value="${urlAnterior}">
	<input type="hidden" name="tipo" value="${tipo}">
	<html:hidden property="destinatario" styleId="comunic_idOrganica"/>

	<c:if test="${tipo != 'C'}">
		<div class="mensagenCaixa" >
			<img src="${IMAGE_DIR}/icon-alerta.png" class="cursor" alt="${alerta}" title="${alerta}" style="vertical-align:middle; padding-left:10px; padding-right:8px;"/> 
			<span class="info"><fmt:message key="ipdms.comunicacaoparecer.criar.alerta" /></span>
		</div>
	</c:if>

	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.comunicacaoparecer.criar.entidadeDestino' />">
			<label for="destinolabel"><fmt:message key="ipdms.comunicacaoparecer.criar.entidadeDestino" /> *</label>
		</div>
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.comunicacaoparecer.criar.entidadeDestino' />">
	  		<c:choose>
			<c:when test="${tipo == 'C'}">
	  			<html:radio property="entidadeDestino" value="E" disabled="true" styleClass="radion" styleId="destinolabel"></html:radio>
	  			<fmt:message key="ipdms.comunicacaoparecer.criar.entidade" />
	  			</c:when>
			</c:choose>
			<html:radio property="entidadeDestino" value="O" styleClass="radion" styleId="destinolabel"></html:radio>
			<fmt:message key="ipdms.comunicacaoparecer.criar.areaFuncional" />
	  	</div>
	</div>

	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.comunicacaoparecer.criar.criadaPor' />"><label for="criadoPorLabel"><fmt:message key="ipdms.comunicacaoparecer.criar.criadaPor" /></label></div>
	  	<div class="label" style="width: 7%;" title="<fmt:message key='ipdms.comunicacaoparecer.criar.criadaPor' />">
	  		<html:text styleClass="textinput" property="autor" size="40" maxlength="80"  readonly="true" style="width: 70%;" styleId="criadoPorLabel"/>
	  	</div>
	  	
	  	<div class="label" style="width: 25%;" title="<fmt:message key='ipdms.comunicacaoparecer.criar.criadaPor' />">
	  		<label for="autorNomeLabel"><html:text styleClass="textinput" property="autorNome" size="40" maxlength="80"  readonly="true" style="width: 95%;" styleId="autorNomeLabel"/></label>
	  	</div>
	  	
	  	<div class="leftTab label" style="width: 7%;" title="<fmt:message key='ipdms.comunicacaoparecer.criar.origem' />"><label for="autoOrigemLabel"><fmt:message key="ipdms.comunicacaoparecer.criar.origem" /></label></div>
	  	<div class="label" style="width: 40%;" title="<fmt:message key='ipdms.comunicacaoparecer.criar.origem' />">
	  		<html:text styleClass="textinput" property="autorOrigem" maxlength="80"  readonly="true" style="width: 20%;" styleId="autoOrigemLabel"/>
	  	</div>
	</div>

	<div class="row formlabel_sf" style="height: 60px;">
		<div class="leftTab label" style="width: 13%;" title="<fmt:message key='ipdms.comunicacaoparecer.criar.destinatario' />"><fmt:message key="ipdms.comunicacaoparecer.criar.destinatario" /> *</div>
	  	
	  	<div class="label" style="width: 4%;">
	  		<a href="#" onclick="fnchama();"><img src="${IMAGE_DIR}/icon-pesquisa.png" class="cursorMao" alt="${pesquisar} <fmt:message key='ipdms.comunicacaoparecer.criar.destinatario' />" title="${pesquisar} <fmt:message key='ipdms.comunicacaoparecer.criar.destinatario' />" /></a>
	  	</div>
	  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.comunicacaoparecer.criar.destinatario' />"><html:text styleClass="textinput" property="nomeDestinatarios" size="77" styleId="comunic_nomeDestinatario" readonly="true" style="width:97%"/></div>
	</div>

	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.comunicacaoparecer.criar.numProcesso' />">
			<label for="processoIDLabel"><fmt:message key="ipdms.comunicacaoparecer.criar.numProcesso" /></label>
		</div>
	  	
	  	<div class="label" style="width: 10%;" title="<fmt:message key='ipdms.comunicacaoparecer.criar.numProcesso' />">
	  		<html:text styleClass="textinput" property="processId" size="45" maxlength="80" style="width: 97%;" readonly="true" styleId="processoIDLabel"/>
	  	</div>
	  	
	  	<div class="leftTab label" style="width: 13%;" title="<fmt:message key='ipdms.comunicacaoparecer.criar.tipoProcesso' />"><fmt:message key="ipdms.comunicacaoparecer.criar.tipoProcesso" /></div>
	  	
	  	<div class="label" style="width: 17%;" title="<fmt:message key='ipdms.comunicacaoparecer.criar.tipoProcesso' />">
	  	<c:choose>
		  	<c:when test="${servicoOnline!=null}">
		  		<input type="text" id="comunic_tipo_processo" style="width: 93%;" size="40" maxlength="80" value="${servicoOnline.variante.titulo}"  readonly="readonly"/>
		  	</c:when>
		  	<c:otherwise>
		  		<input type="text" id="comunic_tipo_processo" style="width: 93%;" size="40" maxlength="80" value=""  readonly="readonly" />
		  	</c:otherwise>
	  	</c:choose>
	  	</div>
	  	
	  	<div class="leftTab label" style="width: 13%;" title="<fmt:message key='ipdms.comunicacaoparecer.criar.etapa' />"><fmt:message key="ipdms.comunicacaoparecer.criar.etapa" /></div>
	  	<div class="label" style="width: 20%;" title="<fmt:message key='ipdms.comunicacaoparecer.criar.etapa' />">
	  		<html:text styleClass="textinput" property="etapaActual" size="45" maxlength="80" style="width: 40%;" readonly="true"/>
	  	</div>
	  	
	</div>

	<div style="clear:both"></div>
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.comunicacaoparecer.criar.data' />">
			<fmt:message key="ipdms.comunicacaoparecer.criar.data" />
		</div>
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.comunicacaoparecer.criar.data' />">
	  		<html:text styleClass="textinput" property="dataCriacao" size="40" maxlength="80"  readonly="true" style="width: 12%;"/>	
	  	</div>
	</div>

	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.comunicacaoparecer.criar.assunto' />"><label for="assuntoLabel"><fmt:message key="ipdms.comunicacaoparecer.criar.assunto" /> *</label></div>
	  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.comunicacaoparecer.criar.assunto' />">
	  		<html:text styleClass="textinput" property="assunto" size="40" maxlength="80" style="width: 52%;" styleId="assuntoLabel"/>
	  		
	  	</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.comunicacaoparecer.criar.mensagem' />"><label for="mensagemLabel"><fmt:message key="ipdms.comunicacaoparecer.criar.mensagem" /> *</label></div>
	  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.comunicacaoparecer.criar.mensagem' />">
	  		<html:textarea styleClass="textinput" property="mensagem"  rows="4" style="width: 50%;" styleId="mensagemLabel"/>
	  				
	  	</div>
	</div>
	
	<div style="clear:both"></div>


	
	<c:if test="${servicoOnline != null}">

		<script type="text/javascript">
			function enableField(textField){
				var index = textField.name.substring(textField.name.indexOf("[")+1, textField.name.indexOf("]") );
				var elems = textField.form.elements;
				for( i = 0; i < elems.length; i++ ){
					if( elems[i].type == "file" && elems[i].name.indexOf("["+index+"]") != -1 ){
						textField.value = trim(textField.value);
						elems[i].disabled = textField.value == "";
						if( elems[i].disabled ){
							elems[i].value = "";
						}
					}
				}
			}
		</script>

		<div class="row" style="padding-top: 20px; text-align:left;" >
			<table class="headings" style="border:none" cellpadding="0" cellspacing="0">
				<tbody>
				  <tr>
				    <td class="titulo2"><fmt:message key="ipdms.comunicacaoparecer.criar.anexos" /></td>
				  </tr>
				</tbody>
			</table>					
		</div>

		<table cellpadding="0" cellspacing="0" class="centro" style="width:500px;">
			<tr>
				<th width="250" class="centro">${nomeFicheiro}</th>
				<th width="250" class="centro">${ficheiro}</th>
			</tr>
		
			<logic:iterate name="comunicacaoParecerForm" property="documentos" id="documentos" indexId="i">
				<nested:root name="documentos">
					<tr class="hoverTransparente">
						<td><nested:text property="description" size="30" maxlength="30" onblur="enableField(this);" indexed="true"/></td>
						<td class="centro"><nested:file property="formFile" size="30" disabled="true" indexed="true"/></td>
					</tr>
				</nested:root>
			</logic:iterate>
			<tr class="hoverTransparente">
				<td colspan="2">&nbsp;</td>
			</tr>
		</table>
		<br />

		<c:if test="${fn:length(comunicacaoParecerForm.antigos) > 0 }">
			<table cellpadding="0" cellspacing="0" class="centro" style="width:500px; border:none;">
				<tr>
					<th width="175" class="centro" style="text-align: left;">${anexados}</th>
					<th width="210" class="centro">${formato}</th>
					<th width="15" class="centro"><img src="${IMAGE_DIR}/icon-lixo.png" alt="<fmt:message key='ipdms.forms.eliminar' />" title="<fmt:message key='ipdms.forms.eliminar' />" /></th>
				</tr>
				<nested:iterate name="comunicacaoParecerForm" property="antigos" id="antigos">
					<nested:root name="antigos">
						<tr>
							<td class="centro">
								<nested:write property="uploadFile.description" />
							</td>
							<td class="alignCenter">
								<c:choose>
									<c:when test="${fn:length(antigos.extension) > 0}">
										<c:out value="${antigos.extension}" />
									</c:when>
									<c:otherwise>
										---
									</c:otherwise>
								</c:choose>
							</td>
							<td class="centro"><nested:checkbox property="uploadFile.selected" indexed="true" style="border:0;" /></td>
						</tr>
					</nested:root>
				</nested:iterate>
			</table>
		</c:if>
		
		<div class="buttonRow">
			<input type="button" class="btForm"
				title="<fmt:message key='ipdms.forms.adicionar' />"
				value="<fmt:message key='ipdms.forms.adicionar' /> +"
				onclick="this.form.action='${pageContext.request.contextPath}/tarefas/criarComunicacao.do2'; this.form.method.value='addFiles'; this.form.submit();">
		</div>

	</c:if>
	

	<br/>
	<div class="buttonRow">
		<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.submit" />" title="<fmt:message key='ipdms.forms.submit.title' />" />
		<input type="button" class="btFormEscuro" value="<fmt:message key="ipdms.forms.cancelar" />"
			onclick="this.form.action='${pageContext.request.contextPath}${urlAnterior}'; this.form.method.value='prepare'; this.form.submit();" title="<fmt:message key='ipdms.forms.cancelar.title' />" />
	</div>
</html:form>