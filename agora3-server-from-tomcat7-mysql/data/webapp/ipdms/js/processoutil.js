/**
 * Este ficheiro contém as funções Javascript que dão suporte ao carregamento dos vários campos
 * na procura de processos
 */

// action que carrega as etapas dada um tipo de processo
var urlEtapa = "selectetapas.do2";

// action que carrega os processos dada uma organica
var urlProcesso = "selectprocessos.do2";

function reCarregarProcessos(organica, divDestino)
{	
	var p = $(organica).options[$(organica).selectedIndex].value;

	var myAjax = new Ajax.Updater(
						{success: divDestino}, urlProcesso,
						{method: 'get', parameters: "organica=" + p, onComplete: runScripts}
						);
}

function carregarEtapas(tipoProcesso, divDestino)
{	
	var p = $(tipoProcesso).options[$(tipoProcesso).selectedIndex].value;
	if( p == "" ) {
		return;
	}

	var myAjax = new Ajax.Updater(
						{success: divDestino}, urlEtapa,
						{method: 'get', parameters: "tipoProcesso=" + p, onComplete: runScripts}
						);
}

function runScripts(originalRequest)
{
	originalRequest.responseText.evalScripts();
}