<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld" %>
<%@ taglib prefix="nested" uri="http://struts.apache.org/tags-nested"  %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"  %>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>


<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" />
<c:set var="JS_DIR" value="${CONTEXT_PATH}/ipdms/js" />

<LINK href="${CONTEXT_PATH}/ipdms/themes/estilos.css" type="text/css" rel="stylesheet" />
<LINK href="${CONTEXT_PATH}/ipdms/themes/forms.css" type="text/css" rel="stylesheet" /> 
<LINK href="${CONTEXT_PATH}/ipdms/modules/entidade/theme/entidade.css" type="text/css" rel="stylesheet" /> 

<c:set var="locale" value="${requestScope['ipdms.morada.locale']}" scope="request" />

<script src='${JS_DIR}/prototype.js' type="text/javascript"></script>

<script>

updateMunicipio = function(){
	var p = 'idEstado='+$F('idEstado')+'&fieldId=idMunicipio';
	new Ajax.Updater('idMunicipio', '${CONTEXT_PATH}/moradaPopupBR.do2?method=renderOptions', {method: 'get', parameters: p});
}


saveMorada = function(presave){
	
	var p =
		'id='+$F('id') +
		'&idEstado='+$F('idEstado') +
		'&idMunicipio='+$F('idMunicipio') +
		'&endereco='+$F('endereco') +
		'&complemento='+$F('complemento') +
		'&bairro='+$F('bairro') +
		'&cidade='+$F('cidade') +
		'&numero='+$F('numero') +
		'&cep='+$F('cep');
	
	if(presave){
		p += '&savemorada=true';
		new Ajax.Request('${CONTEXT_PATH}/moradaPopupBR.do2?method=save', 
				{method: 'post', parameters: p, onComplete: affectParentFieldsAndClose
		     } 
			);
	} else {
		alert('not save!!!');
		new Ajax.Updater('saveResultMessage', '${CONTEXT_PATH}/moradaPopupBR.do2?method=save', {method: 'get', parameters: p});
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

changeEstado = function(){
	updateMunicipio();
}

affectParentMoradaValues = function () {
	if(parent.document.getElementById('${idPlaceHolder}')){
		parent.document.getElementById('${idPlaceHolder}').value=$F('id');
	}
	if(parent.document.getElementById('${idEstadoPlaceHolder}')){
		parent.document.getElementById('${idEstadoPlaceHolder}').value=$F('idEstado');
	}
	if(parent.document.getElementById('${idMunicipioPlaceHolder}')){
		parent.document.getElementById('${idMunicipioPlaceHolder}').value=$F('idMunicipio');
	}
	if(parent.document.getElementById('${enderecoPlaceHolder}')){
		parent.document.getElementById('${enderecoPlaceHolder}').value=$F('endereco');
	}
	if(parent.document.getElementById('${complementoPlaceHolder}')){
		parent.document.getElementById('${complementoPlaceHolder}').value=$F('complemento');
	}		
	if(parent.document.getElementById('${bairroPlaceHolder}')){
		parent.document.getElementById('${bairroPlaceHolder}').value=$F('bairro');
	}		
	if(parent.document.getElementById('${cidadePlaceHolder}')){
		parent.document.getElementById('${cidadePlaceHolder}').value=$F('cidade');
	}
	if(parent.document.getElementById('${cepPlaceHolder}')){
		parent.document.getElementById('${cepPlaceHolder}').value=$F('cep');
	}	
}

</script>

<div id="moradaFormContainer" style="border:none; margin:10px;padding:20px 10px;">
<div id="saveResultMessage">&nbsp;</div>
<fieldset style="margin:0px;padding:10px 0px;width:100%;">
<legend><fmt:message key="ipdms.modules.entidade.moradaedit" /></legend>
<nested:root name="moradaBRFormBean">
<nested:hidden property="id" styleId="id"></nested:hidden>

<!-- 
Primeira Linha
 -->
<div class="row formlabel_sf" style="height:30px;" >
<!-- estado -->
	<div class="leftTab label" style="width: 15%;" title="<fmt:message key='ipdms.modules.entidade.br.estado'/>">
  		<fmt:message key="ipdms.modules.entidade.br.estado"/>
  	</div>
  	<div class="label" style="width: 27%;" title="<fmt:message key='ipdms.modules.entidade.br.estado'/>">
	  	<nested:select
	  			property="idEstado" 
	  			styleId="idEstado" 
	  			onchange="changeEstado();">
			<option value=""></option>
			<html:options collection="estadoList" property="value" labelProperty="title" />
		</nested:select>
  	</div>
<!-- municipio -->
	<div class="leftTab label" style="width: 10%;" title="<fmt:message key='ipdms.modules.entidade.br.municipio'/>">
  		<fmt:message key="ipdms.modules.entidade.br.municipio"/>
  	</div>
  	<div class="label" style="width: 27%;" title="<fmt:message key='ipdms.modules.entidade.br.municipio'/>">
	  	<nested:select
	  			property="idMunicipio" 
	  			styleId="idMunicipio" >
			<option value=""></option>
			<html:options collection="municipioList" property="value" labelProperty="title" />
		</nested:select>
  	</div>
</div>
<!-- 
Segunda Linha
 -->
<div class="row formlabel_sf" style="height:30px;" >
<!-- endereco -->
	<div class="leftTab label" style="width: 15%;" title="<fmt:message key='ipdms.modules.entidade.br.endereco'/>">
  		<fmt:message key="ipdms.modules.entidade.br.endereco"/>
  	</div>
  	<div class="label" style="width: 27%;" title="<fmt:message key='ipdms.modules.entidade.br.endereco'/>">
	  	<nested:text property="endereco" styleId="endereco"></nested:text>
	</div>
	<!-- numero -->
	<div class="leftTab label" style="width: 10%;" title="<fmt:message key='ipdms.modules.entidade.br.numero'/>">
  		<fmt:message key="ipdms.modules.entidade.br.numero"/>
  	</div>
  	<div class="label" style="width: 27%;" title="<fmt:message key='ipdms.modules.entidade.br.numero'/>">
	  	<nested:text property="numero" styleId="numero"></nested:text>
	</div>
</div>
<!-- 
Terceira Linha
 -->
<div class="row formlabel_sf" style="height:30px;" >
<!-- complemento -->
	<div class="leftTab label" style="width: 15%;" title="<fmt:message key='ipdms.modules.entidade.br.complemento'/>">
  		<fmt:message key="ipdms.modules.entidade.br.complemento"/>
  	</div>
  	<div class="label" style="width: 27%;" title="<fmt:message key='ipdms.modules.entidade.br.complemento'/>">
	  	<nested:text property="complemento" styleId="complemento"></nested:text>
	</div>
<!-- bairro -->
	<div class="leftTab label" style="width: 10%;" title="<fmt:message key='ipdms.modules.entidade.br.bairro'/>">
  		<fmt:message key="ipdms.modules.entidade.br.bairro"/>
  	</div>
  	<div class="label" style="width: 27%;" title="<fmt:message key='ipdms.modules.entidade.br.bairro'/>">
	  	<nested:text property="bairro" styleId="bairro"></nested:text>
	</div>
</div>
<!-- 
Quarta Linha
 -->
<div class="row formlabel_sf" style="height:30px;" >
	<!-- cidade -->
	<div class="leftTab label" style="width: 15%;" title="<fmt:message key='ipdms.modules.entidade.br.cidade'/>">
  		<fmt:message key="ipdms.modules.entidade.br.cidade"/>
  	</div>
  	<div class="label" style="width: 27%;" title="<fmt:message key='ipdms.modules.entidade.br.cidade'/>">
	  	<nested:text property="cidade" styleId="cidade"></nested:text>
	</div>
<!-- cep -->
	<div class="leftTab label" style="width: 10%;" title="<fmt:message key='ipdms.modules.entidade.br.cep'/>">
  		<fmt:message key="ipdms.modules.entidade.br.cep"/>
  	</div>
  	<div class="label" style="width: 27%;" title="<fmt:message key='ipdms.modules.entidade.br.cep'/>">
	  	<nested:text property="cep" styleId="cep"></nested:text>
	</div>
	
</div>

</nested:root>
</fieldset>
</div>

<div style="margin:auto;text-align:center;">
	<input type="button" name="submeter" title="<fmt:message key='ipdms.forms.submit.title'/>" value="<fmt:message key='ipdms.forms.submit'/>" onclick="saveMorada(${savemorada});" />
	<input type="button" name="cancelar" title="<fmt:message key='ipdms.forms.cancelar.title'/>" value="<fmt:message key='ipdms.forms.cancelar'/>" onclick="parent.${param.window}.close();"  />
</div>
