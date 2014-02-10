<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<br />
<br />
<table class="centro" width="60%" cellspacing="1">			
	<CAPTION><fmt:message key="ipdms.dynamicform.field.options" /></CAPTION>			
	<tr class="listHeader">
		<th class="centro"><fmt:message key="ipdms.dynamicform.field.option.value" /></th>
		<th class="centro"><fmt:message key="ipdms.dynamicform.field.option.label" /></th>
	</tr>		
	<c:forEach items="${field.options}" var="option">
		<tr>
			<td class="centro">${option.value}</td>
			<td class="centro">${option.label}</td>
		</tr>		
	</c:forEach>
</table>
