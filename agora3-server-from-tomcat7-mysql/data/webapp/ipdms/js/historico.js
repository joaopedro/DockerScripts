/*************************************************
* Este ficheiro contém funções Javascript usadas
* nos vários ecras onde são visualizados o historico
* de processo, nomeadamente etapas e subprocessos
*************************************************/


var colorBase = new Array("#ABC", "#BCC", "#CCC", "#AAA");

/*
 * Esta função carrega ou esconde o histórico de etapas
 * de um subprocesso
 */
function historicoEtapas(etapa, nivel, elementoTabela)
{
	var fold = 'images/icon/icon-mais.png';
	var open = 'images/icon/icon-menos.png';
	 
	var tabela = $('worklist');
	if(elementoTabela !=null){
		tabela = elementoTabela;
	}
	var img = $('imgPadrao_' + etapa);
	var trbegin = $('trPadraobegin_' + etapa);
	var trend = $('trendPadrao_' + etapa);
	
	if(trbegin.rowIndex < (trend.rowIndex - 1)) {
		var numberOfRows = (trend.rowIndex - 1) - trbegin.rowIndex;
		while(numberOfRows > 0) {
			tabela.deleteRow(trbegin.rowIndex + 1);
			numberOfRows = numberOfRows - 1;
		}
	}

	var	abrir = (img.src.indexOf(fold) != -1);

	// alterar icone da imagem
	img.src = abrir ? open : fold;
	
	// carregar os dados
	if (abrir) {		
		var params = "numeroConteudo=" + etapa;
		var request = new Ajax.Request( 'listEtapasSubProcessos.do2',
										{ method: 'get', 
										  parameters: params, 
										  onComplete: function(originalRequest) {
										  	receive(originalRequest, tabela, trbegin.rowIndex, trend.rowIndex, nivel);
										  }
										 });
	}		
	
}
/*
 *Isto foi criado para a tarefa MostrarEtapas, de forma a que se possa ter os niveis com subprocesos como acontece com a funcao historicoEtapas 
 * @param etapa
 * @param nivel
 */

function historicoEtapasWithSimpleAttributes(etapa, nivel, elementoTabela, currentnid, untilNivel)
{
	var fold = 'images/icon/icon-mais.png';
	var open = 'images/icon/icon-menos.png';
	 
	var tabela = $('worklist');
	if(elementoTabela !=null){
		tabela = elementoTabela;
	}
	var img = $('imgPadrao_' + etapa);
	var trbegin = $('trPadraobegin_' + etapa);
	var trend = $('trendPadrao_' + etapa);
	
	if(trbegin.rowIndex < (trend.rowIndex - 1)) {
		var numberOfRows = (trend.rowIndex - 1) - trbegin.rowIndex;
		while(numberOfRows > 0) {
			tabela.deleteRow(trbegin.rowIndex + 1);
			numberOfRows = numberOfRows - 1;
		}
	}

	var	abrir = (img.src.indexOf(fold) != -1);

	// alterar icone da imagem
	img.src = abrir ? open : fold;
	
	// carregar os dados
	if (abrir) {		
		var params = "numeroConteudo=" + etapa;
		var request = new Ajax.Request( 'listEtapasSubProcessos.do2',
										{ method: 'get', 
										  parameters: params, 
										  onComplete: function(originalRequest) {
										  	receiveWithSimpleAttributes(originalRequest, tabela, trbegin.rowIndex, trend.rowIndex, nivel, currentnid, untilNivel);
										  }
										 });
	}		
	
}



/*
 * Esta funcao carrega ou esconde o historico de etapas
 * de um subprocesso
 */
function historicoEtapasSimple(etapa, nivel)
{
	historicoEtapasSimple(etapa, nivel, null);
}
function historicoEtapasSimple(etapa, nivel, elementoTabela, currentnid)
{
	var fold = 'images/icon/icon-mais.png';
	var open = 'images/icon/icon-menos.png';
	var tabela = $('worklist'); 
	if(elementoTabela!=null){
		tabela = elementoTabela;
	}
	
	var img = $('img_' + etapa);
	var trbegin = $('trbegin_' + etapa);
	var trend = $('trend_' + etapa);
	
	if(trbegin.rowIndex < (trend.rowIndex - 1)) {
		var numberOfRows = (trend.rowIndex - 1) - trbegin.rowIndex;
		while(numberOfRows > 0) {
			tabela.deleteRow(trbegin.rowIndex + 1);
			numberOfRows = numberOfRows - 1;
		}
	}
	
	var	abrir = (img.src.indexOf(fold) != -1);
	
	// alterar icone da imagem
	img.src = abrir ? open : fold;
	
	// carregar os dados
	if(abrir) {
		var params = "numeroConteudo=" + etapa + "&historicoSimple=true";
		var request = new Ajax.Request( 'listEtapasSubProcessos.do2',
										{ method: 'get', 
										  parameters: params, 
										  onComplete: function(originalRequest) {
											  receiveSimple(originalRequest, tabela, trbegin.rowIndex, trend.rowIndex, nivel, currentnid);
										  }
										 });		
		
	}

	//toggle div
	//toggleInfo(div, abrir);	
	
}

