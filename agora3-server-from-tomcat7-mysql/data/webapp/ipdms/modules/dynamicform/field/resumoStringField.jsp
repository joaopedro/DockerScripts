<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="resumoStandardField.jsp"></jsp:include>

<c:if test="${not empty field.dynamicValue}">
<div class="row formlabel_sf" style="height:30%;">
	<div class="leftTab label" style="width: 18%; "><b><fmt:message key="ipdms.dynamicform.field.dynamicvalue" />:</b></div>
	<div class="label" style="width: 65%;">&#36;&#123;${field.dynamicValue}&#125;</div>
</div>
</c:if>


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
				<div class="leftTab label" style="width: 13%; "><b><fmt:message key="ipdms.dynamicform.field.required" />:</b></div>
				<div class="label" style="width: 20%;">
					<c:choose>
						<c:when test="${field.required}"><fmt:message key="webflow.sim" /></c:when>
						<c:otherwise><fmt:message key="webflow.nao" /></c:otherwise>
					</c:choose>
				</div>			
				<div class="leftTab label" style="width: 13%; "><b><fmt:message key="ipdms.dynamicform.field.inheritvalue" />:</b></div>
				<div class="label" style="width: 20%;">
					<c:choose>
						<c:when test="${field.inheritValue}"><fmt:message key="webflow.sim" /></c:when>
						<c:otherwise><fmt:message key="webflow.nao" /></c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="row formlabel_sf" style="height:30%;">
				<div class="leftTab label" style="width: 30%; "><b><fmt:message key="ipdms.dynamicform.field.requiredonvalue" />:</b></div>
				<div class="label" style="width: 60%;">${field.requiredOnValue}</div>
			</div>
			<div class="row formlabel_sf" style="height:30%;">
				<div class="leftTab label" style="width: 30%; "><b><fmt:message key="ipdms.dynamicform.field.minsize" />:</b></div>
				<div class="label" style="width: 60%;">${field.minSize}</div>
			</div>
			
			<div class="row formlabel_sf" style="height:30%;">
				<div class="leftTab label" style="width: 30%; "><b><fmt:message key="ipdms.dynamicform.field.maxsize" />:</b></div>
				<div class="label" style="width: 60%;">${field.maxSize}</div>
			</div>
			<div class="row formlabel_sf" style="height:30%;">
				<div class="leftTab label" style="width: 30%; "><b><fmt:message key="ipdms.dynamicform.field.inputsize" />:</b></div>
				<div class="label" style="width: 60%;">${field.inputSize}</div>
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

<c:set var="relations" value="${field.relations}" scope="request" />
<jsp:include page="resumoFieldRelation.jsp"></jsp:include>