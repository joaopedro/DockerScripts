<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.ssl.redirectToSSL.continuar" var="continuar" />
<fmt:message key="ipdms.ssl.redirectToSSL.continuar.title" var="continuarTitle" />

<form action="${pageContext.request.contextPath}${redirectAction}">

	<jsp:include page="certificateInfo.jsp" />	

	<c:forEach var="paramEntry" items="${pageContext.request.parameterMap}">
		<html:hidden property="${paramEntry.key}" value="${paramEntry.value['0']}"/>		
	</c:forEach>
	<div class="buttonRow">
		<html:submit value="${continuar}" styleClass="btForm" title="${continuarTitle}"></html:submit>
	</div>
</form>
