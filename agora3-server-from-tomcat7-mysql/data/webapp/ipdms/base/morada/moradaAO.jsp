<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld" %>
<%@ taglib prefix="nested" uri="http://struts.apache.org/tags-nested"  %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"  %>

<fmt:message key="ipdms.modules.entidade.localidadeOutra" var="localidadeOutra" />

<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" />
<c:set var="JS_DIR" value="${CONTEXT_PATH}/ipdms/js" />

<LINK href="${CONTEXT_PATH}/ipdms/themes/estilos.css" type="text/css" rel="stylesheet" />
<LINK href="${CONTEXT_PATH}/ipdms/themes/forms.css" type="text/css" rel="stylesheet" /> 
<LINK href="${CONTEXT_PATH}/ipdms/modules/entidade/theme/entidade.css" type="text/css" rel="stylesheet" /> 

<c:set var="locale" value="${requestScope['ipdms.morada.locale']}" scope="request" />

<script src='${JS_DIR}/prototype.js' type="text/javascript"></script>

<script>

updateMunicipio = function(){
	var p = 'idProvincia='+$F('idProvincia')+'&fieldId=idMunicipio';
	new Ajax.Updater('idMunicipio', '${CONTEXT_PATH}/moradaPopupAO.do2?method=renderOptions', {method: 'get', parameters: p});
}

updateComuna = function(){
	var p = 'idProvincia='+$F('idProvincia')+'&idMunicipio='+$F('idMunicipio')+'&fieldId=idComuna';
	new Ajax.Updater('idComuna', '${CONTEXT_PATH}/moradaPopupAO.do2?method=renderOptions', {method: 'get', parameters: p});
}

updateLocalidade = function(){
	var p = 'idProvincia='+$F('idProvincia')+'&idMunicipio='+$F('idMunicipio')+'&idComuna='+$F('idComuna')+'&fieldId=idLocalidade';
	new Ajax.Updater('idLocalidade', '${CONTEXT_PATH}/moradaPopupAO.do2?method=renderOptions', {method: 'get', parameters: p});
}

saveMorada = function(presave){
	var p =
		'id='+$F('id') +
		'&idProvincia='+$F('idProvincia') +
		'&idMunicipio='+$F('idMunicipio') +
		'&idComuna='+$F('idComuna') +
		'&idLocalidade='+$F('idLocalidade') +
		'&outraLocalidade='+$F('outraLocalidade') +
		'&domicilio='+$F('domicilio');
		
	if(presave){
		p += '&savemorada=true';
		new Ajax.Request('${CONTEXT_PATH}/moradaPopupAO.do2?method=save', 
				{method: 'post', parameters: p, onComplete: affectParentFieldsAndClose} 
			);
	} else {
		alert('not save!!!');
		new Ajax.Updater('saveResultMessage', '${CONTEXT_PATH}/moradaPopupAO.do2?method=save', {method: 'get', parameters: p});
		affectParentFieldsAndClose();
	}		
}

affectParentFieldsAndClose = function(originalRequest) {
	if(originalRequest) {	
		originalRequest.responseText.evalScripts();
	}
	
	affectParentMoradaValues();
		
	if('${closefunction}' != '') {
		eval('parent.${closefunction}()'); 
	}
	parent.${param.window}.close();
};


changeProvincia = function(){
	updateMunicipio();
	updateComuna();
	updateLocalidade();
}

changeMunicipio = function(){
	updateComuna();
	updateLocalidade();
}

changeComuna = function(){
	updateLocalidade();
}

changeLocalidade = function(){
	if($F('idLocalidade')==-1){
		$('outraLocalidade').show();
	} else {
		$('outraLocalidade').hide();
	}
}

affectParentMoradaValues = function () {
	if(parent.document.getElementById('${idPlaceHolder}')){
		parent.document.getElementById('${idPlaceHolder}').value=$F('id');
	}
	if(parent.document.getElementById('${idProvinciaPlaceHolder}')){
		parent.document.getElementById('${idProvinciaPlaceHolder}').value=$F('idProvincia');
	}
	if(parent.document.getElementById('${idMunicipioPlaceHolder}')){
		parent.document.getElementById('${idMunicipioPlaceHolder}').value=$F('idMunicipio');
	}
	if(parent.document.getElementById('${idComunaPlaceHolder}')){
		parent.document.getElementById('${idComunaPlaceHolder}').value=$F('idComuna');
	}
	if(parent.document.getElementById('${idLocalidadePlaceHolder}')){
		parent.document.getElementById('${idLocalidadePlaceHolder}').value=$F('idLocalidade');
	}
	if(parent.document.getElementById('${outraLocalidadePlaceHolder}')){
		parent.document.getElementById('${outraLocalidadePlaceHolder}').value=$F('outraLocalidade');
	}
	if(parent.document.getElementById('${domicilioPlaceHolder}')){
		parent.document.getElementById('${domicilioPlaceHolder}').value=$F('domicilio');
	}		
}

