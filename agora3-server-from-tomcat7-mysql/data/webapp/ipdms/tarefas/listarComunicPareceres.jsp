<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<fmt:message key="ipdms.comunicacaoparecer.respondido" var="respondido" />
<fmt:message key="ipdms.comunicacaoparecer.etapaProcesso.detalhe.dataEnvio" var="dataEnvio" />
<fmt:message key="ipdms.comunicacaoparecer.etapaProcesso.detalhe.origem" var="origem" />
<fmt:message key="ipdms.comunicacaoparecer.list.enviadoPor" var="enviadoPor" />
<fmt:message key="ipdms.comunicacaoparecer.etapaProcesso.detalhe.assunto" var="assunto" />
<fmt:message key="ipdms.comunicacaoparecer.etapaProcesso.detalhe.destinatario" var="destinatario" />
<fmt:message key="ipdms.comunicacaoparecer.dataResposta" var="dataResposta" />
<fmt:message key="ipdms.comunicacaoparecer.list.consultar" var="consultar" />
<fmt:message key="ipdms.instrucao.pedido.info.title" var="atencao" />

<script>
	var actionUrlcomunic = "${pageContext.request.contextPath}/tarefas/listarComunicPareceres.do2";
	
	showComunicParecerDetail = function(id) {
		new Ajax.Updater( {success: 'detailComunicParecerDiv'}, actionUrlcomunic+ '?method=detail', 
				   		  {method: 'get', parameters: 'id=' + id, evalScripts: true} );
	}
</script>

<div class="row" style="padding-top: 0px; text-align:left;" >
	<table class="headings" style="border:none;" cellpadding="0" cellspacing="0">
		<tbody>
		  <tr>
		    <td class="titulo2"><fmt:message key="ipdms.comunicacaoparecer.etapaProcesso.titulo" /></td>
		  </tr>
		</tbody>
	</table>					
</div>
<br />
<c:choose>
	<c:when test="${not empty comunicPareceres}">
		

		<display:table id="comunicacoesPareceresList" name="${comunicPareceres}" htmlId="worklist"  requestURI="/tarefas/listarComunicacoesPareceres.do2"> 
			<display:setProperty name="paging.banner.some_items_found" value="" /> 
			<display:setProperty name="paging.banner.all_items_found" value="" /> 
			<display:setProperty name="paging.banner.one_item_found" value="" /> 
			<display:setProperty name="paging.banner.placement" value="both" /> 

			<display:column title=" " style="vertical-align: middle;text-align: center">
				<c:if test="${comunicacoesPareceresList.resposta}">
					<img src="${pageContext.request.contextPath}/images/icon/icon-visto.png" alt="${respondido}" title="${respondido}" style="border:none" />
				</c:if>
			</display:column>
			<display:column title="Tipo" sortable="true">
				<c:choose>
				<c:when test="${comunicacoesPareceresList.tipo != 'C'}"><fmt:message key="ipdms.comunicacaoparecer.tipoParecer" /></c:when>
				<c:otherwise><fmt:message key="ipdms.comunicacaoparecer.tipoComunicacao" /></c:otherwise>
				</c:choose>
			</display:column>
			<display:column title="${dataEnvio}" style="width:12%"><fmt:formatDate value="${comunicacoesPareceresList.dataCriacao.time}" pattern="dd-MM-yyyy"/></display:column>
			<display:column title="${origem}" property="autor.organicaPrincipal.sigla" />
			<display:column title="${enviadoPor}" property="autor.titulo" style="width:12%" />
			<display:column title="${assunto}" property="assunto" />
			<display:column title="${destinatario}" style="width:12%">
				<c:forEach items="${comunicacoesPareceresList.destinatarios}" var="destinatario">
					${destinatario.titulo}
				</c:forEach>
			</display:column>
			<display:column title="${dataResposta}"><fmt:formatDate value="${comunicacoesPareceresList.dataResposta.time}" pattern="dd-MM-yyyy"/></display:column>			
			<display:column title="${consultar}" class="alignCenter" style="width:4%">
				<a href="javascript:showComunicParecerDetail(${comunicacoesPareceresList.id});">
					<img src="${pageContext.request.contextPath}/images/icon/icon-consultarDoc.png" class="cursorMao" alt="${consultar}" title="${consultar}" style="border:none" />
				</a>
			</display:column>
		</display:table>
	</c:when>
	<c:otherwise>
		<div class="row formlabel_sf" ><div class="mensagenCaixa"><div style="float:left; width:3%;"><img src="${pageContext.request.contextPath}/images/icon/icon-informacao.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;"  alt="${atencao}" title="${atencao}"/></div><div style="float:right; width:93%; vertical-align:middle; margin-top:4px; "><div class="info"><fmt:message key="ipdms.comunicacaoparecer.etapaProcesso.noRecordsFound" /></div></div><div style="clear:both"></div></div></div>
	</c:otherwise>
</c:choose>
<br/>
<br/>
<div id="detailComunicParecerDiv"></div>