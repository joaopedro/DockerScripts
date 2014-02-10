<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:message key="ipdms.dynamicform.group.gruposDefinidos" var="gruposDefinidos" />

<c:if test="${not empty groups}">
	<fieldset>
		<legend>${gruposDefinidos}:</legend>
		<table class="centro" width="80%" cellspacing="1">			
			<tr class="listHeader">
				<th class="centro">#</th>
				<th class="centro"><fmt:message key="ipdms.dynamicform.group.label" /></th>
				<th class="centro"><fmt:message key="ipdms.dynamicform.group.fields" /></th>
			</tr>
			<c:forEach var="g" items="${groups}">
			<tr>
				<td class="centro">${i+1}</td>
				<td class="centro">${g.label}</td>
				<td class="centro">
					<c:forEach var="f" items="${g.fields}">${f.label},</c:forEach>
				</td>
			</tr>
			</c:forEach>
		</table>			
	</fieldset>	
</c:if>