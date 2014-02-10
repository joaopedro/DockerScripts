<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/ipdms-versionable.tld" prefix="ipdms"%>

<c:set var="tilesTitulo">
	<tiles:getAsString name='titulo'/>
</c:set>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="${tilesTitulo}" var="titulo"/>
<fmt:message key='ipdms.pesquisa.pessoal.norecordsfound' var="norecordsfound"/>
<fmt:message key='ipdms.pesquisa.results.id' var="id"/>
<fmt:message key='ipdms.pesquisa.results.numDoc' var="numDoc"/>
<fmt:message key='ipdms.pesquisa.results.nome' var="nome"/>
<fmt:message key='ipdms.pesquisa.results.nif' var="nif"/>
<fmt:message key='ipdms.pesquisa.results.processo' var="nomeProcesso"/>
<fmt:message key='ipdms.pesquisa.results.assunto' var="assunto"/>
<fmt:message key='ipdms.pesquisa.results.dataEntrada' var="dataEntrada"/>
<fmt:message key='ipdms.pesquisa.results.etapaActual' var="etapaActual"/>

<bean:define id="mapping" name="<%= org.apache.struts.Globals.MAPPING_KEY %>" />
<tiles:insert definition="ipdms.base">
	<tiles:put name="main-body" direct="true">
		<bean:define id="referer"><bean:write name="mapping" property="path" />.do2?<c:if test="${param.hist}">hist=true&</c:if>${urlAnterior}</bean:define>

		<script type="text/javascript">
			showAssignedUser = function (img) {
			var child = img;
			var myajax = new Ajax.Updater( {success: "users_" + child.attributes['id'].value},
								child.attributes['action'].value,
								{method: 'get',evalScripts:true} );

		};
		</script>

		<script type="text/javascript">

			var urlAnterior = '<%= org.apache.struts.util.RequestUtils.encodeURL(referer.toString()) %>';
			var rules = {
				'#worklist tbody tr td.clicavel': function(el) {
					el.onclick = function(event) {
						var queryString = '';
						var spanElement = this.parentNode.select('span');
						if(spanElement.first()) {
							queryString += spanElement.first().innerHTML.split(',').join('&');
						}
						queryString += "&urlAnterior=" + urlAnterior;
						window.location.href = '<tiles:getAsString name="rowAction" />?' +  queryString;
					};
				},
				'#worklist tbody tr': function(el) {
					el.onmouseover = function(){
						Element.addClassName(this,'active-row')
					};

					el.onmouseout = function() {
						Element.removeClassName(this, 'active-row');
					};
				}
			};
			Behaviour.register(rules);
		</script>
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
					<%--
					<c:choose>
						<c:when test="${param.hist}">
							<img src="${pageContext.request.contextPath}/images/icon/icon-historico.png" alt="Pesquisa no Histórico" title="Pesquisa no Histórico" />
						</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" alt="Pesquisa nos Processo Activos" title="Pesquisa nos Processos Activos" />
						</c:otherwise>
					</c:choose>	--%>
				</td>
			</tr>
		</table>
		<tiles:insert attribute="pesquisaForm" flush="false"></tiles:insert>
		<logic:notPresent name="paginatedList">
			<bean:parameter id="pageParam" name="page" value="-1" />
				<div class="row formlabel_sf" >
					<div class="leftTabButton label" style="width: 80%;" title="">
						<logic:greaterThan name="pageParam" value="0">${norecordsfound}</logic:greaterThan>
					</div>
					<div style="clear:both"></div>
				</div>
		</logic:notPresent>
		<logic:present name="paginatedList">
			<%-- tipo do processos ServicoOnlineDriver --%>
			<%-- E' colocado o request URI fixo pela razao descrita acima. Ver comentario. --%>
			<display:table style="cursor: pointer;" class="blabla" id="processo" name="${paginatedList}" htmlId="worklist"
							pagesize="20" requestURI="${originalMapping}.do2">

				<bean:define id="servicoOnline" name="processo" property="contentInterface.servicoonline" />
				<display:column title="${id}" class="realce clicavel" sortable="true" media="html">
			 		<span style="display: none" ><tiles:getAsString name="paramId"/>=${servicoOnline.numeroConteudo}</span>
					${servicoOnline.idProcessoEntidade}
				</display:column>
				<display:column title="${id}" class="realce clicavel" media="pdf rtf excel xml csv">
					${servicoOnline.idProcessoEntidade}
				</display:column>

				<!-- estabelecer entidade principal  -->
				<c:set var="variante" value="${servicoOnline.variante}" />
				<ipdms:set-latest-variante var="latestVariante" conteudo="variante" />
				<c:set var="done" value="false" />
				<c:set var="soEntidadeNome" value="" />
				<c:set var="soEntidadeNIF" value="" />
				<c:forEach var="soEntidade" items="${servicoOnline.entidades}">
					<c:if test="${soEntidade.id.role.sigla==latestVariante.processo.rolePrincipal.sigla && !done}">
						<c:set var="soEntidadeNome" value="${soEntidade.id.entidade.nome}" />
						<c:set var="soEntidadeNIF" value="${soEntidade.id.entidade.nif}" />
						<c:set var="done" value="true" />
					</c:if>
				</c:forEach>

				<display:column title="${nome}" class="realce clicavel" sortable="true">
					${soEntidadeNome}
				</display:column>
				<display:column title="${nif}" class="realce clicavel" sortable="true">
					${soEntidadeNIF}
				</display:column>
				<display:column title="${nomeProcesso}" class="realce clicavel" sortable="true">
					${servicoOnline.tipoConteudo.processo.titulo}
				</display:column>
				<c:if test="${not empty servicoOnline.dynamicDescriptionColumnName}">
					<display:column title="${servicoOnline.dynamicDescriptionColumnName}" class="realce clicavel" sortable="true">
						${servicoOnline.dynamicDescription}
					</display:column>
				</c:if>
				<display:column title="${assunto}" class="realce clicavel" sortable="true">
					<c:choose> <c:when test="${fn:length(servicoOnline.assunto)<=255}">
					${servicoOnline.assunto}</c:when>
					<c:otherwise>
					${fn:substring(servicoOnline.assunto,0,254)}...
					</c:otherwise>
					</c:choose>
				</display:column>
				<display:column title="${dataEntrada}" class="realce clicavel" sortable="true">
					<c:if test="${not empty servicoOnline.dataPreenchimento}">
						<fmt:formatDate type="both" value="${servicoOnline.dataPreenchimento.time}" pattern="dd-MM-yyyy HH:mm"/>
					</c:if>
				</display:column>
				<display:column title="${etapaActual}" class="realce" sortable="true">
					<c:forEach var="logEntrie" items="${servicoOnline.opennedLogEntries}">
						<c:if test="${logEntrie.tipomovimento.descricao=='Tramitar'}">
							<dl>
								<dt style="float:left;width:50%;">${logEntrie.etapa.titulo}</dt>
								<c:if test="${not empty logEntrie.assigneduser}">
									<c:if test="${not empty logEntrie.nid}">
									<dd style="float:left;width:50%;">
									<img src="images/icon/icon-mais.png"
										 align="top"
										 title="Listar utilizadores do grupo"
										 alt="Listar utilizadores do grupo"
										 action="workflowusers.do2?role=${logEntrie.assigneduser}&nid=${logEntrie.nid}"
										 onClick="showAssignedUser(this);"
										 id="${logEntrie.nid}"
									 />${logEntrie.assigneduser}
									<span id="users_${logEntrie.nid}" class="ipdms_reportData" style="border-left: none; vertical-align: top;"></span>
									</dd>
									</c:if>
								</c:if>
							</dl>
						</c:if>
					</c:forEach>
				</display:column>
			</display:table>
		</logic:present>		
	</tiles:put>
</tiles:insert>
