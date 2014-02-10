/*************************************************
* Este ficheiro contém funções Javascript usadas
* nos vários ecrãs que manipulam Documentos.
*************************************************/

/*
 * Esta função carrega ou esconde o histórico de um documento
 */
function historico(documento)
{
	historico(documento,'');
}
function historico(documento, homedir)
{
	var prefix = homedir + ( homedir != "" ? "/" : "" );
	
	var fold = prefix + 'images/icon/icon-mais.png';
	var open = prefix + 'images/icon/icon-menos.png';
	
	var tr = $('tr_'+documento);
	var td = $('td_'+documento);
	var img = $('img_'+documento);

	var abrir = !Element.visible(tr);

	// mostrar/ocultar a linha de dados
	Element.toggle(tr);
	
	// alterar ícone da imagem
	img.src = abrir ? open : fold;
	
	// carregar os dados para o TD destino
	td.innerHTML = abrir ? "Carregar histórico do documento..." : "";
	if( abrir )
	{
		var params = "numero=" + documento + "&method=historico";
		var myajax = new Ajax.Updater( {success: "td_"+documento},
										prefix + "tarefas/listardocumentos.do2",
										{method: "get", parameters: params} );
	}
}


function historicoDocumento(documento)
{
	historicoDocumento(documento,'');
}
function historicoDocumento(documento, homedir)
{
	var prefix = homedir + ( homedir != "" ? "/" : "" );
	
	var fold = prefix + 'images/icon/icon-mais.png';
	var open = prefix + 'images/icon/icon-menos.png';
	
	var tr = $('tr_'+documento);
	var td = $('td_'+documento);
	var img = $('img_'+documento);

	var abrir = !Element.visible(tr);

	// mostrar/ocultar a linha de dados
	Element.toggle(tr);
	
	// alterar ícone da imagem
	img.src = abrir ? open : fold;
	
	// carregar os dados para o TD destino
	td.innerHTML = abrir ? "Carregar histórico do documento..." : "";
	if( abrir )
	{
		var params = "numero=" + documento + "&method=historico";
		var myajax = new Ajax.Updater( {success: "td_"+documento},
										prefix + "tarefas/listDocumentos.do2",
										{method: "get", parameters: params} );
	}
}
