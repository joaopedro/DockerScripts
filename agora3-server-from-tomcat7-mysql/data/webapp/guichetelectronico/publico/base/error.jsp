<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="errors.situacaoErro.title" bundle="${guichetBundle}" var="title" />
<fmt:message key="errors.situacaoErro.description" bundle="${guichetBundle}" var="description" />
<fmt:message key="errors.situacaoErro.userMsg" bundle="${guichetBundle}" var="userMsg" />
<fmt:message key="errors.situacaoErro.adminMsg" bundle="${guichetBundle}" var="adminMsg" />

<div class="barraTitulo">
	<div class="textoTitulo">${title}</div>
</div>

<div id="areaCentral">	
<P class="formlabel">${description}</P>

<div id="MensagemErro">
	<html:errors  />
</div>

<P class="formlabel">
	<logic:present name="blame">
		<logic:equal name="blame" value="user">${userMsg}</logic:equal>
		<logic:equal name="blame" value="admin">${adminMsg}</logic:equal>
	</logic:present>
</P>

<DIV style="text-align:center;">
<logic:notPresent name="retorno">
	<logic:present parameter="retorno">
	<bean:parameter id="retorno" name="retorno" />
	</logic:present>
</logic:notPresent>
<logic:present name="retorno">
	<bean:define id="retorno" name="retorno" type="java.lang.String"/>
	<form action="${pageContext.request.contextPath}<%= java.net.URLDecoder.decode(retorno, "UTF-8") %>" method="post">
	<logic:present name="anteriores">
		<input type="hidden" name="anteriores" value="<bean:write name="anteriores"/>">
	</logic:present>
		<input type="submit" class="btForm" value="<fmt:message key='guichetelectronico.forms.anterior' bundle='${guichetBundle}' />">
	</form>
</logic:present>
</DIV>
</div>