/*
 * toggle method
 */
function toggleInfo(div, show) 
{
	if(show == true){
		$(div).show();
	}
	else {
		$(div).hide();
	}
			
}

function receive(originalRequest, table, beginIndex, endIndex, nivel) {
	var responseXML = originalRequest.responseXML;
	
	// verificar se isto ï¿½ mesmo necessï¿½rio (IE hacking)
	if (responseXML.documentElement == null){
		originalRequest.responseXML.loadXML(originalRequest.responseText);
	}
	
	var inicio = beginIndex + 1;
	
	var root = responseXML.documentElement;
	var childs = root.childNodes;
	for (var i = 0; i < childs.length; i++){
		var node = childs[i];
		if (node.nodeType == 1) { //ï¿½ um elemento historyEntry
			
			var newTr = table.insertRow(inicio);
			if(node.getAttribute("isEtapa") == 'true') {
				createRowEtapa(node, nivel, newTr);
			} else { //SubProcess
				createRowSubProcesso(node, nivel, newTr);
				inicio = inicio + 1;
				var newTrEnd = table.insertRow(inicio);
				createTBodySubProcesso(node, newTrEnd);
			}
			inicio = inicio + 1;
		}
	}
	
	Behaviour.apply();
}

/*
 * Isto foi criado para a tarefa MostrarEtapas 
 * info necessaria aqui
 * //activeDays, responder, result, motivo, comentario, atributosEtapa, documentos
 */
function receiveWithSimpleAttributes(originalRequest, table, beginIndex, endIndex, nivel, currentnid, untilNivel) {
	var responseXML = originalRequest.responseXML;
	
	// verificar se isto ï¿½ mesmo necessï¿½rio (IE hacking)
	if (responseXML.documentElement == null){
		originalRequest.responseXML.loadXML(originalRequest.responseText);
	}
	
	var inicio = beginIndex + 1;
	
	var root = responseXML.documentElement;
	var childs = root.childNodes;
	for (var i = 0; i < childs.length; i++){
		var node = childs[i];
		if (node.nodeType == 1) { //ï¿½ um elemento historyEntry
			
			var newTr = table.insertRow(inicio);
			if(node.getAttribute("isEtapa") == 'true') {
				createRowEtapaSimple(node, nivel, newTr, currentnid);
			} else { //SubProcesso
				if (nivel<=untilNivel){
				createRowSubProcessoAsSingle(node, nivel, newTr, currentnid);
				inicio = inicio + 1;
				var newTrEnd = table.insertRow(inicio);
				createTBodySubProcessoAsSingle(node, newTrEnd, currentnid);
				}
			}
			inicio = inicio + 1;
		}
	}
	
	Behaviour.apply();
}


/**
 * @param originalRequest
 * @param table
 * @param beginIndex
 * @param endIndex
 * @param nivel
 */
