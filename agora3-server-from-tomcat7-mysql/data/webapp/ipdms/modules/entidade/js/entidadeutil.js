/*
 * DHTMLGoodies tab pane functionality
 */

var SINGULAR = 1;
var COLECTIVO = 2;

function showTabs(selectTipo, nameTabMorada, nameTabLocais){
	var value = selectTipo[selectTipo.selectedIndex].value;
	if (value == SINGULAR){
		document.getElementById('spanTabentidadeTabs_1').innerHTML = nameTabMorada;		
		ajax_loadContent('divTab1','editEntidade.do2?method=loadEntidadeSingularForm');
 		ajax_loadContent('divTab2','editEntidade.do2?method=loadMoradaForm');

	}else if (value == COLECTIVO){
		document.getElementById('spanTabentidadeTabs_1').innerHTML = nameTabLocais;
		ajax_loadContent('divTab1','editEntidade.do2?method=loadEntidadeColectivaForm');
		ajax_loadContent('divTab2','editEntidade.do2?method=loadLocaisForm');
	}
	ajax_loadContent('divTab3','editEntidade.do2?method=loadMoradaEstrangeiraForm');
}

/*
 * Manage moradas entidade form
 */
var MORADA_ACTION = "moradaEntidade-";
var MORADAES_ACTION = "moradaEstrangeiraEntidade.do2?method=";

/*
 * Render functions
 */

function getUrlMoradaAction(locale) {
	return MORADA_ACTION + locale + '.do2?method=';
}

function updateDivMoradas(locale) {
	updateDivMoradaEntidade('existingMoradas', getUrlMoradaAction(locale));
}

function updateDivMoradasEs() {
	updateDivMoradaEntidade('existingMoradasEs', MORADAES_ACTION);
}

function updateDivMoradaEntidade(resultDiv, action) {
	new Ajax.Updater( {success: resultDiv}, action + 'list', {method: 'get', evalScripts: true} );
}

/*
 * Remove Functions
 */

function removeMorada(index, locale, avisoMsg, emptyMsg) {
	var vals='';
	var i;
	var j=0;
	for(i=0;i<index.length;i++)
	{
	if(index[i].checked){
	vals+=index[i].value +',';
	j++;
	}}

	if(vals==''){
		 Ext.MessageBox.alert(avisoMsg, emptyMsg);
	}else {
		removeMoradaEntidade('existingMoradas', getUrlMoradaAction(locale), vals);
	}
}

function removeMoradaEs(index, avisoMsg, emptyMsg) {
	var vals='';
	var i;
	var j=0;
	for(i=0;i<index.length;i++)
	{
	if(index[i].checked){
	vals+=index[i].value +',';
	j++;
	}}

	if(vals==''){
		 Ext.MessageBox.alert(avisoMsg, emptyMsg);
	} else {
		removeMoradaEntidade('existingMoradasEs', MORADAES_ACTION, vals);
	}
}

function removeMoradaEntidade(resultDiv, action, index) {
	new Ajax.Updater( {success: resultDiv}, action + 'remove', {method: 'get', parameters: 'morada_index='+index, evalScripts: true} );
}

/*
 * Edit
 */

function editMorada(locale, index) {
	editMoradaEntidade('divNewMorada', getUrlMoradaAction(locale), index);
}

function editMoradaEs(index) {
	editMoradaEntidade('divEditMoradaEs', MORADAES_ACTION, index);
}

function editMoradaEntidade(divDestino, action, index) {

	var p  = '';
	if(index) { p = 'morada_index=' + index; }
	new Ajax.Updater( {success: divDestino}, action + 'edit', {method: 'get', parameters: p, evalScripts:true} );
}


/*
 * Save
 */

function saveMorada(locale) {
	saveMoradaEntidade('divNewMorada', getUrlMoradaAction(locale), 'errorDivMorada', 'morada_principal');
}

function saveMoradaEs() {
	saveMoradaEntidade('divEditMoradaEs', MORADAES_ACTION, 'errorDivMoradaEs', 'moradaes_principal');
}

