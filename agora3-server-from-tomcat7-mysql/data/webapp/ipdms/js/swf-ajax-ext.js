/*
 * Javascript integration between spring webflow screens 
 * and EXT ajax requests
 */

function stopFormSubmit() {
	return false;
}

function webflowAjaxRequestEv(e, eventId) {
	var pressedButton = Event.element(e);
	var form = pressedButton.form;
	form.onsubmit = stopFormSubmit;
	
	//Disable all input images not to be sent to server
	$$('input[type="image"]','input[type="button"]','input[type="submit"]').invoke('disable');

	// Prepare parameters of request
	var url = form.action;
	var m = form.method;
	var p = Form.serialize(form);
	p += '&' + eventId + '=0' ;
	extAjaxRequest(url, p, m);

	Event.stop(e);
}


function webflowAjaxRequest(e) {

	var pressedButton = Event.element(e);
	var form = pressedButton.form;
	form.onsubmit = stopFormSubmit;
	
	//Disable all input images not to be sent to server
	$$('input[type="image"]','input[type="button"]','input[type="submit"]').invoke('disable');

	// Prepare parameters of request
	var url = form.action;

	var m = form.method;
	var p = Form.serialize(form);
	p += '&' + pressedButton.name + '=' + pressedButton.value;

	extAjaxRequest(url, p, m);

	Event.stop(e);
}

function extAjaxRequest(url, queryString, method, destinationDiv) {
	var m = method;
	if(m == null) {
		m = 'POST';
	}
	//Prepare the mask during the ajax request
	maskDuringRequest();
	
	Ext.Ajax.request({
		url: url,
		method: m,
		params: queryString,
		success: function(request) {
			onComplete(request, false, destinationDiv);
		},
		failure: function(request) {
			onComplete(request, true, destinationDiv);
		}
	});
}

function maskDuringRequest() {
	Ext.Ajax.on('beforerequest', function(connection,options){
		Ext.getBody().mask('<img src="ipdms/js/ext/resources/images/default/grid/loading.gif" /> A carregar...');
	});

	Ext.Ajax.on('requestcomplete', function(connection,options){
		Ext.getBody().unmask();
	});

	Ext.Ajax.on('requestexception', function(connection,options){
		Ext.getBody().unmask();
	});
}

function onComplete(request, failure, destinationDiv) {
	
	if(failure) {
		Ext.MessageBox.show({
            title: 'Ocorreu um erro',
            msg: 'Ocorreu um erro ao processar ao pedido',
            buttons: Ext.MessageBox.OK
       });
	   return;
	}

	var destinationElement = "ajaxlayout";
	if(destinationDiv) {
		destinationElement = destinationDiv;
	}
	
	//window.document.body.style.cursor = "auto";
	//$("ajaxlayout").style.display = 'block';
	var responseText = request.responseText;
	if (responseText != null) {
		/*
		 * A adi��o do &nbsp tem a ver com um comportamento estranho do IE9. Quando
		 * o response text apenas tem uma tag de <script></script>, o conteudo assignado
		 * ao innerHTML � descartado. Tem que ser adicionado um non breaking space para que
		 * o valor n�o seja descartado e seja avaliado no evalScripts()
		 */
		$(destinationElement).innerHTML = responseText;
		$(destinationElement).innerHTML.evalScripts();
	}
}