function receiveSimple(originalRequest, table, beginIndex, endIndex, nivel, currentnid) {
	var responseXML = originalRequest.responseXML;
	
	// verificar se isto ï¿½ mesmo necessï¿½rio (IE hacking)
	if (responseXML.documentElement == null){
		originalRequest.responseXML.loadXML(originalRequest.responseText);
	}
	
	var inicio = beginIndex + 1;
	
	var root = responseXML.documentElement;
	var childs = root.childNodes;
	for (var i = 0; i < childs.length; i++){
		var node = childs[i];
		if (node.nodeType == 1) { //um elemento historyEntry
			
			var newTr = table.insertRow(inicio);
			if(node.getAttribute("isEtapa") == 'true') {
				createRowEtapaSimple(node, nivel, newTr, currentnid);
			} else { //SubProcesso
				createRowSubProcesso(node, nivel, newTr);
				inicio = inicio + 1;
				var newTrEnd = table.insertRow(inicio);
				createTBodySubProcesso(node, newTrEnd);
			}
			inicio = inicio + 1;
		}
	}
	
	Behaviour.apply();
}
//activeDays, responder, result, motivo, comentario, atributosEtapa, documentos
function createRowEtapa(node, nivel, newTr, currentnid) {
	newTr.style.backgroundColor = getColor(nivel);
	newTr.appendChild(createSpecialTDWithSpan(node.getAttribute("spanText")));
	newTr.appendChild(createHtmlElement(node.getAttribute("titulo"), "td")); 
	newTr.appendChild(createHtmlElement(node.getAttribute("tipomovimento"), "td"));
	newTr.appendChild(createHtmlElement(node.getAttribute("beginDate"), "td"));
	newTr.appendChild(createHtmlElement(node.getAttribute("endDate"), "td"));
	newTr.appendChild(createHtmlElement(node.getAttribute("responder"), "td"));
	newTr.appendChild(createHtmlElement(node.getAttribute("colaborador"), "td"));
	newTr.appendChild(createSpecialTDAssignedUser(node.getAttribute("assignedUser"), node.getAttribute("nid")));
	newTr.appendChild(createHtmlElement(node.getAttribute("result"), "td"));
	newTr.appendChild(createHtmlElement(node.getAttribute("comentario"), "td"));
	
	var tdPdf = createHtmlElement('','TD');
	var link = document.createElement ('A');
	link.setAttribute('href', node.getAttribute("pdfAction"));
	
	var pdfImage = document.createElement ('IMG');
	pdfImage.setAttribute('src', node.getAttribute("pdfImage"));
	
	link.appendChild(pdfImage);
	tdPdf.appendChild(link);
	
	newTr.appendChild(tdPdf, "td");
}


function getNidFrom(text) {
	if (text != null) {
		var arr = text.split(',');
		for ( var i = 0; i < arr.length; i++) {
			if (arr[i] != null) {
				var nv = arr[i].split('=');
				if (nv.length == 2) {
					if (nv[0] != null && nv[0] == 'nid') {
						return nv[1];
					}
				}
			}

		}
		return  null;

	} else {
		return null;
	}
}


function createRowEtapaSimple(node, nivel, newTr, currentnid) {
	newTr.style.backgroundColor = getColor(nivel);
		
	newTr.appendChild(createSpecialTDWithSpan(node.getAttribute("spanText")));
	
	var titulo = node.getAttribute("titulo");
	var titleNode = createHtmlElement(titulo, "td");
	if (currentnid!=null) {
		var spannid = getNidFrom(node.getAttribute("spanText"));
		if (spannid!=null && spannid==currentnid) {
			titulo = "* " + titulo;
			bold = createHtmlElement(titulo, "b");
			titleNode = createHtmlElementWithchildnode(bold, "td");
		}
	}
	newTr.appendChild(titleNode);
	newTr.appendChild(createHtmlElement(node.getAttribute("activeDays"), "td"));
	newTr.appendChild(createHtmlElement(node.getAttribute("responder"), "td"));
	newTr.appendChild(createHtmlElement(node.getAttribute("result"), "td"));
	newTr.appendChild(createHtmlElement(node.getAttribute("motivo"), "td"));
	
	//
	var comentarios = node.getAttribute("comentario");
    if(comentarios != ""){
    	newTr.appendChild(createHtmlElementList(comentarios.split(";"), "td"));		
    	   
    } else {
    	 // append empty child if "comentario" was empty
        newTr.appendChild(createHtmlElement(node.getAttribute("comentario"), "td"));
    }
    	
	//
	var atributos = node.getAttribute("atributosEtapa");
	if(atributos != ""){
		newTr.appendChild(createHtmlElementList(atributos.split(";"), "td"));		 
	} else {
		// append empty child if "atributosEtapa" was empty
		newTr.appendChild(createHtmlElement(node.getAttribute("atributosEtapa"), "td"));
	}

	//
	var documentos = node.getAttribute("documentos");
	if(documentos != ""){
		newTr.appendChild(createHtmlDocumentoList(documentos.split(";"), "td"));		 
	} else { // append empty child
		newTr.appendChild(createHtmlElement("", "td"));
	}

	
}

function getPaddingForNivel(nivel) {
	var padding='';
	for (var i=1; i < nivel*10; i++) {
		padding = padding+ '&nbsp;';
	}
	return padding;
}


