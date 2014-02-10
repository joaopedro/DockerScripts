<%@ taglib uri="/tags/html" prefix="html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:message key="ipdms.forms.cancelar" var="cancelar" />
<fmt:message key="ipdms.forms.cancelar.title" var="cancelarTitle" />

<div>
	<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
		<tr><td class="titulo1"><fmt:message key="ipdms.dynamicform.form.edit.title" /></td></tr>
		<tr><td class="titulo2"><fmt:message key="ipdms.dynamicform.invalidstateatsave.subtitle" /></td></tr>
	</table>
</div>
<br/>

<html:form action="applicationFlow" method="post" >
	<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">
	<p class="formfield"><fmt:message key="ipdms.dynamicform.invalidstateatsave.text" /></p>
	<br/>
	<div class="buttonRow">
		<input type="submit" name="_eventId_next" value="${cancelar}" class="btForm" title="${cancelarTitle}"/>
	</div>
</html:form>
