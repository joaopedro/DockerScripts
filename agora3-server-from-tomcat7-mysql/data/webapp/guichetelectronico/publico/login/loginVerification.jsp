<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>


<!-- BARRA DO TITULO PRINCIAPL DA AREA CENTRAL -->
<div class="barraTitulo">
	<div class="textoTitulo"><fmt:message key="guichetelectronico.loginverification.titulo" bundle="${guichetBundle}"/></div>
</div>

<!-- DIV DO FORMULÁRIO -->
<html:form action="/publico/login" method="post">
<html:hidden property="method" value="verification"/>

<div id="areaCentral">

	<div class="row formlabel_sf">
		<div class="label textoBold" style="width: 19%;" title="<fmt:message key='guichetelectronico.loginverification.utilizador' bundle='${guichetBundle}'/>">
			<fmt:message key="guichetelectronico.loginverification.utilizador" bundle="${guichetBundle}"/>:
		</div>

		<div class="label" style="width: 78%;" title="<fmt:message key='guichetelectronico.loginverification.utilizador' bundle='${guichetBundle}'/>">
			${colaborador.login}
		</div>
	</div>
	<div class="row formlabel_sf">
		<div class="label textoBold" style="width: 19%;" title="<fmt:message key='guichetelectronico.loginverification.pergunta' bundle='${guichetBundle}'/>">
			<fmt:message key="guichetelectronico.loginverification.pergunta" bundle="${guichetBundle}"/>:
		</div>

		<div class="label" style="width: 78%;" title="<fmt:message key='guichetelectronico.loginverification.pergunta' bundle='${guichetBundle}'/>">
			${colaborador.pergunta.pergunta}
		</div>
	</div>

	<div class="row formlabel_sf">
		<div class="label" style="width: 19%;" title="<fmt:message key='guichetelectronico.loginverification.resposta' bundle='${guichetBundle}'/>">
			<label for="resposta"><fmt:message key="guichetelectronico.loginverification.resposta" bundle="${guichetBundle}"/></label>
		</div>

		<div class="label" style="width: 78%;" title="<fmt:message key='guichetelectronico.loginverification.resposta' bundle='${guichetBundle}'/>">
			<input type="text" value="" name="resposta" style="width: 70%" id="resposta" />
		</div>
	</div>
	<div style="clear: both"></div>
	<div class="buttonRow">
		<input type="submit" class="btForm" value="<fmt:message key='guichetelectronico.forms.submit' bundle='${guichetBundle}'/>" title="<fmt:message key='guichetelectronico.forms.submit.title' bundle='${guichetBundle}'/>">
		<input class="btFormEscuro" type="button" value="<fmt:message key='guichetelectronico.forms.cancelar' bundle='${guichetBundle}'/>" title="<fmt:message key='guichetelectronico.forms.cancelar.title' bundle='${guichetBundle}'/>" onclick="setActionAndSubmit(this.form,'${pageContext.request.contextPath}/guichetelectronico/publico/homepage.do2');"/>
	</div>
</div>
</html:form>