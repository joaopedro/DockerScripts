function callAjaxRequest(url, queryString, destinationDiv, fmtMessages){
	var errorsTitle=fmtMessages["errorsTitle"];
	var errorsMsg=fmtMessages["errorsMsg"];
	var loading=fmtMessages["loading"];
	
	jQuery.ajax({
		type: "POST",
		url: url,
		data: queryString,
		beforeSend: function() {
			jQuery("body").mask(loading);
		},
		complete: function() {
			jQuery("body").unmask();
		},
		success: function(data) {			
			var destinationElement = "ajaxlayout";
			if(destinationDiv) {
				destinationElement = destinationDiv;
			}

			if (data != null) {
				if($(destinationElement) != null) {
					$(destinationElement).innerHTML = '&nbsp;' + data;
					$(destinationElement).innerHTML.evalScripts();
				} else {
					data.evalScripts();
				}
			}			
		},
		error: function() {
			jQuery("<div title='" + errorsTitle + "' >" + errorsMsg + "</div>").dialog({
				modal: true,
				resizable: false,
				dialogClass: 'ecm-dialog'
			});
		}
	});
}