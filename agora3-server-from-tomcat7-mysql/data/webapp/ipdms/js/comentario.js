/**
* Este ficheiro contém as funções Javascript que dão suporte à gestão de observações das etapas
* é usado pelo ficheiro comentario.jsp
**/

// div que recebe o resultado ajax
var divComentariosAnteriores = "comentariosanteriores";

// action que executa uma acção sobre os comentarios e volta a carregar a lista de ultimos comentários
var urlComentario = "comentarioCRUD.do2";


// Nomes de botões, e inputs
var botVerMais = "vermais";
var botVerMenos = "vermenos";
var botEditar = "editar";
var botRemover = "remover";
var botCriar = "novocomentario";
var botAlterar = "alterar";
var botCancelar = "cancelar";
var inputNovoComentario = "textonovocomentario";
var radioTipoNovoComentario = "tiponovocomentario";
var inputComentario = "comentario";
var linhaMaisInformacao = "comentariofull";
var inputComentarioId = "comentarioid";
var NUMEROCOMENTARIOS = 5;
var linhaVisTipoComentario = "visualizarTipoComentario";
var linhaEdiTipoComentario = "editarTipoComentario";
var radioTipoComentario = "tipocomentario";

var listaBotoes = new Array(botVerMais, botVerMenos, botEditar, botRemover);

/**
 * Concatena as variaveis para o pedido ajax
 *
 */
function obterParams(operacao, indice)
{
	var varsURL = "nid="+$("nid").value;
		
	switch(operacao) {
		case 1: varsURL += "&method=create"; 
				varsURL += "&comentario="+$(inputNovoComentario).value;
				varsURL += "&tipocomentario="+getRadioValue(radioTipoNovoComentario);
				varsURL += "&canPerform="+$("canPerform").value;
				break;
		case 2: varsURL += "&method=update"; 
				varsURL += "&comentarioid=" + $(inputComentarioId + indice).value; 
				varsURL += "&comentario="+$(inputComentario + indice).value;
				varsURL += "&tipocomentario="+getRadioValue(radioTipoComentario + indice);
				varsURL += "&canPerform="+$("canPerform").value;
				break;
		case 3: varsURL += "&method=delete"; 
				varsURL += "&comentarioid=" + $(inputComentarioId + indice).value; 
				varsURL += "&canPerform="+$("canPerform").value;
				break;
	}
	return varsURL;
}

function carregarComentarios(parametros)
{	
	if(parametros == "") return;
	
	$(divComentariosAnteriores).innerHTML = '<p class="formfield">(Loading...)</p>';
	var myAjax = new Ajax.Updater(
						{success: divComentariosAnteriores},
						 urlComentario,
						{method: 'post', parameters: parametros, onComplete: runScripts}
					);
}
function runScripts(originalRequest)
{
	originalRequest.responseText.evalScripts();
	enableAllButtons();
}

function criarComentario(msg) {
	confirmMsg="Are you sure you want to create this comment?";
	if(msg!=null){
		confirmMsg=msg;
	}
	if(confirm(confirmMsg)) {
		var params = obterParams(1);
		carregarComentarios(params);
	}	
}

function removerComentario(indice,msg) {
	confirmMsg="Are you sure you want to delete this comment?";
	if(msg!=null){
		confirmMsg=msg;
	}	
	if($(botRemover + indice).disabled) {
		return false;
	}
	if(confirm(confirmMsg)) {
		var params = obterParams(3,indice);
		carregarComentarios(params);		
	}
}

function editarComentario(indice) {
	if($(botEditar + indice).disabled) {
		return false;
	}
	disableAllButtons();
	showElementIndex(linhaMaisInformacao, indice);
	$(inputComentario + indice).readOnly = false;
	$(inputComentario + indice).focus();
	hideElementIndex(linhaVisTipoComentario, indice);
	showElementIndex(linhaEdiTipoComentario, indice);	
	showElementIndex(botAlterar, indice);
	showElementIndex(botCancelar, indice);
}

