/**
* Este ficheiro contém as funções Javascript que dão suporte à distribuição por nome.
*
* É usado pelos ficheiros nomedist.jsp e nomedistpopup.jsp 
**/

//map oject for ids selected
var selectedIds = {};
var selectedIdsDarConhecimento = {};


//////////////////////////////////////
//	Add user to assigned list		//
//////////////////////////////////////
	
function addToAssigList(element, name) {
		
	//	div's to affect
   	var div = 'assignados';
   	var fs = 'assignados-fs';

   	var ids = element.id.split('_');
   	var newElementId = "colassignado_" + ids[1];

   	//	if element is checked, append element
   	if(element.checked){
   		//	add only if there is not already
   		var assignadosFS = jQuery('#'+fs);
   		var exists = assignadosFS.children('#'+newElementId).length == 1;
   		if(!exists){
   			var newElement = createElement(element.id, newElementId, ' ' + name, 'selectedIds', div, fs);
   			assignadosFS.append(newElement);
   			//add colaborador to map
   			selectedIds[ids[1]] = name;
   		}
   	} else {
   		//	if element is unchecked, remove it
   		removeItem(selectedIds, newElementId, element.id);
   	}

   	//	show or hide div with the assigned users, if not visible yet
   	showHideElement(div, fs);

}

function addToDarConhecimentoList(element, name) {
	
	//	div's to affect
   	var div = 'darconhec';
   	var fs = 'darconhec-fs';

   	var ids = element.id.split('_');
   	var newElementId = "coldarconhec_" + ids[1];

   	//if element is checked, append element
   	if(element.checked){
   		//	add only if there is not already
   		var darconhecFS = jQuery('#'+fs);
   		var exists = darconhecFS.children('#'+newElementId).length == 1;
   		if(!exists){
   			var newElement = createElement(element.id, newElementId, ' ' + name, 'selectedIdsDarConhecimento', div, fs);
   			darconhecFS.append(newElement);
   			//	add colaborador to map
   			selectedIdsDarConhecimento[ids[1]] = name;
   		}
   	} else {
   		//	if element is unchecked, remove it
   		removeItem(selectedIdsDarConhecimento, newElementId, element.id);
   	}

   	//	show or hide div with the assigned users, if not visible yet
   	showHideElement(div, fs);
		
}
	
	
//////////////////////////////////////////////
//	Remove the user from assigned list,		//
//	and uncheck the equivalent element in	//
//	the search list							//
//////////////////////////////////////////////
function removeItem(list, div, fs, id, uncheckId) {
	
	//remove element in the colaboradores assigned list
   	var element = jQuery('#'+id);
   	element.remove();

   	//remove colaborador from map
   	var v = id.split('_');
   	delete list[v[1]];

   	//uncheck the element in the search table
   	var ckBox = jQuery('#'+ck);
   	var checked = ckBox.is(':checked');
   	if(checked){
   		ckBox.attr('checked', !checked);
   	}
				
}
		
	
//////////////////////////////////
//	Create a new HTML element	//
//////////////////////////////////
function createElement(id, newElementId, text, list, div, fs){
		
	var img = document.createElement("img");
    img.setAttribute("class", "cursorMao");
    img.setAttribute("style", "vertical-align: bottom; float: right;");
    img.setAttribute("src", "images/icon/icon-apagar.png");
    img.setAttribute("title", "Apagar Colaboradores");
    img.setAttribute("alt", "Apagar Colaboradores");
    img.setAttribute("onclick", "removeItem(\'" + list + "\',\'" + newElementId + "\',\'" + elementId + "\'); showHideElement(\'" + div + "\',\'" + fs + "');");

    //text element
    var textNode = document.createTextNode(text);

    //div element
    var div = document.createElement("div");
    div.setAttribute("id", newElementId);
    div.setAttribute("style", "margin-top: 5.5px;");
    div.appendChild(textNode);
    div.appendChild(img);

    return div;
	
}
	
	
//////////////////////////
//	Show/hide element	//
//////////////////////////
function showHideElement(div, fs){
			
	var fsDiv = jQuery('#'+div);
    if(fsDiv.css('display') == 'none'){
    	fsDiv.css('display', 'inline');
    } else {
    	var fset = jQuery('#'+fs);
    	var size = fset.children().length;
    	if(size == 1){
    		fsDiv.css('display', 'none');
    	}
    }
	
}

	
	