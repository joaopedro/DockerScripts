<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key='ipdms.errors.unknownException' var="exception"/>
<fmt:message key='ipdms.forms.terminar' var="terminar"/>
<fmt:message key='ipdms.forms.anterior.title' var="anteriorTitle"/>

<div id="ver_ajuda" class="info" style="padding-top:0px; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr><td class="titulo1"><fmt:message key="ipdms.administration.export.import.title" /></td></tr>
		</tbody>
	</table>					
</div>

<br/>
<p class="formfield"><b><fmt:message key="ipdms.administration.import.result" /></b></p>

<c:choose>
	<c:when test="${not empty unknownException}">
		<p class="formfield">${exception}:<br/><br/>${unknownException}</p>	
	</c:when>
	<c:when test="${empty importErrors}">
		<br/><p class="formfield"><fmt:message key="ipdms.administration.import.nowarnings" /></p>		
	</c:when>	
	<c:otherwise>
		<p class="formfield"><fmt:message key="ipdms.administration.import.warnings" />:</p>
		<c:set var="importErrors" value="${importErrors}" scope="request" />
		<jsp:include page="errorsTablePart.jsp" />
	</c:otherwise>
</c:choose>


<form action="${pageContext.request.contextPath}/homepage.do2">
	<div class="buttonRow">
		<input type="submit" class="btForm" value="${terminar}" title="${anteriorTitle}" />
	</div>
</form>