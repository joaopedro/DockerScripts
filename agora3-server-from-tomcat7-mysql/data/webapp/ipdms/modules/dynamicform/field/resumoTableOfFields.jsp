<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:message key="ipdms.dynamicform.field.colunasDefinidas" var="colunasDefinidas" />

<jsp:include page="resumoStandardField.jsp" />

<div class="row formlabel_sf" style="height:30%;">
	<div class="leftTab label" style="width: 18%; "><b><fmt:message key="ipdms.dynamicform.field.tableoffields.title" />:</b></div>
	<div class="label" style="width: 35%;">${field.title}</div>
		<div class="leftTab label" style="width: 18%; "><b><fmt:message key="ipdms.dynamicform.field.tableoffields.numberofrows" />:</b></div>
	<div class="label" style="width: 20%;">${field.numberOfRows}</div>						
</div>	

<%--  DIV TABLE FIELD COLUMNS INFO--%>
<c:set var="validationTitle">${colunasDefinidas}</c:set>
<div style="clear:both"><br /></div>
<div class="row" style="text-align:left;">
	<table border="0" cellpadding="0" cellspacing="0" class="headings">
	<tbody>
	<tr id="tablefields_${field.siglaId}_val_open">
	<td class="titulo2" style="width:3%;">
		<a href="#" onclick="toggleInfo('tablefields_${field.siglaId}_val');">
			<img src="images/icon/seta_seccao_fecha.png" alt="${validationTitle}" title="${validationTitle}"/>
		</a>
	</td>
	<td class="titulo2">
		<a href="#" onclick="toggleInfo('tablefields_${field.siglaId}_val');" class="formfield">
			${validationTitle}
		</a>
	</td>
	</tr>
	<tr id="tablefields_${field.siglaId}_val_close" style="display: none;">
	<td class="titulo2" style="width:3%;">
		<a href="#" onclick="toggleInfo('tablefields_${field.siglaId}_val');">
			<img src="images/icon/seta_seccao_abre.png" alt="${validationTitle}" title="${validationTitle}"/>
		</a>
	</td>
	<td class="titulo2">
		<a href="#" onclick="toggleInfo('tablefields_${field.siglaId}_val');" class="formfield">
			${validationTitle}
		</a>
	</td>
	</tr>
	<tr id="tablefields_${field.siglaId}_val" style="display: none;">
		<td colspan="2">
			<table class="centro" width="80%" cellspacing="1">			
				<tr class="listHeader">
					<th class="centro">#</th>
					<th class="centro"><fmt:message key="ipdms.dynamicform.field.label" /></th>
					<th class="centro"><fmt:message key="ipdms.dynamicform.field.fieldtype" /></th>
					<th class="centro"><fmt:message key="ipdms.dynamicform.field.fieldid" /></th>
				</tr>
				<c:forEach var="columnField" items="${field.fields}" varStatus="i">
				<tr>
					<td class="centro">${i.index+1}</td>
					<td class="centro">${columnField.label}</td>
					<td class="centro">${columnField.type}</td>
					<td class="centro">${columnField.siglaId}</td>
				</tr>
				</c:forEach>
			</table>
		</td>
	</tr>
	</tbody>
	</table>
</div>
<%--  DIV TABLE FIELD COLUMNS INFO --%>


<c:if test="${not empty field.validators}">
<%--  DIV EXTRA VALIDATION INFO--%>
<c:set var="validationTitle"><fmt:message key="ipdms.dynamicform.resumo.validationinfo" /></c:set>
<div style="clear:both"><br /></div>
<div class="row" style="text-align:left;">
	<table border="0" cellpadding="0" cellspacing="0" class="headings">
	<tbody>
	<tr id="${field.siglaId}_val_open">
	<td class="titulo2" style="width:3%;">
		<a href="#" onclick="toggleInfo('${field.siglaId}_val');">
			<img src="images/icon/seta_seccao_fecha.png" alt="${validationTitle}" title="${validationTitle}"/>
		</a>
	</td>
	<td class="titulo2">${validationTitle}</td>
	</tr>
	<tr id="${field.siglaId}_val_close" style="display: none;">
	<td class="titulo2" style="width:3%;">
		<a href="#" onclick="toggleInfo('${field.siglaId}_val');">
			<img src="images/icon/seta_seccao_abre.png" alt="${validationTitle}" title="${validationTitle}"/>
		</a>
	</td>
	<td class="titulo2">${validationTitle}</td>
	</tr>
	<tr id="${field.siglaId}_val" style="display: none;">
		<td colspan="2">
			<c:set var="validators" value="${field.validators}" scope="request" />
			<jsp:include page="resumoFieldValidators.jsp"></jsp:include>
		</td>
	</tr>
	</tbody>
	</table>
</div>
<%--  END DIV EXTRA VALIDATION INFO--%>
</c:if>
