<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="resumoStandardField.jsp"></jsp:include>

<div class="row formlabel_sf" style="height:30%;">
	<div class="leftTab label" style="width: 18%; "><b><fmt:message key="ipdms.dynamicform.field.height" />:</b></div>
	<div class="label" style="width: 35%;">${field.height}</div>
		<div class="leftTab label" style="width: 18%; "><b><fmt:message key="ipdms.dynamicform.field.width" />:</b></div>
	<div class="label" style="width: 25%;">${field.width}</div>						
</div>		

<div class="row formlabel_sf" style="height:30%;">
	<div class="leftTab label" style="width: 18%; "><b><fmt:message key="ipdms.dynamicform.field.maxnumberofphotos" />:</b></div>
	<div class="label" style="width: 65%;">${field.maxNumberOfPhotos}</div>
</div>