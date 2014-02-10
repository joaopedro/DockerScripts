<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld" %>
<%@ taglib prefix="nested" uri="http://struts.apache.org/tags-nested"  %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"  %>

<fmt:message key="ipdms.modules.entidade.codigopostal.outro" var="outro" />

<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" />
<c:set var="JS_DIR" value="${CONTEXT_PATH}/ipdms/js" />

<LINK href="${CONTEXT_PATH}/ipdms/themes/estilos.css" type="text/css" rel="stylesheet" />
<LINK href="${CONTEXT_PATH}/ipdms/themes/forms.css" type="text/css" rel="stylesheet" /> 
<LINK href="${CONTEXT_PATH}/ipdms/modules/entidade/theme/entidade.css" type="text/css" rel="stylesheet" /> 

<c:set var="locale" value="${requestScope['ipdms.morada.locale']}" scope="request" />

<script src='${JS_DIR}/prototype.js' type="text/javascript"></script>

<script>
updateDescription = function(){
	var p = 'cp4='+$F('cp4')+'&cp3='+$F('cp3')+'&localidade='+$F('localidade');
	new Ajax.Updater('moradaPtDescription', '${CONTEXT_PATH}/moradaPopupPT.do2?method=renderDescription', {method: 'get', parameters: p});
};

updateMorada = function(){
	var p = 'cp4='+$F('cp4')+'&cp3='+$F('cp3')+'&localidade='+$F('localidade')+'&fieldId=morada';
	new Ajax.Updater('morada', '${CONTEXT_PATH}/moradaPopupPT.do2?method=renderOptions', {method: 'get', parameters: p});
};

updateLocalidade = function(){
	var p = 'cp4='+$F('cp4')+'&cp3='+$F('cp3')+'&fieldId=localidade';
	new Ajax.Updater('localidade', '${CONTEXT_PATH}/moradaPopupPT.do2?method=renderOptions', {method: 'get', parameters: p});
};

updateCP3 = function(){
	var p = 'cp4='+$F('cp4')+'&fieldId=cp3';
	new Ajax.Updater('cp3', '${CONTEXT_PATH}/moradaPopupPT.do2?method=renderOptions', {method: 'get', parameters: p});
};

saveMorada = function(presave){
	var p = 
		'id='+$F('id') +
		'&cp4='+$F('cp4') +
		'&cp3='+$F('cp3') +
		'&cp4Outro='+$F('cp4Outro') +
		'&cp3Outro='+$F('cp3Outro') +
		'&localidade='+$F('localidade') +
		'&localidadeOutro='+$F('localidadeOutro') +
		'&morada='+$F('morada') +
		'&moradaOutro='+$F('moradaOutro') +
		'&lote='+$F('lote');
	if(presave) {
		p += '&savemorada=true';
		new Ajax.Request('${CONTEXT_PATH}/moradaPopupPT.do2?method=save', 
			{method: 'post', parameters: p, onComplete: affectParentFieldsAndClose} 
		);
		
	} else {
		new Ajax.Updater('saveResultMessage', '${CONTEXT_PATH}/moradaPopupPT.do2?method=save', {method: 'get', parameters: p});
		affectParentFieldsAndClose();
	}		
};

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


showOutraMorada = function(){
	$('cp3').hide();
	$('localidade').hide();
	$('morada').hide();
	$('cp4Outro').show();
	$('cp3Outro').show();
	$('localidadeOutro').show();
	$('moradaOutro').show();
};

hideOutraMorada = function(){
	$('cp3').show();
	$('localidade').show();
	$('morada').show();
	$('cp4Outro').hide();
	$('cp3Outro').hide();
	$('localidadeOutro').hide();
	$('moradaOutro').hide();
};

changeCP4 = function(){
	if($F('cp4')==-1){
		showOutraMorada();
	} else {
		hideOutraMorada();
		updateCP3();
		updateLocalidade();
		updateMorada();
	}
	updateDescription();
};

changeCP3 = function(){
	updateLocalidade();
	updateDescription();
	updateMorada();
};

changeLocalidade = function(){
	updateDescription();
	updateMorada();
};

affectParentMoradaValues = function () {
	if(parent.document.getElementById('${idPlaceHolder}')) {
		parent.document.getElementById('${idPlaceHolder}').value=$F('id');
	}
	if(parent.document.getElementById('${cp4PlaceHolder}')) {
		parent.document.getElementById('${cp4PlaceHolder}').value=$F('cp4');
	}
	if(parent.document.getElementById('${cp3PlaceHolder}')) {
		parent.document.getElementById('${cp3PlaceHolder}').value=$F('cp3');
	}
	if(parent.document.getElementById('${cp4OutroPlaceHolder}')) {
		parent.document.getElementById('${cp4OutroPlaceHolder}').value=$F('cp4Outro');
	}
	if(parent.document.getElementById('${cp3OutroPlaceHolder}')) {
		parent.document.getElementById('${cp3OutroPlaceHolder}').value=$F('cp3Outro');
	}
	if(parent.document.getElementById('${localidadePlaceHolder}')) {
		parent.document.getElementById('${localidadePlaceHolder}').value=$F('localidade');
	}
	if(parent.document.getElementById('${localidadeOutroPlaceHolder}')) {
		parent.document.getElementById('${localidadeOutroPlaceHolder}').value=$F('localidadeOutro');
	}
	if(parent.document.getElementById('${moradaPlaceHolder}')) {
		parent.document.getElementById('${moradaPlaceHolder}').value=$F('morada');
	}
	if(parent.document.getElementById('${moradaOutroPlaceHolder}')) {
		parent.document.getElementById('${moradaOutroPlaceHolder}').value=$F('moradaOutro');
	}
	if(parent.document.getElementById('${lotePlaceHolder}')) {
		parent.document.getElementById('${lotePlaceHolder}').value=$F('lote');
	}
}

