function cal_AjaxRequest(url, queryString, method, destinationDiv, fmtMessages) {
	var errorsTitle=fmtMessages["errorsTitle"];
	var errorsMsg=fmtMessages["errorsMsg"];
	var loading=fmtMessages["loading"];
	
	var m = method;
	if(m == null) {
		m = 'POST';
	}
	//Prepare the mask during the ajax request
	cal_MaskDuringRequest(loading);
	
	Ext.Ajax.request({
		url: url,
		method: m,
		params: queryString,
		loadScripts: true,
		success: function(request) {
			cal_OnComplete(request, false, destinationDiv, errorsTitle, errorsMsg);
		},
		failure: function(request) {
			cal_OnComplete(request, true, destinationDiv, errorsTitle, errorsMsg);
		}
	});
}

function cal_MaskDuringRequest(loading) {
	Ext.Ajax.on('beforerequest', function(connection,options){
		Ext.getBody().mask('<img src="' + CONTEXT_PATH + '/ipdms/js/ext/resources/images/default/grid/loading.gif" /> ' + loading);
	});

	Ext.Ajax.on('requestcomplete', function(connection,options){
		Ext.getBody().unmask();
	});

	Ext.Ajax.on('requestexception', function(connection,options){
		Ext.getBody().unmask();
	});
}

function cal_OnComplete(request, failure, destinationDiv, errorsTitle, errorsMsg) {
	
	if(failure) {
		Ext.MessageBox.show({
            title: errorsTitle,
            msg: errorsMsg,
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
	//alert(responseText);
	if (responseText != null) {
		if($(destinationElement) != null) {
			/*
			 * A adição do &nbsp tem a ver com um comportamento estranho do IE9. Quando
			 * o response text apenas tem uma tag de <script></script>, o conteudo assignado
			 * ao innerHTML é descartado. Tem que ser adicionado um non breaking space para que
			 * o valor não seja descartado e seja avaliado no evalScripts()
			 */
			$(destinationElement).innerHTML = '&nbsp;' + responseText;
			$(destinationElement).innerHTML.evalScripts();
		} else {
			responseText.evalScripts();
		}
	}
}