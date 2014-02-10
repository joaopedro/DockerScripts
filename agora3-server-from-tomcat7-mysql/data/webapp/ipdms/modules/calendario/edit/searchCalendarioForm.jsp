<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html:form styleId="calendarioSearchForm" action="edit/list">
<fieldset>
	<legend><fmt:message key="calendario.search.titulo" bundle="${calendarioBundle}" /></legend>
	
	<html:errors />
	
	<html:hidden property="page"/>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='calendario.edit.ano' bundle='${calendarioBundle}' />">
			<label for="calendario.ano">
				<fmt:message key="calendario.edit.ano" bundle="${calendarioBundle}" />
			</label>
		</div>
		<div class="label" style="width: 80%;" title="<fmt:message key='calendario.edit.ano' bundle='${calendarioBundle}' />">
			<html:text property="params(ano)" />
		</div>
	</div>

	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='calendario.edit.descricao' bundle='${calendarioBundle}' />">
			<label for="calendario.descricao">
				<fmt:message key="calendario.edit.descricao" bundle="${calendarioBundle}" />
			</label>
		</div>
		<div class="label" style="width: 80%;" title="<fmt:message key='calendario.edit.descricao' bundle='${calendarioBundle}' />">
			<html:text property="params(descricao)" />
		</div>
	</div>	
	<div class="buttonRow">
		<input type="button" class="btForm" value='<fmt:message key="ipdms.forms.submit" bundle="${calendarioBundle}"/>' onclick="listCalendario();" title='<fmt:message key="ipdms.forms.submit.title" bundle="${calendarioBundle}"/>' />
		<input type="button" class="btFormEscuro" value='<fmt:message key="ipdms.forms.cancelar" bundle="${calendarioBundle}"/>' onclick="cancelSearch();" title='<fmt:message key="ipdms.forms.cancelar.title" bundle="${calendarioBundle}"/>' />
	</div>
</fieldset>
</html:form>