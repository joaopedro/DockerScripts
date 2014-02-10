<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>


<c:set var="IMG_GUICHET_DIR" value="${pageContext.request.contextPath}/images/guichet" />
<div class="barraTitulo">
	<div class="textoTitulo"><fmt:message key="guichetelectronico.login.titulo" bundle="${guichetBundle}"/></div>
</div>
			
<div id="areaCentral">		

<form action="j_acegi_security_check_guichet" method="post" id="loginForm">


<!-- LINHA DO PREENCHIMENTO OBRIGATORIO -->
<div class="row" style="padding-bottom:20px;">
	<div class="label" style="width: 90%; " title="<fmt:message key='guichetelectronico.obrigatorio' bundle='${guichetBundle}'/>">
		<span class="formlabel_obrigatorio"><fmt:message key="guichetelectronico.obrigatorio" bundle="${guichetBundle}"/></span>
	</div>
</div>
	
	<div class="row formlabel_sf">
   		<div class="leftTab label" style="width: 10%; " title="<fmt:message key='guichetelectronico.login.utilizador'  bundle='${guichetBundle}'/>"><fmt:message key="guichetelectronico.login.utilizador"  bundle="${guichetBundle}"/> * </div>
   		<div class="label" style="width: 85%;" title="<fmt:message key='guichetelectronico.login.utilizador'  bundle='${guichetBundle}'/>">
   			<input type="text" value="" id="user" name="j_username" size="15"/>
   		</div>
	</div>
	<div class="row formlabel_sf">
   		<div class="leftTab label" style="width: 10%; " title="<fmt:message key='guichetelectronico.login.password' bundle='${guichetBundle}' />"><fmt:message key="guichetelectronico.login.password" bundle="${guichetBundle}" /> *</div>
   		<div class="label" style="width: 85%;" title="<fmt:message key='guichetelectronico.login.password' bundle='${guichetBundle}' />">
   			<input type="password" id="pass" value="" name="j_password" size="15" onfocus="this.select();"/>
   		</div>
	</div>

	<div style="clear:both"></div>
	
	<div class="buttonRow">
			<input class="btForm" type="button" value="<fmt:message key='guichetelectronico.login.esquecipassword' bundle='${guichetBundle}' />" title="<fmt:message key='guichetelectronico.login.esquecipassword' bundle='${guichetBundle}' />" onclick="setActionAndSubmit(this.form,'${pageContext.request.contextPath}/guichetelectronico/publico/login.do2?method=forgotPassword');"/>
			<input type="submit" class="btForm" value="<fmt:message key='guichetelectronico.forms.submit' bundle='${guichetBundle}' />" title="<fmt:message key='guichetelectronico.forms.submit.title' bundle='${guichetBundle}' />"/>
			<input class="btFormEscuro" type="button" value="<fmt:message key='guichetelectronico.forms.cancelar' bundle='${guichetBundle}' />" title="<fmt:message key='guichetelectronico.forms.cancelar.title' bundle='${guichetBundle}' />" onclick="setActionAndSubmit(this.form,'${pageContext.request.contextPath}/guichetelectronico/publico/homepage.do2');"/>
		</div>

</form>
</div>