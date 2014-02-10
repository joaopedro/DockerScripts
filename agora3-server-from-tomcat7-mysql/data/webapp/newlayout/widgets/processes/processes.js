//guarda a estrutura da tabela num cookie quando há alterações
//TODO: isto deverá ser substituido para ficar na BD
function tableDefsCookie(){
	tableDefs = {
		columns: [],
		visibility: []
	};	

	var tbl = jQuery('#Table');
	var headers = jQuery('th', tbl);

	headers.each(function() {
		if($(this)[0].dataMapping != undefined){
			tableDefs.columns.push($(this)[0].dataMapping);
			tableDefs.visibility.push($(this).is(':visible'));
		}
	})
	
	var tableDefsJson = JSON.stringify(tableDefs);
	
	createCookie('tableDefs', tableDefsJson, 6);
}

//criação da estrutura da tabela
var tableDefs;
function createTable(tableDefs){
	var tr = document.getElementById('headRow');
	var lastTh = document.getElementById('lastTh');
	
	var ul = document.getElementById('columnCheckbox');
	
	for (var i=0;i<tableDefs.columns.length;i++){
		var column = tableDefs.columns[i];
		
		var th = document.createElement('th');
		th.dataMapping = column;
		
		var li = document.createElement("li");
		li.style.cursor = "pointer";
		li.title = "Drag and drop to reorder columns";
		
		var checkbox = document.createElement('input');
		checkbox.type = "checkbox";
		checkbox.checked = tableDefs.visibility[i];

		var textNode;
		
		if(column == "tipoProcesso"){
			th.innerHTML = fmtResources.tipoProcesso;
			th.className = "sortable";
			th.onclick = function() {
				sortColumn(this, 'tipoProcesso');
			}
			
			checkbox.onclick = function(){toggleColumn(this)};
			textNode = document.createTextNode(fmtResources.tipoProcesso);
		}
		else if(column == "dataInicial"){
			th.innerHTML = fmtResources.dataInicial;
			th.className = "sortable";
			th.onclick = function() {
				sortColumn(this, 'dataCriacao');
			}
			
			checkbox.onclick = function(){toggleColumn(this)};
			textNode = document.createTextNode(fmtResources.dataInicial);
		}
		else if(column == "entidade"){			
			th.innerHTML = fmtResources.entidade;
			
			checkbox.onclick = function(){toggleColumn(this)};
			textNode = document.createTextNode(fmtResources.entidade);
		}
		else if(column == "assunto"){			
			th.innerHTML = fmtResources.assuntoDes;
			
			checkbox.onclick = function(){toggleColumn(this)};
			textNode = document.createTextNode(fmtResources.assuntoDes);
		}
		else if(column == "etapa"){
			th.innerHTML = fmtResources.etapaDes;
			th.className = "sortable";
			th.onclick = function() {
				sortColumn(this, 'etapa');
			}
			
			checkbox.onclick = function(){toggleColumn(this)};
			textNode = document.createTextNode(fmtResources.etapaDes);
		}
		else if(column == "enviadoPor"){			
			th.innerHTML = fmtResources.enviadoPorDes;
			
			checkbox.onclick = function(){toggleColumn(this)};
			textNode = document.createTextNode(fmtResources.enviadoPorDes);
		}
		else if(column == "origemProcesso"){			
			th.innerHTML = fmtResources.origemProcesso;
			
			checkbox.onclick = function(){toggleColumn(this)};
			textNode = document.createTextNode(fmtResources.origemProcesso);
		}
		else if(column == "assignado"){			
			th.innerHTML = fmtResources.assignadoDes;
			
			checkbox.onclick = function(){toggleColumn(this)};
			textNode = document.createTextNode(fmtResources.assignadoDes);
		}
		
		tr.insertBefore(th, lastTh);
		
		if(!tableDefs.visibility[i]){
			$(th).toggle();
		}
		
		li.appendChild(checkbox);
		li.appendChild(textNode);
		
		ul.appendChild(li);
	}
}

//chamada ajax para o carregamento da lista de processos
function loadListprocess(url,div){
	$.ajax({
		type: 'GET',
	    url: url,
	    dataType: 'html',
	    beforeSend: function() {
	    	$("#tableDiv").parent().parent().parent().mask(fmtResources.loadingMsg);
		},
		complete: function() {
			$("#tableDiv").parent().parent().parent().unmask();
		},
	    error: function(transport) {
	    	console.log('Server side Error : ' + transport.status);
	    },
	    success: function(data) {
	      	$("#" + div).html(data);
	    }
	});
}

//paginação
function paginationAjax(url,ajaxDest){	
	$.ajax({
		type: 'POST',
	    url: url,
	    dataType: 'html',
	    beforeSend: function() {
	    	$("#tableDiv").parent().parent().parent().mask(fmtResources.loadingMsg);
		},
		complete: function() {
			$("#tableDiv").parent().parent().parent().unmask();
		},
	    error: function(transport) {
	    	console.log('Server side Error : ' + transport.status);
	    },
	    success: function(data) {
	      	$("#" + ajaxDest).html(data);
	    }
	});
}

