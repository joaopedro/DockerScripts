function catcalc()
{

}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_showHideLayers() { //v6.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}

function flevDivPositionValue(sDiv, sProperty) { // v2.1, Marja Ribbers-de Vroed, FlevOOware
	this.opera = (window.opera); // Opera 5+
	this.ns4 = (document.layers); // Netscape 4.x
	this.ns6 = (document.getElementById && !document.all && !this.opera); // Netscape 6+
	this.ie = (document.all);  // Internet Explorer 4+
    var sValue = ""; docObj = eval("MM_findObj('" + sDiv + "')"); if (docObj == null) {return 0;}
	if ((sProperty == "left") || (sProperty == "top")) {
		if (!this.ns4) {docObj = docObj.style;} 
		sValue = eval("docObj." + sProperty);
		if ((this.ie) && (sValue == "")) { // IE (on PC) bug with nested layers
			if (sProperty == "top") { sValue = eval(sDiv + ".offsetTop"); } 
			else { sValue = eval(sDiv + ".offsetLeft"); } 
		};
	}
	else {
		if (this.opera) {
			docObj = docObj.style;
			if (sProperty == "height") { sValue = docObj.pixelHeight; } 
			else if (sProperty == "width") { sValue = docObj.pixelWidth; } 
		}
		else if (this.ns4) {sValue = eval("docObj.clip." + sProperty);} 
		else if (this.ns6) {sValue = document.defaultView.getComputedStyle(docObj, "").getPropertyValue(sProperty); } 
	    else if (this.ie) { 
			if (sProperty == "width") { sValue = eval(sDiv + ".offsetWidth"); } 
			else if (sProperty == "height") { sValue = eval(sDiv + ".offsetHeight"); } 
		}
   	}
	sValue = (sValue == "") ? 0 : sValue; 
	if (isNaN(sValue)) { if (sValue.indexOf('px') > 0) { sValue = sValue.substring(0,sValue.indexOf('px')); } } 
	return parseInt(sValue); 
}

function flevPersistentLayer() { // v3.3, Marja Ribbers-de Vroed, FlevOOware
	var sD = arguments[0], oD = eval("MM_findObj('" + sD + "')"), iWW, iWH, iSX, iSY, iT = 10, sS = "";
	if (!document.layers) {oD = oD.style;}
	if (oD.tmpTimeout != null) {clearTimeout(oD.tmpTimeout);}
	var sXL = arguments[1], sXC = arguments[2], sXR = arguments[3], sYT = arguments[4], sYC = arguments[5], sYB = arguments[6];
	var iS = (arguments.length > 7) ? parseInt(arguments[7]) : 0, iPx = (arguments.length > 8) ? parseInt(arguments[8]) : 0;
	if (window.innerWidth) { // NS4, NS6 and Opera
		var oW = window; iWW = oW.innerWidth; iWH = oW.innerHeight; iSX = oW.pageXOffset; iSY = oW.pageYOffset; }
	else if (document.documentElement && document.documentElement.clientWidth) { // IE6 in standards compliant mode
		var oDE = document.documentElement; iWW = oDE.clientWidth; iWH = oDE.clientHeight; iSX = oDE.scrollLeft; iSY = oDE.scrollTop; }
	else if (document.body) { // IE4+
		var oDB = document.body; iWW = oDB.clientWidth; iWH = oDB.clientHeight; iSX = oDB.scrollLeft; iSY = oDB.scrollTop; }
	else {return;}
	var iCX = iNX = flevDivPositionValue(sD, 'left'), iCY = iNY = flevDivPositionValue(sD, 'top');
	if (sXL != "") {iNX = iSX + parseInt(sXL);} 
	else if (sXC != "") {iNX = Math.round(iSX + (iWW/2) - (flevDivPositionValue(sD, 'width')/2));}
	else if (sXR != "") {iNX = iSX + iWW - (flevDivPositionValue(sD, 'width') + parseInt(sXR));}
	if (sYT != "") {iNY = iSY + parseInt(sYT);}
	else if (sYC != "") {iNY = Math.round(iSY + (iWH/2) - (flevDivPositionValue(sD, 'height')/2));}
	else if (sYB != "") {iNY = iSY + (iWH - flevDivPositionValue(sD, 'height') - parseInt(sYB));}
	if ((iCX != iNX) || (iCY != iNY)) {
		if (iS > 0) {
			if (iPx > 0) { iT = iS;
				var iPxX = iPx, iPxY = iPx, iMX = Math.abs(iCX - iNX), iMY = Math.abs(iCY - iNY);
				// take care of diagonal movement
				if (iMX < iMY) {iPxY = (iMX != 0) ? ((iMY/iMX)*iPx) : iPx;}
				else {iPxX = (iMY != 0) ? ((iMX/iMY)*iPx) : iPx;}
				if (iPxX >= iMX) {iPxX = Math.min(Math.ceil(iPxX), iPx);}
				if (iPxY >= iMY) {iPxY = Math.min(Math.ceil(iPxY), iPx);}
				// temporary X/Y coordinates
				if ((iCX < iNX) && (iCX + iPxX < iNX)) {iNX = iCX + iPxX;}
				if ((iCX > iNX) && (iCX - iPxX > iNX)) {iNX = iCX - iPxX;}
				if ((iCY < iNY) && (iCY + iPxY < iNY)) {iNY = iCY + iPxY;}
				if ((iCY > iNY) && (iCY - iPxY > iNY)) {iNY = iCY - iPxY;} }
			else { 
				var iMX = ((iNX - iCX) / iS), iMY = ((iNY - iCY) / iS); 
				iMX = (iMX > 0) ? Math.ceil(iMX) : Math.floor(iMX); iNX = iCX + iMX; 
				iMY = (iMY > 0) ? Math.ceil(iMY) : Math.floor(iMY); iNY = iCY + iMY; } }
		if ((parseInt(navigator.appVersion)>4 || navigator.userAgent.indexOf("MSIE")>-1) && (!window.opera)) {sS="px";}
		if (iMX != 0) {eval("oD.left = '" + iNX + sS + "'");}
		if (iMY != 0) {eval("oD.top = '" + iNY + sS + "'");} }
	var sF = "flevPersistentLayer('" + sD + "','" + sXL + "','" + sXC + "','" + sXR + "','" + sYT + "','" + sYC + "','" + sYB + "'," + iS + "," + iPx + ")";
	oD.tmpTimeout = setTimeout(sF,1000);
}

function flevInitPersistentLayer() { // v3.3, Marja Ribbers-de Vroed, FlevOOware
	if (arguments.length < 8) {return;}
	var sD = arguments[0]; if (sD == "") {return;}
	var	oD = eval("MM_findObj('" + sD + "')"); if (!oD) {return;}
	var iCSS = parseInt(arguments[1]);
	var sXL = arguments[2], sXC = arguments[3], sXR = arguments[4], sYT = arguments[5], sYC = arguments[6], sYB = arguments[7];
	var iS = (arguments.length > 8) ? parseInt(arguments[8]) : 0, iPx = (arguments.length > 9) ? parseInt(arguments[9]) : 0;
	if (iCSS != 0) { if (!document.layers) {oD = oD.style;} sXL = parseInt(oD.left), sYT = parseInt(oD.top);}
	var sF = "flevPersistentLayer('" + sD + "','" + sXL + "','" + sXC + "','" + sXR + "','" + sYT + "','" + sYC + "','" + sYB + "'," + iS + "," + iPx + ")";
	eval(sF);
}
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
