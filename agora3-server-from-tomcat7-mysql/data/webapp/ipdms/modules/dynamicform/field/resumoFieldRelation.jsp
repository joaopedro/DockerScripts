<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--  DIV EXTRA RELATIONS INFO--%>
<c:if test="${not empty relations}">
<c:set var="relationTitle"><fmt:message key="ipdms.dynamicform.resumo.relationinfo" /></c:set>
<div style="clear:both"><br /></div>
<div class="row" style="text-align:left;">
	<table border="0" cellpadding="0" cellspacing="0" class="headings">
	<tbody>
	<tr id="${field.siglaId}_rel_open">
	<td class="titulo2" style="width:3%;">
		<a href="#" onclick="toggleInfo('${field.siglaId}_rel');">
			<img src="images/icon/seta_seccao_fecha.png" alt="${relationTitle}" title="${relationTitle}"/>
		</a>
	</td>
	<td class="titulo2">${relationTitle}</td>
	</tr>
	<tr id="${field.siglaId}_rel_close" style="display: none;">
	<td class="titulo2" style="width:3%;">
		<a href="#" onclick="toggleInfo('${field.siglaId}_rel');">
			<img src="images/icon/seta_seccao_abre.png" alt="${relationTitle}" title="${relationTitle}"/>
		</a>
	</td>
	<td class="titulo2">${relationTitle}</td>
	</tr>
	<tr id="${field.siglaId}_rel" style="display: none;">
		<td colspan="2">
			<%-- EXTRA RELATION INFO --%>
			<span class="formlabel"><fmt:message key="ipdms.dynamicform.field.relation.title"/></span>
			<table class="formtable" width="80%">			
				<tr class="listHeader">
					<th class="textoBold"><fmt:message key="ipdms.dynamicform.field.relation.onvalue" /></th>
					<th class="textoBold"><fmt:message key="ipdms.dynamicform.field.relation.action" /></th>
					<th class="textoBold"><fmt:message key="ipdms.dynamicform.field.relation.affectedfield" /></th>
				</tr>		
			<c:forEach items="${relations}" var="relation">
				<tr>
					<td class="formfield">${relation.onValue}</td>
					<td class="formfield">${relation.relationType}</td>
					<td class="formfield">${relation.affectedField.siglaId}</td>
				</tr>		
			</c:forEach>
			</table>			
			<%-- END EXTRA RELATION INFO --%>		
		</td>
	</tr>
	</tbody>
	</table>
</div>
</c:if>
<%--  END DIV EXTRA RELATION INFO--%>
