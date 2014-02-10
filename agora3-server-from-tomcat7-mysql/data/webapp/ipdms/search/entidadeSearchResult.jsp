<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.pesquisa.porentidade.id" var="id" />
<fmt:message key="ipdms.pesquisa.porentidade.nome" var="nome" />
<fmt:message key="ipdms.pesquisa.porentidade.nif" var="nif" />
<fmt:message key="ipdms.pesquisa.porentidade.tipo" var="tipo" />
<fmt:message key="ipdms.pesquisa.porentidade.numProcessos" var="numProcessos" />
<fmt:message key="ipdms.pesquisa.porentidade.consultar" var="consultar" />

<display:table id="entidades" name="${paginatedList}" htmlId="worklist"  requestURI="${originalMapping}.do2">
	<c:set var="entidade" value="${entidades.entidade}" />

	<display:column title="${id}" sortable="true" sortProperty="id">
		${entidade.id}<span style="display: none;">${paramId}=${entidade.id}</span>				
	</display:column>
	<display:column title="${nome}" sortable="true" sortName="nome">${entidade.nome}</display:column>
	<display:column title="${nif}" sortable="true" sortName="nif">${entidade.nif}</display:column>
	<display:column title="${tipo}">${entidade.tipoEntidade}</display:column>
	<display:column title="${numProcessos}">${entidades.numProcessos}</display:column>
	<display:column title="${consultar}" style="width:6%; text-align:center;">
		<a href="${pageContext.request.contextPath}/listServicosOnlineFromEntidade.do2?id=${entidade.id}">
			<img src="${pageContext.request.contextPath}/images/icon/icon-consultarDoc.png"
				class="cursorMao" alt="${consultar}" title="${consultar}" style="border:none" /> 
		</a>
	</display:column>
	
</display:table>



