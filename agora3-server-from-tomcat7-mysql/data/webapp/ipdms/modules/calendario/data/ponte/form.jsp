<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html:form styleId="ponteForm" action="ponte/save">
<fieldset>
	<legend><fmt:message key="data.ponte.edit.titulo" bundle="${calendarioBundle}" /></legend>
	
	<html:errors />
	
	<jsp:include page="../commons/generalform.jsp" />
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='data.ponte.organica' bundle='${calendarioBundle}' />">
			<label for="tipo"><fmt:message key="data.ponte.organica" bundle="${calendarioBundle}" /> *</label>
		</div>
		<div class="label" style="width: 80%;">
			<html:hidden styleId="${viewPrefix}_organicaid" property="organicaid" />
			<span id="${viewPrefix}_organicadesc">${ponteForm.organica.designacao}</span>
			<img style="vertical-align: bottom" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" 
				class="cursorMao" alt="<fmt:message key='data.ponte.organica' bundle='${calendarioBundle}' />" title="<fmt:message key='data.ponte.organica' bundle='${calendarioBundle}' />" 
				onclick="showOrganica${viewPrefix}();" />
		</div>
	</div>	
	
	<div class="buttonRow">
		<input type="button" class="btForm" value='<fmt:message key="ipdms.forms.submit" bundle="${calendarioBundle}"/>' onclick="save${viewPrefix}('ponteForm');" title='<fmt:message key="ipdms.forms.submit.title" bundle="${calendarioBundle}"/>' />
		<input type="button" class="btFormEscuro" value='<fmt:message key="ipdms.forms.cancelar" bundle="${calendarioBundle}"/>' onclick="cancelEdit${viewPrefix}();" title='<fmt:message key="ipdms.forms.cancelar.title" bundle="${calendarioBundle}"/>' />
	</div>
</fieldset>
</html:form>

