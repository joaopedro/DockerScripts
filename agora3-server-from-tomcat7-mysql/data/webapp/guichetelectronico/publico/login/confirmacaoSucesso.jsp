<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- BARRA DO TITULO PRINCIAPL DA AREA CENTRAL -->
			<div class="barraTitulo">
				<div class="textoTitulo"><fmt:message key="guichetelectronico.confirmation.titulo" bundle="${guichetBundle}"/> </div>
			</div>
			
			<div id="areaCentral">	
				<!-- MENSAGEM DE ERRO -->
				<div class="mensagenCaixa" >
					<img src="${pageContext.request.contextPath}/images/guichet/icons/icon-OK.png" alt="Ok" title="Ok" style="vertical-align:middle; padding-left:10px; padding-right:8px;"/> 
					<span class="info"><fmt:message key="guichetelectronico.confirmation.sucesso" bundle="${guichetBundle}"/></span>
				</div>
				<!-- LINHA DO BOTÃO -->
				<div class="buttonRow">
					<input class="btForm" style="vertical-align:middle;" type="button" value="<fmt:message key='guichetelectronico.forms.concluido' bundle='${guichetBundle}'/>" title="<fmt:message key='guichetelectronico.forms.concluido' bundle='${guichetBundle}'/>" onclick="setActionAndSubmit(this.form,'${pageContext.request.contextPath}/guichetelectronico/publico/login.do2');"/>
				</div>
			</div>