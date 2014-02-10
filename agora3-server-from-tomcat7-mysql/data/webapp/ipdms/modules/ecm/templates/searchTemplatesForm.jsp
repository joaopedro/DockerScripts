<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<fmt:message key="ipdms.forms.pesquisar" var="pesquisar" bundle="${ecmBundle}" />
<fmt:message key="ecm.template.designacaoplural" var="templateDes" bundle="${ecmBundle}" />
<fmt:message key="ecm.template.descricao" var="descricao" bundle="${ecmBundle}" />
<fmt:message key="ecm.template.proprietario" var="proprietario" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.submit" var="submit" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.submit.title" var="submitTitle" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.cancelar" var="cancelar" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.cancelar.title" var="cancelarTitle" bundle="${ecmBundle}" />

<html:form styleId="ecmSearchForm" action="/listTemplateEstruturas">
<fieldset>
	<legend>${pesquisar} ${templateDes}</legend>
	
	<html:errors />
	
	<html:hidden property="page"/>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="${descricao}">
			<label for="templateEstruturas.descricaoTemplate">
				${descricao}
			</label>
		</div>
		<div class="label" style="width: 80%;" title="${descricao}">
			<html:text property="params(descricaoTemplate)" />
		</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="${proprietario}">
			<label for="templateEstruturas.proprietario">
				${proprietario}
			</label>
		</div>
		<div class="label" style="width: 80%;" title="${proprietario}">
			<html:text property="params(proprietario)" />
		</div>
	</div>
	
	<div class="buttonRow">
		<input type="button" class="btForm" value='${submit}' onclick="listTemplateEstruturas();" title='${submitTitle}' />
		<input type="button" class="btFormEscuro" value='${cancelar}' onclick="cancelSearch();" title='${cancelarTitle}' />
	</div>
	
</fieldset>
</html:form>