function saveMoradaEntidade(divForm, action, divDestino, moradaDefault) {
	if($(moradaDefault)) {
		submitDivWithExtraValues(divForm, action + 'save', divDestino, true, moradaDefault + '=' + $F(moradaDefault));
	} else {
		submitDiv(divForm, action + 'save', divDestino, true);
	}
}
function enableButtons() {
	$$('input.btForm', 'img.imgButton').invoke('show');
}

function disabelButtons() {
	$$('input.btForm', 'img.imgButton').invoke('hide');
}


/*
 * Contacto
 */

var CONTACTO_ACTION = 'contactoEntidade.do2?method=';
var CONTACTOES_ACTION = 'contactoEstrangeiroEntidade.do2?method=';


function showContacto(index) {
	$('imgshowcontacto' + index).hide();
	$('imghidecontacto' + index).show();
	$('tr_contactos' + index).show();
//	$('tr_editContacto' + index).show();
	var p = 'morada_index=' + index;
	new Ajax.Updater( {success: 'contactos' + index}, CONTACTO_ACTION + 'list', {method: 'get', parameters: p} );
}

function showContactoEs(index) {
	$('imgshowcontactoEs' + index).hide();
	$('imghidecontactoEs' + index).show();
	$('tr_contactosEs' + index).show();
//	$('tr_editContactoEs' + index).show();
	var p = 'morada_index=' + index;
	new Ajax.Updater( {success: 'contactosEs' + index}, CONTACTOES_ACTION + 'list', {method: 'get', parameters: p} );
}


function hideContactos(index) {
	$('imgshowcontacto' + index).show();
	$('imghidecontacto' + index).hide();
	$('tr_contactos' + index).hide();
//	$('tr_editContacto' + index).hide();
	Element.update($('contactos' + index), '');	
}

function hideContactosEs(index) {
	$('imgshowcontactoEs' + index).show();
	$('imghidecontactoEs' + index).hide();
	$('tr_contactosEs' + index).hide();
//	$('tr_editContactoEs' + index).hide();
	Element.update($('contactosEs' + index), '');	
}



function editContacto(moradaindex, contactoindex) {
	editContactoEntidade('editContacto', CONTACTO_ACTION, moradaindex, contactoindex);
}

function editContactoEs(moradaindex, contactoindex) {
	editContactoEntidade('editContactoEs', CONTACTOES_ACTION, moradaindex, contactoindex);
}


function editContactoEntidade(divDestino, action, moradaindex, contactoindex) {
	var p = 'morada_index=' + moradaindex;
	if(contactoindex) {
		p += "&contacto_index=" + contactoindex;
	}

	new Ajax.Updater( {success: divDestino + moradaindex}, action + 'edit', {method: 'get', parameters: p} );
}


function saveContacto(morada_index) {
	saveContactoEntidade('editContacto', CONTACTO_ACTION, 'errorDivContacto', morada_index);
}

function saveContactoEs(morada_index) {
	saveContactoEntidade('editContactoEs', CONTACTOES_ACTION, 'errorDivContactoEs', morada_index);
}


function saveContactoEntidade(divForm, action, divDestino, morada_index) {
	submitDiv(divForm + morada_index, action + 'save', divDestino + morada_index, true);
}


function removeContacto(moradaindex, contactoindex) {
	removeContactoEntidade('contactos', CONTACTO_ACTION, moradaindex, contactoindex);
}

function removeContactoEs(moradaindex, contactoindex) {
	removeContactoEntidade('contactosEs', CONTACTOES_ACTION, moradaindex, contactoindex);
}

function removeContactoEntidade(divDestino, action, moradaindex, contactoindex) {
	var p = 'morada_index=' + moradaindex + '&contacto_index=' + contactoindex;
	new Ajax.Updater( {success: divDestino + moradaindex}, action + 'remove', {method: 'get', parameters: p} );
}

/*
 * Entidade Relation
 */

var ENTIDADERELATION_ACTION = 'entidadeRelation.do2?method=';

