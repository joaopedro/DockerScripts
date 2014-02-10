<%@ taglib uri="/tags/html" prefix="html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<fmt:message key="ipdms.forms.anterior" var="anterior" />
<fmt:message key="ipdms.forms.anterior.title" var="anteriorTitle" />
<fmt:message key="ipdms.dynamicform.field.adicionarRelacao" var="adicionarRelacao" />
<fmt:message key="ipdms.dynamicform.field.adicionarValidador" var="adicionarValidador" />
<fmt:message key="ipdms.dynamicform.field.gravarCampo" var="gravarCampo" />

<c:set var="newfield" scope="request">${dynamicForm.editField.field.id == 0}</c:set> 

<div>
	<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
		<tr><td class="titulo1"><fmt:message key="ipdms.dynamicform.form.edit.title" /></td></tr>
		<tr><td class="titulo2"><fmt:message key="ipdms.dynamicform.field.editdate.subtitle" /></td></tr>
	</table>
</div>
<br/>

<form:form modelAttribute="define-dynamicform" >
	<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">
	<html:errors/>

	<jsp:include page="editStandardField.jsp"></jsp:include>
	
	<div class="row formlabel_sf" style="height:30%;">
		<div class="leftTab label" style="width: 20%; " title="<fmt:message key="ipdms.dynamicform.field.defaultvalue" />">
			<label for="editField.field.defaultValue">
				<fmt:message key="ipdms.dynamicform.field.defaultvalue" />
			</label>
		</div>
		<div class="label" style="width: 25%;" title="<fmt:message key="ipdms.dynamicform.field.defaultvalue" />">
			<html:text name="dynamicForm" property="editField.field.defaultValue" styleId="editField.field.defaultValue" />
			<script>
				Calendar.setup({ inputField : 'editField.field.defaultValue', ifFormat : '%d-%m-%Y', showsTime : false });
			</script>
		</div>
		<div class="leftTab label" style="width: 15%; " title="<fmt:message key="ipdms.dynamicform.field.currentdaydefault" />">
			<label for="editField.field.defaultValueIsCurrentDay">
				<fmt:message key="ipdms.dynamicform.field.currentdaydefault" />
			</label>
		</div>
		<div class="label" style="width: 15%;" title="<fmt:message key="ipdms.dynamicform.field.currentdaydefault" />">
			<html:checkbox name="dynamicForm" property="editField.field.defaultValueIsCurrentDay" 
				styleId="editField.field.defaultValueIsCurrentDay" style="border:0;" />
		</div>
	</div>
	
	<div class="row formlabel_sf" style="height:30%;">
		<div class="leftTab label" style="width: 20%; " title="<fmt:message key="ipdms.dynamicform.field.beforecurrentday" />">
			<label for="editField.field.beforeToday">
				<fmt:message key="ipdms.dynamicform.field.beforecurrentday" />
			</label>
		</div>
		<div class="label" style="width: 5%;" title="<fmt:message key="ipdms.dynamicform.field.beforecurrentday" />">
			<html:checkbox name="dynamicForm" property="editField.field.beforeToday" styleId="editField.field.beforeToday" />
		</div>
		<div class="leftTab label" style="width: 20%; " title="<fmt:message key="ipdms.dynamicform.field.aftercurrentday" />">
			<label for="editField.field.afterToday">
				<fmt:message key="ipdms.dynamicform.field.aftercurrentday" />
			</label>
		</div>
		<div class="label" style="width: 5%;" title="<fmt:message key="ipdms.dynamicform.field.aftercurrentday" />">
			<html:checkbox name="dynamicForm" property="editField.field.afterToday" styleId="editField.field.afterToday" />
		</div>
	</div>

	<div class="row formlabel_sf" style="height:30%;">
		<div class="leftTab label" style="width: 20%; " title="<fmt:message key="ipdms.dynamicform.field.beforethen" />">
			<label for="editField.field.beforeThen">
				<fmt:message key="ipdms.dynamicform.field.beforethen" />
			</label>
		</div>
		<div class="label" style="width: 75%;" title="<fmt:message key="ipdms.dynamicform.field.beforethen" />">
			<html:text name="dynamicForm" property="editField.field.beforeThen" styleId="editField.field.beforeThen" />
			<script>
				Calendar.setup({ inputField : 'editField.field.beforeThen', ifFormat : '%d-%m-%Y', showsTime : false });
			</script>
		</div>
	</div>
	<div class="row formlabel_sf" style="height:30%;">
		<div class="leftTab label" style="width: 20%; " title="<fmt:message key="ipdms.dynamicform.field.afterthen" />">
			<label for="editField.field.afterThen">
				<fmt:message key="ipdms.dynamicform.field.afterthen" />
			</label>
		</div>
		<div class="label" style="width: 75%;" title="<fmt:message key="ipdms.dynamicform.field.afterthen" />">
			<html:text name="dynamicForm" property="editField.field.afterThen" styleId="editField.field.afterThen" />
			<script>
				Calendar.setup({ inputField : 'editField.field.afterThen', ifFormat : '%d-%m-%Y', showsTime : false });
			</script>
		</div>
	</div>

	<jsp:include page="fieldRelations.jsp"></jsp:include>

	<jsp:include page="fieldValidators.jsp"></jsp:include>

	<br/>
	<div class="buttonRow">
		<input type="button" name="_eventId_cancelEditField" value="${anterior}" class="btForm" onclick="webflowAjaxRequest(event);" title="${anteriorTitle}" />
		<c:if test="${empty dynamicForm.editTableField}">
			<c:if test="${newfield}">
				<input type="button" name="_eventId_addRelationEditField" value="${adicionarRelacao}" class="btForm" onclick="webflowAjaxRequest(event);" title="${adicionarRelacao}" />
			</c:if>
			<input type="button" name="_eventId_addValidatorEditField" value="${adicionarValidador}" class="btForm" onclick="webflowAjaxRequest(event);" title="${adicionarValidador}" />
		</c:if>
		<input type="button" name="_eventId_savefield" value="${gravarCampo}" class="btForm" onclick="webflowAjaxRequest(event);" title="${gravarCampo}" />
	</div>
</form:form>
