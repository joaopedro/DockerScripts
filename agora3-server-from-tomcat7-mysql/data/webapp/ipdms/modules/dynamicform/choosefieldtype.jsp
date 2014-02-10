<%@ taglib uri="/tags/html" prefix="html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<fmt:message key="ipdms.forms.anterior" var="anterior" />
<fmt:message key="ipdms.forms.anterior.title" var="anteriorTitle" />
<fmt:message key="ipdms.forms.seguinte" var="seguinte" />
<fmt:message key="ipdms.forms.seguinte.title" var="seguinteTitle" />

<div>
	<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
		<tr><td class="titulo1"><fmt:message key="ipdms.dynamicform.form.edit.title" /></td></tr>
	</table>
</div>
<form:form  modelAttribute="define-dynamicform">
	<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">
	
	
	<div class="row formlabel_sf" >
         <div class="leftTab label" style="width: 97%; " title="<fmt:message key='ipdms.dynamicform.form.choosefieldtype.message' />">
			<label for="optionFields"><fmt:message key="ipdms.dynamicform.form.choosefieldtype.message" /> </label>
         </div>
     </div>
	<div class="row formlabel_sf" >
         <div class="leftTab label" style="width: 97%; " title="<fmt:message key='ipdms.dynamicform.form.choosefieldtype.message' />">
			<html:select name="dynamicForm" property="editFieldType" style="formtext_sf" styleId="optionFields">
				<c:forEach items="${dynamicForm.fieldTypes}" var="ft">
					<c:if test="${ft != 'TABLEOFFIELDS' || !dynamicForm.editingTableField}">
						<html:option value="${ft}">${ft}</html:option>
					</c:if>
				</c:forEach>	
			</html:select>
         </div>
     </div>
	<div class="buttonRow">
		<input type="button" name="_eventId_back" value="${anterior}" class="btForm" onclick="webflowAjaxRequest(event);" title="${anteriorTitle}" />
		<input type="button" name="_eventId_next" value="${seguinte}" class="btForm" onclick="webflowAjaxRequest(event);" title="${seguinteTitle}" />
	</div>
</form:form>

