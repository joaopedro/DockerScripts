<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.modules.templates.template.organica" var="organicas" />
<fmt:message key="ipdms.modules.templates.template.tipotemplate" var="tipotemplate" />
<fmt:message key="ipdms.modules.templates.template.organicasassociadas.empty" var="emptyOrganicas" />
<fmt:message key="ipdms.modules.templates.template.ficheiro" var="ficheiro" />
<fmt:message key="ipdms.forms.pesquisar" var="pesquisar" />

<c:set var="THEMES_DIR"
	value="${pageContext.request.contextPath}/ipdms/themes" />
<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />

<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/column-tree.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/CustomToolbar.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/ColumnNodeUI.css" />
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ColumnNodeUI.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ConfirmCancel.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/Window_Iframe.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/IPDMSTreePanel.js"></script>


<script type="text/javascript">	
	document.title = '${productName} - <fmt:message key="ipdms.modules.templates.templates.edit.titulo" />';
	
	function showOrganicaMultiple() {
		var action = "${pageContext.request.contextPath}/ajaxListOrganica.do2";
		paramts = "valuePlaceOlder=idorganicas";
		paramts += "&descPlaceOlder=descorganicas";
				
		if($F('idorganicas')) {
			paramts += "&selectedids="+$F('idorganicas');
		}
		paramts += "&window=winchoose&multiple=true";

		ExtWindow('${organicas}', action, paramts, 'ext');
	}
</script>

<div class="row" style="text-align:left; padding-top:0px;">
    <table border="0" cellpadding="0" cellspacing="0" class="headings">
        <tbody>
          <tr>
            <td class="titulo1"><fmt:message key="ipdms.modules.templates.templates.edit.titulo" /></td>
          </tr>
        </tbody>
    </table>					
</div>
<br/>


<div id="errorDivTipoTemplate">
	<html:errors />
</div>

<html:form action="templates/saveTemplatesAction.do2" enctype="multipart/form-data" method="post">
	<html:hidden property="templateId"/>
	<input type="hidden" name="method" value="save">

	<div class="row" style="padding-bottom:2%;">
		<div class="leftTab label" style="width: 90%; " title="<fmt:message key='ipdms.obrigatorio' />">
	  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
	  	</div>
	</div>

	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="${tipotemplate}">
			<label for="tipoTemplateLabel">${tipotemplate} *</label>
		</div>
		<div class="label" style="width: 80%;"  title="${tipotemplate}">
			<html:select property="tipoTemplate" style="width: 20%;" styleId="tipoTemplateLabel">
				<html:option value=""><fmt:message key="ipdms.forms.select.default" /></html:option>
				<html:optionsCollection name="listaTiposTemplate" label="designacao" value="id"/>
			</html:select>
		</div>
	</div>

	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.modules.templates.template.titulo' />">
			<label for="tituloLabel"><fmt:message key="ipdms.modules.templates.template.titulo" /> *</label>
		</div>
		<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.modules.templates.template.titulo' />">
			<html:text property="titulo" style="width: 40%;" styleId="tituloLabel"/>
		</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%;" title="${organicas}">
			<label for="organicaLabel">${organicas}</label>
		</div>
		<div class="label" style="width: 5%;">
	  		<img class="cursorMao" alt="${pesquisar} ${organicas}" title="${pesquisar} ${organicas}" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" 
				onclick="showOrganicaMultiple();"/>
			<html:hidden styleId="idorganicas" property="organicas" />
	  	</div>  	
	  	<div class="label" style="width: 74%;" title="<fmt:message key='ipdms.modules.templates.template.organicasassociadas' />">
	  		<span class="textoAzul"><fmt:message key="ipdms.modules.templates.template.organicasassociadas" /></span> 
	  		<div id="descorganicas" class="listaCinzenta" style="width: 70%;">
	  			<c:set var="collectionName" value="${templateFormBean.organicasSelected}" />
	  			<c:choose>
					<c:when test="${not empty collectionName}">
						<c:set var="more_info" value=" &#10;&#10;"  scope="request"></c:set>
						<c:forEach items="${collectionName}" var="object">
							<c:set var="more_info" value="${more_info}> ${object.designacao} &nbsp;&#10;<br />" scope="request"></c:set>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:set var="more_info" value="${emptyOrganicas}" scope="request" />
					</c:otherwise>
				</c:choose>
				${more_info}
	  		</div>
	  	</div>
	</div>
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%;" title="${ficheiro}">${ficheiro} *</div>

	  	<c:set var="fileForUpload" value="${templateFormBean.ficheiro}" scope="request"/>
	  	<c:import url="/ipdms/commons/fileupload/replaceablefile.jsp">  		
	  		<c:param name="formUploadProperty" value="ficheiro" />
 		  	<c:param name="visualizeFileAction" value="file/getTemplate" />
	  	</c:import>		
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.modules.templates.template.sigla' />">
			<label for="siglaLabel"><fmt:message key="ipdms.modules.templates.template.sigla" /></label>
		</div>
		<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.modules.templates.template.sigla' />">
			<html:text property="sigla" style="width: 40%;" styleId="siglaLabel" size="30" maxlength="30"/>
		</div>
	</div>
	
	<div style="clear:both;"><br /></div>
	<div class="buttonRow">
		<input type="submit" class="btForm" title="<fmt:message key='ipdms.forms.submit.title'/>" value="<fmt:message key='ipdms.forms.submit'/>" />
		<input type="button" class="btFormEscuro" onclick="setActionAndSubmit(this.form, 'showModule.do2?tabName=template');" title="<fmt:message key='ipdms.forms.cancelar.title'/>" value="<fmt:message key='ipdms.forms.cancelar'/>"/>
	</div>
</html:form>
