<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="/WEB-INF/ipdms-versionable.tld" prefix="ipdms"%>

<fmt:message key="ipdms.loading" var="loading"/>
<fmt:message key="ipdms.myprocesses.popupTitle.nenhumSeleccionado" var="popupTitle"/>
<fmt:message key="ipdms.myprocesses.popupMsg.nenhumSeleccionado" var="popupMsg"/>

<script>
/*
 * Ext Config
 */
Ext.Ajax.on('beforerequest', function(connection,options){ Ext.getBody().mask('<img src="ipdms/js/ext/resources/images/default/grid/loading.gif" /> ${loading}'); });
Ext.Ajax.on('requestcomplete', function(connection,options)	{ Ext.getBody().unmask(); });
Ext.Ajax.on('requestexception', function(connection,options){ Ext.getBody().unmask(); });

/*
 * Ajax function to load my processes
 */	
loadMyProcesses = function(params) {
	loadListprocess('${pageContext.request.contextPath}/myprocesses.do2?' + params,'myprocesses');	
};

//list object to save selectedId's
//only nids
var elements = [];

populateIds = function() {
	
	//for each checkbox element, check if is selected
	$$('input[type="checkbox"]').each(
		function filter(item) {
			{
				// only nid is added to array
       			var el = item.id.split('_')[1];
       			if(item.checked){                		
       				if(elements.indexOf(el) == -1){                			
       					var pos = elements.length;                			              			
       					elements[pos] = el;                			
       				}                		
       			} else{
       				if(elements.indexOf(el) != -1){
       				var pos = elements.indexOf(el);                		
       				elements.splice(pos, 1);                			
       				}
       			}                	
       		}
		});
		
};

//transforms a string value into an array
transformStringIntoArray = function(value){		
	
	if(value != null && value != ''){	
		var elems = value.split(';');
		for(var i = 0; i < elems.length; i++){
			elements[i] = elems[i];				
		}	
	}
		
};

//transforms an array into a string value
transformArrayIntoString = function(obj, label){		

	var parameters = '';
	if(obj.length > 0){		
		parameters += label;
		for(var i = 0; i < obj.length; i++){
			parameters += obj[i].trim() + ';';					
		}		
		parameters = parameters.substring(0,parameters.length - 1);		
	}
		
	return parameters;
	
};

Ext.select("#myprocesses span.pagelinks a").on('click', function(ev) {
														ev.stopEvent();
														
														// get page number that will be loaded
														var page = this.href.split('page=')[1];
														var pnumber = page.split('&')[0];														
														
														populateIds();																
														var params = transformArrayIntoString(elements, 'notifids=');													
																				
														var parameters = 'page='+ pnumber;
														if(params != ''){
															parameters += '&' + params;	
														}																																								
																												
														loadMyProcesses(parameters);														
																																									
													});		
	
Ext.select("#myprocesses th.sortable a").on('click', function(ev) {
														ev.stopEvent();
														
														// get sort property
														var srt = this.href.split('?')[1];
														var sort = srt.split('&')[0];
																												
														populateIds();																
														var params = transformArrayIntoString(elements, 'notifids=');													
																				
														var parameters = sort;
														if(params != ''){
															parameters += '&' + params;	
														}
																												
														loadMyProcesses(parameters);
													});

/*
 * Javascript to submit the worklist form in my processes to export documents
 * to bundle or to execute a "Tramitacao Multipla"
 */
isFormEmpty = function() {
	
	populateIds();
	
	if(elements.length == 0){
		Ext.MessageBox.show({ 
			title: '${popupTitle}',
			msg: '${popupMsg}', 
			buttons: Ext.MessageBox.OK,
			icon: Ext.MessageBox.WARNING 
			});
		return true;
	}
	
	return false;
};

exportBundle = function () {
	if(!isFormEmpty()) {
		var params = transformArrayIntoString(elements, 'notifids=');
		$('exportForm').action += '?' + params;		
		$('exportForm').submit();	
	}
}; 

tramitarMultiplo = function() {
	if(!isFormEmpty()) {		
		var params = transformArrayIntoString(elements, 'notifids=');
		$('exportForm').action = '${pageContext.request.contextPath}/compileMultipleNotification.do2' + '?' + params;
		$('exportForm').submit();
	}
};



</script>

