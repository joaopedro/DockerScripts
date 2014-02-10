<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html:form styleId="editCalendarioForm" action="edit/save">
<fieldset>
	<legend><fmt:message key="calendario.edit.titulo" bundle="${calendarioBundle}" /></legend>
	
	<html:errors />
	
	<html:hidden property="id"/>

	<div class="row" style="padding-bottom:2%;">
		<div class="leftTab label" style="width: 90%; " title="<fmt:message key='ipdms.obrigatorio' bundle='${calendarioBundle}' />">
	  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" bundle="${calendarioBundle}" /></span>
	  	</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='calendario.edit.ano' bundle='${calendarioBundle}' />">
			<label for="calendario.ano"><fmt:message key="calendario.edit.ano" bundle="${calendarioBundle}" /> *</label>
		</div>
		<div class="label" style="width: 80%;" title="<fmt:message key='calendario.edit.ano' bundle='${calendarioBundle}' />">
			<html:text property="ano" />
		</div>
	</div>

	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='calendario.edit.descricao' bundle='${calendarioBundle}' />">
			<label for="calendario.descricao"><fmt:message key="calendario.edit.descricao" bundle="${calendarioBundle}" /> *</label>
		</div>
		<div class="label" style="width: 80%;" title="<fmt:message key='calendario.edit.descricao' bundle='${calendarioBundle}' />">
			<html:text property="descricao" />
		</div>
	</div>	
	<div class="buttonRow">
		<input type="button" class="btForm" value='<fmt:message key="ipdms.forms.submit" bundle="${calendarioBundle}"/>' onclick="save('editCalendarioForm');" title='<fmt:message key="ipdms.forms.submit.title" bundle="${calendarioBundle}"/>' />
		<input type="button" class="btFormEscuro" value='<fmt:message key="ipdms.forms.cancelar" bundle="${calendarioBundle}"/>' onclick="cancelEdit();" title='<fmt:message key="ipdms.forms.cancelar.title" bundle="${calendarioBundle}"/>' />
	</div>
</fieldset>
</html:form>