function buildPaginationElement(fullListSize,objectsPerPage,pageNumber,url,domElem,ajaxDest){
	var nPages = Math.floor(fullListSize/objectsPerPage) + 1;
	var previousPage = pageNumber - 1;
	var nextPage = pageNumber + 1;
	
	if(nPages > 1 && pageNumber > 1){		
		var hrefFirst = "<a href='#' onclick='javascript:paginationAjax(&quot;" + url + 1 + "&quot;,&quot;" + ajaxDest + "&quot;);'>&lt;&lt;</a>";
		$(domElem).append(hrefFirst);
		
		var hrefPrevious = "<a href='#' onclick='javascript:paginationAjax(&quot;" + url + previousPage + "&quot;,&quot;" + ajaxDest + "&quot;);'>&lt;</a>";
		$(domElem).append(hrefPrevious);				
	}
	else{
		$(domElem).append("&lt;&lt; &nbsp;");
		$(domElem).append("&lt; &nbsp;");
	}	
	
	for (var i=1; i <= nPages; i++){
		if(i != pageNumber){			
			var hrefPage = "<u><a href='#' onclick='javascript:paginationAjax(&quot;" + url + i + "&quot;,&quot;" + ajaxDest + "&quot;);'>" + i + "</a></u>";
			$(domElem).append(hrefPage);
		}
		else{
			$(domElem).append("<b>" + i + "</b> &nbsp;");
		}
	}
	
	if(nPages > 1 && pageNumber != nPages){		
		var hrefNext = "<a href='#' onclick='javascript:paginationAjax(&quot;" + url + nextPage + "&quot;,&quot;" + ajaxDest + "&quot;);'>&gt;</a>";
		$(domElem).append(hrefNext);
		
		var hrefLast = "<a href='#' onclick='javascript:paginationAjax(&quot;" + url + nPages + "&quot;,&quot;" + ajaxDest + "&quot;);'>&gt;&gt;</a>";
		$(domElem).append(hrefLast);
	}
	else{
		$(domElem).append("&gt; &nbsp;");
		$(domElem).append("&gt;&gt;");
	}
}

//ordenação das colunas
function sortColumn(element, sort){
	if(element.order == undefined){
		element.order = "asc";
	}
	
	var div = "myprocesses";
	var url = javaVariables.contextPath + "/newlayout/listProcesses.do2?sort=" + sort + "&dir=" + element.order;
	loadListprocess(url,div);
	
	var sortableColumns = $('.sortable-asc, .sortable-desc');
	sortableColumns.removeClass();
	sortableColumns.addClass('sortable');

	if(element.order == "asc"){
		element.className = "sortable-asc";
		element.order = "desc";
	}
	else if(element.order == "desc"){
		element.className = "sortable-desc";
		element.order = "asc";
	}
}

//costumização das defenições da tabela
function toggleColumn(element){		
	var index = $(element).parent().index() + 5;		
	var column = $("#Table tr > :nth-child(" + index + ")");
	column.toggle();
	
	tableDefsCookie();
};

jQuery.moveColumn = function (table, from, to) {
    var rows = jQuery('tr', table);
    var cols;
    rows.each(function() {
        cols = jQuery(this).children('th, td');
        if(from > to){
        	cols.eq(from).detach().insertBefore(cols.eq(to));
        }
        else if(from < to){
        	cols.eq(from).detach().insertAfter(cols.eq(to));
        }
    });
    
    tableDefsCookie();
}


//selecção de todas as checkboxes
function toogleCheck(cbx){
	var tbody = $('#tbody');
	var inputs = tbody.find('input');
	
	for (var i=0;i<inputs.length;i++){
		if(inputs[i].type=="checkbox"){
			inputs[i].checked = cbx.checked;
		}
	}
}

//websocket		
var websocket = $.atmosphere;

var websocketRequest = {
	url: javaVariables.contextPath + "/websockets/message",
    contentType: "application/json",
    transport: 'websocket',
    headers: {"user": javaVariables.user}
};

websocket.onMessage = function (response) {
    var message = response.responseBody;
    var json = JSON.parse(message);
    
    loadWebsocketProcess(json);
    $("#newProcessNotification").slideUp(500, onMessageCallback);
}

websocket.subscribe(websocketRequest);

