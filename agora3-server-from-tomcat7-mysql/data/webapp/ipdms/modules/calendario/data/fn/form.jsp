<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html:form styleId="feriadoNacionalForm" action="fn/save">
<fieldset>
	<legend><fmt:message key="data.fn.edit.titulo" bundle="${calendarioBundle}" /></legend>
	
	<html:errors />

	<jsp:include page="../commons/generalform.jsp" />	
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='data.fn.tipo' bundle='${calendarioBundle}' />">
			<label for="tipo"><fmt:message key="data.fn.tipo" bundle="${calendarioBundle}" /> *</label>
		</div>
		<div class="label" style="width: 80%;" title="<fmt:message key='data.fn.tipo' bundle='${calendarioBundle}' />">
			<html:radio property="tipo" value="FIXO" /> <fmt:message key="data.fn.tipo.fixo" bundle="${calendarioBundle}" />
			<html:radio property="tipo" value="MOVEL" /> <fmt:message key="data.fn.tipo.movel" bundle="${calendarioBundle}" />
		</div>
	</div>
	<div class="buttonRow">
		<input type="button" class="btForm" value='<fmt:message key="ipdms.forms.submit" bundle="${calendarioBundle}"/>' onclick="save${viewPrefix}('feriadoNacionalForm');" title='<fmt:message key="ipdms.forms.submit.title" bundle="${calendarioBundle}"/>' />
		<input type="button" class="btFormEscuro" value='<fmt:message key="ipdms.forms.cancelar" bundle="${calendarioBundle}"/>' onclick="cancelEdit${viewPrefix}();" title='<fmt:message key="ipdms.forms.cancelar.title" bundle="${calendarioBundle}"/>' />
	</div>
</fieldset>
</html:form>