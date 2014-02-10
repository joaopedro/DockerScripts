<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<fmt:message key="guichetelectronico.forms.atencao" bundle="${guichetBundle}" var="atencao"/>

<c:set var="IMG_GUICHET_DIR" value="${pageContext.request.contextPath}/images/guichet" />

<div class="barraTitulo">
	<div class="textoTitulo"><fmt:message key="guichetelectronico.error.titulo" bundle="${guichetBundle}"/></div>
</div>
			
<div id="areaCentral">		

<html:form action="/publico/login" method="post">

		<c:if test="${erro == 1}">
    		<div class="mensagenCaixa" >
					<img src="${IMG_GUICHET_DIR}/icons/icon-atencao.png" alt="${atencao}" title="${atencao}" style="vertical-align:middle; padding-left:10px; padding-right:8px;"/> 
					<span class="info"><fmt:message key="guichetelectronico.error.credentials.wrong" bundle="${guichetBundle}"/></span>
				</div>
    	</c:if>
        
    	<c:if test="${erro == 2}">
    		<div class="mensagenCaixa" >
				<img src="${IMG_GUICHET_DIR}/icons/icon-atencao.png" alt="${atencao}" title="${atencao}" style="vertical-align:middle; padding-left:10px; padding-right:8px;"/> 
				<span class="info"><fmt:message key="guichetelectronico.error.credentials.donotexist" bundle="${guichetBundle}"/></span>
			</div>
    	</c:if>

		<c:if test="${erro == 3}">
    		<div class="mensagenCaixa" >
				<img src="${IMG_GUICHET_DIR}/icons/icon-atencao.png" alt="${atencao}" title="${atencao}" style="vertical-align:middle; padding-left:10px; padding-right:8px;"/> 
				<span class="info"><fmt:message key="guichetelectronico.error.resposta.wrong" bundle="${guichetBundle}"/></span>
			</div>
    	</c:if>
    	<c:if test="${erro == 4}">
    		<div class="mensagenCaixa" >
				<img src="${IMG_GUICHET_DIR}/icons/icon-atencao.png" alt="${atencao}" title="${atencao}" style="vertical-align:middle; padding-left:10px; padding-right:8px;"/> 
				<span class="info"><fmt:message key="guichetelectronico.error.resposta.pendente" bundle="${guichetBundle}"/></span>
			</div>
    	</c:if>
    	<div class="buttonRow">
				<input type="submit" class="btForm" value="<fmt:message key='guichetelectronico.forms.concluido' bundle='${guichetBundle}'/>" title="<fmt:message key='guichetelectronico.forms.concluido' bundle='${guichetBundle}'/>" id="concluido"/>
			</div>
	</html:form>
</div>
