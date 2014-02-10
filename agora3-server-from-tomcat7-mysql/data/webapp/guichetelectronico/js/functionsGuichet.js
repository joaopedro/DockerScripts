var menuids=["menuPrincipal"]; //Enter id(s) of menuPrincipal UL menus, separated by commas

//stop events method for ie8 - 
//equivalent to event stoppropagation method
function stopEvent(e) {

	if(!e) var e = window.event;

	//e.cancelBubble is supported by IE -
	// this will kill the bubbling process.
	e.cancelBubble = true;
	e.returnValue = false;

	//e.stopPropagation works only in Firefox.
	if ( e.stopPropagation ) e.stopPropagation();
	if ( e.preventDefault ) e.preventDefault();		

	return false;
}

//check if element is child of another
function isDescendant(parent, child) {
	var node = child.parentNode;
	while (node != null) {
		if (node == parent) {
			return true;
		}
		node = node.parentNode;
	}
	return false;
}

//clear all other ul elements
//depending of hierarchy between them.
function clearUls(element){

	var ultags=document.getElementById(menuids[0]).getElementsByTagName("ul");
	for (var t=0; t<ultags.length; t++){
		//if element is not descendent of ultag[t], then we hide it
		if(!isDescendant(ultags[t],element))
			ultags[t].style.display="none";
		else
			ultags[t].style.display="block";
	}
}

function buildsubmenus(){
	for (var i=0; i<menuids.length; i++){
		var ultags=document.getElementById(menuids[i]).getElementsByTagName("ul");
		for (var t=0; t<ultags.length; t++){
			ultags[t].parentNode.getElementsByTagName("a")[0].className="subfolderstyle";
			if (ultags[t].parentNode.parentNode.id==menuids[i]) //if this is a first level submenu
				ultags[t].style.left=ultags[t].parentNode.offsetWidth+"px"; //dynamically position first level submenus to be width of main menu item
			else //else if this is a sub level submenu (ul)
				ultags[t].style.left=ultags[t-1].getElementsByTagName("a")[0].offsetWidth+"px"; //position menu to the right of menu item that activated it

			//on mouse over li
			ultags[t].parentNode.onmouseover=function(ev){

				clearUls(this.getElementsByTagName("ul")[0]);
				//use stopEvent instead of stopPropagation 
				stopEvent(ev);
				//ev.stopPropagation();
				this.getElementsByTagName("ul")[0].style.display="block";

			};

			//on click hide all li menu elements
			document.onclick=function(){
				var ultags=this.getElementById(menuids[0]).getElementsByTagName("ul");
				for (var t=0; t<ultags.length; t++){
					ultags[t].style.display="none";
				}
			};

		}
		for (var t=ultags.length-1; t>-1; t--){ //loop through all sub menus again, and use "display:none" to hide menus (to prevent possible page scrollbars
			ultags[t].style.visibility="visible";
			ultags[t].style.display="none";
		}
	}
}

if (window.addEventListener){

	window.addEventListener("load", buildsubmenus, false);

}else if (window.attachEvent){

	window.attachEvent("onload", buildsubmenus);
}

//Diminuir e Aumentar tamanho do texto
var min=10;
var max=18;
function increaseFontSize() {
	var p = document.getElementsByTagName('div');
	for(i=0;i<p.length;i++) {
		if(p[i].style.fontSize) {
			var s = parseInt(p[i].style.fontSize.replace("px",""));
		} else {
			var s = 12;
		}
		if(s!=max) {
			s += 1;
		}
		p[i].style.fontSize = s+"px"
	}
}
function decreaseFontSize() {
	var p = document.getElementsByTagName('div');
	for(i=0;i<p.length;i++) {
		if(p[i].style.fontSize) {
			var s = parseInt(p[i].style.fontSize.replace("px",""));
		} else {
			var s = 12;
		}
		if(s!=min) {
			s -= 1;
		}
		p[i].style.fontSize = s+"px";
	}   
}