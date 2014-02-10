<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div id="ver_ajuda" class="info" style="padding-top:0px; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr><td class="titulo1"><fmt:message key="ipdms.dynamicform.import.title" /></td></tr>
		</tbody>
	</table>					
</div>

<br/>
<p class="formfield"><b><fmt:message key="ipdms.dynamicform.import.result" /></b></p>

<c:choose>
	<c:when test="${not empty unknownException}">
		<p class="formfield">
			<fmt:message key="ipdms.dynamicform.import.error.unknownexception">
				<fmt:param value="${unknownException}" />
			</fmt:message>		
		</p>	
	</c:when>
	<c:when test="${not empty idExterno}">
		<p class="formfield">
			<fmt:message key="ipdms.dynamicform.import.error.idexterno">
				<fmt:param value="${idExterno}" />
			</fmt:message>
		</p>
	</c:when>
	<c:when test="${not empty argumentNotFound}">
		<p class="formfield">
			<fmt:message key="ipdms.dynamicform.import.error.argumentnotfound">
				<fmt:param value="${argumentNotFound}" />
			</fmt:message>
		</p>
	</c:when>
	<c:otherwise>
		<br/><p class="formfield">
			<fmt:message key="ipdms.dynamicform.import.nowarnings">
				<fmt:param value="${savedDynamicForm.id}" />
			</fmt:message>
		</p>
	</c:otherwise>
</c:choose>

<form action="${pageContext.request.contextPath}/listDynamicForms.do2">
	<div class="buttonRow">
		<input type="submit" class="btForm" value="<fmt:message key='ipdms.forms.terminar' />" title="<fmt:message key='ipdms.forms.terminar.title' />" />
	</div>
</form>