function createRowSubProcessoAsSingle(node, nivel, newTr) {
	newTr.style.backgroundColor = getColor(nivel);
	newTr.setAttribute("id", "trPadraobegin_" + node.getAttribute("numeroConteudo"));  //Alterado de trbegin para trPadraoBegin
		
	var td1 = document.createElement("td");
	td1.setAttribute("align", "center");
	
	var td1a = document.createElement("a");
	td1a.setAttribute("href", "javascript:historicoEtapasWithSimpleAttributes(" + node.getAttribute("numeroConteudo") + "," + (nivel + 1) + ");");
	td1a.setAttribute("title", "Consultar Historico");
	var td1img = document.createElement("img");
	td1.innerHTML = td1.innerHTML + getPaddingForNivel(nivel);
	
	td1img.setAttribute("src", "images/icon/icon-mais.png");
	td1img.setAttribute("id", "imgPadrao_" + node.getAttribute("numeroConteudo")); //alterado para imgPadrao
	
	td1a.appendChild(td1img);
	td1.appendChild(td1a);

	var td2 = document.createElement("td");
	td2.setAttribute("colSpan", "9");
	var bold = document.createElement("b");
	var text1 = document.createTextNode(node.getAttribute("nomeProcesso"));
	bold.appendChild(text1);
	var text2 = document.createTextNode(" (" + node.getAttribute("entryDate") + ")");
	td2.appendChild(bold);
	td2.appendChild(text2);

	newTr.appendChild(td1);
	newTr.appendChild(td2);
}

function createTBodySubProcessoAsSingle(node, newTrEnd) {
	newTrEnd.setAttribute("id", "trendPadrao_" + node.getAttribute("numeroConteudo")); //alterado de trend para trendPadrao
	newTrEnd.setAttribute("style", "display: none");
	newTrEnd.style.display = "none";
}


function createRowSubProcesso(node, nivel, newTr) {
	newTr.style.backgroundColor = getColor(nivel);
	newTr.setAttribute("id", "trPadraobegin_" + node.getAttribute("numeroConteudo"));  //Alterado de trbegin para trPadraoBegin
		
	var td1 = document.createElement("td");
	td1.setAttribute("align", "center");
	td1.innerHTML = td1.innerHTML + getPaddingForNivel(nivel);
	var td1a = document.createElement("a");
	td1a.setAttribute("href", "javascript:historicoEtapas(" + node.getAttribute("numeroConteudo") + "," + (nivel + 1) + ");");
	td1a.setAttribute("title", "Consultar Historico");
	
	var td1img = document.createElement("img");
	td1img.setAttribute("src", "images/icon/icon-mais.png");
	td1img.setAttribute("id", "imgPadrao_" + node.getAttribute("numeroConteudo")); //alterado para imgPadrao
	
	td1a.appendChild(td1img);
	td1.appendChild(td1a);

	var td2 = document.createElement("td");
	td2.setAttribute("colSpan", "9");
	var bold = document.createElement("b");
	var text1 = document.createTextNode(node.getAttribute("nomeProcesso"));
	bold.appendChild(text1);
	var text2 = document.createTextNode(" (" + node.getAttribute("entryDate") + ")");
	td2.appendChild(bold);
	td2.appendChild(text2);

	newTr.appendChild(td1);
	newTr.appendChild(td2);
}

function createTBodySubProcesso(node, newTrEnd) {
	newTrEnd.setAttribute("id", "trendPadrao_" + node.getAttribute("numeroConteudo")); //alterado de trend para trendPadrao
	newTrEnd.setAttribute("style", "display: none");
	newTrEnd.style.display = "none";
}

/**
 * Added current nid
 * @param text
 * @param currentNid
 * @returns
 */
function createSpecialTDWithSpan(text) {
	var newTd = document.createElement("td");
	var span = document.createElement("span");
	span.appendChild(document.createTextNode(text));	
	span.setAttribute("id", "notificationSpan");
	span.setAttribute("style", "display: none");
	span.style.display = "none";
	newTd.appendChild(span);
	return newTd;
}

