/**
* Este ficheiro cont�m as fun��es Javascript que d�o suporte � gest�o de dimens�es
* � usado pelo ficheiro editdimensao.jsp
**/

// div que recebe o resultado ajax
var divArvoreNiveis = "arvoreNiveis";

//div que contem o fieldset para cria��o e edi��o de n�veis
var divNovoNivel = "novoNivel";

// action que executa uma ac��o sobre os comentarios e volta a carregar a lista de ultimos coment�rios
var urlNivel = "criarniveldimensional.do2";


// Nomes de bot�es, e inputs
var botCriar = "novonivelButton";
var botAlterar = "alterarnivelButton";
var botCancelarEdit = "cancelaredicaoButton";
var botEliminar = "eliminarnivelButton";
var inputNovoNivel = "textonivel";

var listaBotoes = new Array(botCriar, botAlterar, botCancelarEdit, botEliminar);

/**
 * Concatena as variaveis para o pedido ajax
 *
 */
function obterParams(operacao, indice)
{
	var varsURL = "";	
	
	switch(operacao) {
		case 1: varsURL += "&method=create"; 
				varsURL += "&designacao="+$(inputNovoNivel).value;
				break;
		case 2: varsURL += "&method=show"; 
				varsURL += "&index=" + indice; 
				varsURL += "&designacao="+$(inputNovoNivel).value;
				break;
		case 3: varsURL += "&method=delete"; 
				varsURL += "&index=" + indice; 
				break;
		case 4: varsURL += "&method=edit"; 
				varsURL += "&index=" + indice;
				varsURL += "&designacao="+$(inputNovoNivel).value;
				break;
	}
	return varsURL;
}

function carregarNiveis(parametros)
{	
	if(parametros == "") return;
	
	$(divArvoreNiveis).innerHTML = '<p class="formfield">(a carregar...)</p>';
	var myAjax = new Ajax.Updater(
						{success: divArvoreNiveis},
						 urlNivel,
						{method: 'post', parameters: parametros, onComplete: runScripts}
					);
}

function carregarNivel(parametros)
{	
	if(parametros == "") return;
	
	var myAjax = new Ajax.Updater(
						{success: divNovoNivel},
						 urlNivel,
						{method: 'post', parameters: parametros, onComplete: runScriptsEdit}
					);
}

function runScripts(originalRequest)
{
	originalRequest.responseText.evalScripts();
	limpaNovoNivel();
	showElement($(botCriar));
	hideElement($(botAlterar));
	hideElement($(botEliminar));
}

function runScriptsEdit(originalRequest)
{
	originalRequest.responseText.evalScripts();
	showElement($(divNovoNivel));
	hideElement($(botCriar));
	showElement($(botAlterar));
	showElement($(botEliminar));
}


function showFormNovoNivel() {
	limpaNovoNivel();
	showElement($('novoNivel'));
	showElement($(botCriar));
	hideElement($(botAlterar));
	hideElement($(botEliminar));
}

function criarNivel() {
	var params = obterParams(1, '');
	carregarNiveis(params);	
}

function eliminarNivel(indice) {
	var params = obterParams(3, indice);
	carregarNiveis(params);		
}

function editarNivel(indice) {
	var params = obterParams(2,indice);
	carregarNivel(params);
}

function alterarNivel(indice) {
	var params = obterParams(4,indice);
	carregarNiveis(params);
	
}

function cancelarEditarNivel(indice) {
	limpaNovoNivel();
	showElement($(botCriar));
	hideElement($(botAlterar));
	hideElement($(divNovoNivel));
	hideElement($(botEliminar));
		
	//enableAllButtons();
}

function limpaNovoNivel() {
	$(inputNovoNivel).value = "";
}

/*
 * Show/Hide Elements functions
 * Disable/Enable functions
 */

function showElement(field) {
	$(field).style.display = "";
}

function hideElement(field) {
	$(field).style.display = "none";
}

function disableElement(field) {
	$(field).disabled = true;
}

function enableElement(field) {
	$(field).disabled = null;
}

function existsElement(field) {
	return ($(field) != null);
}

