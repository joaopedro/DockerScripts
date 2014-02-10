<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<fieldset>
<legend><fmt:message key="ipdms.modules.template.tipotemplate.edit.titulo" /></legend>

<div id="errorDivTipoTemplate">
	<html:errors />
</div>
<input type="hidden" id="tipotemplate_id" value="${tipoTemplate.id}">

<div class="row" style="padding-bottom:2%;">
	<div class="leftTab label" style="width: 90%; " title="<fmt:message key='ipdms.obrigatorio' />">
  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
  	</div>
</div>

<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.modules.templates.tipotemplate.designacao' />">
		<label for="tipotemplate_designacao"><fmt:message key="ipdms.modules.templates.tipotemplate.designacao" /> *</label>
	</div>
	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.modules.templates.tipotemplate.designacao' />">
		<input type="text" id="tipotemplate_designacao" value="${tipoTemplate.designacao}" />
	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.modules.templates.tipotemplate.descricao' />">
		<label for="tipotemplate_descricao"><fmt:message key="ipdms.modules.templates.tipotemplate.descricao" /></label>
	</div>
	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.modules.templates.tipotemplate.descricao' />">
		<input type="text" id="tipotemplate_descricao" value="${tipoTemplate.descricao}" style="width:80%"/>
	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.modules.templates.tipotemplate.idsequencia' />">
		<label for="tipotemplate_descricao"><fmt:message key="ipdms.modules.templates.tipotemplate.idsequencia" /></label>
	</div>
	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.modules.templates.tipotemplate.idsequencia' />">
		<input type="text" id="tipotemplate_idsequencia" value="${tipoTemplate.idSequencia}" size="20" maxlength="20"/>
	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.modules.templates.tipotemplate.descsequencia' />">
		<label for="tipotemplate_descricao"><fmt:message key="ipdms.modules.templates.tipotemplate.descsequencia" /></label>
	</div>
	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.modules.templates.tipotemplate.descsequencia' />">
		<input type="text" id="tipotemplate_descsequencia" value="${tipoTemplate.descricaoSequencia}" size="20" maxlength="20"/>
	</div>
</div>

<div class="buttonRow">
	<input type="button" class="btForm" title="<fmt:message key='ipdms.forms.submit.title'/>" value="<fmt:message key='ipdms.forms.submit'/>" onclick="saveTipoTemplate();" />
	<input type="button" class="btFormEscuro" title="<fmt:message key='ipdms.forms.cancelar.title'/>" value="<fmt:message key='ipdms.forms.cancelar'/>" onclick="Element.update('editTipoTemplatePane', '' );" />
</div>
</fieldset>