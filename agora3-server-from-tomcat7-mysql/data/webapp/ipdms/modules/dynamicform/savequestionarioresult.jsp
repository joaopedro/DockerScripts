<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:message key="ipdms.dynamicform.questionario.result.msg1" var="resultMsg1" />
<fmt:message key="ipdms.dynamicform.questionario.result.msg2" var="resultMsg2" />
<fmt:message key="ipdms.dynamicform.questionario.result.back" var="resultBack" />
<fmt:message key="ipdms.dynamicform.questionario.result.back.here" var="here" />

<div>
	<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
		<tr><td class="titulo1"><fmt:message key="ipdms.dynamicform.questionario" /></td></tr>
		<tr><td class="titulo2"><fmt:message key="ipdms.dynamicform.questionario.result" /></td></tr>
	</table>
</div>

<br/>
<p>
${resultMsg1} "${questionario.descricao}" ${resultMsg2} <b>"${questionario.id}"</b>.
</p>
<br/>
<p>
${resultBack} <a href="${pageContext.request.contextPath}/listDynamicForms.do2">${here}</a>
</p>