<fmt:message key="ipdms.myprocesses.numProcesso" var="numProcesso"/>
<fmt:message key="ipdms.myprocesses.tipoProcesso" var="tipoProcesso"/>
<fmt:message key="ipdms.myprocesses.dataInicial" var="dataInicial"/>
<fmt:message key="ipdms.myprocesses.entidade" var="entidade"/>
<fmt:message key="ipdms.myprocesses.assunto" var="assunto"/>
<fmt:message key="ipdms.myprocesses.etapa" var="etapa"/>
<fmt:message key="ipdms.myprocesses.enviadoPor" var="enviadoPor"/>
<fmt:message key="ipdms.myprocesses.origemProcesso" var="origemProcesso"/>
<fmt:message key="ipdms.myprocesses.prioridade" var="prioridade"/>
<fmt:message key="ipdms.myprocesses.estado" var="estado"/>
<fmt:message key="ipdms.myprocesses.prazoUltrapassado" var="prazoUltrapassado"/>
<fmt:message key="ipdms.myprocesses.prazoAproximacao" var="prazoAproximacao"/>
<fmt:message key="ipdms.myprocesses.prazoDentro" var="prazoDentro"/>
<fmt:message key="ipdms.myprocesses.assignado" var="assignado"/>
<fmt:message key="ipdms.myprocesses.consultar" var="consultar"/>
<fmt:message key="ipdms.myprocesses.obterDocumentos" var="obterDocumentos"/>
<fmt:message key="ipdms.myprocesses.tarmitarvarios" var="tarmitarvarios"/>


<c:set var="IMG_DIR" value="${pageContext.request.contextPath}/images" />

<form id="exportForm" name="exportForm" action="bundle/listDocumentsOfProcesses.do2" method="post">
	<input type="hidden" id="nextNotifications" name="nextNotifications" value="" />	
	<input type="hidden" id="currentPage" name="currentPage" value="${filterPartialList.page}" />
		
	<c:set var="pagenotifids" value="" />
	<display:table id="notification" name="${paginatedList}" htmlId="worklist" requestURI="" >
		<c:set var="pagenotifids" value="${pagenotifids}${notification.id}:" />
		<c:set var="so" value="${notification.process.servicoOnline}" />
		<display:column title="${numProcesso}">${so.idProcessoEntidade}</display:column>
		<display:column title="${tipoProcesso}" sortable="true" sortProperty="tipoProcesso" sortName="tipoProcesso">
			<c:set var="variante" value="${so.variante}" />
			<ipdms:set-latest-variante var="v" conteudo="variante" />
			${v.titulo}
		</display:column>
		<display:column title="${dataInicial}" sortable="true" sortProperty="dataCriacao" sortName="dataCriacao"> 
			<fmt:formatDate value="${so.dataPreenchimento.time}" pattern="dd-MM-yyyy HH:mm"/>
		</display:column>
		<display:column title="${entidade}">
			<c:set var="done" value="false" />
			<c:set var="soEntidadeNome" value="" />
			<c:forEach var="soEntidade" items="${so.entidades}">
				<c:if test="${soEntidade.id.role.sigla==notification.etapaConfig.processo.rolePrincipal.sigla && !done}">
					<c:set var="soEntidadeNome" value="${soEntidade.id.entidade.nome}" />
					<c:set var="done" value="true" />
				</c:if>
			</c:forEach>
			${soEntidadeNome}
		</display:column>
		<display:column title="${assunto}">
			<c:choose>
				<c:when test="${fn:length(so.assunto)<=50}">${so.assunto}</c:when>
				<c:otherwise>${fn:substring(so.assunto,0,47)}...</c:otherwise>
			</c:choose>				
		</display:column>
		<display:column title="${etapa}" sortable="true" sortProperty="etapa" sortName="etapa">
			<c:forEach var="logEntrie" items="${so.etapasAbertas}">
				<c:if test="${logEntrie.nid==notification.id}">
					${logEntrie.etapa.titulo}
				</c:if>											
			</c:forEach>
		</display:column>
		<display:column title="${enviadoPor}">
			<c:forEach var="logEntrie" items="${so.etapasAbertas}">
				<c:if test="${logEntrie.nid==notification.id}">
					<span title="${logEntrie.colaborador.nome}">
						${logEntrie.colaborador.login}
					</span>
				</c:if>											
			</c:forEach>
		</display:column>
		<display:column title="${origemProcesso}">
			<c:forEach var="logEntrie" items="${so.etapasAbertas}">
				<c:if test="${logEntrie.nid==notification.id}">
					<c:if test="${logEntrie.colaborador.organicaPrincipal!=null}">
						<span title="${logEntrie.colaborador.organicaPrincipal.designacao}">
						${logEntrie.colaborador.organicaPrincipal.sigla}
						</span>
					</c:if>
				</c:if>											
			</c:forEach>
		</display:column>
		<display:column title="${prioridade}" sortable="true" sortProperty="priority">
			<fmt:message key="${so.priority.resourceKey}" />
		</display:column>
		<display:column title="${estado}" style="text-align:center;">
			<c:choose>
				<c:when test="${notification.outOfDate}">
					<img src='${IMG_DIR}/icon/reprovado-01.png' alt="${prazoUltrapassado}" title="${estado}: ${prazoUltrapassado}" />
				</c:when>
				<c:otherwise>
					<c:if test="${notification.inAlert}">
					<img src='${IMG_DIR}/icon/aguardar-01.png' 
							alt="${prazoAproximacao}" title="${estado}: ${prazoAproximacao}" />
					</c:if>
					<c:if test="${!notification.inAlert}">
						<img src='${IMG_DIR}/icon/aprovado-01.png' alt="${prazoDentro}" title="${estado}: ${prazoDentro}" />
					</c:if>							
				</c:otherwise>
			</c:choose>
		</display:column>
		<display:column title="${assignado}" sortable="true" style="vertical-align: middle; text-align: center;">
			<logic:iterate id="assignee" name="notification" property="assignees">
				<logic:iterate id="assigneeKey" name="worklistkey" indexId="assigneeKeyIndex">
					<c:if test="${assignee == assigneeKey}">
						<img src='${IMG_DIR}/icon/worklist/colab${assigneeKeyIndex mod 12}.png' 
							alt="${assignado} ${assignee.titulo}" title="${assignado} ${assignee.titulo}" />
					</c:if>
				</logic:iterate>
			</logic:iterate>
		</display:column>
		<display:column  title="${consultar}" style="width:6%; text-align:center;">
			<a href="javascript:openNotification('${notification.id}');">
			 	<img src="${pageContext.request.contextPath}/images/icon/icon-consultarDoc.png"
				class="cursorMao" alt=<fmt:message key="ipdms.myprocesses.consultarprocesssonumero"/> ${so.idProcessoEntidade}" 
				title="<fmt:message key="ipdms.myprocesses.consultarprocesssonumero"/> ${so.idProcessoEntidade}" /> 
			</a>
		</display:column>
		<display:column style="text-align:center;">
			<c:set var="checkid" value="rowSelected_${notification.id}" />
			<c:set var="checked_flag" value="false" />
			
			<c:if test="${not empty selectedIds}">
				<c:forEach items="${selectedIds}" var="selectedId">								
					<c:set var="value" value="rowSelected_${selectedId}" />
					<c:if test="${value == checkid}">	
						<c:set var="checked_flag" value="true" />
					</c:if>						
				</c:forEach>
			</c:if>
										
			<c:if test="${checked_flag}"><input type="checkbox" value="checked" id="${checkid}" name="${checkid}" checked="checked" /></c:if>
			<c:if test="${!checked_flag}"><input type="checkbox" value="checked" id="${checkid}" name="${checkid}" /></c:if>				
				
		</display:column>
		<display:footer>
			<td colspan="12">&nbsp;</td>
			<td>
				<a href="#" onclick="exportBundle();"><img src="${IMG_DIR}/icon/icon-obterDocumento.png" title="${obterDocumentos}" alt="${obterDocumentos}" /></a>
				<a href="#" onclick="tramitarMultiplo();"><img src="${IMG_DIR}/icon/icon-tramitarVarios.png" title="${tarmitarvarios}" alt="${tarmitarvarios}" /></a>
			</td>
		</display:footer>
	</display:table>
		
