// utils.js

/*
function togglestat(img, obj, imgdir) {
	var linha = document.getElementById(obj);

	if (linha.style.display == '') {
		img.aberto = false;
		img.src = imgdir+"/icon/icon-mais.png";	
		linha.style.display = 'none';
	} else {
		img.aberto = true;
		img.src = imgdir+"/icon/icon-menos.png";
		linha.style.display = '';
	}
}*/

// ajuda
function verAjuda(opcao)
{
	document.getElementById("ajuda").style.display = opcao == 's' ?  "inline" : "none";
	document.getElementById("ver_ajuda").style.display = opcao == 's' ?  "none" : "inline";
}

// campos de fieldset
function useField(textFieldID, use)
{
	var textField = $(textFieldID);
	if( textField )
	{
		textField.disabled = !use;
		if( use )
			textField .focus();
		else
			textField.value = "";
	}
}
function useFieldTxt(checkbox, textbox)
{
	//textbox.disabled = !checkbox.checked;
	if(checkbox.checked)
	{
		textbox.style.visibility="visible";
	}
	else
	{
		textbox.value = "";
		textbox.style.visibility="hidden";
	}
}
function useFieldSelect(checkbox, select)
{
	select.disabled = !checkbox.checked;
	if(checkbox.checked)
	{	
		select.style.visibility="visible";
		select.focus();		
	}
	else
	{
		select.selectedIndex = 0;
		select.style.visibility="hidden";
	}
}

// trim de valores
function trim( text )
{
	var i, j;

	for( i = 0; i < text.length && text.charAt(i) == ' ' ; i++ );
	for( j = text.length - 1; j > i && text.charAt(j) == ' '; j-- );

	return text.substring(i,j+1);
}

// soma do valor de dois campos para um total
function calcularTotal(a,b,total)
{
	var campoA = $(a);
	var campoB = $(b);
	var campoTotal = $(total);
	
	if( campoA && campoB && campoTotal )
	{
		var intA = isNaN(campoA.value) ? 0 : Number(campoA.value);
		var intB = isNaN(campoB.value) ? 0 : Number(campoB.value);
	
		campoTotal.value = "" + Number(intA + intB);
	}
}
// soma do valor de três campos para um total
function calcularTotal3(a,b,c,total)
{
	var campoA = $(a);
	var campoB = $(b);
	var campoC = $(c);
	var campoTotal = $(total);
	
	if( campoA && campoB && campoC && campoTotal )
	{
		var intA = isNaN(campoA.value) ? 0 : Number(campoA.value);
		var intB = isNaN(campoB.value) ? 0 : Number(campoB.value);
		var intC = isNaN(campoC.value) ? 0 : Number(campoC.value);
	
		campoTotal.value = "" + Number(intA + intB + intC);
	}
}

// efectua um pedido Ajax e coloca o resultado no innerHTML de um DIV ou SPAN
function ajaxDescritivoCAE( campoCae, idCampoDesc )
{
	$(idCampoDesc).innerHTML = '(a carregar...)';
	var myajax = new Ajax.Updater( {success: idCampoDesc},
									'descritivoCAE.do2',
									{method: 'get', parameters: 'cae='+campoCae.value} );
}

function findKeyCode(event) {
	if (window.event) 
		return window.event.keyCode;
	else if (event.keyCode == 0)
		return event.which
	else 
		return event.keyCode
}

var VIRGULA = 44;
var PONTO   = 46;
var MENOS   = 45;

function IsDecimalNumber(objecto,evento) {
	if (IsDigitComma(evento)){
		codigoTecla = findKeyCode(evento);
		var valor = objecto.value;
		if (((codigoTecla == PONTO) || (codigoTecla == VIRGULA))
			&&((valor.indexOf(",") != -1) || (valor.indexOf(".") != -1))) { 
			return false;
  		}else return true; 
  	}
  	return false;
}

function IsNumericKey(event) 
{
	var keycode = findKeyCode(event)
	return ((keycode>=48) && (keycode<=57)
			|| keycode==8	 // backspace
			|| keycode==9	 // tab
			|| keycode==13	 // enter
			|| keycode==37	 // left-arrow
			|| keycode == 39 // right-arrow
			);
}

function IsDigit(e) 
{
	// internet explorer
	var keycode = e.keyCode;
	
	// mozillas
	if( keycode == 0 ) keycode = e.which;

	// devolve true se a tecla é um dígito, ou alguma das outras referidas abaixo
	return(((keycode>=48) && (keycode<=58)) // números
			|| keycode==8	// backspace
			|| keycode==9	// tab
			|| keycode==13	// enter
			|| keycode==37	// left-arrow
			|| keycode==39	// right-arrow
			|| keycode==46	// delete
			);
}



function focusOnError(field) {
	if($(field) != null && $(field).focus) {
		$(field).focus();
	}
}



//Função que permite adicionar uma propriedade de maxlength a uma TextArea
//deve ser executado o setMaxLength(); no final da pagina
function setMaxLength() {
	var x = document.getElementsByTagName('textarea');
	var counter = document.createElement('div');
	counter.className = 'formfield';
	for (var i=0;i<x.length;i++) {
		if (x[i].getAttribute('maxlength')) {
			var counterClone = counter.cloneNode(true);
			counterClone.relatedElement = x[i];
			counterClone.innerHTML = '<span>0</span>/'+x[i].getAttribute('maxlength');
			x[i].parentNode.insertBefore(counterClone,x[i].nextSibling);
			x[i].relatedElement = counterClone.getElementsByTagName('span')[0];

			x[i].onkeyup = x[i].onkeypress = checkMaxLength;
			x[i].onkeyup();
		}
	}
}

function checkMaxLength() {
	var maxLength = this.getAttribute('maxlength');
	var currentLength = this.value.length;

	this.relatedElement.firstChild.nodeValue = currentLength;
	
	if (currentLength >= maxLength)
		return false;
	// not innerHTML
}

function isDigit() 
{
	return(((event.keyCode>=48) && (event.keyCode<=57)) || event.keyCode==46 );
}


function getUrl(action, method, additionalParameters) {
	if(method != '') {
		return action + '?method=' + method + '&' + additionalParameters;
	}
	return action + '?' + additionalParameters;;
}

function toggle() {
	var ele = document.getElementById("toggleText");
	var text = document.getElementById("displayText");
	if(ele.style.display == "block") {
    		ele.style.display = "none";
  	}
	else {
		ele.style.display = "block";
	}
} 

/* Função utilitária que permite adicionar 
 * *.js a uma página.
 * Pode ser usado, por exemplo, para
 * incluir scripts num pedido ajax
 * a posição pode ser por exemplo 
 * 'head' ou 'body'
 */
function addJavascript(jsname,pos) {
	var th = document.getElementsByTagName(pos)[0];
	var s = document.createElement('script');
	s.setAttribute('type','text/javascript');
	s.setAttribute('src',jsname);
	th.appendChild(s);
}