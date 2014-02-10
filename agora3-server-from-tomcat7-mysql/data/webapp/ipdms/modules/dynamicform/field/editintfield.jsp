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

<script language="Javascript" defer="defer">

 swapVisibility= function(elemCheckBox){
	 
	 //element name
	 var elemCheckedName=elemCheckBox.name;
	 
	 var elemToHide;
	 var elemToShow;
	 var checkBoxToHide;
	 
	 
	 if(elemCheckedName==="editField.field.tableTotalizer"){
		 
		//full divs
		 elemToHide="totalizer_inputfield";
		 elemToShow="expression_inputfield";
		 
		 checkBoxToHide="editField.field.expression";
	 }else{
		 //full divs
		 elemToHide="expression_inputfield";
		 elemToShow="totalizer_inputfield";
		 
		 checkBoxToHide="editField.field.tableTotalizer";
	 }
	 
	 //if it's visible we hide it and clean input field
	 if( $(elemToHide).visible() ){
		 
	 	$(elemToHide).hide();
	 	//clean field input value in case there's same text
	 	$(elemCheckedName+"Field").value="";
	 }else{
		//show element if checkbox changes to checked
	 	$(elemToHide).show();
		
	 	//check if the other element exists
	 	//and proceed to hide it and change the respective
	 	//checkbox state to unchecked
	 	//set value of field to empty
	 	if($(elemToShow)){
	 		//uncheck the other checkbox if its checked expression/totalizer
	 		$(checkBoxToHide).checked = false;
	 		//clean field input value in case there's same text
	 		$(elemCheckedName+"Field").value="";
	 		$(elemToShow).hide();
	 	}
	 }
 }
 
 swapAvailability= function() {
	 
		if( $('editField.field.decimalPlacesSize').value.empty()){
			
			$('editField.field.decimalSeparator').disable();
		}else{
			
			$('editField.field.decimalSeparator').enable();
		}
 }
 
 initialCheckboxState= function(){ 
 		
	   //check if the tableTotalizer is available
	   if( $('editField.field.tableTotalizer')){ 
		//if it is show the totalizer_input if the checkbox is checked   
	   	if($('editField.field.tableTotalizer').checked){
			
	 		$('totalizer_inputfield').show();	
	 	}
	   }
	   //repeat same for expression
	   if($('editField.field.expression').checked){
	 		
	 		$('expression_inputfield').show();
	 	}
 }

</script>

<div>
	<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
		<tr><td class="titulo1"><fmt:message key="ipdms.dynamicform.form.edit.title" /></td></tr>
		<tr><td class="titulo2"><fmt:message key="ipdms.dynamicform.field.editint.subtitle" /></td></tr>
	</table>
</div>


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
		<div class="label" style="width: 75%;" title="<fmt:message key="ipdms.dynamicform.field.defaultvalue" />">
			<html:text name="dynamicForm" property="editField.field.defaultValue" styleId="editField.field.defaultValue" />
		</div>
	</div>
	
 	<c:if test="${ empty dynamicForm.editTableField}">
	<div class="row formlabel_sf" style="height:30%;" id="totalizerDiv">
		<!-- totalizer check -->
		<div class="leftTab label" style="width: 20%; ">
			<label for="editField.field.tableTotalizer">
				<fmt:message key="ipdms.dynamicform.field.totalizer" />
			</label>
		</div>
		<div class="label" style="width: 25%;">
			<html:checkbox onchange="swapVisibility(this);" name="dynamicForm" property="editField.field.tableTotalizer" styleId="editField.field.tableTotalizer" style="border:0;" />
		</div>
		<!-- totalizer field -->
		<div id="totalizer_inputfield" style="display: none;">	
			<div class="leftTab label" style="width: 11%;">
				<label for="editField.field.tableTotalizerField">
					<fmt:message key="ipdms.dynamicform.field.totalizerField" />
				</label>
			</div>
			<div class="label" style="width: 34%;">
				<html:text name="dynamicForm" property="editField.field.tableTotalizerField" styleId="editField.field.tableTotalizerField" size="15" maxlength="20"  />	
				<fmt:message key="ipdms.dynamicform.field.totalizerField.tip" />
			</div>
		</div>	
	</div>	
 	</c:if>
	
	<div class="row formlabel_sf" style="height:30%;">
		<!-- expression check -->
		<div class="leftTab label" style="width: 20%; ">
			<label for="editField.field.expression">
				<fmt:message key="ipdms.dynamicform.field.expression" />
			</label>
		</div>
		<div class="label" style="width: 25%;">
			<html:checkbox onchange="swapVisibility(this);" name="dynamicForm" property="editField.field.expression" styleId="editField.field.expression" style="border:0;" />
		</div>
		<!-- expression field -->
		<div id="expression_inputfield" style="display: none;">	
			<div class="leftTab label" style="width: 11%;">
				<label for="editField.field.expressionField">
					<fmt:message key="ipdms.dynamicform.field.expressionField" />
				</label>
			</div>
			<div class="label" style="width: 34%;">
				<html:text name="dynamicForm" property="editField.field.expressionField" styleId="editField.field.expressionField" size="15" maxlength="45"  />	
				<fmt:message key="ipdms.dynamicform.field.expressionField.tip" />
			</div>
		</div>	
	</div>	
	
	
	<div class="row formlabel_sf" style="height:30%;">
	    <!-- decimal places field -->
		<div class="leftTab label" style="width: 20%; ">
			<label for="editField.field.decimalPlacesSize">
				<fmt:message key="ipdms.dynamicform.field.decimalPlaces" />
			</label>
		</div>
		<div class="label" style="width: 25%;">
			<html:text onkeyup="swapAvailability();" name="dynamicForm" property="editField.field.decimalPlacesSize" styleId="editField.field.decimalPlacesSize" size="9" maxlength="9"/>
			<fmt:message key="ipdms.number.tip" />
		</div>
			 <!-- decimal separator field -->
		<div class="leftTab label" style="width: 11%; ">
			<label for="editField.field.decimalSeparator">
				<fmt:message key="ipdms.dynamicform.field.decimalSeparator" />
			</label>
 			<script>
 				swapAvailability();
 				
 			</script> 
		</div>
		<div class="label" style="width: 34%;">
			<html:text  name="dynamicForm" property="editField.field.decimalSeparator" styleId="editField.field.decimalSeparator" size="9" maxlength="9" />
			<fmt:message key="ipdms.dynamicform.field.decimalSeparatorTip" />
		</div>
		<script>initialCheckboxState();</script>
	</div>

	<div class="row formlabel_sf" style="height:30%;">
		<div class="leftTab label" style="width: 20%; ">
			<label for="editField.field.minValue">
				<fmt:message key="ipdms.dynamicform.field.minvalue" />
			</label>
		</div>
		<div class="label" style="width: 25%;" title="<fmt:message key="ipdms.dynamicform.field.minvalue" />">
			<html:text name="dynamicForm" property="editField.field.minValue" styleId="editField.field.minValue" size="9" maxlength="9"/>
			<fmt:message key="ipdms.number.tip" />
		</div>
		<div class="leftTab label" style="width: 11%; " title="<fmt:message key="ipdms.dynamicform.field.maxvalue" />">
			<label for="editField.field.maxValue">
				<fmt:message key="ipdms.dynamicform.field.maxvalue" />
			</label>
		</div>
		<div class="label" style="width: 34%;" title="<fmt:message key="ipdms.dynamicform.field.maxvalue" />">
			<html:text name="dynamicForm" property="editField.field.maxValue" styleId="editField.field.maxValue" size="9" maxlength="9" />
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
