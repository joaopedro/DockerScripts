// funções javascript para integração do AJAX no ecrãs do Spring Web Flow

function stopSubmit(){ return false; }

// evita os pedidos repetidos
var _ajr = 0;

// faz o submit do formulário, usando Ajax
function ajaxSubmit(e)
{
	ajaxSubmitReferer(e,"");
}

function ajaxSubmitExcludeInputImage(e) {
	$$('input[type="image"]').invoke('disable');
	ajaxSubmitReferer(e,"");
}

function ajaxSubmitReferer(e, referer, isEndState)
{
	window.document.body.style.cursor = "wait";
	if (_ajr == 0)
	{
		// impede novos pedidos até este ser concluído
		_ajr++;
	
		var pressedButton = Event.element(e);
		var form = pressedButton.form;
		
		// inactiva os botões do form
		disableButtons(form.elements);
		
		// evita a inclusão do atributo onsubmit="return false;" em todos os formulários
		form.onsubmit = stopSubmit;
	
		// faz o HttpRequest e invoca um método nextScreen para tratar o resultado
		var url = form.action;
		var m = form.method;
		var p = Form.serialize(form);
		p += '&' + pressedButton.name + '=' + pressedButton.value;

		// caso se esteja a terminar o processo, é necesssário determinar se estamos num IFRAME, ou na própria aplicação
		var isEndState = pressedButton.value == "Cancelar"
					|| pressedButton.value == "Terminar"
					//|| pressedButton.value == "Gravar"
					|| pressedButton.value == "Suspender"
					|| isEndState;
					
		var inIframe = window != parent;
		
		// se for um pedido final do processo
		if( isEndState )
		{
			// 1) executa-se o pedido Ajax e ignora-se o resultado
			var myAjax = new Ajax.Request( url, {method: m, parameters: p} );

			// 2.1) caso se esteja num IFRAME, o referer é enviado para o 'parent'
			if( inIframe )
			{
				window.document.body.innerHTML="<div style='font-family: arial;'><br><br>&nbsp;&nbsp;"+pressedButton.value+"...</div>";
				parent.document.location.href = referer;
			}
			else // 2.2) caso contrário, o 'referer' é carregado no próprio frame
			{
				window.document.location.href = referer;
			}
		}
		else // se não for um estado final, executa-se um pedido normal
		{
			var myAjax = new Ajax.Request( url, {method: m, parameters: p, 
												 onComplete: onComplete, 
												 on302: onRedirect,
												 on301: onRedirect} );
		}
	}
	
	// aborta o evento
 	Event.stop(e);
}

function onRedirect(request) {
	var location = request.getResponseHeader("location");
	window.location.href = location;
}

// determina a secção da página (DIV ?) que vai receber o resultado do pedido Ajax;
// liberta a flag que impedia novos pedidos
function onComplete(request)
{
	window.document.body.style.cursor = "auto";
	_ajr--;

	$("ajaxlayout").style.display = 'block';
	$("loading").style.display = 'none';
	var responseText = request.responseText;
	if(	responseText != null) {
		$("ajaxlayout").innerHTML = responseText;
		$("ajaxlayout").innerHTML.evalScripts();
	}
}

function wait(event)
{
	loading('ajaxlayout','loading');
}

// inactiva todos os botões do form
function disableButtons(elems)
{
	for( i = 0; i < elems.length; i++ )
	{
		if( elems[i].type == "submit" || elems[i].type=="button" )
		{
			elems[i].disabled = true;
			elems[i].onclick = function(){return false;};
		}
	}
}

function doAjax(event)
{
	doAjaxReferer(event,"");
}

function doAjaxExcludeInputImage(event)
{
	// internet explorer
	var keycode = event.keyCode;
	
	// mozillas
	if( keycode == 0 ) keycode = event.which;

	if( keycode == 13 // enter
		|| keycode == 32 // espaço
		)
	{
		ajaxSubmitExcludeInputImage(event, "");
	}
}

function doAjaxReferer(event,referer)
{
	// internet explorer
	var keycode = event.keyCode;
	
	// mozillas
	if( keycode == 0 ) keycode = event.which;

	if( keycode == 13 // enter
		|| keycode == 32 // espaço
		)
	{
		ajaxSubmit(event,referer);
	}
}