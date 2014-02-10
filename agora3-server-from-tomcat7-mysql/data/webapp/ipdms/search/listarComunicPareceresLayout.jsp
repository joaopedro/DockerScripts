<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="/WEB-INF/ipdms-versionable.tld" prefix="ipdms"%>


<c:set var="tilesTitulo">
	<tiles:getAsString name='titulo'/>
</c:set>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="${tilesTitulo}" var="titulo"/>
<fmt:message key="ipdms.comunicacaoparecer.list.tipo" var="tipo" />
<fmt:message key="ipdms.comunicacaoparecer.pesquisa.numProcesso" var="numProcesso" />
<fmt:message key="ipdms.comunicacaoparecer.etapaProcesso.detalhe.tipoProcesso" var="tipoProcesso" />
<fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.dataEnvio" var="dataEnvio" />
<fmt:message key="ipdms.comunicacaoparecer.pesquisa.areaProcesso" var="areaProcesso" />
<fmt:message key="ipdms.comunicacaoparecer.pesquisa.detalhe.origem" var="origem" />
<fmt:message key="ipdms.comunicacaoparecer.list.enviadoPor" var="enviadoPor" />
<fmt:message key="ipdms.comunicacaoparecer.list.listaDestinatarios" var="listaDestinatarios" />
<fmt:message key="ipdms.comunicacaoparecer.etapaProcesso.detalhe.assunto" var="assunto" />
<fmt:message key="ipdms.comunicacaoparecer.list.anexo" var="anexo" />
<fmt:message key="ipdms.comunicacaoparecer.list.dataFecho" var="dataFecho" />
<fmt:message key="ipdms.comunicacaoparecer.list.consultar" var="consultar" />


<bean:define id="mapping" name="<%= org.apache.struts.Globals.MAPPING_KEY %>" />
<tiles:insert definition="ipdms.base">
	<tiles:put name="main-body" direct="true">
		<bean:define id="referer"><bean:write name="mapping" property="path" />.do2</bean:define>
	
		<script type="text/javascript">	
			document.title = '${productName} - ${titulo}';	 
		</script>
		<table style="border:none" cellpadding="0" cellspacing="0" class="headings" >
			<tr>
				<td class="titulo1">${titulo}</td>
			</tr>
			<tr>
				<td>
					<%-- 
						NOTA: o original mapping desta pagina esta a ser guardado pois no caso de o pesquisa form adicionado
						ser o da pesquica avançada, o original mapping é sobreposto por um valor incorrecto. Isto acontece
						pois o jsp do form da pesquisa avançada invoca uma chamada ao controlador de stusts (para obter a lista
						de etapas dinamimacamente) e o valor do original mapping é sobreposto pelo valor do selectatapas
					--%>
					<c:set var="originalMapping" value="${requestScope['org.apache.struts.action.mapping.instance'].path}"></c:set>
				</td>
			</tr>
		</table>
		<tiles:insert attribute="pesquisaForm" flush="false"></tiles:insert>
		
		<logic:notPresent name="listaComunicPareceres">
			<bean:parameter id="pageParam" name="page" value="-1" />
				<div class="row formlabel_sf" >
					<div class="leftTabButton label" style="width: 80%;" title="">
						<logic:greaterThan name="pageParam" value="0"><fmt:message key="ipdms.comunicacaoparecer.pesquisa.noRecordsFound" /></logic:greaterThan>
					</div>
					<div style="clear:both"></div>
				</div>
		</logic:notPresent>
		<logic:present name="listaComunicPareceres">
			<%-- tipo do processos ServicoOnlineDriver --%>
			<%-- E' colocado o request URI fixo pela razao descrita acima. Ver comentario. --%>
			
			<display:table id="comunicacaoParecer" name="${sessionScope.listaComunicPareceres}" htmlId="worklist" 
							pagesize="20" requestURI="${originalMapping}.do2">

			<display:column title="${tipo}" sortable="true">
				<c:choose>
				<c:when test="${comunicacaoParecer.tipo != 'C'}"><fmt:message key="ipdms.comunicacaoparecer.tipoParecer" /></c:when>
				<c:otherwise><fmt:message key="ipdms.comunicacaoparecer.tipoComunicacao" /></c:otherwise>
				</c:choose>
			</display:column>
			<display:column title="${numProcesso}" property="servicoOnline.idProcessoEntidade" sortable="true" />
			<display:column title="${tipoProcesso}">
				<c:set var="variante" value="${comunicacaoParecer.servicoOnline.variante}" />
				<ipdms:set-latest-variante var="v" conteudo="variante" />
				${v.processo.titulo}
			</display:column>
			<display:column title="${dataEnvio}" sortable="true"><fmt:formatDate value="${comunicacaoParecer.dataCriacao.time}" pattern="dd-MM-yyyy"/></display:column>
			<display:column title="${areaProcesso}" >
				<c:set var="variante" value="${comunicacaoParecer.servicoOnline.variante}" />
				<ipdms:set-latest-variante var="v" conteudo="variante" />
				${v.processo.organicaPrincipal.designacao}
			</display:column>
			<display:column title="${origem}" property="autor.organicaPrincipal.sigla" sortable="true" />			
			<display:column title="${enviadoPor}" property="autor.titulo" sortable="true" />
			<display:column title="${listaDestinatarios}" >
				<logic:iterate name="comunicacaoParecer" id="dest" property="destinatarios">
					${dest.titulo}<br/>
				</logic:iterate>
			</display:column>
			<display:column title="${assunto}" property="assunto" />
			<display:column title="${anexo}" />
			<display:column title="${dataFecho}" sortable="true"><fmt:formatDate value="${comunicacaoParecer.dataResposta.time}" pattern="dd-MM-yyyy"/></display:column>			
			<display:column title="${consultar}">
				<a href="javascript:showComunicParecerDetail(${comunicacaoParecer.id});">
					<img src="${pageContext.request.contextPath}/images/icon/icon-consultarDoc.png" class="cursorMao" alt="${consultar}" title="${consultar}" style="border:none" />
				</a>
			</display:column>
		</display:table>
			 
		</logic:present>
		
		<br/>
	<div id="resumoComunicParecerDiv"></div>		
	</tiles:put>
</tiles:insert>