function createSpecialTDAssignedUser(assignedUser, nid) {

	var newTd = document.createElement("td");
	newTd.setAttribute("id", "assignedUser");
	var textNode = document.createTextNode(assignedUser);
	var blankSpace = document.createTextNode(" ");	
	//so mostrar imagem pra clickar se existir assignuser e o nid n for null ou vazio
	if(assignedUser != null && assignedUser != '' && nid!=null && nid!='') {
		var newImg = document.createElement("img");
        newImg.setAttribute("src", " images/icon/icon-mais.png");
		newImg.setAttribute("align", "top");
		newImg.setAttribute("title", "Listar utilizadores do grupo");
		newImg.setAttribute("action", "workflowusers.do2?role=" + assignedUser +"&nid="+nid);
		newImg.setAttribute("id", nid);
		newImg.setAttribute("onClick", "showAssignedUser(this);");
		
		var span = document.createElement("span");
		span.setAttribute("id", "users_" + nid);
		span.setAttribute("class", "ipdms_reportData");
		newTd.appendChild(blankSpace);
		newTd.appendChild(newImg);
		newTd.appendChild(textNode);
		newTd.appendChild(span);
	}	
	return newTd;
}

function createHtmlElement(text, htmlElement) {
	var newHtmlElement = document.createElement(htmlElement);
	var textNode = document.createTextNode(text);
	newHtmlElement.appendChild(textNode);
	return newHtmlElement;
}

function createHtmlElementWithchildnode(childnode, htmlelement) {
	var newHtmlElement = document.createElement(htmlelement);
	newHtmlElement.appendChild(childnode);
	return newHtmlElement;
}

/**/*************************************************
* Este ficheiro contï¿½m funï¿½ï¿½es Javascript usadas
* nos vï¿½rios ecrï¿½s onde sï¿½o visualizados o historico
* de processo, nomeadamente etapas e subprocessos
*************************************************/


var colorBase = new Array("#ABC", "#BCC", "#CCC", "#AAA");

/*
 * Esta funï¿½ï¿½o carrega ou esconde o histï¿½rico de etapas
 * de um subprocesso
 */
function historicoEtapas(etapa, nivel, elementoTabela)
{
	var fold = 'images/icon/icon-mais.png';
	var open = 'images/icon/icon-menos.png';
	
	var tabela = $('worklist');
	if(elementoTabela !=null){
		tabela = elementoTabela;
	}
	var img = $('imgPadrao_' + etapa);
	var trbegin = $('trPadraobegin_' + etapa);
	var trend = $('trendPadrao_' + etapa);
	sï¿½o
//	alert('Begin: ' + trbegin.rowIndex + ' End:' + trend.rowIndex);
	if(trbegin.rowIndex < (trend.rowIndex - 1)) {
		var numberOfRows = (trend.rowIndex - 1) - trbegin.rowIndex;
		while(numberOfRows > 0) {
			tabela.deleteRow(trbegin.rowIndex + 1);
			numberOfRows = numberOfRows - 1;
		}
	}

	var	abrir = (img.src.indexOf(fold) != -1);

	// alterar ï¿½cone da imagem
	img.src = abrir ? open : fold;
	
	// carregar os dados
	if (abrir) {		
		var params = "numeroConteudo=" + etapa;
		var request = new Ajax.Request( 'listEtapasSubProcessos.do2',
										{ method: 'get', 
										  parameters: params, 
										  onComplete: function(originalRequest) {
										  	receive(originalRequest, tabela, trbegin.rowIndex, trend.rowIndex, nivel);
										  }
										 });
	}		
	
}

/*
 * Esta funï¿½ï¿½o carrega ou esconde o histï¿½rico de etapas
 * de um subprocesso
 */
function historicoEtapasSimple(etapa, nivel)
{
	historicoEtapasSimple(etapa, nivel, null);
}
function historicoEtapasSimple(etapa, nivel, elementoTabela)
{
	var fold = 'images/icon/icon-mais.png';
	var open = 'images/icon/icon-menos.png';
	var tabela = $('worklist'); 
	if(elementoTabela!=null){
		tabela = elementoTabela;
	}
	
	var img = $('img_' + etapa);
	var trbegin = $('trbegin_' + etapa);
	var trend = $('trend_' + etapa);
	
	if(trbegin.rowIndex < (trend.rowIndex - 1)) {
		var numberOfRows = (trend.rowIndex - 1) - trbegin.rowIndex;
		while(numberOfRows > 0) {
			tabela.deleteRow(trbegin.rowIndex + 1);
			numberOfRows = numberOfRows - 1;
		}
	}
	
	
	var	abrir = (img.src.indexOf(fold) != -1);
	
	// alterar ï¿½cone da imagem
	img.src = abrir ? open : fold;
	
	// carregar os dados
	if(abrir) {
		var params = "numeroConteudo=" + etapa + "&historicoSimple=true";
		var request = new Ajax.Request( 'listEtapasSubProcessos.do2',
										{ method: 'get', 
										  parameters: params, 
										  onComplete: function(originalRequest) {
											  receiveSimple(originalRequest, tabela, trbegin.rowIndex, trend.rowIndex, nivel);
										  }
										 });		
		
	}

	//toggle div
	//toggleInfo(div, abrir);	
	
}

