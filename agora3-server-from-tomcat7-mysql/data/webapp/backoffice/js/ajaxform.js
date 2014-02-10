// fun��es javascript para integra��o do AJAX no ecr�s do Spring Web Flow

function stopSubmit(){ return false; }

// evita os pedidos repetidos
var _ajr = 0;
var localdivid = null;
var localform = null;

// faz o submit do formul�rio, usando Ajax
function ajaxSubmit(e, divid)
{
	localdivid = divid;
	window.document.body.style.cursor = "wait";
	if (_ajr == 0)
	{
		// impede novos pedidos at� este ser conclu�do
		_ajr++;
	
		var pressedButton = Event.element(e);
		var form = pressedButton.form;
		localform = form;
		// inactiva os bot�es do form
		disableButtons(form.elements);
		
		// evita a inclus�o do atributo onsubmit="return false;" em todos os formul�rios
		form.onsubmit = stopSubmit;
	
		// faz o HttpRequest e invoca um m�todo nextScreen para tratar o resultado
		var url = form.action;
		var m = form.method;
		var p = Form.serialize(form);
		p += '&' + pressedButton.name + '=' + pressedButton.value;
		var myAjax = new Ajax.Request( url, {method: m, parameters: p, 
											 onComplete: onComplete, 
											 on302: onRedirect,
											 on301: onRedirect} );
	}
	// aborta o evento
 	Event.stop(e);
}

var localFn = null;
// faz o submit do formul�rio, usando Ajax
function ajaxSubmitGeneric(f, divid, completeFn)
{
	localdivid = divid;
	if ( completeFn )
		localFn = completeFn;
	window.document.body.style.cursor = "wait";
	if (_ajr == 0)
	{
		// impede novos pedidos at� este ser conclu�do
		_ajr++;
	
		var form = f;
		localform = form;
		
		// evita a inclus�o do atributo onsubmit="return false;" em todos os formul�rios
		form.onsubmit = stopSubmit;
	
		// faz o HttpRequest e invoca um m�todo nextScreen para tratar o resultado
		var url = form.action;
		var m = form.method;
		var p = Form.serialize(form);
		var myAjax = new Ajax.Request( url, {method: m, parameters: p, 
											 onComplete: onCompleteGeneric, 
											 on302: onRedirect,
											 on301: onRedirect} );
	}
}

function onRedirect(request) {
	var location = request.getResponseHeader("location");
	window.location.href = location;
}

// determina a sec��o da p�gina (DIV ?) que vai receber o resultado do pedido Ajax;
// liberta a flag que impedia novos pedidos
function onComplete(request)
{
	window.document.body.style.cursor = "auto";
	_ajr--;

	$(localdivid).style.display = 'block';
	var responseText = request.responseText;
	if(	responseText != null) {
		if (responseText.indexOf("<body") != -1) {
	    	document.body.innerHTML = responseText;
			document.body.innerHTML.evalScripts();
		} else {
			$(localdivid).innerHTML = responseText;
			$(localdivid).innerHTML.evalScripts();
		}
	}
	if ( localform != null )
		enableButtons(localform.elements);
	
}
function onCompleteGeneric(request)
{
	window.document.body.style.cursor = "auto";
	_ajr--;

	$(localdivid).style.display = 'block';
	var responseText = request.responseText;
	if(	responseText != null) {
		if (responseText.indexOf("<body") != -1) {
	    	document.body.innerHTML = responseText;
			document.body.innerHTML.evalScripts();
		} else {
			$(localdivid).innerHTML = responseText;
			$(localdivid).innerHTML.evalScripts();
		}
	}
	if ( localFn != null )
		localFn();
}

function wait(event)
{
	loading(localdivid,'');
}

// reactiva todos os bot�es do form
function enableButtons(elems)
{
	for( i = 0; i < elems.length; i++ )
	{
		if( elems[i].type == "submit" || elems[i].type=="button" )
		{
			elems[i].disabled = false;
			elems[i].onclick = elems[i].lastonclick;
		}
	}
}
// inactiva todos os bot�es do form
function disableButtons(elems)
{
	for( i = 0; i < elems.length; i++ )
	{
		if( elems[i].type == "submit" || elems[i].type=="button" )
		{
			elems[i].disabled = true;
			elems[i].lastonclick = elems[i].onclick;
			elems[i].onclick = function(){return false;};
		}
	}
}

function doAjax(event)
{
	// internet explorer
	var keycode = event.keyCode;
	
	// mozillas
	if( keycode == 0 ) keycode = event.which;

	if( keycode == 13 // enter
		|| keycode == 32 // espa�o
		)
	{
		ajaxSubmit(event);
	}
}