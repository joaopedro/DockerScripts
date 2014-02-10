//LOCK/UNLOCK DOCUMENT DISPATCH ACTION
var CERTIFYACTION = "/certifyDocumentoByUser.do2";

/**
 * Function to certify a document
 * @param contextPath application root contextPath
 * @param documentId document id to be certified
 */
function certify(contextPath, documentId) {
	var myMask = new Ext.LoadMask(Ext.getBody(), {
		msg : 'Executar...'
	});
	Ext.Ajax.on('beforerequest', myMask.show, myMask);
	Ext.Ajax.on('requestcomplete', myMask.hide, myMask);
	Ext.Ajax.on('requestexception', myMask.hide, myMask);
	
	Ext.Ajax.request( {
		url : contextPath + CERTIFYACTION,
		params : {
			method: 'certify',
			ncDocumento : documentId
		},
		method : 'GET',
		success : function(response) {
			processSuccess(documentId, response);
		},
		failure : function(response) {
			processFailure(documentId);
		}
	});

}



/**
 * Function that processes the result of the lock/unlock request
 * @param documentId
 * @param action
 * @param response
 */
function processSuccess(documentId, response) {
	var jsonData = Ext.util.JSON.decode(response.responseText);
	processResult(documentId, jsonData.error, jsonData.accessNotAllowed, jsonData.nocertificatefound, jsonData.alreadyCertified);
}

/**
 * Function that processes the failure of the lock/unlock request
 * @param documentId
 * @param action
 */
function processFailure(documentId) {
	processResult(documentId, true);
}

function processResult(documentId, error, accessNotAllowed, nocertificatefound, alreadyCertified) {
	if (error) { // Error
		var message = "Ocorreu um erro ao efectuar a certifica��o ao documento";
		if (accessNotAllowed) { // User has no permission
			message = "O utilizador n�o tem permiss�es para efectuar a opera��o de certificacao";
		} else if (alreadyCertified) { // Already lock/unlock
			message = "Opera��o duplicada! A ac��o de certifica��o j� foi efectuado ao documento";
		}
		showErrorMessage(message);
	} else { 
		showInfoMessage();
		showHideButtons(documentId);
	}
}

function showInfoMessage() {
	Ext.Msg.show( {
		title : 'Documento certificado com sucesso',
		msg : 'Foi efectuado a certifica��o do documento com sucesso!',
		buttons : Ext.MessageBox.OK,
		icon : Ext.MessageBox.INFO
	});
}

function showErrorMessage(message) {
	Ext.Msg.show( {
		title : 'Erro na execu��o da certifica��o',
		msg : message,
		buttons : Ext.MessageBox.OK,
		icon : Ext.MessageBox.ERROR
	});
}


function showHideButtons(docId) {
	$(docId + '_certify').hide();
	$(docId + '_certified').show();
}
