<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<!-- BARRA DO TITULO PRINCIAPL DA AREA CENTRAL -->
			<div class="barraTitulo">
				<div class="textoTitulo"><fmt:message key="guichetelectronico.newpassword.titulo" bundle="${guichetBundle}"/></div>
			</div>
			
			<div id="areaCentral">
			<html:form action="/publico/login" method="post">	
				<!-- MENSAGEM DE ERRO -->
				<div class="mensagenCaixa" >
					<img src="${pageContext.request.contextPath}/images/guichet/icons/icon-OK.png" alt="Ok" title="Ok" style="vertical-align:middle; padding-left:10px; padding-right:8px;"/> 
					<span class="info"><fmt:message key="guichetelectronico.newpassword.sucesso" bundle="${guichetBundle}"/></span>
				</div>
				<!-- LINHA DO BOTÃO -->
				<div class="buttonRow">
					<input class="btForm" style="vertical-align:middle;" type="button" value="<fmt:message key='guichetelectronico.forms.concluido' bundle='${guichetBundle}' />" title="<fmt:message key='guichetelectronico.forms.concluido' bundle='${guichetBundle}' />" onclick="setActionAndSubmit(this.form,'${pageContext.request.contextPath}/guichetelectronico/publico/homepage.do2');"/>
				</div>
			</html:form>
			</div>