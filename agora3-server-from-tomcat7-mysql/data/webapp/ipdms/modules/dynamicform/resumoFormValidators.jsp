<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${not empty validators}">
<%--  DIV EXTRA VALIDATION INFO--%>
	<c:set var="validationTitle"><fmt:message key="ipdms.dynamicform.resumo.validationinfo" /></c:set>
	<div style="clear:both"><br /></div>
	<div class="row" style="text-align:left;">
		<table border="0" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		<tr id="form_validators_open">
		<td class="titulo2" style="width:3%;">
			<a href="#" onclick="toggleInfo('form_validators');">
				<img src="images/icon/seta_seccao_fecha.png" alt="${validationTitle}" title="${validationTitle}"/>
			</a>
		</td>
		<td class="titulo2">${validationTitle}</td>
		</tr>
		<tr id="form_validators_close" style="display: none;">
		<td class="titulo2" style="width:3%;">
			<a href="#" onclick="toggleInfo('form_validators');">
				<img src="images/icon/seta_seccao_abre.png" alt="${validationTitle}" title="${validationTitle}"/>
			</a>
		</td>
		<td class="titulo2">${validationTitle}</td>
		</tr>
		<tr id="form_validators" style="display: none;">
			<td colspan="2">
				<jsp:include page="field/resumoFieldValidators.jsp"></jsp:include>
			</td>
		</tr>
		</tbody>
		</table>
	</div>
	<%--  END DIV EXTRA VALIDATION INFO--%>
</c:if>	