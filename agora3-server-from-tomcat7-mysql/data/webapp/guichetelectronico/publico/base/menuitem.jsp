<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<li>
	<c:if test="${subOption.tipo == 'menu'}">
		<a href="../${acesso}/detalhemenu.do2?id=${subOption.idMenu}"
			title="${subOption.titulo}">${subOption.titulo}</a>
	</c:if>
	<c:if test="${subOption.tipo == 'informacao'}">
		<a href="../${acesso}/detalheinformacao.do2?id=${subOption.idMenu}" 
			title="${subOption.titulo}">${subOption.titulo}</a>
	</c:if>
	<c:if test="${subOption.tipo == 'instrucao'}">
		<%-- <a href="../${acesso}/servicos.do2${subOption.linkEspecifico}" title="${subOption.titulo}">${subOption.titulo}</a> --%>
		<a href="..${subOption.linkEspecifico}" title="${subOption.titulo}">${subOption.titulo}</a>
	</c:if>
	<c:if test="${subOption.tipo == 'link'}">
		<c:if test="${subOption.linkVisualizacao == '0'}">
			<c:set var="target" value="_blank"/>
		</c:if>
		<c:if test="${subOption.linkVisualizacao == '1'}">
			<c:set var="target" value="_blank"/>
		</c:if>
		<c:if test="${subOption.linkVisualizacao == '2'}">
			<c:set var="target" value="_parent"/>
		</c:if>
		
		<a href="${subOption.linkEspecifico}" target="${target}"
					title="${subOption.titulo}">${subOption.titulo}</a>
	</c:if>
	
<c:if test="${!empty subOption.subOptions}">
	<ul id="outronivel">
		<c:forEach items="${subOption.subOptions}" var="item" varStatus="itemStatus">
			<c:set var="subOption" value="${item}" scope="request"/>
			<jsp:include page="menuitem.jsp"/>
		</c:forEach>
	</ul>
</c:if>
</li>