<%@ taglib uri="/tags/html" prefix="html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<fmt:message key="ipdms.forms.anterior" var="anterior" />
<fmt:message key="ipdms.forms.anterior.title" var="anteriorTitle" />
<fmt:message key="ipdms.dynamicform.field.gravarCampo" var="gravarCampo" />

<c:set var="newfield" scope="request">${dynamicForm.editField.field.id == 0}</c:set> 

<div>
	<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
		<tr><td class="titulo1"><fmt:message key="ipdms.dynamicform.form.edit.title" /></td></tr>
		<tr><td class="titulo2"><fmt:message key="ipdms.dynamicform.field.editphoto.subtitle" /></td></tr>
	</table>
</div>
<br/>

<form:form modelAttribute="define-dynamicform" >
	<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">
	<html:errors/>
	<jsp:include page="editStandardField.jsp"></jsp:include>
	
	<div class="row formlabel_sf" style="height:30%;">
		<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.dynamicform.field.height' />">
			<label for="editField.field.height">
				<fmt:message key="ipdms.dynamicform.field.height" />
			</label>
		</div>
		<div class="label" style="width: 75%;" title="<fmt:message key='ipdms.dynamicform.field.height' />">
			<html:text name="dynamicForm" property="editField.field.height" 
				styleId="editField.field.height" />
		</div>
	</div>
	<div class="row formlabel_sf" style="height:30%;">
		<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.dynamicform.field.width' />">
			<label for="editField.field.width">
				<fmt:message key="ipdms.dynamicform.field.width" />
			</label>
		</div>
		<div class="label" style="width: 75%;" title="<fmt:message key='ipdms.dynamicform.field.width' />">
			<html:text name="dynamicForm" property="editField.field.width" 
				styleId="editField.field.width" />
		</div>
	</div>
		
	<br/>
	<div class="buttonRow">
		<input type="button" name="_eventId_cancelEditField" value="${anterior}" class="btForm" onclick="webflowAjaxRequest(event);" title="${anteriorTitle}" />
		<input type="button" name="_eventId_savefield" value="${gravarCampo}" class="btForm" onclick="webflowAjaxRequest(event);" title="${gravarCampo}" />
	</div>
</form:form>
