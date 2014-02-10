<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key='guichetelectronico.forms.criar' bundle='${guichetBundle}' var='criar'/>

<div class="barraTitulo">
	<div class="textoTitulo"><fmt:message key="guichetelectronico.webflow.variantes.titulo" bundle="${guichetBundle}"/> ${processo.titulo} </div>					
</div>

<div id="areaCentral">
<div class="mensagenCaixa" >
	<img src="${pageContext.request.contextPath}/images/icon/icon-atencao.png" alt="<fmt:message key='guichetelectronico.forms.atencao' bundle='${guichetBundle}'/>" title="<fmt:message key='guichetelectronico.forms.atencao' bundle='${guichetBundle}'/>" style="vertical-align:middle; padding-left:10px; padding-right:8px;"/> 
	<span class="info"><fmt:message key="guichetelectronico.webflow.variantes.mensagem" bundle="${guichetBundle}"/></span>
</div>

	<c:set var="referer" value="${requestScope['javax.servlet.forward.servlet_path']}" />
	<c:if test="${not empty requestScope['javax.servlet.forward.query_string']}">
		<c:set var="referer" value="${referer}?${requestScope['javax.servlet.forward.query_string']}" />
	</c:if>
	<c:forEach items="${variantes}" var="variante">
		<c:if test="${variante.visivelExterior}">
			<div class="barraSubTitulo" >${variante.titulo}</div>
			<div class="row formlabel_sf" >
				<div class="label" style="width: 87%; " >
					<label for="nome">${variante.descricao}</label>
				</div>

				<div class="label" style="width: 10%;" title="${criar}">					
					» <html:link action="${variante.link}?tipo=${variante.numeroConteudo}&referer=${referer}" title="${criar}">${criar}</html:link>						
				</div>
			</div>
			<br />
		</c:if>
	</c:forEach>							
</div>
