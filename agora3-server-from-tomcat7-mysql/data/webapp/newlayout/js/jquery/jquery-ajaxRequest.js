
/**
 * Simple Ajax call using jQuery
 *
 */
function simpleAjaxRequest(action, div, divToMask){
    $.ajax({
		url: action,
	    dataType: 'html',
	    beforeSend: function() {
	        $(divToMask).mask('A carregar...');
        },
        complete: function() {
        	$(divToMask).unmask();
        },
	    error: function(transport) {
	    	console.log('Server side Error : ' + transport.status);
	    },
	    success: function(data) {
	        $("#" + div).html(data);
	    }
	});


}