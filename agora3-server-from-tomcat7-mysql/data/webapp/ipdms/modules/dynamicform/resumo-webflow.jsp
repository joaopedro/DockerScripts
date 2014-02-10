<%@ taglib uri="/tags/html" prefix="html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<fmt:message key="ipdms.forms.anterior" var="anterior" />
<fmt:message key="ipdms.forms.anterior.title" var="anteriorTitle" />
<fmt:message key="ipdms.forms.submit" var="submit" />
<fmt:message key="ipdms.forms.submit.title" var="submitTitle" />

<div>
	<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
		<tr><td class="titulo1"><fmt:message key="ipdms.dynamicform.form.edit.title" /></td></tr>
		<tr><td class="titulo2"><fmt:message key="ipdms.dynamicform.form.edit.resumo.subtitle" /></td></tr>
	</table>
</div>

<form:form  modelAttribute="define-dynamicform">
	<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">

	<c:set var="dynamicFormValidators" value="${dynamicForm.formValidators}" scope="request" />
	<c:set var="dynamicFormFields" value="${dynamicForm.fields}" scope="request" />
	<c:set var="dynamicFormGroups" value="${dynamicForm.groups}" scope="request" />
	<c:set var="dynamicForm" value="${dynamicForm.form}" scope="request" />
	
	<jsp:include page="resumoFormTemplatePart.jsp" />
	<div class="buttonRow">
		<input type="submit" name="_eventId_back" value="${anterior}" class="btForm" onclick="webflowAjaxRequest(event);" title="${anteriorTitle}" />
		<input type="submit" name="_eventId_saveform" value="${submit}" class="btForm" title="${submitTitle}" />
	</div>
</form:form>