/*
 * toggle method
 */
function toggleInfo(div, show) 
{
	if(show == true){
		$(div).show();
	}
	else {
		$(div).hide();
	}
			
}

function receive(originalRequest, table, beginIndex, endIndex, nivel) {
	var responseXML = originalRequest.responseXML;
	
	// verificar se isto ï¿½ mesmo necessï¿½rio (IE hacking)
	if (responseXML.documentElement == null){
		originalRequest.responseXML.loadXML(originalRequest.responseText);
	}
	
	var inicio = beginIndex + 1;
	
	var root = responseXML.documentElement;
	var childs = root.childNodes;
	for (var i = 0; i < childs.length; i++){
		var node = childs[i];
		if (node.nodeType == 1) { //ï¿½ um elemento historyEntry
			
			var newTr = table.insertRow(inicio);
			if(node.getAttribute("isEtapa") == 'true') {
				createRowEtapa(node, nivel, newTr);
			} else { //SubProcesso
				createRowSubProcesso(node, nivel, newTr);
				inicio = inicio + 1;
				var newTrEnd = table.insertRow(inicio);
				createTBodySubProcesso(node, newTrEnd);
			}
			inicio = inicio + 1;
		}
	}
	
	Behaviour.apply();
}

/**
 * 
 * @param originalRequest
 * @param table
 * @param beginIndex
 * @param endIndex
 * @param nivel
 */
function receiveSimple(originalRequest, table, beginIndex, endIndex, nivel) {
	
	var responseXML = originalRequest.responseXML;
	
	// verificar se isto ï¿½ mesmo necessï¿½rio (IE hacking)
	if (responseXML.documentElement == null){
		originalRequest.responseXML.loadXML(originalRequest.responseText);
	}
	
	var inicio = beginIndex + 1;
	
	var root = responseXML.documentElement;
	var childs = root.childNodes;
	for (var i = 0; i < childs.length; i++){
		var node = childs[i];
		if (node.nodeType == 1) { //ï¿½ um elemento historyEntry
			
			var newTr = table.insertRow(inicio);
			if(node.getAttribute("isEtapa") == 'true') {
				createRowEtapaSimple(node, nivel, newTr);
			} else { //SubProcesso
				createRowSubProcesso(node, nivel, newTr);
				inicio = inicio + 1;
				var newTrEnd = table.insertRow(inicio);
				createTBodySubProcesso(node, newTrEnd);
			}
			inicio = inicio + 1;
		}
	}
	
	Behaviour.apply();
}

function createRowEtapa(node, nivel, newTr) {
	newTr.style.backgroundColor = getColor(nivel);
	newTr.appendChild(createSpecialTDWithSpan(node.getAttribute("spanText")));
	newTr.appendChild(createHtmlElement(node.getAttribute("titulo"), "td")); 
	newTr.appendChild(createHtmlElement(node.getAttribute("tipomovimento"), "td"));
	newTr.appendChild(createHtmlElement(node.getAttribute("beginDate"), "td"));
	newTr.appendChild(createHtmlElement(node.getAttribute("endDate"), "td"));
	newTr.appendChild(createHtmlElement(node.getAttribute("responder"), "td"));
	newTr.appendChild(createHtmlElement(node.getAttribute("colaborador"), "td"));
	newTr.appendChild(createSpecialTDAssignedUser(node.getAttribute("assignedUser"), node.getAttribute("nid")));
	newTr.appendChild(createHtmlElement(node.getAttribute("result"), "td"));
	newTr.appendChild(createHtmlElement(node.getAttribute("comentario"), "td"));
	
	var tdPdf = createHtmlElement('','TD');
	var link = document.createElement ('A');
	link.setAttribute('href', node.getAttribute("pdfAction"));
	
	var pdfImage = document.createElement ('IMG');
	pdfImage.setAttribute('src', node.getAttribute("pdfImage"));
	
	link.appendChild(pdfImage);
	tdPdf.appendChild(link);
	
	newTr.appendChild(tdPdf, "td");
}

