//LOCK/UNLOCK DOCUMENT DISPATCH ACTION
var LOCKACTION = "/lockDocumento.do2";
var LOCKMETHOD = "lock";
var UNLOCKMETHOD = "unlock";

var runningStr;
var errorTitleStr;
var errorMsgStr;
var errorMsgPt2Str;
var accessNotAllowedStr;
var alreadyLockStr;
var alreadyLockPt2Str;
var successTitleStr;
var successMsgStr;
var successMsgPt2Str;

/**
 * Function to lock a document
 * @param contextPath application root contextPath
 * @param documentId document id to be locked
 */
function lock(contextPath, documentId, lockMessages) {
	runningStr = lockMessages["running"];
	errorTitleStr = lockMessages["errorTitle"];
	errorMsgStr = lockMessages["errorMsg"];
	errorMsgPt2Str = lockMessages["errorMsgPt2"];
	accessNotAllowedStr = lockMessages["accessNotAllowed"];
	alreadyLockStr = lockMessages["alreadyLock"];
	alreadyLockPt2Str = lockMessages["alreadyLockPt2"];
	successTitleStr = lockMessages["successTitle"];
	successMsgStr = lockMessages["successMsg"];
	successMsgPt2Str = lockMessages["successMsgPt2"];
	
	doLockRequest(contextPath, documentId, LOCKACTION, LOCKMETHOD);
}

/**
 * Function to unlock a document by it's id
 * @param contextPath application root contextPath
 * @param documentId document id to be unlocked
 */
function unlock(contextPath, documentId, lockMessages) {
	runningStr = lockMessages["running"];
	errorTitleStr = lockMessages["errorTitle"];
	errorMsgStr = lockMessages["errorMsg"];
	errorMsgPt2Str = lockMessages["errorMsgPt2"];
	accessNotAllowedStr = lockMessages["accessNotAllowed"];
	alreadyLockStr = lockMessages["alreadyLock"];
	alreadyLockPt2Str = lockMessages["alreadyLockPt2"];
	successTitleStr = lockMessages["successTitle"];
	successMsgStr = lockMessages["successMsg"];
	successMsgPt2Str = lockMessages["successMsgPt2"];
	
	doLockRequest(contextPath, documentId, LOCKACTION, UNLOCKMETHOD);
}

function doLockRequest(contextPath, documentId, lockAction, lockMethod) {
	var myMask = new Ext.LoadMask(Ext.getBody(), {
		msg: runningStr
	});
	Ext.Ajax.on('beforerequest', myMask.show, myMask);
	Ext.Ajax.on('requestcomplete', myMask.hide, myMask);
	Ext.Ajax.on('requestexception', myMask.hide, myMask);

	Ext.Ajax.request( {
		url : contextPath + lockAction,
		params : {
			method : lockMethod,
			ncDocumento : documentId
		},
		method : 'GET',
		success : function(response) {
			processSuccess(documentId, lockMethod, response);
		},
		failure : function(response) {
			processFailure(documentId, lockMethod);
		}
	});
}

/**
 * Function that processes the result of the lock/unlock request
 * @param documentId
 * @param action
 * @param response
 */
function processSuccess(documentId, action, response) {
	var jsonData = Ext.util.JSON.decode(response.responseText);
	processResult(documentId, action, jsonData.error,
			jsonData.accessNotAllowed, jsonData.alreadyLocked);
}

/**
 * Function that processes the failure of the lock/unlock request
 * @param documentId
 * @param action
 */
function processFailure(documentId, action) {
	processResult(documentId, action, true);
}

function processResult(documentId, action, error, accessNotAllowed, alreadyLock) {
	if (error) { // Error
		var message = errorMsgStr + " " + action + " " + errorMsgPt2Str;
		if (accessNotAllowed) { // User has no permission
			message = accessNotAllowedStr + " " + action;
		} else if (alreadyLock) { // Already lock/unlock
			message = alreadyLockStr + " " + action	+ " " + alreadyLockPt2Str;
		}
		showErrorMessage(action, message);
	} else { // Ok
		if (action == LOCKMETHOD) {
			showUnlockButton(documentId);
		} else {
			showLockButton(documentId);
		}
		showInfoMessage(action);
	}
}

function showInfoMessage(lockAction) {
	Ext.Msg.show( {
		title : lockAction + " " + successTitleStr,
		msg : successMsgStr + " " + lockAction + " " + successMsgPt2Str,
		buttons : Ext.MessageBox.OK,
		icon : Ext.MessageBox.INFO
	});
}

function showErrorMessage(lockAction, message) {
	Ext.Msg.show( {
		title : errorTitleStr + " " + lockAction,
		msg : message,
		buttons : Ext.MessageBox.OK,
		icon : Ext.MessageBox.ERROR
	});
}

/**
 * Tries to show/hide components that should exist in the parent page
 * <docId>_lock - lock button
 * <docId>_unlock - unlock button
 * This action will be called in the successfully unlock action 
 */
function showLockButton(docId) {
	$(docId + '_unlock').hide();
	$(docId + '_lock').show();
}

/**
 * Tries to show/hide components that should exist in the parent page
 * <docId>_lock - lock button
 * <docId>_unlock - unlock button
 * This action will be called in the successfully lock action 
 */
function showUnlockButton(docId) {
	$(docId + '_lock').hide();
	$(docId + '_unlock').show();
}
