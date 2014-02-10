<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<br/>
<br/>
<c:if test="${not empty validators}">
<fieldset>
	<legend><fmt:message key="ipdms.dynamicform.field.validator.title"/></legend>
	<table class="formtable" width="80%">			
		<tr class="listHeader">
			<th class="textoBold"><fmt:message key="ipdms.dynamicform.field.validator.class" /></th>
			<th class="textoBold"><fmt:message key="ipdms.dynamicform.field.validator.args" /></th>
		</tr>
		<c:forEach items="${validators}" var="validator">
		<tr>
			<td class="formfield">${validator.clazz}</td>
			<td class="formfield">${validator.args}</td>
		</tr>
	</c:forEach>
	</table>
</fieldset>
</c:if>