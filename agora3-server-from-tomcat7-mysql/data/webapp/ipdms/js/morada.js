/**
* Este ficheiro contém as funções Javascript que dão suporte ao carregamento dos vários campos das moradas.
* É usado pelo ficheiro morada.jsp
**/
// divs que recebem os resultados do ajax
	// selects
	var divConcelhos = "concelhos";
	var divFreguesias = "freguesias";
	var divLocalidades = "localidades";
	var divArterias = "arterias";
	var divCp4 = "codpostal4";
	var divCp3 = "codpostal3";

	// texto
	var divCpalfa = "codpostalalfa";

// action que carrega os dados
var urlMorada = "morada.do2";

/*
* Esta função devolve o valor de um campo Select
*/
function valorSelectMorada(select)
{
	if( select.disabled || select.selectedIndex < 0 ) return "";
	
	return select.options[select.selectedIndex].value;
}

/*
* nível 1 - envia distritos
* nível 2 - envia concelhos
* nível 3 - envia freguesia
* nível 4 - envia localidades
* nível 5 - envia artérias
* nível 6 - envia cp4
*/
function obterParams(nivel)
{
	// carregar os valores dos campos
	var campos = new Array($("distrito"), $("concelho"), $("freguesia"), $("localidade"), $("arteria"), $("cp4"), $("cp3"));
	var p = "";
	var i = 0;
	while( i < nivel )
	{
		if( campos[i] != null )
		{
			var v = valorSelectMorada(campos[i]);
			// se o campo não tem valor, então não se efectua o pedido
			if( v == "" ) return "";
			p += (i>0?"&":"") + campos[i].name + "=" + v;
		}
		i++;
	}

	// indicar se as artérias são para ignorar
	if( $("ignorar_arterias") ) p += "&"+$("propriedadeMorada").value + ".arteria=-1";

	// indicar a propriedade do bean que corresponde à morada em uso
	p += "&propriedadeMorada=" + $("propriedadeMorada").value;

	return p;
}
function limparCampos(nivel)
{
	if( nivel <= 1 ) Element.update( divConcelhos, "" );
	if( nivel <= 2 ) Element.update( divFreguesias, "" );
	if( nivel <= 3 ) Element.update( divLocalidades, "" );
	if( nivel <= 4 ){ Element.update( divArterias, "" ); mostrarRua(); }
	if( nivel <= 5 ) { Element.update( divCp4, "" ); mostrarRua(); }
	if( nivel <= 6 ) Element.update( divCp3, "" );
	if( nivel <= 7 ) Element.update( divCpalfa, "" );
}
function carregarCampos(nivel)
{
	var divDestino;
	limparCampos(nivel);
	
	if(nivel == "6" && mostrarOutroCp()) {
		return; //Se tiver sido seleccionado outro cp, não sao carregados os Cp3
	}
	
	var p = obterParams(nivel);
	if( p == "" ) return;
	switch(nivel)
	{
	case 1: divDestino = divConcelhos; break;
	case 2: divDestino = divFreguesias; break;
	case 3: divDestino = divLocalidades; break;
	case 4: divDestino = divArterias; break;
	case 5: divDestino = divCp4; break;
	case 6: divDestino = divCp3; break;
	case 7: divDestino = divCpalfa; break;
	}
	$(divDestino).innerHTML = '(a carregar...)';
	var myAjax = new Ajax.Updater(
						{success: divDestino},
						 urlMorada,
						{method: 'get', parameters: p, onComplete: runScripts}
					);
}
function runScripts(originalRequest)
{
	originalRequest.responseText.evalScripts();
}
function carregarConcelhos()
{
	carregarCampos(1);
}
function carregarFreguesias()
{
	carregarCampos(2);
}
function carregarLocalidades()
{
	carregarCampos(3);
}
function carregarArterias()
{
	carregarCampos(4);
}
function carregarCp4()
{
	carregarCampos(5);
}
function carregarCp3()
{
	carregarCampos(6);
}
function carregarCpalfa()
{
	carregarCampos(7);
}
function mostrarRua()
{
	var arteria = $("arteria");
	var rua = $("rua");
	
	if( !rua ) return;

	rua.style.display = (!arteria || (valorSelectMorada(arteria) != "-1" && valorSelectMorada(arteria) != "")) ? "none" : "inline";
}

function mostrarOutroCp() {

	var cp4 = $("cp4");
	var outroCp4 = $("outroCp4");
	var outroCp3 = $("outroCp3");
	var outroCpalfa = $("cpalfa");

	if( !outroCp4 || !outroCp3 || !outroCpalfa ) {
		return false;
	}

	outroCp4.value = "";
	outroCp3.value = "";
	outroCpalfa.value = "";

	if(!cp4 || valorSelectMorada(cp4) == "-1") {	
		outroCp4.style.display = "inline";
		outroCp3.style.display = "inline";
		outroCpalfa.style.display = "inline";
		return true;
	} 
	outroCp4.style.display = "none";
	outroCp3.style.display = "none";
	outroCpalfa.style.display = "none";
	return false;
}