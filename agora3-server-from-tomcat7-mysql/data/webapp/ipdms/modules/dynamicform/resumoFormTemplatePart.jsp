<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.dynamicform.form.externalid' />">
  		<label for="externalId"><b><fmt:message key="ipdms.dynamicform.form.externalid" />:</b></label>
  	</div>	  	
  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.dynamicform.form.externalid' />">${dynamicForm.externalId}</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.dynamicform.form.description' />">
  		<label for="description"><b><fmt:message key="ipdms.dynamicform.form.description" />:</b></label>
  	</div>	  	
  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.dynamicform.form.description' />">${dynamicForm.description}</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.dynamicform.form.title' />">
  		<label for="title"><b><fmt:message key="ipdms.dynamicform.form.title" />:</b></label>
  	</div>	  	
  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.dynamicform.form.title' />">${dynamicForm.title}</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.dynamicform.form.subtitle' />">
  		<label for="subtitle"><b><fmt:message key="ipdms.dynamicform.form.subtitle" />:</b></label>
  	</div>	  	
  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.dynamicform.form.subtitle' />">${dynamicForm.subtitle}</div>
</div>


<c:set var="validators" value="${dynamicFormValidators}" scope="request" />
<jsp:include page="resumoFormValidators.jsp"></jsp:include>

<br/><br/>
<c:forEach items="${dynamicFormFields}" var="field" varStatus="i">
	<fieldset>
		<legend><fmt:message key='ipdms.dynamicforms.webservice.field' /> ${i.index + 1}: ${field.siglaId}</legend>
		<c:set var="field" value="${field}" scope="request" />
		<c:choose>
			<c:when test="${field.type == 'STRING'}"><jsp:include page="field/resumoStringField.jsp" /></c:when>
			<c:when test="${field.type == 'INTEGER'}"><jsp:include page="field/resumoIntField.jsp" /></c:when>
			<c:when test="${field.type == 'DATE'}"><jsp:include page="field/resumoDateField.jsp" /></c:when>
			<c:when test="${field.type == 'RADIOINPUT'}"><jsp:include page="field/resumoRadioField.jsp" /></c:when>
			<c:when test="${field.type == 'COMBOBOX'}"><jsp:include page="field/resumoComboboxField.jsp" /></c:when>
			<c:when test="${field.type == 'ALERT'}"><jsp:include page="field/resumoAlertField.jsp" /></c:when>
			<c:when test="${field.type == 'NIVELDIMENSIONAL'}"><jsp:include page="field/resumoNivelDimensionalField.jsp" /></c:when>
			<c:when test="${field.type == 'MORADA'}"><jsp:include page="field/resumoMoradaField.jsp" /></c:when>
			<c:when test="${field.type == 'DIMENSAO'}"><jsp:include page="field/resumoDimensaoField.jsp" /></c:when>
			<c:when test="${field.type == 'ENTIDADE'}"><jsp:include page="field/resumoEntidadeField.jsp" /></c:when>
			<c:when test="${field.type == 'MULTILINE'}"><jsp:include page="field/resumoMultilineField.jsp" /></c:when>
			<c:when test="${field.type == 'EXTERNALOPTION'}"><jsp:include page="field/resumoExternalOptionField.jsp" /></c:when>
			<c:when test="${field.type == 'TABLEOFFIELDS'}"><jsp:include page="field/resumoTableOfFields.jsp" /></c:when>
			<c:when test="${field.type == 'PHOTO'}"><jsp:include page="field/resumoPhotoField.jsp" /></c:when>
			<c:when test="${field.type == 'MULTIPLEPHOTO'}"><jsp:include page="field/resumoMultiplePhotoField.jsp" /></c:when>
			<c:when test="${field.type == 'COLABORADOR'}"><jsp:include page="field/resumoColaboradorField.jsp" /></c:when>
			<c:when test="${field.type == 'ORGANICA'}"><jsp:include page="field/resumoOrganicaField.jsp" /></c:when>
			<c:when test="${field.type == 'COMENTARIOPESSOAL'}"><jsp:include page="field/resumoComentarioPessoalField.jsp" /></c:when>
			<c:when test="${field.type == 'BOOLEAN'}"><jsp:include page="field/resumoBooleanField.jsp" /></c:when>
			<c:when test="${field.type == 'PROCESS'}"><jsp:include page="field/resumoProcessoField.jsp" /></c:when>
			<c:otherwise><fmt:message key='ipdms.dynamicforms.webservice.field.unknown' />.</c:otherwise>
		</c:choose>
	</fieldset>
</c:forEach>
<br/>
<c:set var="groups" value="${dynamicFormGroups}" scope="request" />
<jsp:include page="group/resumoGroup.jsp" />
<br/>

<script>
toggleInfo = function (elementid) {
	$(elementid + '_close').toggle(); 
	$(elementid + '_open').toggle();
	$(elementid).toggle();	
};
</script>