<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="/WEB-INF/ipdms-versionable.tld" prefix="ipdms"%>


<c:set var="tilesTitulo">
	<tiles:getAsString name='titulo'/>
</c:set>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="${tilesTitulo}" var="titulo"/>
<fmt:message key="ipdms.pesquisa.pessoal.numProcesso" var="numProcesso" />
<fmt:message key="ipdms.pesquisa.pessoal.inicioProcesso" var="inicioProcesso" />
<fmt:message key="ipdms.pesquisa.pessoal.tipoProcesso" var="tipoProcesso" />
<fmt:message key="ipdms.pesquisa.pessoal.quemInteragiu" var="quemInteragiu" />
<fmt:message key="ipdms.pesquisa.pessoal.ultimaInteraccao" var="ultimaInteraccao" />
<fmt:message key="ipdms.pesquisa.pessoal.etapaUltimaInteraccao" var="etapaUltimaInteraccao" />
<fmt:message key="ipdms.pesquisa.pessoal.utilizadorActual" var="utilizadorActual" />
<fmt:message key="ipdms.pesquisa.pessoal.listarUtilizadores" var="listarUtilizadores" />
<fmt:message key="ipdms.pesquisa.pessoal.etapaActual" var="etapaActual" />
<fmt:message key="ipdms.pesquisa.pessoal.consultar" var="consultar" />
<fmt:message key="ipdms.pesquisa.pessoal.consultarProcesso" var="consultarProcesso" />

<script type="text/javascript">
	showAssignedUser = function (img) {
		var child = img;
		var myajax = new Ajax.Updater( {success: "users_" + child.attributes['id'].value},
							child.attributes['action'].value,
							{method: 'get',evalScripts:true} );
	};
</script>


<tiles:insert definition="ipdms.base">

	<tiles:put name="main-body" direct="true">
		
		<script type="text/javascript">	
			document.title = '${productName} - ${titulo}';	 
		</script>
		
		<table style="border:none" cellpadding="0" cellspacing="0" class="headings" >
			<tr>
				<td class="titulo1">${titulo}</td>
			</tr>			
		</table>
		
		<tiles:insert attribute="pesquisaForm" flush="false"></tiles:insert>		
		
		<logic:notPresent name="paginatedList">
			<bean:parameter id="pageParam" name="page" value="-1" />
				<div class="row formlabel_sf" >
					<div class="leftTabButton label" style="width: 80%;" title="">
						<logic:greaterThan name="pageParam" value="0">								
							<fmt:message key="ipdms.pesquisa.pessoal.norecordsfound" />							
						</logic:greaterThan>
					</div>
					<div style="clear:both"></div>
				</div>
		</logic:notPresent>
		
		<logic:present name="paginatedList">			
		
				<display:table id="processo" name="${paginatedList}" htmlId="worklist" requestURI="/procuraprocessospessoais.do2" style="cursor: pointer;" >
					 
					<bean:define id="servicoOnline" name="processo" property="contentInterface.servicoonline" />
					
					<%-- get last closed entry --%>
					<c:set var="closedEntry" value="" />
					<c:forEach var="logEntry" items="${servicoOnline.closedEntries}">
						<c:if test="${empty closedEntry}">							
							<c:set var="closedEntry" value="${logEntry}" />							
						</c:if>						
						<c:if test="${not empty closedEntry}">
							<c:if test="${closedEntry.id < logEntry.id}">
								<c:set var="closedEntry" value="${logEntry}" />
							</c:if>
						</c:if>																																			
					</c:forEach>				
					<c:set var="latestCol" value="${closedEntry.responder}"/>
					<c:if test="${ not empty closedEntry && not empty closedEntry.responder}">
						<ipdms:set-latest-colaborador var="latestCol" login="${closedEntry.responder}"/>
					</c:if>					
					<display:column title="${numProcesso}" class="realce" sortable="true">
				 		${servicoOnline.idProcessoEntidade}				
					</display:column>
					<display:column title="${inicioProcesso}" class="realce" sortable="true">
						<fmt:formatDate type="both" value="${servicoOnline.dataPreenchimento.time}" pattern="dd-MM-yyyy HH:mm"/>
					</display:column>
					<display:column title="${tipoProcesso}" class="realce" sortable="true">
						${servicoOnline.tipoConteudo.processo.titulo}
					</display:column>
					<display:column title="${quemInteragiu}" class="realce" sortable="true" >
						<span title="${latestCol.titulo}">
							${closedEntry.responder}
						</span>
					</display:column>
					<display:column title="${ultimaInteraccao}" class="realce" sortable="true">
						<fmt:formatDate value="${closedEntry.enddate.time}" pattern="dd-MM-yyyy HH:mm"/>
					</display:column>
					<display:column title="${etapaUltimaInteraccao}" class="realce" sortable="true">
						${closedEntry.etapa.titulo}				
					</display:column>
					<display:column title="${utilizadorActual}" class="realce" sortable="true">
						<c:forEach var="logEntry" items="${servicoOnline.etapasAbertas}">						
							<c:if test="${fn:startsWith(logEntry.assigneduser, 'R')}">						
								<img src="images/icon/icon-mais.png" 
									class="cursorMao" 
									style="vertical-align:top" 
									title="${listarUtilizadores}" 
									alt="${listarUtilizadores}" 
									action="workflowusers.do2?role=${logEntry.assigneduser}&nid=${logEntry.nid}" 
									onClick="showAssignedUser(this);" 
									id="${logEntry.nid}" />						
							</c:if>${logEntry.assigneduser}
							<span id="users_${logEntry.nid}" style="font-size: 9px; border-left: none; vertical-align: top;"></span>
						</c:forEach>
					</display:column>
					<display:column title="${etapaActual}" class="realce" sortable="true">
						${processo.contentInterface.nomeEtapaActual}
					</display:column>
					<display:column title="${consultar}" class="realce">					
						<a href="${pageContext.request.contextPath}/displayconteudo.do2?numero=${servicoOnline.numeroConteudo}">
							<img src="${pageContext.request.contextPath}/images/icon/icon-consultarDoc.png" class="cursorMao" alt="${consultarProcesso}" title="${consultarProcesso}" />						
						</a>
					</display:column>				
				</display:table>
						
		</logic:present>
				
	</tiles:put>
	
</tiles:insert>