<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row formlabel_sf" style="height:20%;">
	<div class="leftTab label" style="width: 18%; "><b><fmt:message key="ipdms.dynamicform.field.fieldid" />:</b></div>
	<div class="label" style="width: 35%;">${field.siglaId}</div>
	<div class="leftTab label" style="width: 18%; "><b><fmt:message key="ipdms.dynamicform.field.fieldtype" />:</b></div>
	<div class="label" style="width: 20%;">${field.type}</div>
</div>
<div class="row formlabel_sf" style="height:30%;">
	<div class="leftTab label" style="width: 18%; "><b><fmt:message key="ipdms.dynamicform.field.label" />:</b></div>
	<div class="label" style="width: 35%;">${field.label}</div>
		<div class="leftTab label" style="width: 18%; "><b><fmt:message key="ipdms.dynamicform.field.externalid" />:</b></div>
	<div class="label" style="width: 25%;">${field.externalId}</div>						
</div>		
<c:if test="${not empty field.defaultValue}">
<div class="row formlabel_sf" style="height:30%;">
	<div class="leftTab label" style="width: 18%; "><b><fmt:message key="ipdms.dynamicform.field.defaultvalue" />:</b></div>
	<div class="label" style="width: 65%;">${field.defaultValue}</div>
</div>
</c:if>