</script>

<div id="moradaFormContainer" style="border:none; margin:10px;padding:20px 10px;">
<div id="saveResultMessage">&nbsp;</div>
<fieldset style="margin:0px;padding:10px 0px;width:100%;">
<legend><fmt:message key="ipdms.modules.entidade.moradaedit" /></legend>

<nested:root name="moradaPTFormBean">
<nested:hidden property="id" styleId="id"></nested:hidden>

<!-- 
Primeira Linha
 -->
<div class="row formlabel_sf" style="height:30px;" >
<!-- codigo postal -->
	<div class="leftTab label" style="width: 10%;" title="<fmt:message key='ipdms.modules.entidade.codigopostal'/>">
  		<fmt:message key="ipdms.modules.entidade.codigopostal"/>
  	</div>
  	<div class="label" style="width: 27%;" title="<fmt:message key='ipdms.modules.entidade.codigopostal'/>">
	  	<nested:select
	  			property="cp4" 
	  			styleId="cp4" 
	  			onchange="changeCP4();">
			<option value=""></option>
			<option value="-1" ${moradaPTFormBean.cp4 eq '-1' ? 'selected="selected"' : ''}>${outro}</option>
			<html:options collection="cp4List" property="value" labelProperty="title" />
		</nested:select>
	  	<nested:select
	  			property="cp3" 
	  			styleId="cp3" 
	  			onchange="changeCP3();">
			<option value=""></option>
			<html:options collection="cp3List" property="value" labelProperty="title" />
		</nested:select>
		<nested:text property="cp4Outro" styleId="cp4Outro" size="4"  />
		<nested:text property="cp3Outro" styleId="cp3Outro" size="3" />
  	</div>
  	
<!-- localidade -->  	
	<div class="leftTab label" style="width: 10%;" title="<fmt:message key='ipdms.modules.entidade.localidade'/>">
  		<fmt:message key="ipdms.modules.entidade.localidade"/>
  	</div>
  	<div class="label" style="width: 27%;" title="<fmt:message key='ipdms.modules.entidade.localidade'/>">
	  	<nested:select property="localidade" styleId="localidade" onchange="changeLocalidade();">
			<option value=""></option>
			<html:options collection="localidadeList" property="value" labelProperty="title" />
		</nested:select>
  		<nested:text property="localidadeOutro" styleId="localidadeOutro" />
  	</div>
</div>

<!-- 
segunda linha
 -->
 
<!-- descricao -->
<div id="moradaPtDescription"><jsp:include page="renderDescription.jsp"></jsp:include> </div>

<!-- 
terceira linha
 -->
 
<div class="row formlabel_sf" style="height:30px;" >
 <!-- morada -->
	<div class="leftTab label" style="width: 10%;" title="<fmt:message key='ipdms.modules.entidade.morada'/>">
  		<fmt:message key="ipdms.modules.entidade.morada"/>
  	</div>
  	<div class="label" style="width: 27%;" title="<fmt:message key='ipdms.modules.entidade.morada'/>">
	  	<nested:select property="morada" styleId="morada">
			<option value=""></option>
			<html:options collection="moradaList" property="value" labelProperty="title" />
		</nested:select>
		<nested:text property="moradaOutro" styleId="moradaOutro" />
  	</div>
 <!-- lote -->
  	<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.lote'/>">
  		<fmt:message key="ipdms.modules.entidade.lote"/>
  	</div>
  	<div class="label" style="width: 27%;" title="<fmt:message key='ipdms.modules.entidade.lote'/>">
  		<nested:text property="lote" styleId="lote" />
  	</div>
</div>

<script>${moradaPTFormBean.cp4 eq '-1' ? 'showOutraMorada();' : 'hideOutraMorada();'}</script>


</nested:root>
</fieldset>
</div>

<div style="margin:auto;text-align:center;">
	<input type="button" name="submeter" title="<fmt:message key='ipdms.forms.submit.title'/>" value="<fmt:message key='ipdms.forms.submit'/>" onclick="saveMorada(${savemorada});" />
	<input type="button" name="cancelar" title="<fmt:message key='ipdms.forms.cancelar.title'/>" value="<fmt:message key='ipdms.forms.cancelar'/>" onclick="parent.${param.window}.close();"  />
</div>