</form>

<c:forEach var="assigneeKey" items="${worklistkey}" varStatus="status">
	<div class="alignLeft">
		<div class="left">
			<img src='${IMG_DIR}/icon/worklist/colab${status.index mod 12}.png'  
				alt="${assignado}: ${assigneeKey.titulo}" title="${assignado}: ${assigneeKey.titulo}" />
		</div>
		<div class="right">
			<div class="texto">${assigneeKey.titulo}</div>
		</div>
	</div>
	<div class="formlabel"></div>

</c:forEach>

<script>
	transformStringIntoArray('${notifids}');		
	
	
	createNotificationList = function(id, str){			
		
		var newstr = '';
		var arr = str.split(':');
		var pos = 0;
		for ( var i = 0; i < arr.length; i++) {
			if(id == arr[i]){
				pos = i;
				break;
			}			
		}
		
		for ( var i = pos; i < arr.length; i++) {
			newstr += arr[i] + ':';								
		}
		
		return newstr.substring(0,newstr.length - 1);		
		
	};
	
	openNotification = function(id){
		
		// affect pagenotifids with current page notifcation ids list
		var str = '${pagenotifids}';
		str = str.substring(0, str.length - 1);
		var next = createNotificationList(id, str);
		$('nextNotifications').value = next;
				
		$('exportForm').action = '${pageContext.request.contextPath}/notification.do2?nid=' + id;
		$('exportForm').submit();			
			
	};
		
</script>

