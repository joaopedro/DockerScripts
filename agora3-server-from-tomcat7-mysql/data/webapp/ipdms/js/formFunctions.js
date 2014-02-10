function confirmaCancelar() {
	return confirm("Deseja realmente cancelar o processo?");
}
function confirmaGravar() {
	return confirm("O seu pedido irá ser gravado na sua área pessoal. Para aceder, deverá ir a \"A Minha Conta » Drafts de Processos\". \n "
					+ "Atenção: para que o seu pedido seja enviado para a entidade, tem que seleccionar \"Submeter\" / \"Seguinte\" no final do processo.");
}

function setActionAndSubmit(form, action) {
	form.action = action;
	form.submit();
}


function submitDiv(divToSubmit,url, divToUpdate, evalScripts) {
	var p = buildParametersFromDiv(divToSubmit);
	new Ajax.Updater({success: divToUpdate}, url, {method: 'post', parameters: encodeURI(p), evalScripts: evalScripts } );
}

function submitDivWithExtraValues(divToSubmit,url, divToUpdate, evalScripts, extraValues) {
	var p = buildParametersFromDiv(divToSubmit);
	if(p != '') { p += '&'; }
	p += extraValues;
	
	new Ajax.Updater({success: divToUpdate}, url, {method: 'post', parameters: encodeURI(p), evalScripts: evalScripts } );
}


/*
function runScripts(originalRequest)
{
	alert(originalRequest.responseText);
	//originalRequest.responseText.evalScripts();
}*/

/**
 * Constructs a url get parameter string using all the:
 *  input
 *  select
 * Excludes buttons
 */
function buildParametersFromDiv(div) {
	var par = '';
	if($(div)) {
		var subFormElements = $(div).select('input', 'select', 'textarea');
		for(i = 0; i < subFormElements.length; i++) {
			if(subFormElements[i].type != 'button' && subFormElements[i].type != 'radio') {
				if(!par.empty()) { par += '&' }
				par += subFormElements[i].id + '=' + $F(subFormElements[i]);
			}
			if(subFormElements[i].type == 'radio') {
				if($F(subFormElements[i]) != null){
					if(!par.empty()) { par += '&' }
					par += subFormElements[i].id + '=' + $F(subFormElements[i]); 	
				}
			}
			
		}
	}	
	return par;
}