<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="/ipdms/layout/ipdmsScriptsThemes.jsp" />

<fmt:message key="ipdms.ssl.documentCertifyInfo.certificacaoDocumento" var="certificacaoDocumento" />
<fmt:message key="ipdms.ssl.certificateInfo.serialNumber" var="serialNumber" />
<fmt:message key="ipdms.ssl.certificateInfo.issuer" var="issuer" />
<fmt:message key="ipdms.ssl.certificateInfo.subject" var="subject" />

<fieldset>
	<legend>${certificacaoDocumento}</legend>
	<br />
	<table>
		<tr>
			<td class="textoBold">${serialNumber}</td>
			<td class="formfield">${certificateInfo.serialNumber}</td>
		</tr>
		<tr>
			<td class="textoBold">${issuer}</td>
			<td class="formfield">${certificateInfo.issuerDN}</td>
		</tr>
		<tr>
			<td class="textoBold">${subject}</td>
			<td class="formfield">${certificateInfo.subjectDN}</td>
		</tr>			
	</table>
</fieldset>
