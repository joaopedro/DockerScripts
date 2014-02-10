<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.obrigatorio" var="obrigatorio" bundle="${ecmBundle}" />
<fmt:message key="ecm.instancia.descricao" var="descricao" bundle="${ecmBundle}" />
<fmt:message key="ecm.instancia.proprietario" var="proprietario" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.gravar" var="gravar" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.cancelar" var="cancelar" bundle="${ecmBundle}" />

<fieldset style="margin-left:10px; margin-top:10px; width:90%;">
	<div id="errorDivInstantiateTemplate">
		<html:errors />
	</div>
	
	<input type="hidden" id="codigoTemplate" name="codigoTemplate" value="${codigoTemplate}" />
	
	<div class="row" style="margin-bottom:20px; margin-left:-10px;">
		<div class="leftTab label" style="width: 90%; " title="${obrigatorio}">
	  		<span class="formlabel_obrigatorio">${obrigatorio}</span>
	  	</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 25%; " title="${descricao}">
			<label for="descricaoEstrutura">${descricao} *</label>
		</div>
		<div class="label" style="width: 50%;" title="${descricao}">
			<input type="text" name="descricaoEstrutura" id="descricaoEstrutura" value="" size="25">
		</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 25%; " title="${proprietario}">
			<label for="proprietario">${proprietario} *</label>
		</div>
		<div class="label" style="width: 50%;" title="${proprietario}">
			<input type="text" name="proprietario" id="proprietario" value="" size="25">
		</div>
	</div>
	
	<div style="clear:both"></div>
	
	<div class="buttonRow">
		<input type="button" class="btForm" title="${gravar}" value="${gravar}" onclick="saveTemplateInstance();" />
		<input type="button" class="btFormEscuro" title="${cancelar}" value="${cancelar}" onclick="cancelTemplateInstance();" />
	</div>	
</fieldset>