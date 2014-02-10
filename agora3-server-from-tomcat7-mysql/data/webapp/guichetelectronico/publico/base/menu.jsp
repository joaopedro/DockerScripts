<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="imgDir" value="${pageContext.request.contextPath}/images" />
<c:set var="iconImgDir" value="${imgDir}/icon" />
<c:set var="botaoMais" value="${imgDir}/button/maisMenu.gif" />
<c:set var="botaoMenos" value="${imgDir}/button/menosMenu.gif" />

<script type="text/JavaScript">
function showHideDiv(nivel, id) { 
	var endId = '-' + nivel + '-' + id; 
	if ($('linhamenu'+endId).style.visibility == "hidden") {
		$('linhamenu'+endId).style.visibility = 'visible'; 
		$('linhamenu'+endId).style.display = 'block'; 
		$('img'+endId).src = '${botaoMenos}'; 
		$('titulo'+endId).className = 'subMenu1'; 
	} else {
		$('linhamenu'+endId).style.visibility = 'hidden'; 
		$('linhamenu'+endId).style.display = 'none'; 
		$('img'+endId).src = '${botaoMais}';
		$('titulo'+endId).className = 'subMenu'; 
	}
} 
</script>

<ul id="menuPrincipal">
	<c:choose>
		<c:when test="${log == null}">
			<c:set var="acesso" value="publico" scope="request"/>
			<li><html:link action="/publico/login"><fmt:message key="guichetelectronico.menu.login" bundle="${guichetBundle}"/></html:link></li>
			<li><html:link action="/publico/register"><fmt:message key="guichetelectronico.menu.registo" bundle="${guichetBundle}"/></html:link></li>
		</c:when>
		<c:otherwise>
			<c:set var="acesso" value="secure" scope="request"/>
			<li><a href="${pageContext.request.contextPath}/guichetelectronico/publico/j_acegi_logout_guichet"><fmt:message key="guichetelectronico.menu.logout" bundle="${guichetBundle}"/></a></li>
			<li><a href="${pageContext.request.contextPath}/guichetelectronico/secure/editdadospessoais.do2"><fmt:message key="guichetelectronico.menu.alterardados" bundle="${guichetBundle}"/></a></li>
		</c:otherwise>
	</c:choose>

	<c:forEach items="${menuOptions}" var="menuOption" varStatus="menuOptionStatus">
	<li>
		<c:if test="${menuOption.value.tipo == 'menu'}">
			<a href="../${acesso}/detalhemenu.do2?id=${menuOption.value.idMenu}"
				title="${menuOption.value.titulo}">${menuOption.value.titulo}</a>
		</c:if>
		<c:if test="${menuOption.value.tipo == 'informacao'}">
			<a href="../${acesso}/detalheinformacao.do2?id=${menuOption.value.idMenu}" 
				title="${menuOption.value.titulo}">${menuOption.value.titulo}</a>
		</c:if>
		<c:if test="${menuOption.value.tipo == 'instrucao'}">
			<a href="../${acesso}/servicos.do2${menuOption.value.link}"
				title="${menuOption.value.titulo}">${menuOption.value.titulo}</a>
		</c:if>
		<c:if test="${menuOption.value.tipo == 'link'}">
			<a href="${menuOption.value.link}" 
				title="${menuOption.value.titulo}">${menuOption.value.titulo}</a>
		</c:if>
		
		<c:if test="${!empty menuOption.value.subOptions}">
			<ul id="nivel1">
				<c:forEach items="${menuOption.value.subOptions}" var="subOption" varStatus="subOptionStatus">
					<c:set var="subOption" value="${subOption}" scope="request"/>
					<jsp:include page="../base/menuitem.jsp"/>					
				</c:forEach>
				</ul>
		</c:if>
	</li>	
	</c:forEach>
</ul>