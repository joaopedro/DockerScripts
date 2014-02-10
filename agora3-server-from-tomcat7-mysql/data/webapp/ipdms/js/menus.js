  var listaId = new Array();
  
  var linkPressed=null;

	function findPosY(obj) {
	  var curtop = 0;

	  if(obj.offsetParent) {
	    while(1) {
	      curtop += obj.offsetTop;
	      if(!obj.offsetParent)
	        break;
	      obj = obj.offsetParent;
	    }
	  } else if(obj.y) {
	    curtop += obj.y;
	  }

	  return curtop;
	}


  //////////////////////////////////////////////
  //esconder, fechar todas as opccoes de menu //
  //////////////////////////////////////////////
  function hideEverything()
  {
	  var i = 0;
	  for (i = 0; i < listaId.length; i++)
		document.getElementById("linhamenu" + listaId[i]).style.display = "none";  
  }
  
  /////////////////////  
  // Eliminar cookies//
  /////////////////////
  function deleteMenusCookie(cookieName) 
  {
    var exp = new Date();
    exp.setTime (exp.getTime() - 1000000000);  // This cookie is history (changed -1 to make it previous time)
    var cval = GetCookie (cookieName);

    document.cookie =cookieName + "=" + GetCookie (cookieName) + "; expires=" + exp.toGMTString();
    
   }
  
  ///////////////////////////////////////////////////
  //Ir buscar todos os elementos expandidos/abertos//
  ///////////////////////////////////////////////////
  function getOpenItens()
  {
	var oItens = "";
	var i = 0;
	for (i = 0; i < listaId.length; i++) {
		if (document.getElementById('linhamenu' + listaId[i]).style.display != "none")
			oItens += "&" + listaId[i];
	}

	return oItens;
  } 
  
  //////////////////////////////////////////////////////////////////////////////////////////////////
  //Guardar elemento(link final) e respectivos grupo/subgrupo, ex: titulo-link-2-1-1-1, 2-1-1, 2-1//
  //////////////////////////////////////////////////////////////////////////////////////////////////
  function getCurrentItems(el)
  {

	var link= el.substring("titulo-link".length)//extrair titulo-link da string
	var liId= link.substring(0,link.lastIndexOf('-'));//extrair a partir do ultimo '-' para ficarmos com id da linhamenu correspondente    
	var oItens = "&"+link;//guardar id do titulo-link na 1ª posição
	var i = 0;	
	
	for (i = 0; i < listaId.length; i++) {
		if ('linhamenu' + listaId[i]== 'linhamenu' + liId){
			//alert("entrou");
			oItens += "&" + listaId[i];
			liId=liId.substring(0,liId.lastIndexOf('-'));
			i=0;//voltar a pesquisar no nivel acima
		}
	}
	return oItens;
  }
  
  /////////////////////////////////////////
  //cookie para items abertos: [+] / [-] //
  /////////////////////////////////////////
  function setMenuCookie()
  {

	deleteMenusCookie('menuPos');
    var expdate = new Date (); 
    expdate.setTime(expdate.getTime() + (24 * 60 * 60 * 1000 * 365)); 
   
	SetCookie ("menuPos", getOpenItens(), expdate, cookiePath);	
  }
  
  ///////////////////////////////////////////////////////
  //cookie para item seleccionado: titulo-link-x-x-x.. //
  ///////////////////////////////////////////////////////
  function setMenuCookieCurrent(el)
  {
	  
	deleteMenusCookie('menuCur');
    var expdate = new Date (); 
    expdate.setTime(expdate.getTime() + (24 * 60 * 60 * 1000 * 365));     
   
    SetCookie ("menuCur", getCurrentItems(el), expdate,cookiePath);   
  }
  
  
  function 	addUnloadEvent(func){
		var onunload = window.onunload;
		
		if (typeof window.onunload != 'function') {
			window.onunload = func;
		} else {
			window.onunload = function() {
				onunload();
				func();
			}
		}
	}  
  
  addUnloadEvent( function() {setMenuCookie()});
  
  ////////////////////////
  //ao carregar a pagina//
  ////////////////////////
  Behaviour.addLoadEvent( function() { 
		var all = document.all || document.getElementsByTagName('*');
		for (var i in all){
		  	var element = all[i];
		  	if (element && element.id && typeof(element.id)=='string' && element.id.indexOf('linhamenu') == 0){
		 		var aux = element.id.substring("linhamenu".length);
		 		listaId.push(aux);
		  	}
		}
		//mostrar opccoes//
	  	hideEverything();
		var menuPosStr = GetCookie("menuPos");
	  	if( menuPosStr != null )//se houver cookie
	  	{
			var arrMenus = menuPosStr.split("&");
			for(i=1; i<arrMenus.length; i++) {
				var element = document.getElementById("linhamenu" + arrMenus[i]);
				if(element) {
					element.style.display = "block";
					element.style.visibility = "visible";
					$('img'+arrMenus[i]).src = cookiePath+'/images/button/menosMenu.png';
				}
			}
		}
	  	
	  	////////////////////////////////////////////////////
	  	//colocar cor na hierarquia da opcção seleccionada//
	  	////////////////////////////////////////////////////
	  	//className : simboloMenu/textoMenu->cor preta//////
	  	//className : simboloMenu1/textoMenu1->cor vermelho/
	  	////////////////////////////////////////////////////
	  	
	  	var menuCurPos = GetCookie('menuCur');
	  	if( menuCurPos != null )//se houver cookie
	  	{
			var colMenus = menuCurPos.split("&");//partir cookie//
			
		 //elementos cuja style classe é necessario alterar para mudar as cores do texto do link e simbolo
		  if($('titulo-link'+colMenus[1])){
			  
			var elemFinalLink= $('titulo-link'+colMenus[1]).parentNode;//link final
			var elemSimbolo   = Element.previous($('titulo-link'+colMenus[1]).parentNode);//simbolo ' »  
						
			for(i=2; i<colMenus.length; i++) {//comecar na posicao 2 porque a 1 posicao contem o id do link final ex.1-1-1-4
					
				var element1 = document.getElementById("linhamenu" + colMenus[i]);
				if(element1) {
					 newImPath=Element.previous($('titulo' + colMenus[i]));//caminho para logotipo.
					 if(newImPath.className!='simboloMenu')					 
					 //mudar cor de logotipo 				  
						 $('icon'+ colMenus[i]).src=$('icon'+ colMenus[i]).src.replace("preto","vermelho");
						 else//estamos num elemento com id: titulo-XXXX sem logotipo mas sim com o simbolo '»'
					    	Element.previous($('titulo' +colMenus[i])).className="simboloMenu1";
					  
					 $('titulo' + colMenus[i]).className="textoMenu1";
				}
			}
			
			////////////////////////////////////////////////////////////////////////////////////
			////mudar cor de texto e simbolo do LINK final  ex: linha '» Gestão Orgânica' //////
			////ou caso seja um link de modulo vai ter o icon administrativo atras        //////
			////////////////////////////////////////////////////////////////////////////////////
			var parentElemHeight;
			if(elemSimbolo.className==''){
				//se o elemento nao tiver classname então temos icone atras, e temos de mudar cor para vermelho
				$('icon'+ colMenus[1]).src=$('icon'+ colMenus[1]).src.replace("preto","vermelho");
				parentElemHeight=$('icon'+ colMenus[1]).clientHeight;
			}else{//neste caso temos o simbolo '»' e é so mudar a classname para alterar para vermelho
				elemSimbolo.className="simboloMenu1";
				parentElemHeight=elemSimbolo.clientHeight;}
			//colocar o texto do link final a vermelho
			elemFinalLink.className="textoMenu1";
		}
	  	}
	
	////////////////////////////////////////////////////////
	//Posicionar a scrollbar de acordo com link carregado///
	////////////////////////////////////////////////////////
	if(elemSimbolo){ 	
	//posicao eixo Y do elemento em relacao a window
	var elemyPos= findPosY(elemSimbolo.parentNode);
	//altura do cabecalho
	var headerHeight=$('DHTMLSuite_paneContentnorth').clientHeight;
	//altura do div que contem menu
	var menuDivHeight=$('DHTMLSuite_paneContentwest').clientHeight;
	$('DHTMLSuite_paneContentwest').scrollTop=elemyPos-headerHeight-menuDivHeight/2;	
	}
	});

	  
	 
