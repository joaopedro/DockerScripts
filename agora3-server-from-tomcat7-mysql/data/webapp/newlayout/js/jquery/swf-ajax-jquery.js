/*
 * Javascript integration between spring webflow screens 
 * and jQuery ajax requests
 */

function stopFormSubmit() {
	return false;
}

function webflowAjaxRequestEv(e, eventId) {

	var pressedButton = e.target;
	var form = pressedButton.form;
	form.onsubmit = stopFormSubmit;
	
	//Disable all input images not to be sent to server
	disableButtons();

	// Prepare parameters of request
	var url = form.action;
	var m = form.method;
	var idForm = form.getAttribute('id');
    var p =	$('#'+idForm).serialize();
    p += '&' + pressedButton.name + '=' + pressedButton.value;

	// execute the ajax call
	jQueryAjaxRequest(url, p, m);

    //avoid the propagation of the event
	return false;
}


function webflowAjaxRequest(e) {

	var pressedButton = e.target;
	var form = pressedButton.form;
	form.onsubmit = stopFormSubmit;
	
	//Disable all input images not to be sent to server
	disableButtons();

	// Prepare parameters of request
	var url = form.action;
	var m = form.method;
	var idForm = form.getAttribute('id');
    var p =	$('#'+idForm).serialize();
    p += '&' + pressedButton.name + '=' + pressedButton.value;

	// execute the ajax call
    jQueryAjaxRequest(url, p, m);

    //avoid the propagation of the event
	return false;
}

/*
 *   Execute the Ajax call using jQuery
 */
function jQueryAjaxRequest(url, queryString, method) {

    var m = method;
    if(m == null) {
    	m = 'POST';
    }

	$.ajax({
	    url: url,
    	dataType: 'html',
    	type: m,
    	data: queryString,
    	beforeSend: function() {
    	    $("body").mask('A carregar...');
        },
        complete: function() {
          	$("body").unmask();
        },
    	error: function(transport) {
    	  	console.log('Server side Error : ' + transport.status);
    	},
    	success: function(data) {
    	    $("#main-body").html(data);
    	}
    });

}

/*
 * Disable all form buttons and images
 */
function disableButtons() {
    $(":image").attr('disabled', true);
    $(":button").attr('disabled', true);
    $(":submit").attr('disabled', true);
}
