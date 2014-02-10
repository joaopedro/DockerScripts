<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://ajaxtags.org/tags/ajax" prefix="ajax" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.atencaoMsg" var="atencaoMsg" bundle="${ecmBundle}" />
<fmt:message key="ipdms.emptyRecords" var="emptyRecords" bundle="${ecmBundle}" />
<fmt:message key="ecm.estrutura.descricao" var="descricao" bundle="${ecmBundle}" />
<fmt:message key="ecm.estrutura.proprietario" var="proprietario" bundle="${ecmBundle}" />
<fmt:message key="ecm.estrutura.dataCriacao" var="dataCriacao" bundle="${ecmBundle}" />
<fmt:message key="ecm.estrutura.dataExpiracao" var="dataExpiracao" bundle="${ecmBundle}" />
<fmt:message key="ecm.estrutura.estado" var="estado" bundle="${ecmBundle}" />
<fmt:message key="ecm.estrutura.estado.preliminar" var="preliminar" bundle="${ecmBundle}" />
<fmt:message key="ecm.estrutura.estado.publicado" var="publicado" bundle="${ecmBundle}" />
<fmt:message key="ecm.estrutura.estado.expirado" var="expirado" bundle="${ecmBundle}" />
<fmt:message key="ecm.estrutura.contextos" var="contextos" bundle="${ecmBundle}" />
<fmt:message key="ecm.estrutura.tipos" var="tipos" bundle="${ecmBundle}" />
<fmt:message key="ecm.conteudos.designacaoplural" var="conteudosDes" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.pesquisar" var="pesquisar" bundle="${ecmBundle}" />

<c:choose>
	<c:when test="${paginatedList.fullListSize == 0}">	
		<br/>
		<div class="row formlabel_sf" >
			<div class="mensagenCaixa">
				<div style="float:left; width:3%;">
					<img src="${pageContext.request.contextPath}/images/icon/icon-informacao.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;"  alt="${atencaoMsg}" title="${atencaoMsg}"/>
				</div>
				<div style="float:right; width:93%; vertical-align:middle; margin-top:4px; ">
					<div class="info">${emptyRecords}</div>
				</div>
				<div style="clear:both"></div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<ajax:displayTag id="displayTagFrameEstrutura" ajaxFlag="true" baseUrl="${pageContext.request.contextPath}/ecm/listEstruturas.do2">
			<display:table style="cursor: pointer;" id="estrutura" name="${paginatedList}" htmlId="worklist" requestURI="">
				<display:column title="${descricao}" property="descricaoEstrutura" class="realce" sortable="true" />
				<display:column title="${proprietario}" property="proprietario" class="realce" sortable="true" />
				<display:column title="${dataCriacao}" property="dataCriacao.time" format="{0,date,dd-MM-yyyy}" class="realce" sortable="true" />
				
				<display:column title="${dataExpiracao}" property="dataExpiracao.time" format="{0,date,dd-MM-yyyy}" class="realce" sortable="true" />
				
				<display:column title="${estado}" style="width:6%; text-align:center;">
					<c:if test="${estrutura.estado.codigoEstado eq 1}">
						<c:set var="imgPath" value="${pageContext.request.contextPath}/images/icon/aguardar-01.png" />
						<c:set var="statusMsg" value="${preliminar}" />
					</c:if>
					<c:if test="${estrutura.estado.codigoEstado eq 2}">
						<c:set var="imgPath" value="${pageContext.request.contextPath}/images/icon/aprovado-01.png" />
						<c:set var="statusMsg" value="${publicado}" />
					</c:if>
					<c:if test="${estrutura.estado.codigoEstado eq 3}">
						<c:set var="imgPath" value="${pageContext.request.contextPath}/images/icon/reprovado-01.png" />
						<c:set var="statusMsg" value="${expirado}" />
					</c:if>				
				
					<a href="#" onclick="setStatus('${estrutura.descricaoEstrutura}', '${estrutura.estado.codigoEstado}');">
						<img src="${imgPath}" class="cursorMao" alt="${statusMsg}" title="${statusMsg}" style="border:none" />						
					</a>
				</display:column>
				
				<display:column title="${contextos}" class="realce">
					<c:forEach items="${estrutura.contextos}" var="contexto">
						<p>${contexto.descricaoContexto}</p>
					</c:forEach>
				</display:column>
				
				<display:column title="${tipos}" class="realce">
					<c:forEach items="${estrutura.tipos}" var="tipo">
						<p>${tipo.descricaoTipo}</p>
					</c:forEach>
				</display:column>
								
				<display:column title="${conteudosDes}" style="width:6%; text-align:center;">
					<a href="${pageContext.request.contextPath}/ecm/conteudos.do2?codigoEstrutura=${estrutura.codigoEstrutura}">
						<img src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" class="cursorMao" alt="${pesquisar}" title="${pesquisar}" style="border:none" />
					</a>
				</display:column>				
			</display:table>			
		</ajax:displayTag>
	</c:otherwise>
</c:choose>