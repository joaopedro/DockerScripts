<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- // MULTILÍNGUA NOS CONTEÚDOS --%>
<c:set var="international" scope="session" value="true" />
<table width="100%" border="1" cellspacing="0" cellpadding="0">
	<tr>
		<td><html:link action="/homepage">
			<img src='${pageContext.request.contextPath}/backoffice/images/logo.jpg' border="0" />
		</html:link></td>
		<td width="10%">
			Versão do KCMS: ${ Version }<br/>
			Compilada em: ${ CompileDateTimeStr }<br/>
			Versão do Java: ${ JavaVersion }
		</td>
	</tr>
</table>
