<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<html:form styleId="comentarioPessoalForm" action="saveComentarioPessoalAction">

<fieldset>
<legend><fmt:message key="ipdms.comentariopessoal.editar" />&nbsp;</legend>

<div id="errorDivTipoTemplate">
	<html:errors />
</div>
<html:hidden property="id" />

<div class="row" style="padding-bottom:2%;">
	<div class="leftTab label" style="width: 90%; " title="<fmt:message key='ipdms.obrigatorio' />">
  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
  	</div>
</div>

<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.modules.templates.tipotemplate.descricao' />">
		<label for="tipotemplate_descricao"><fmt:message key="ipdms.modules.templates.tipotemplate.descricao" /> *</label>
	</div>
	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.modules.templates.tipotemplate.descricao' />">
		<html:textarea property="comentario" />
	</div>
</div>

<div class="buttonRow">
	<input type="button" class="btForm" title="<fmt:message key='ipdms.forms.submit.title'/>" value="<fmt:message key='ipdms.forms.submit'/>" onclick="saveComentarioPessoal();" />
	<input type="button" class="btFormEscuro" title="<fmt:message key='ipdms.forms.cancelar.title'/>" value="<fmt:message key='ipdms.forms.cancelar'/>" onclick="Element.update('editCPDiv', '' );" />
</div>
</fieldset>
</html:form>