
/************************************************************************************************************
(C) www.dhtmlgoodies.com, March 2006

This is a script from www.dhtmlgoodies.com. You will find this and a lot of other scripts at our website.   

Terms of use:
You are free to use this script as long as the copyright message is kept intact. However, you may not
redistribute, sell or repost it without our permission.

Thank you!

www.dhtmlgoodies.com
Alf Magne Kalleland

************************************************************************************************************/

var enableCache = false;
var jsCache = new Array();

var dynamicContent_ajaxObjects = new Array();
var dynamicContent_urlArray = new Array();

function ajax_showContent(divId,ajaxIndex,url)
{
   document.getElementById(divId).innerHTML = dynamicContent_ajaxObjects[ajaxIndex].response;
   dynamicContent_ajaxObjects[ajaxIndex].response.evalScripts();
   
   if(enableCache){
      jsCache[url] =    dynamicContent_ajaxObjects[ajaxIndex].response;
   }
   dynamicContent_ajaxObjects[ajaxIndex] = false;
}

function ajax_loadContent(divId,url)
{
   
   if(enableCache && jsCache[url]){
      document.getElementById(divId).innerHTML = jsCache[url];
      return;
   }
   
   dynamicContent_urlArray[divId] = url;
   
   var ajaxIndex = dynamicContent_ajaxObjects.length;
   document.getElementById(divId).innerHTML = 'Por favor aguarde...';
   dynamicContent_ajaxObjects[ajaxIndex] = new sack();
   dynamicContent_ajaxObjects[ajaxIndex].requestFile = url;   // Specifying which file to get
   dynamicContent_ajaxObjects[ajaxIndex].onCompletion = function(){ 
   ajax_showContent(divId,ajaxIndex,url); 
   };   // Specify function that will be executed after file has been found
   dynamicContent_ajaxObjects[ajaxIndex].runAJAX();      // Execute AJAX function   
   
   
}

// criada especiamente para a tab-view nao perder as informações apos alteração de ABA
function ajax_loadContent_tab(divId,url)
{

	if ($(divId).innerHTML != '') { 
	
		return true;
	} 

   if(enableCache && jsCache[url]){
      document.getElementById(divId).innerHTML = jsCache[url];
      return;
   }
   
   dynamicContent_urlArray[divId] = url;
   
   var ajaxIndex = dynamicContent_ajaxObjects.length;
   document.getElementById(divId).innerHTML = 'Por favor aguarde...';
   dynamicContent_ajaxObjects[ajaxIndex] = new sack();
   dynamicContent_ajaxObjects[ajaxIndex].requestFile = url;   // Specifying which file to get
   dynamicContent_ajaxObjects[ajaxIndex].onCompletion = function(){ ajax_showContent(divId,ajaxIndex,url); };   // Specify function that will be executed after file has been found
   dynamicContent_ajaxObjects[ajaxIndex].runAJAX();      // Execute AJAX function   
   
   
}

function ajax_parseJs(obj)
{
	var scriptTags = obj.getElementsByTagName('SCRIPT');
	var string = '';
	var jsCode = '';
	for(var no=0;no<scriptTags.length;no++){	
		if(scriptTags[no].src){
	        var head = document.getElementsByTagName("head")[0];
	        var scriptObj = document.createElement("script");
	
	        scriptObj.setAttribute("type", "text/javascript");
	        scriptObj.setAttribute("src", scriptTags[no].src);  	
		}else{
			if(navigator.userAgent.toLowerCase().indexOf('opera')>=0){
				jsCode = jsCode + scriptTags[no].text + '\n';
			}
			else
				jsCode = jsCode + scriptTags[no].innerHTML;	
		}
		
	}

	if(jsCode)ajax_installScript(jsCode);
}


function ajax_installScript(script)
{		
    if (!script)
        return;		
    if (window.execScript){        	
    	window.execScript(script)
    }else if(window.jQuery && jQuery.browser.safari){ // safari detection in jQuery
        window.setTimeout(script,0);
    }else{        	
        window.setTimeout( script, 0 );
    } 
}	
	
	
function evaluateCss(obj)
{
	var cssTags = obj.getElementsByTagName('STYLE');
	var head = document.getElementsByTagName('HEAD')[0];
	for(var no=0;no<cssTags.length;no++){
		head.appendChild(cssTags[no]);
	}	
}