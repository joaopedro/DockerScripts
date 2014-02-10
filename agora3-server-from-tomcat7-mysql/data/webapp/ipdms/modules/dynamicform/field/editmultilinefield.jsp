<%@ taglib uri="/tags/html" prefix="html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<fmt:message key="ipdms.forms.anterior" var="anterior" />
<fmt:message key="ipdms.forms.anterior.title" var="anteriorTitle" />
<fmt:message key="ipdms.dynamicform.field.adicionarValidador" var="adicionarValidador" />
<fmt:message key="ipdms.dynamicform.field.gravarCampo" var="gravarCampo" />

<c:set var="newfield" scope="request">${dynamicForm.editField.field.id == 0}</c:set> 

<div>
	<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
		<tr><td class="titulo1"><fmt:message key="ipdms.dynamicform.form.edit.title" /></td></tr>
		<tr><td class="titulo2"><fmt:message key="ipdms.dynamicform.field.editmultiline.subtitle" /></td></tr>
	</table>
</div>

<form:form modelAttribute="define-dynamicform" >
	<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">
	<html:errors/>
	
	<jsp:include page="editStandardField.jsp"></jsp:include>

	
	<div class="row formlabel_sf" style="height:30%;">
		<div class="leftTab label" style="width: 20%; " title="<fmt:message key="ipdms.dynamicform.field.numberofrows" />" >
			<label for="editField.field.numberOfRows">
				<fmt:message key="ipdms.dynamicform.field.numberofrows" />
			</label>
		</div>
		<div class="label" style="width: 17%;" title="<fmt:message key="ipdms.dynamicform.field.numberofrows" />" >
			<html:text name="dynamicForm" property="editField.field.numberOfRows" styleId="editField.field.numberOfRows" size="3" maxlength="5"/>
			<fmt:message key="ipdms.number.tip" />
		</div>
		<div class="leftTab label" style="width: 15%; " title="<fmt:message key="ipdms.dynamicform.field.numberofcolumns" />" >
			<label for="editField.field.numberOfColumns">
				<fmt:message key="ipdms.dynamicform.field.numberofcolumns" />
			</label>
		</div>
		<div class="label" style="width: 17%;" title="<fmt:message key="ipdms.dynamicform.field.numberofcolumns" />" >
			<html:text name="dynamicForm" property="editField.field.numberOfColumns" styleId="editField.field.numberOfColumns" size="3" maxlength="5" />
			<fmt:message key="ipdms.number.tip" />
		</div>
	</div>
	<br/>
	<jsp:include page="fieldValidators.jsp"></jsp:include>
	
	<br/>
	<div class="buttonRow">
		<input type="button" name="_eventId_cancelEditField" value="${anterior}" class="btForm" onclick="webflowAjaxRequest(event);" title="${anteriorTitle}" />
		<c:if test="${empty dynamicForm.editTableField}">
		<input type="button" name="_eventId_addValidatorEditField" value="${adicionarValidador}" class="btForm" onclick="webflowAjaxRequest(event);" title="${adicionarValidador}" />
		</c:if>
		<input type="button" name="_eventId_savefield" value="${gravarCampo}" class="btForm" onclick="webflowAjaxRequest(event);" title="${gravarCampo}" />
	</div>
</form:form>
