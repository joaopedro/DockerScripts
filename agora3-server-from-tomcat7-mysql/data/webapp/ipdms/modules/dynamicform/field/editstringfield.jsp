<%@ taglib uri="/tags/html" prefix="html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
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
		<tr><td class="titulo2"><fmt:message key="ipdms.dynamicform.field.editstring.subtitle" /></td></tr>
	</table>
</div>

<form:form modelAttribute="define-dynamicform">
	<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">
	<html:errors/>
	
	<jsp:include page="editStandardField.jsp"></jsp:include>
		
	<div class="row formlabel_sf" style="height:30%;">
		<div class="leftTab label" style="width: 20%; " title="<fmt:message key="ipdms.dynamicform.field.defaultvalue" />">
			<label for="editField.field.defaultValue">
				<fmt:message key="ipdms.dynamicform.field.defaultvalue" />
			</label>
		</div>
		<div class="label" style="width: 75%;" title="<fmt:message key="ipdms.dynamicform.field.defaultvalue" />">
			<html:text name="dynamicForm" property="editField.field.defaultValue" styleId="editField.field.defaultValue" />
		</div>
	</div>
	<div class="row formlabel_sf" style="height:30%;">
		<div class="leftTab label" style="width: 20%; " title="<fmt:message key="ipdms.dynamicform.field.dynamicvalue" />">
			<label for="editField.field.dynamicValue">
				<fmt:message key="ipdms.dynamicform.field.dynamicvalue" />
			</label>
		</div>
		<div class="label" style="width: 75%;" title="<fmt:message key="ipdms.dynamicform.field.dynamicvalue" />">
			&#36;&#123;<html:text name="dynamicForm" property="editField.field.dynamicValue" styleId="editField.field.dynamicValue" />&#125; (siglaCampo.subpropriedade)
		</div>
	</div>
	<div class="row formlabel_sf" style="height:30%;">
		<div class="leftTab label" style="width: 20%; " title="<fmt:message key="ipdms.dynamicform.field.minsize" />">
			<label for="editField.field.minSize">
				<fmt:message key="ipdms.dynamicform.field.minsize" />
			</label>
		</div>
		<div class="label" style="width: 17%;" title="<fmt:message key="ipdms.dynamicform.field.minsize" />">
			<html:text name="dynamicForm" property="editField.field.minSize" styleId="editField.field.minSize" size="3" maxlength="5"/>
			<fmt:message key="ipdms.number.tip" />
		</div>
		<div class="leftTab label" style="width: 15%; " title="<fmt:message key="ipdms.dynamicform.field.maxsize" />">
			<label for="editField.field.maxSize">
				<fmt:message key="ipdms.dynamicform.field.maxsize" />
			</label>
		</div>
		<div class="label" style="width: 17%;" title="<fmt:message key="ipdms.dynamicform.field.maxsize" />">
			<html:text name="dynamicForm" property="editField.field.maxSize" styleId="editField.field.maxSize" size="3" maxlength="5" />
			<fmt:message key="ipdms.number.tip" />
		</div>
	</div>
	<div class="row formlabel_sf" style="height:30%;">
		<div class="leftTab label" style="width: 20%; " title="<fmt:message key="ipdms.dynamicform.field.inputsize" />">
			<label for="editField.field.inputSize">
				<fmt:message key="ipdms.dynamicform.field.inputsize" />
			</label>
		</div>
		<div class="label" style="width: 75%;" title="<fmt:message key="ipdms.dynamicform.field.inputsize" />">
			<html:text name="dynamicForm" property="editField.field.inputSize" styleId="editField.field.inputSize" size="3" maxlength="5"/>
			<fmt:message key="ipdms.number.tip" />
		</div>			
	</div>	
	<br />
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
