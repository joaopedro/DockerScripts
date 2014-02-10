<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- BARRA DO TITULO PRINCIAPL DA AREA CENTRAL -->
<div class="barraTitulo">
	<div class="textoTitulo"><fmt:message key="guichetelectronico.registo.confirmacao.titulo" bundle="${guichetBundle}"/></div>
</div>
			
<html:form action="/publico/register" method="post">
	<div id="areaCentral">	
		<!-- MENSAGEM DE ERRO -->
		<c:choose>
			<c:when test="${error}">
				<div class="mensagenCaixa" >
					<img src="${pageContext.request.contextPath}/images/guichet/icons/icon-atencao.png" alt="<fmt:message key='guichetelectronico.forms.atencao' bundle='${guichetBundle}'/>" title="<fmt:message key='guichetelectronico.forms.atencao' bundle='${guichetBundle}'/>" style="vertical-align:middle; padding-left:10px; padding-right:8px;"/> 
					<span class="info"><fmt:message key="guichetelectronico.registo.confirmacao.erro" bundle="${guichetBundle}"/></span>
				</div>				
			</c:when>
			<c:otherwise>
				<div class="mensagenCaixa" >
					<img src="${pageContext.request.contextPath}/images/guichet/icons/icon-OK.png" alt="Ok" title="Ok" style="vertical-align:middle; padding-left:10px; padding-right:8px;"/> 
					<span class="info"><fmt:message key="guichetelectronico.registo.confirmacao.mensagemOk" bundle="${guichetBundle}"/></span>
				</div>
			</c:otherwise>
		</c:choose>								
		<!-- LINHA DO BOTÃO -->
		<div class="buttonRow">
			<input class="btForm" style="vertical-align:middle;" type="button" value="<fmt:message key='guichetelectronico.forms.concluido' bundle='${guichetBundle}'/>" title="<fmt:message key='guichetelectronico.forms.concluido' bundle='${guichetBundle}'/>" onclick="setActionAndSubmit(this.form,'${pageContext.request.contextPath}/guichetelectronico/publico/homepage.do2');"/>
		</div>
	</div>
</html:form>