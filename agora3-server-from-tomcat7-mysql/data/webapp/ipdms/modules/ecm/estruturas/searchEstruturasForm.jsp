<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<fmt:message key="ipdms.forms.pesquisar" var="pesquisar" bundle="${ecmBundle}" />
<fmt:message key="ecm.estrutura.designacaoplural" var="estruturaDes" bundle="${ecmBundle}" />
<fmt:message key="ecm.estrutura.descricao" var="descricao" bundle="${ecmBundle}" />
<fmt:message key="ecm.estrutura.proprietario" var="proprietario" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.submit" var="submit" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.submit.title" var="submitTitle" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.cancelar" var="cancelar" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.cancelar.title" var="cancelarTitle" bundle="${ecmBundle}" />

<html:form styleId="ecmSearchForm" action="/listEstruturas">
<fieldset>
	<legend>${pesquisar} ${estruturaDes}</legend>
	
	<html:errors />
	
	<html:hidden property="page"/>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="${descricao}">
			<label for="estruturas.descricaoEstrutura">
				${descricao}
			</label>
		</div>
		<div class="label" style="width: 80%;" title="${descricao}">
			<html:text property="params(descricaoEstrutura)" />
		</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="${proprietario}">
			<label for="estruturas.proprietario">
				${proprietario}
			</label>
		</div>
		<div class="label" style="width: 80%;" title="${proprietario}">
			<html:text property="params(proprietario)" />
		</div>
	</div>
	
	<div class="buttonRow">
		<input type="button" class="btForm" value='${submit}' onclick="listEstruturas();" title='${submitTitle}' />
		<input type="button" class="btFormEscuro" value='${cancelar}' onclick="cancelSearch();" title='${cancelarTitle}' />
	</div>
	
</fieldset>
</html:form>