</script>

<div id="moradaFormContainer" style="border:none; margin:10px;padding:20px 10px;">
<div id="saveResultMessage">&nbsp;</div>
<fieldset style="margin:0px;padding:10px 0px;width:100%;">
<legend><fmt:message key="ipdms.modules.entidade.moradaedit" /></legend>

<nested:root name="moradaAOFormBean">
<nested:hidden property="id" styleId="id"></nested:hidden>

<!-- 
Primeira Linha
 -->
<div class="row formlabel_sf" style="height:30px;" >
<!-- provincia -->
	<div class="leftTab label" style="width: 10%;" title="<fmt:message key='ipdms.modules.entidade.provincia'/>">
  		<fmt:message key="ipdms.modules.entidade.provincia"/>
  	</div>
  	<div class="label" style="width: 27%;" title="<fmt:message key='ipdms.modules.entidade.provincia'/>">
	  	<nested:select
	  			property="idProvincia" 
	  			styleId="idProvincia" 
	  			onchange="changeProvincia();">
			<option value=""></option>
			<html:options collection="provinciaList" property="value" labelProperty="title" />
		</nested:select>
  	</div>
<!-- municipio -->
	<div class="leftTab label" style="width: 10%;" title="<fmt:message key='ipdms.modules.entidade.municipio'/>">
  		<fmt:message key="ipdms.modules.entidade.municipio"/>
  	</div>
  	<div class="label" style="width: 27%;" title="<fmt:message key='ipdms.modules.entidade.municipio'/>">
	  	<nested:select
	  			property="idMunicipio" 
	  			styleId="idMunicipio" 
	  			onchange="changeMunicipio();">
			<option value=""></option>
			<html:options collection="municipioList" property="value" labelProperty="title" />
		</nested:select>
  	</div>
</div>

<!-- 
Segunda Linha
 -->
<div class="row formlabel_sf" style="height:30px;" >
<!-- comuna -->
	<div class="leftTab label" style="width: 10%;" title="<fmt:message key='ipdms.modules.entidade.comuna'/>">
  		<fmt:message key="ipdms.modules.entidade.comuna"/>
  	</div>
  	<div class="label" style="width: 27%;" title="<fmt:message key='ipdms.modules.entidade.comuna'/>">
	  	<nested:select
	  			property="idComuna" 
	  			styleId="idComuna" 
	  			onchange="changeComuna();">
			<option value=""></option>
			<html:options collection="comunaList" property="value" labelProperty="title" />
		</nested:select>
  	</div>
<!-- localidade -->
	<div class="leftTab label" style="width: 10%;" title="<fmt:message key='ipdms.modules.entidade.localidade'/>">
  		<fmt:message key="ipdms.modules.entidade.localidade"/>
  	</div>
  	<div class="label" style="width: 27%;" title="<fmt:message key='ipdms.modules.entidade.localidade'/>">
	  	<nested:select
	  			property="idLocalidade" 
	  			styleId="idLocalidade"
	  			onchange="changeLocalidade();">
			<option value=""></option>
			<option value="-1">${localidadeOutra}</option>
			<html:options collection="localidadeList" property="value" labelProperty="title" />
		</nested:select>
		<nested:text property="outraLocalidade" styleId="outraLocalidade" />
  	</div>
</div>

<script>changeLocalidade();</script>


<!-- 
Terceira Linha
 -->
<div class="row formlabel_sf" style="height:30px;" >
<!-- domicilio -->
	<div class="leftTab label" style="width: 10%;" title="<fmt:message key='ipdms.modules.entidade.domicilio'/>">
  		<fmt:message key="ipdms.modules.entidade.domicilio"/>
  	</div>
  	<div class="label" style="width: 27%;" title="<fmt:message key='ipdms.modules.entidade.domicilio'/>">
	  	<nested:text property="domicilio" styleId="domicilio"></nested:text>
	</div>
</div>

</nested:root>
</fieldset>
</div>

<div style="margin:auto;text-align:center;">
	<input type="button" name="submeter" title="<fmt:message key='ipdms.forms.submit.title'/>" value="<fmt:message key='ipdms.forms.submit'/>" onclick="saveMorada(${savemorada});" />
	<input type="button" name="cancelar" title="<fmt:message key='ipdms.forms.cancelar.title'/>" value="<fmt:message key='ipdms.forms.cancelar'/>" onclick="parent.${param.window}.close();"  />
</div>