function editEntidadeRelation(index) {
	var p = '';
	if(index) {
		p += "&entidaderelation_index=" + index;
	}
	new Ajax.Updater( {success: 'divEditEntidadeRelation'}, ENTIDADERELATION_ACTION + 'edit', {method: 'get', parameters: p} );
}
 
function saveEntidadeRelation() {
	submitDiv('divEditEntidadeRelation', ENTIDADERELATION_ACTION + 'save', 'existingEntidadeRelations', true);
}

function updateDivEntidadeRelations() {
	new Ajax.Updater( {success: 'existingEntidadeRelations'}, ENTIDADERELATION_ACTION + 'list', {method: 'get', evalScripts: true} );
}

function removeEntidadeRelation(index, avisoMsg, emptyMsg) {
	var vals='';
	var i;
	for(i=0;i<index.length;i++)	{
		if(index[i].checked){
			vals+=index[i].value +',';
		}
	}
	
	if(vals==''){	
		 Ext.MessageBox.alert(avisoMsg, emptyMsg);	
	}else {		
		new Ajax.Updater( {success: 'existingEntidadeRelations'}, 
			ENTIDADERELATION_ACTION + 'remove', 
			{method: 'get', parameters: 'index='+vals, evalScripts: true} );
	}
}

/*
 * MORADA PT
 */
var CP4DIV = "cp4MoradaDiv";
var CP3DIV = "cp3MoradaDiv";
var LOCALIDADEDIV = "localidadeMoradaDiv";
var OUTRALOCALIDADEDIV = "outraLocalidadeDiv";
var MORADADIV = "moradaMoradaDiv";


var CP4DIV_OUTRO = "cp4OutroMoradaDiv";
var CP3DIV_OUTRO = "cp3OutroMoradaDiv";
var LOCALIDADEDIV_OUTRO = "localidadeOutroMoradaDiv";
var MORADADIV_OUTRO = "moradaOutroMoradaDiv";

var CP4_OUTRO = "morada_cp4_outro";
var CP4 = "morada_cp4";
var CP3_OUTRO = "morada_cp3_outro";
var CP3 = "morada_cp3";
var LOCALIDADE_OUTRO = "morada_localidade_outro";
var LOCALIDADE = "morada_localidade";
var MORADA_OUTRO = "morada_morada_outro";
var MORADA = "morada_morada";

var previosCp4 = "";

function renderSelect(locale, nivel)
{
	var divDestino;
	if(locale == 'pt') {
		divDestino = getMoradaPtRenderDiv(nivel);
	}
	else if(locale == 'br') {
			divDestino = getMoradaBrRenderDiv(nivel);
	} else {
		divDestino = getMoradaAoRenderDiv(nivel);
	}
	if(!divDestino) return;
	
	$(divDestino).innerHTML = '(Loading...)';
	submitDiv('divNewMorada', getUrlMoradaAction(locale) + 'renderField',divDestino, true);
}

function getMoradaPtRenderDiv(nivel) {
		
	if(nivel == 2 && $F('morada_cp4') == -1) { //OUTRO Selected
		showOutroPT();
		return;
	} else if(Element.visible(CP4DIV_OUTRO)) {
		hideOutroPT();
	}

	previosCp4 = $(CP4).options[$(CP4).selectedIndex].text;
	
	switch(nivel)
	{
		case 1: return CP4DIV;
		case 2: return CP3DIV;
		case 3: return LOCALIDADEDIV;
		case 4: return MORADADIV;
		default: return;
	}
}

function resetFieldsPT(nivel) {
	if( nivel <= 1 ) Element.update( CP4DIV, "asd" );
	if( nivel <= 2 ) Element.update( CP3DIV, "asd" );
	if( nivel <= 3 ) Element.update( LOCALIDADEDIV, "asd");
	if( nivel <= 4 ) Element.update( MORADADIV, "asd" );
}

function resetMoradaPrincipal(index){
	
	var i;
	if(index)
	for(i=0;i<index.length;i++)
	{
		index[i].checked=false;
	}
	
}


