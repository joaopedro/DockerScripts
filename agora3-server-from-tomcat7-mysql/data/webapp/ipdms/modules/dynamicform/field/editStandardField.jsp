<%@ taglib uri="/tags/html" prefix="html" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row" style="padding-bottom:2%;">
	<div class="leftTab label" style="width: 90%; ">
  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
  	</div>
</div>
	
	
<div class="row formlabel_sf" style="height:30%;">
	<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.dynamicform.field.fieldid' />">
		<label for="editField.field.siglaId">
			<c:choose>
				<c:when test="${newfield}">
					<fmt:message key="ipdms.dynamicform.field.fieldid" /> *	
				</c:when>
				<c:otherwise>
					<fmt:message key="ipdms.dynamicform.field.fieldid" />:
				</c:otherwise>
			</c:choose>
		</label>
	</div>
	<div class="label" style="width: 75%;" title="<fmt:message key='ipdms.dynamicform.field.fieldid' />">
		<c:choose>
			<c:when test="${newfield}">
				<html:text name="dynamicForm" property="editField.field.siglaId"  styleId="editField.field.siglaId" size="30"/>	
			</c:when>
			<c:otherwise>
				${dynamicForm.editField.field.siglaId}
			</c:otherwise>
		</c:choose>
	</div>			
</div>
<div class="row formlabel_sf" style="height:30%;">
	<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.dynamicform.field.externalid' />" >
		<label for="editField.field.externalId">
			<c:choose>
				<c:when test="${newfield}">
					<fmt:message key="ipdms.dynamicform.field.externalid" />	
				</c:when>
				<c:otherwise>
					<fmt:message key="ipdms.dynamicform.field.externalid" />:
				</c:otherwise>
			</c:choose>
		</label>
	</div>
	<div class="label" style="width: 75%;" title="<fmt:message key='ipdms.dynamicform.field.externalid' />">
		<c:choose>
			<c:when test="${newfield}">
				<html:text name="dynamicForm" property="editField.field.externalId" styleId="editField.field.externalId"  />	
			</c:when>
			<c:otherwise>
				${dynamicForm.editField.field.externalId}
			</c:otherwise>
		</c:choose>
	</div>			
</div>
<div class="row formlabel_sf" style="height:30%;">
	<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.dynamicform.field.label' />">
		<label for="editField.field.label">
			<fmt:message key="ipdms.dynamicform.field.label" /> *
		</label>
	</div>
	<div class="label" style="width: 75%;" title="<fmt:message key='ipdms.dynamicform.field.label' />">
	  <html:text name="dynamicForm" property="editField.field.label" styleId="editField.field.label" size="30"/>	
	</div>			
</div>		
<div class="row formlabel_sf" style="height:30%;">
	<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.dynamicform.field.required' />">
		<label for="editField.field.required">
			<fmt:message key="ipdms.dynamicform.field.required" />
		</label>
	</div>
	<div class="label" style="width: 75%;" title="<fmt:message key='ipdms.dynamicform.field.required' />">
		<html:checkbox name="dynamicForm" property="editField.field.required" styleId="editField.field.required" style="border:0;" />
	</div>			
</div>	
<div class="row formlabel_sf" style="height:30%;">
	<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.dynamicform.field.inheritvalue' />">
		<label for="editField.field.inheritValue">
			<fmt:message key="ipdms.dynamicform.field.inheritvalue" />
		</label>
	</div>
	<div class="label" style="width: 75%;" title="<fmt:message key='ipdms.dynamicform.field.inheritvalue' />">
		<html:checkbox name="dynamicForm" property="editField.field.inheritValue" styleId="editField.field.inheritValue" style="border:0;" />
	</div>			
</div>
<div class="row formlabel_sf" style="height:30%;">
	<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.dynamicform.field.requiredonvalue' />">
		<label for="editField.field.requiredOnValue">
			<fmt:message key="ipdms.dynamicform.field.requiredonvalue" />
		</label>
	</div>
	<div class="label" style="width: 75%;" title="<fmt:message key='ipdms.dynamicform.field.requiredonvalue' />">
		<html:text name="dynamicForm" property="editField.field.requiredOnValue" styleId="editField.field.requiredOnValue" />
	</div>
</div>
<div class="row formlabel_sf" style="height:30%;">
	<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.dynamicform.field.visible' />">
		<label for="editField.field.visible">
			<fmt:message key="ipdms.dynamicform.field.visible" />
		</label>
	</div>
	<div class="label" style="width: 75%;" title="<fmt:message key='ipdms.dynamicform.field.visible' />">
		<html:checkbox name="dynamicForm" property="editField.field.visible" styleId="editField.field.visible" style="border:0;" />
	</div>			
</div>
<div class="row formlabel_sf" style="height:30%;">
	<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.dynamicform.field.enabled' />">
		<label for="editField.field.enabled">
			<fmt:message key="ipdms.dynamicform.field.enabled" />
		</label>
	</div>
	<div class="label" style="width: 75%;" title="<fmt:message key='ipdms.dynamicform.field.enabled' />">
		<html:checkbox name="dynamicForm" property="editField.field.enabled" styleId="editField.field.enabled" style="border:0;" />
	</div>			
</div>
<div class="row formlabel_sf" style="height:30%;">
	<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.dynamicform.field.signer' />">
		<label for="editField.field.signer">
			<fmt:message key="ipdms.dynamicform.field.signer" />
		</label>
	</div>
	<div class="label" style="width: 75%;" title="<fmt:message key='ipdms.dynamicform.field.signer' />">
		<html:checkbox name="dynamicForm" property="editField.field.signer" styleId="editField.field.signer" style="border:0;" />
	</div>			
</div>