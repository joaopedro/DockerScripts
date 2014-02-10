<%@ taglib uri="/tags/html" prefix="html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:message key="ipdms.forms.anterior" var="anterior" />
<fmt:message key="ipdms.forms.anterior.title" var="anteriorTitle" />

<div>
	<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
		<!-- tr><td class="titulo1"><fmt:message key="ipdms.dynamicform.form.edit.title" /></td></tr-->
		<tr><td class="titulo1"><fmt:message key="ipdms.dynamicform.form.edit.resumo.subtitle" /></td></tr>
		<!-- tr><td class="titulo2"><fmt:message key="ipdms.dynamicform.form.edit.resumo.subtitle" /></td></tr-->
	</table>
</div>

<html:form action="listDynamicForms" method="get">

	<c:set var="dynamicFormValidators" value="${dynamicForm.validators}" scope="request" />
	<c:set var="dynamicFormFields" value="${dynamicForm.fields}" scope="request" />
	<c:set var="dynamicFormGroups" value="${dynamicForm.groups}" scope="request" />

	<jsp:include page="resumoFormTemplatePart.jsp" />
	<div class="buttonRow">
		<input type="submit" value="${anterior}" class="btForm" title="${anteriorTitle}"/>
	</div>
</html:form>