function showOutroPT() {
  $(CP3DIV, LOCALIDADEDIV, MORADADIV).invoke('hide');
  $(CP4DIV_OUTRO, CP3DIV_OUTRO, LOCALIDADEDIV_OUTRO, MORADADIV_OUTRO).invoke('show');
}

function hideOutroPT() {
  $(CP3DIV, LOCALIDADEDIV, MORADADIV).invoke('show');
  $(CP4DIV_OUTRO, CP3DIV_OUTRO, LOCALIDADEDIV_OUTRO, MORADADIV_OUTRO).invoke('hide');
}

function copyToOutroPT() {
	if($(CP4_OUTRO).value=='')
		$(CP4_OUTRO).value=previosCp4;

	if($(CP3_OUTRO).value=='')
		$(CP3_OUTRO).value=$(CP3).options[$(CP3).selectedIndex].text;

	if($(LOCALIDADE_OUTRO).value=='')
		$(LOCALIDADE_OUTRO).value=$(LOCALIDADE).options[$(LOCALIDADE).selectedIndex].text;

	if($(MORADA_OUTRO).value=='')
		$(MORADA_OUTRO).value=$(MORADA).options[$(MORADA).selectedIndex].text;
}

var PROVINCIADIV = "provinciaMoradaDiv";
var MUNICIPIODIV = "municipioMoradaDiv";
var COMUNADIV = "comunaMoradaDiv";
var LOCALIDADEDIV = "localidadeMoradaDiv";

function getMoradaAoRenderDiv(nivel) {
	//Reset fields
	if( nivel <= 5 ) toggleOutraLocalidade();
			
	//Get Div Name
	switch(nivel)
	{
		case 1: return PROVINCIADIV;
		case 2: return MUNICIPIODIV;
		case 3: return COMUNADIV;
		case 4: return LOCALIDADEDIV;
		default: return;
	}
}

function toggleOutraLocalidade(){
	if($(LOCALIDADE)!=null && $(LOCALIDADE).value == '-1')
		$(OUTRALOCALIDADEDIV).show();
	else
		$(OUTRALOCALIDADEDIV).hide();
}

var ESTADODIV = "estadoMoradaDiv";
var MUNICIPIODIV = "municipioMoradaDiv";

function getMoradaBrRenderDiv(nivel) {
	//Get Div Name
	switch(nivel)
	{
		case 1: return ESTADODIV;
		case 2: return MUNICIPIODIV;
		default: return;
	}
}

/*
function runScripts(originalRequest)
{
	//alert(originalRequest.responseText);
	//originalRequest.responseText.evalScripts();
}
*/

/**
 * edit morada:
 * concelho & freguesia labels
 */

var CONCELHODIV = "localidadeConcelhoDiv";
var FREGUESIADIV = "localidadeFreguesiaDiv";
var DISTRITODIV = "localidadeDistritoDiv";

resetLabels = function(){
	$(CONCELHODIV).innerHTML='';
	$(FREGUESIADIV).innerHTML='';
}
updateLabels = function() {
	resetLabels();
	var morada_cp4= $(CP4) ? $(CP4).value : '';
	var morada_cp3= $(CP3) ? $(CP3).value : '';
	var morada_localidade= $(LOCALIDADE) ? $(LOCALIDADE).value : '';
	if(!morada_cp4.blank() && !morada_cp3.blank() && !morada_localidade.blank()){
		var p = 'morada_cp4='+morada_cp4+'&morada_cp3='+morada_cp3+'&morada_localidade='+morada_localidade;
		new Ajax.Updater(DISTRITODIV, 'moradaEntidade-pt.do2?method=renderLabel&field=distrito', {method: 'get', parameters: p});
		new Ajax.Updater(CONCELHODIV, 'moradaEntidade-pt.do2?method=renderLabel&field=concelho', {method: 'get', parameters: p});
		new Ajax.Updater(FREGUESIADIV, 'moradaEntidade-pt.do2?method=renderLabel&field=freguesia', {method: 'get', parameters: p});
	}
}