/**
 * 
 * @param node
 * @param nivel
 * @param newTr
 */
function createRowEtapaSimple(node, nivel, newTr) {
	newTr.style.backgroundColor = getColor(nivel);
	newTr.appendChild(createSpecialTDWithSpan(node.getAttribute("spanText")));
	newTr.appendChild(createHtmlElement(node.getAttribute("titulo"), "td")); 
	newTr.appendChild(createHtmlElement(node.getAttribute("activeDays"), "td"));
	newTr.appendChild(createHtmlElement(node.getAttribute("responder"), "td"));
	newTr.appendChild(createHtmlElement(node.getAttribute("result"), "td"));
	newTr.appendChild(createHtmlElement(node.getAttribute("motivo"), "td"));
	
	//
	var comentarios = node.getAttribute("comentario");
    if(comentarios != ""){
    	newTr.appendChild(createHtmlElementList(comentarios.split(";"), "td"));		
    	   
    } else {
    	 // append empty child if "comentario" was empty
        newTr.appendChild(createHtmlElement(node.getAttribute("comentario"), "td"));
    }
    	
	//
	var atributos = node.getAttribute("atributosEtapa");
	if(atributos != ""){
		newTr.appendChild(createHtmlElementList(atributos.split(";"), "td"));		 
	} else {
		// append empty child if "atributosEtapa" was empty
		newTr.appendChild(createHtmlElement(node.getAttribute("atributosEtapa"), "td"));
	}

	//
	var documentos = node.getAttribute("documentos");
	if(documentos != ""){
		newTr.appendChild(createHtmlDocumentoList(documentos.split(";"), "td"));		 
	} else { // append empty child
		newTr.appendChild(createHtmlElement("", "td"));
	}

	
}

function createRowSubProcesso(node, nivel, newTr) {
	
	newTr.style.backgroundColor = getColor(nivel);
	newTr.setAttribute("id", "trbegin_" + node.getAttribute("numeroConteudo"));
		
	var td1 = document.createElement("td");
	td1.setAttribute("align", "center");
	
	var td1a = document.createElement("a");
	td1a.setAttribute("href", "javascript:historicoEtapas(" + node.getAttribute("numeroConteudo") + "," + (nivel + 1) + ");");
	td1a.setAttribute("title", "Consultar Histï¿½rico");
	
	var td1img = document.createElement("img");
	td1img.setAttribute("src", "images/icon/icon-mais.png");
	td1img.setAttribute("id", "img_" + node.getAttribute("numeroConteudo"));
	
	td1a.appendChild(td1img);
	td1.appendChild(td1a);

	var td2 = document.createElement("td");
	td2.setAttribute("colSpan", "9");
	var bold = document.createElement("<b>");
	var text1 = document.createTextNode(node.getAttribute("nomeProcesso"));
	bold.appendChild(text1);
	var text2 = document.createTextNode(" (" + node.getAttribute("entryDate") + ")");
	td2.appendChild(bold);
	td2.appendChild(text2);

	newTr.appendChild(td1);
	newTr.appendChild(td2);
}

function createTBodySubProcesso(node, newTrEnd) {
	newTrEnd.setAttribute("id", "trend_" + node.getAttribute("numeroConteudo"));
	newTrEnd.setAttribute("style", "display: none");
	newTrEnd.style.display = "none";
}

function createSpecialTDWithSpan(text) {
	var newTd = document.createElement("td");
	var span = document.createElement("span");
	span.appendChild(document.createTextNode(text));	
	span.setAttribute("id", "notificationSpan");
	span.setAttribute("style", "display: none");
	span.style.display = "none";
	newTd.appendChild(span);
	return newTd;
}

function createSpecialTDAssignedUser(assignedUser, nid) {

	var newTd = document.createElement("td");
	newTd.setAttribute("id", "assignedUser");
	var textNode = document.createTextNode(assignedUser);
	var blankSpace = document.createTextNode(" ");	
	//so mostrar imagem pra clickar se existir assignuser e o nid n for null ou vazio
	if(assignedUser != null && assignedUser != '' && nid!=null && nid!='') {
		var newImg = document.createElement("img");
        newImg.setAttribute("src", " images/icon/icon-mais.png");
		newImg.setAttribute("align", "top");
		newImg.setAttribute("title", "Listar utilizadores do grupo");
		newImg.setAttribute("action", "workflowusers.do2?role=" + assignedUser +"&nid="+nid);
		newImg.setAttribute("id", nid);
		newImg.setAttribute("onClick", "showAssignedUser(this);");
		
		var span = document.createElement("span");
		span.setAttribute("id", "users_" + nid);
		span.setAttribute("class", "ipdms_reportData");
		newTd.appendChild(blankSpace);
		newTd.appendChild(newImg);
		newTd.appendChild(textNode);
		newTd.appendChild(span);
	}	
	return newTd;
}

