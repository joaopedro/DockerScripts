<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--methods totalizerTableFields/calculateExpression -> dynamicFormFunctions.js file -->

<c:set var="extraproperties" />
<c:if test="${not empty fieldInstance}">
	<c:set var="extraproperties">${extraproperties} value="${fieldInstance.value}"</c:set>
</c:if>
<c:if test="${not empty field.inputSize}">
	<c:set var="extraproperties">${extraproperties} size="${field.inputSize}"</c:set>
</c:if>
<c:if test="${not empty field.relations}">
	<c:set var="extraproperties">${extraproperties} onChange="${dfieldId}_changed();"</c:set>
</c:if>
<c:if test="${!field.enabled}">
	<c:set var="extraproperties">${extraproperties} disabled="true"</c:set>
</c:if>
<input type="text" id="${dfieldId}" name="${dfieldId}"
	${extraproperties} />
<!-- check if fied is a table totalizer -->
<c:if test="${field.tableTotalizer}">
	<c:if test="${not empty field.tableTotalizerField}">
		<script type="text/javascript" defer="defer">
			//using ready from jquery allows us to concat multiple events
			//to run when the windows is finished loading
			jQuery(document).ready(
					function(){
						
						totalizerTableFields(
								'${field.decimalSeparator}',
								'${field.decimalPlacesSize}',
								'${field.tableTotalizerField}',
								'${dfieldId}')
								});
		</script>
	</c:if>
</c:if>
<!-- check if fied is an math expression field -->
<c:if test="${field.expression}">
	<c:if test="${not empty field.expressionField}">
		<script type="text/javascript" defer="defer">	
			//using ready from jquery allows us to concat multiple events
			//to run when the windows is finished loading
			jQuery(document).ready(
					function(){
						calculateExpression(
								'${field.decimalSeparator}',
								'${field.decimalPlacesSize}',
								'${field.expressionField}',
								'${dfieldId}');
			});		
		</script>
	</c:if>
</c:if>

