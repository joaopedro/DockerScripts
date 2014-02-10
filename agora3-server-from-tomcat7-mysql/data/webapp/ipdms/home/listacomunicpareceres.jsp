<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:message key="ipdms.comunicacaoparecer.list.tipo" var="tipo" />
<fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.alerta" var="alerta" />
<fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.dataEnvio" var="dataEnvio" />
<fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.origem" var="origem" />
<fmt:message key="ipdms.myprocesses.enviadoPor" var="enviadoPor" />
<fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.assunto" var="assunto" />
<fmt:message key="ipdms.comunicacaoparecer.etapaProcesso.detalhe.destinatario" var="destinatario" />
<fmt:message key="ipdms.comunicacaoparecer.list.consultar" var="consultar" />
<fmt:message key="ipdms.etapa.darConhecimento" var="tomeiConhecimento" />
<fmt:message key="ipdms.instrucao.pedido.info.title" var="atencao" />


<div id="comunicacaoParecerListErrorDiv">
	<html:errors />
</div>

<c:choose>
	<c:when test="${not empty comunicPareceres}">

		<display:table id="comunicacoesPareceresList" name="${comunicPareceres}" htmlId="worklist" requestURI="/comunicacoesPareceres.do2" 
				pagesize="10"> 
			<display:setProperty name="paging.banner.some_items_found" value="" /> 
			<display:setProperty name="paging.banner.all_items_found" value="" /> 
			<display:setProperty name="paging.banner.one_item_found" value="" /> 
			<display:setProperty name="paging.banner.placement" value="both" /> 

			<display:column title="${tipo}" sortable="true">
				<c:choose>
				<c:when test="${comunicacoesPareceresList.tipo != 'C'}">
					<fmt:message key="ipdms.comunicacaoparecer.tipoParecer" /> <img src="${pageContext.request.contextPath}/images/icon/icon-alerta.png" class="cursor" alt="${alerta}" title="${alerta}" />
				</c:when>
				<c:otherwise><fmt:message key="ipdms.comunicacaoparecer.tipoComunicacao" /></c:otherwise>
				</c:choose>
			</display:column>
			<display:column title="${dataEnvio}" sortable="true" style="width:12%"><fmt:formatDate value="${comunicacoesPareceresList.dataCriacao.time}" pattern="dd-MM-yyyy"/></display:column>
			<display:column title="${origem}" property="autor.organicaPrincipal.sigla" sortable="true" />
			<display:column title="${enviadoPor}" property="autor.titulo" sortable="true" style="width:12%"/>
			<display:column title="${assunto}" property="assunto" />
			<display:column title="${destinatario}" style="width:12%">
				${comunicacoesPareceresList.destinatario.titulo}
			</display:column>			
			<display:column title="${consultar}" class="alignCenter" style="width:4%">
				<c:set var="url" value="javascript:showComunicParecerDetail(${comunicacoesPareceresList.id},'');" />
				<c:if test="${comunicacoesPareceresList.tipo != 'C'}">
					<c:set var="url" value="javascript:showComunicParecerDetail(${comunicacoesPareceresList.id},'responderParecer.do2');" />										
				</c:if>
				
				<a href="${url}">
					<img src="${pageContext.request.contextPath}/images/icon/icon-consultarDoc.png" class="cursorMao" alt="${consultar}" title="${consultar}" style="border:none" />
				</a>
			</display:column>
			<display:column title="${tomeiConhecimento}" class="alignCenter" style="width:7%">
				<c:if test="${comunicacoesPareceresList.tipo == 'C'}">
					<input type="checkbox" id="conhecimentoId" value="${comunicacoesPareceresList.id}" style="border:0;" />
				</c:if>
			</display:column>
			<display:footer>
			<td colspan="7" class="tableFooter">&nbsp;</td>
			<td class="tableFooter alignCenter"><img
				src="${pageContext.request.contextPath}/images/icon/icon-visto.png"
				onclick="javascript:responderComunicAll();show2();" class="cursorMao" alt="${tomeiConhecimento}"
				title="${tomeiConhecimento}" /></td>
		</display:footer>
		</display:table>
	</c:when>
	<c:otherwise>
		<div class="row formlabel_sf" ><div class="mensagenCaixa"><div style="float:left; width:3%;"><img src="${pageContext.request.contextPath}/images/icon/icon-informacao.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;"  alt="${atencao}" title="${atencao}"/></div><div style="float:right; width:93%; vertical-align:middle; margin-top:4px; "><div class="info"><fmt:message key="ipdms.comunicacaoparecer.consultar.noRecordsFound" /></div></div><div style="clear:both"></div></div></div>
	</c:otherwise>
</c:choose>