function loadWebsocketProcess(json){
	var table=document.getElementById("tbody");		
	var row=table.insertRow(0);
	//TODO encontrar equivalente ao notification.id no save process listener
	row.id= "${notification.id}";
	row.className = "no_read";
	
	var cell0=row.insertCell(0);
	cell0.align="center";
	cell0.innerHTML="<input name='' type='checkbox' value=''>";

	var priorityText = json.priority;
	var priorityImgUrl;
	var priorityFmt;
	if(priorityText == 'processo.priority.high'){
		priorityImgUrl = javaVariables.imgDir + "/icones/Ico_priorvermelho.png";
		priorityFmt = fmtResources.priorityHigh;
	}
	else if(priorityText == 'processo.priority.medium'){
		priorityImgUrl = javaVariables.imgDir + "/icones/Ico_prioramarelo.png";
		priorityFmt = fmtResources.priorityMedium;
	}
	else if(priorityText == 'processo.priority.low'){
		priorityImgUrl = javaVariables.imgDir + "/icones/Ico_priorverde.png";
		priorityFmt = fmtResources.priorityLow;
	}
	
	var cell1=row.insertCell(1);
	cell1.align="center";
	cell1.innerHTML= "<img src='" + priorityImgUrl + "' title='" + fmtResources.prioridade + ": " + priorityFmt + "' width='12' height='12' border='0' />";
	
	var notificationStatus;
	var notificationStatusImgUrl;
	if(json.status == 'prazoUltrapassado'){
		notificationStatus = fmtResources.prazoUltrapassado;
		notificationStatusImgUrl = javaVariables.imgDir + "/icones/Ico_estadovermelho.png";
	}
	else if(json.status == 'prazoAproximacao'){
		notificationStatus = fmtResources.prazoAproximacao;
		notificationStatusImgUrl = javaVariables.imgDir + "/icones/Ico_estadoamarelo.png";
	}
	else if(json.status == 'prazoDentro'){
		notificationStatus = fmtResources.prazoDentro;
		notificationStatusImgUrl = javaVariables.imgDir + "/icones/Ico_estadoverde.png";
	}

	var cell2=row.insertCell(2);
	cell2.align="center";
	cell2.innerHTML="<img src='" + notificationStatusImgUrl + "' title='" + fmtResources.estado + ": " + notificationStatus + "' width='12' height='12' border='0' />";

	var cell3=row.insertCell(3);
	cell3.innerHTML="<a href='#' onclick='openNotification(-1,&quot;" + json.idProcessoEntidade + "&quot;)'>" + json.idProcessoEntidade + "</a>";
	
	for (var i=0;i<tableDefs.columns.length;i++){
		var cell = row.insertCell(i + 4);
		var dataMapping = tableDefs.columns[i];

		if(!tableDefs.visibility[i]){
			$(cell).toggle();
		}
		
		if(dataMapping == "tipoProcesso"){
			cell.innerHTML = json.tipoProcesso;
		}
		else if(dataMapping == "dataInicial"){
			cell.innerHTML=json.dataInicial;
		}
		else if(dataMapping == "entidade"){
			cell.innerHTML=json.soEntidadeNome;
		}
		else if(dataMapping == "assunto"){
			cell.innerHTML=json.assunto;
		}
		else if(dataMapping == "etapa"){
			cell.innerHTML=json.etapaNome;
		}
		else if(dataMapping == "enviadoPor"){
			cell.innerHTML=json.enviadoPor;
		}
		else if(dataMapping == "origemProcesso"){
			cell.innerHTML="<span title='" + json.origemProcessoDesignacao + "'>" + json.origemProcessoSigla + "</span>";
		}
		else if(dataMapping == "assignado"){
			cell.innerHTML=json.assignado;
		}
	}
	
	var cell12=row.insertCell(12);
	
	table.deleteRow(table.rows.length-1);
}

function onMessageCallback() {
	setTimeout(function() {
  		$( "#newProcessNotification" ).hide().fadeIn();
	}, 1000 );
};

//Pesquisa de processos
function toggleProcessForm(divId, imgId) {
    if(document.getElementById(divId).style.display == 'none'){
        document.getElementById(divId).style.display = 'block';
        document.getElementById(imgId).src = javaVariables.imgDir + '/setaClose.png';
    }
    else{
        document.getElementById(divId).style.display = 'none';
        document.getElementById(imgId).src = javaVariables.imgDir + '/setaOpen.png';
    }
}

//TODO: esta acção não está correcta. Tem que se usar a mesma acção das notificações mas com parâmetros de filtro
//A renderização da lista também tem que ser refeita
function searchProcess(){
	var p = $("#nav").serialize();
	
	$.ajax({
		type: 'POST',
	    url: '${pageContext.request.contextPath}/newlayout/searchProcess.do2?' + p,
	    dataType: 'html',
	    beforeSend: function() {
	    	$("#tableDiv").parent().parent().parent().mask(fmtResources.loadingMsg);
		},
		complete: function() {
			$("#tableDiv").parent().parent().parent().unmask();
		},
	    error: function(transport) {
	    	console.log('Server side Error : ' + transport.status);
	    },
	    success: function(data) {
	      	$("#myprocesses").html(data);
	      	$("#HiddenDiv_1").hide();
	    }
	});		
};