function createHtmlElement(text, htmlElement) {
	var newHtmlElement = document.createElement(htmlElement);
	var textNode = document.createTextNode(text);
	newHtmlElement.appendChild(textNode);
	return newHtmlElement;
}

/**
 * Create a new <td> element for a list of elements.
 * the html format is <b>label:</b> value<br>
 * 
 * @param elements
 * @param htmlElement
 * 
 * @returns
 */
function createHtmlElementList(elements, htmlElement) {
	
	//new <td> element
	var newTd = document.createElement(htmlElement);
	
	var len = elements.length;
	for ( var i = 0; i < len; i++)  {
		
		if(elements[i] != ""){
			//split the string elements in two
			//<b>label:</b> value<br>
			var parts = elements[i].split(":");
			
			// label textNode
			var label = document.createTextNode(parts[0] + ":");
			var bold = document.createElement("b");
			
			// value textNode
			var value = document.createTextNode(" " + parts[1]);			
			
			// <br> element for new line
			var br = document.createElement("br");
			
			//add elements to newTd
			bold.appendChild(label);
			newTd.appendChild(bold);
			newTd.appendChild(value);
			newTd.appendChild(br);
		}
	}
	return newTd;
}

function createHtmlDocumentoList(elements, htmlElement) {
	var newTd = document.createElement(htmlElement);
	var len = elements.length;
	for ( var i = 0; i < len; i++) {
		if (elements[i] != "") {
			//split the string elements into numeroconteudo,designacao,extensao
			var parts = elements[i].split(",");
			
			var docLink = document.createElement("a");
						
			docLink.setAttribute("href", "file/getDocumento.do2?nc="+parts[0]);
			docLink.setAttribute("target", "_blank");
			
			docLink.appendChild(document.createTextNode(parts[1] + " "));
			var ita = document.createElement("i");
			ita.appendChild(document.createTextNode("("+parts[2]+")"));
			docLink.appendChild(ita);
			newTd.appendChild(docLink);
			newTd.appendChild(document.createElement("br"));
		}
	}
	return newTd;
}

function getColor(nivel) {
	return colorBase[nivel - 1];
}


 * Create a new <td> element for a list of elements.
 * the html format is <b>label:</b> value<br>
 * 
 * @param elements
 * @param htmlElement
 * 
 * @returns
 */
function createHtmlElementList(elements, htmlElement) {
	
	//new <td> element
	var newTd = document.createElement(htmlElement);
	
	var len = elements.length;
	for ( var i = 0; i < len; i++)  {
		
		if(elements[i] != ""){
			//split the string elements in two
			//<b>label:</b> value<br>
			var parts = elements[i].split(":");
			
			// label textNode
			var label = document.createTextNode(parts[0] + ":");
			var bold = document.createElement("b");
			
			// value textNode
			var value = document.createTextNode(" " + parts[1]);			
			
			// <br> element for new line
			var br = document.createElement("br");
			
			//add elements to newTd
			bold.appendChild(label);
			newTd.appendChild(bold);
			newTd.appendChild(value);
			newTd.appendChild(br);
		}
	}
	return newTd;
}

function createHtmlDocumentoList(elements, htmlElement) {
	var newTd = document.createElement(htmlElement);
	var len = elements.length;
	for ( var i = 0; i < len; i++) {
		if (elements[i] != "") {
			//split the string elements into numeroconteudo,designacao,extensao
			var parts = elements[i].split(",");
			 
			var docLink = document.createElement("a");
						
			docLink.setAttribute("href", "file/getDocumento.do2?nc="+parts[0]);
			docLink.setAttribute("target", "_blank");
			
			docLink.appendChild(document.createTextNode(parts[1] + " "));
			var ita = document.createElement("i");
			ita.appendChild(document.createTextNode("("+parts[2]+")"));
			docLink.appendChild(ita);
			newTd.appendChild(docLink);
			newTd.appendChild(document.createElement("br"));
		}
	}
	return newTd;
}

function getColor(nivel) {
	return colorBase[nivel - 1];
}