function alterarComentario(indice,msg) {
	confirmMsg="Are you sure you want to change this comment?";
	if(msg!=null){
		confirmMsg=msg;
	}
	if(confirm(confirmMsg)) {
		var params = obterParams(2,indice);
		carregarComentarios(params);		
	}	
}

function cancelarEditarComentario(indice) {

	hideElementIndex(linhaMaisInformacao, indice);
	showElementIndex(linhaVisTipoComentario, indice);
	hideElementIndex(linhaEdiTipoComentario, indice);
	hideElementIndex(botAlterar, indice);
	hideElementIndex(botCancelar, indice);	
	enableAllButtons();
}


function verMais(indice) {
	if($(botVerMais + indice).disabled) {
		return false;
	}
	showElementIndex(linhaMaisInformacao, indice);
	$(inputComentario + indice).readOnly = true;
	hideElementIndex(botVerMais, indice);
	showElementIndex(botVerMenos, indice);
}

function verMenos(indice) {
	if($(botVerMenos + indice).disabled) {
		return false;
	}
	hideElementIndex(linhaMaisInformacao, indice);
	showElementIndex(botVerMais, indice);
	hideElementIndex(botVerMenos, indice);
}

function limpaNovoComentario() {
	$(inputNovoComentario).value = "";
	setRadioValue(radioTipoNovoComentario, "3");
}

/*
 * Show/Hide Elements functions
 * Disable/Enable functions
 */

function showElementIndex(field,index) {
	showElement(field + index);
}

function showElement(field) {
	$(field).style.display = "";
}

function hideElementIndex(field,index) {
	hideElement(field + index);
}

function hideElement(field) {
	$(field).style.display = "none";
}

function disableElementIndex(field,index) {
	disableElement(field + index);
}

function disableElement(field) {
	$(field).disabled = true;
}

function enableElementIndex(field,index) {
	enableElement(field + index);
}

function enableElement(field) {
	$(field).disabled = null;
}

function existsElement(field, index) {
	return ($(field + index) != null);
}

function enableAllButtons() {
	enableElement(botCriar);
	for(i = 0; i < NUMEROCOMENTARIOS; i++) {
		for(j = 0; j < listaBotoes.length; j++) {
			if(!existsElement(listaBotoes[j],i)) {
				return;
			}
			enableElementIndex(listaBotoes[j], i);
		}
	}
}

function disableAllButtons() {
	disableElement(botCriar);
	for(i = 0; i < NUMEROCOMENTARIOS; i++) {
		for(j = 0; j < listaBotoes.length; j++) {
			if(!existsElement(listaBotoes[j],i)) {
				return;
			}
			disableElementIndex(listaBotoes[j], i);			
		}
	}
}

function getRadioValue(field) {
	return getCheckedValue($(field).form.elements[field]);
}

function setRadioValue(field, value) {
	setCheckedValue($(field).form.elements[field], value);
}

// return the value of the radio button that is checked
// return an empty string if none are checked, or
// there are no radio buttons
function getCheckedValue(radioObj) {
	if(!radioObj)
		return "";
	var radioLength = radioObj.length;
	if(radioLength == undefined)
		if(radioObj.checked)
			return radioObj.value;
		else
			return "";

	for(var i = 0; i < radioLength; i++) {
		if(radioObj[i].checked) {
			return radioObj[i].value;
		}
	}
	return "";
}

// set the radio button with the given value as being checked
// do nothing if there are no radio buttons
// if the given value does not exist, all the radio buttons
// are reset to unchecked
function setCheckedValue(radioObj, newValue) {
	if(!radioObj)
		return;
	var radioLength = radioObj.length;
	if(radioLength == undefined) {
		radioObj.checked = (radioObj.value == newValue.toString());
		return;
	}
	for(var i = 0; i < radioLength; i++) {
		radioObj[i].checked = false;
		if(radioObj[i].value == newValue.toString()) {
			radioObj[i].checked = true;
		}
	}
}
