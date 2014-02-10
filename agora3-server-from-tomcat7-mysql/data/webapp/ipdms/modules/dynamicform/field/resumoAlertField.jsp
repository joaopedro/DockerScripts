<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="resumoStandardField.jsp"></jsp:include>

<c:if test="${not empty field.validators}">
<%--  DIV EXTRA VALIDATION INFO--%>
<div style="clear:both"><br /></div>
<div class="row" style="text-align:left;">
	<table border="0" cellpadding="0" cellspacing="0" class="headings">
	<tbody>
	<jsp:include page="resumoOpenCloseTr.jsp" />
	<tr id="${field.siglaId}_val" style="display: none;">
		<td colspan="2">
			<%-- EXTRA VALIDATION INFO --%>
			<div class="row formlabel_sf" style="height:30%;">
				<div class="leftTab label" style="width: 30%; "><b><fmt:message key="ipdms.dynamicform.field.requiredonvalue" />:</b></div>
				<div class="label" style="width: 60%;">${field.requiredOnValue}</div>
			</div>
			<c:set var="validators" value="${field.validators}" scope="request" />
			<jsp:include page="resumoFieldValidators.jsp"></jsp:include>
			<%-- END EXTRA VALIDATION INFO --%>		
		</td>
	</tr>
	</tbody>
	</table>
</div>
<%--  END DIV EXTRA VALIDATION INFO--%>
</c:if>