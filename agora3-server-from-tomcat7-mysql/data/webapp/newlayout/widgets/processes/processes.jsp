<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="IMG_DIR" value="${pageContext.request.contextPath}/newlayout/images" />

<fmt:message key="agora.myprocesses.prioridade" var="prioridade"/>
<fmt:message key="agora.myprocesses.estado" var="estado"/>
<fmt:message key="agora.myprocesses.numProcesso" var="numProcesso"/>

<script>
	var fmtResources = {
		tipoProcesso: '<fmt:message key="agora.myprocesses.tipoProcesso"/>',
		dataInicial: '<fmt:message key="agora.myprocesses.dataInicial"/>',
		entidade: '<fmt:message key="agora.myprocesses.entidade"/>',
		assuntoDes: '<fmt:message key="agora.myprocesses.assunto"/>',
		etapaDes: '<fmt:message key="agora.myprocesses.etapa"/>',
		enviadoPorDes: '<fmt:message key="agora.myprocesses.enviadoPor"/>',
		origemProcesso: '<fmt:message key="agora.myprocesses.origemProcesso"/>',
		assignadoDes: '<fmt:message key="agora.myprocesses.assignado"/>',
		loadingMsg: '<fmt:message key="agora.loading"/>',
		prioridade: '${prioridade}',
		priorityHigh: '<fmt:message key="processo.priority.high"/>',
		priorityMedium: '<fmt:message key="processo.priority.medium"/>',
		priorityLow: '<fmt:message key="processo.priority.low"/>',
		estado: '${estado}',
		prazoUltrapassado: '<fmt:message key="agora.myprocesses.prazoUltrapassado"/>',
		prazoAproximacao: '<fmt:message key="agora.myprocesses.prazoAproximacao"/>',
		prazoDentro: '<fmt:message key="agora.myprocesses.prazoDentro"/>'
	};
</script>

<script src='${pageContext.request.contextPath}/newlayout/widgets/processes/processes.js' type="text/javascript"></script>

<script>
	$(document).ready(function() {
		//drag and drop da lista de colunas
		$("#columnCheckbox").sortable({
			revert: true,
			start: function(e, ui) {
		          // creates a temporary attribute on the element with the old index
				$(this).attr('data-previndex', ui.item.index());
			},
			update: function(e, ui) {
		          // gets the new and old index then removes the temporary attribute
				var newIndex = parseInt(ui.item.index()) + 4;
				var oldIndex = parseInt($(this).attr('data-previndex')) + 4;
				
				var tbl = jQuery('table');
				jQuery.moveColumn(tbl, oldIndex, newIndex);
		          
				$(this).removeAttr('data-previndex');
		      }
		});
		
		//lê o cookie com as definições da tabela
		var cookie = readCookie('tableDefs');
		if(cookie != null){
			tableDefs = JSON.parse(cookie);
		}
		else{
			var json = '{"columns":["tipoProcesso","dataInicial","entidade","assunto","etapa","enviadoPor","origemProcesso","assignado"],"visibility":[true,true,true,true,true,true,true,true]}';
			tableDefs = JSON.parse(json);
		}
		
		//cria a tabela
		createTable(tableDefs);
		
		//lista os processos
		loadListprocess('${pageContext.request.contextPath}/newlayout/listProcesses.do2','myprocesses');
	});
</script>

  <div id="tableDiv">
	<div id="TableSort" class="TabSort">
	    <span class="NumPages"></span>
	</div>
	
	<div id="Table">
		<table>
			<thead>
				<tr id="headRow">
					<th><input name="" type="checkbox" onclick="toogleCheck(this);"></th>
					<th class="sortable" onclick="javascript:sortColumn(this,'priority');">
						<img src="${IMG_DIR}/icones/Ico_prior1.png" width="12" height="12" title="${prioridade}" alt="${prioridade}">&nbsp;&nbsp;
					</th>
		            <th><img src="${IMG_DIR}/icones/Ico_estado1.png" width="12" height="12" title="${estado}" alt="${estado}"></th>
					<th>${numProcesso}</th>
		            <th id="lastTh" width="12px">
			            <div class="DisplayBox">
				            <ul>
					            <li><img src="${IMG_DIR}/icones/Ico_admin1.png" width="12" height="12">
					              	<ul id="columnCheckbox">
					              	</ul>
					            </li>
				            </ul>
			            </div>
		            </th>
				</tr>
			</thead>
			<tbody id="tbody"></tbody>
		</table>
	</div>
  </div>

<div id="myprocesses"></div>