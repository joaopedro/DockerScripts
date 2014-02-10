<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:choose>
	<c:when test="${changeline && field.changeLine}">
		<c:set var="styleLabel" value="width: 27%;" />
		<c:set var="styleInput" value="width: 60%;" />
	</c:when>
	<c:otherwise>
		<c:set var="styleLabel" value="padding-right: 20px;" />
		<c:set var="styleInput" value="padding-right: 40px;" />
		
	</c:otherwise>
</c:choose>


<c:choose>
<%-- RESUMO: see dynamicform.jsp --%>
<c:when test="${inputDisabled || resumo}"> 
	<div class="row formlabel_sf" >
		<c:set var="dfieldId" value="${field.siglaId}" scope="request" />
		<div class="leftTab label" style="width: 27%; " title="${field.label}">
			<b>${field.label}:</b>
		</div>
		<div class="label" style="width: 60%;" title="${field.label}">
			<jsp:include page="parts/optionvaluesvaluepart.jsp" />
		</div>
	</div>
</c:when>

<%-- Normal Form --%>
<c:otherwise>
	<c:if test="${!field.visible}">
		<c:set var="divstyle">style="display: none;"</c:set>
	</c:if>
	<c:set var="dfieldId" value="${field.siglaId}" scope="request" />
	
	
	<c:if test="${changeline}">
		<div id="div-gen-changeline_${dfieldId}" class="row formlabel_sf" >
	</c:if>
	
	
	
		<div id="div_${dfieldId}" ${divstyle}>
			<div class="leftTab label" style="${styleLabel}" title="${field.label}">
				<label for="${dfieldId}">${field.label}</label>
				<jsp:include page="parts/requiredpart.jsp" />
			</div>
			<div class="label" style="${styleInput}" title="${field.label}">
				<jsp:include page="parts/radioinputpart.jsp" />
		  	</div>
		</div>
		
		<c:if test="${not empty field.relations}">
			<script>
				${dfieldId}_changed = function () {
					var radioValue = $$('input:checked[type="radio"][name="${dfieldId}"]').pluck('value');
					<c:forEach items="${field.relations}" var="rel">
					if(radioValue == '${rel.onValue}') {
						<c:choose>
						<c:when test="${rel.relationType == 'DISABLED'}">
							$('${rel.affectedField.siglaId}').disable();
						</c:when>
						<c:when test="${rel.relationType == 'ENABLED'}">
							$('${rel.affectedField.siglaId}').enable();
						</c:when>
						<c:when test="${rel.relationType == 'HIDDEN'}">
							$('div_${rel.affectedField.siglaId}').hide();
						</c:when>
						<c:when test="${rel.relationType == 'VISIBLE'}">
							$('div_${rel.affectedField.siglaId}').show();
						</c:when>
						<c:otherwise>alert('unknown action');</c:otherwise>
					</c:choose>
					}
					</c:forEach>	
				};
				
				${dfieldId}_changed();
			</script> 
		</c:if>
		
	<c:set var="changeline" value="${field.changeLine}" scope="request"/>
	<c:if test="${changeline}">
		</div>
	</c:if>	
		
		
</c:otherwise>
</c:choose>