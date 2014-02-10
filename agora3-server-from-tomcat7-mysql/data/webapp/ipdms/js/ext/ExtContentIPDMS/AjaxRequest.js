//funcões que executam uma chamada Ajax, utiliza o Ajax.request do ExtJS
//é passada a div e a action a executar
function loadListprocess(div, action){
		
	Ext.Ajax.timeout=0;
	Ext.Ajax.request({
		url: action, 
	  	success: function(response, opts) {
	 	   $(div).innerHTML=response.responseText;
	   	},
	   	failure: function(response, opts) {
	       console.log('Server side Error : ' + response.status);
	   	}
	});

}


//Recebe a div, a action e um parametro.
//O url é construido com o valor da action + o parametro passado
function loadListprocessWithParameters(div, action, param){
	
	var url = action + '?' + param;
	
	//$(div).innerHTML="<br><span class='formfield'><img src='${JS_DIR}/ext/resources/images/default/grid/loading.gif' style='width:16px; height:16px; vertical-align:top;' alt='A Carregar' title='A Carregar' />A carregar resultado...</span> </div>";		
	Ext.Ajax.timeout=0;
	Ext.Ajax.request({
		url: url,
		success: function(response, opts) {
	   	  	$(div).innerHTML=response.responseText;
	   	},
	   	failure: function(response, opts) {
	   	  	console.log('Server side Error : ' + response.status);
	   	}
	});	
	
}


//Recebe a div e o evento.
//Do evento retiramos a action e os parametros, se existirem,
//que serão depois convertidos no url que será executado
function loadListprocessWithEvent(div, event){
	
	var params = Event.element(event);
	var form = params.form;
	var p = Form.serialize(form);
	var action = form.action;
	
	
	var url = action + '?' + p;
	
	//$(div).innerHTML="<br><span class='formfield'><img src='${JS_DIR}/ext/resources/images/default/grid/loading.gif' style='width:16px; height:16px; vertical-align:top;' alt='A Carregar' title='A Carregar' />A carregar resultado...</span> </div>";		
	Ext.Ajax.timeout=0;
	Ext.Ajax.request({
		url: url,
		success: function(response, opts) {
	   	  	$(div).innerHTML=response.responseText;
	   	},
	   	failure: function(response, opts) {
	   	  	console.log('Server side Error : ' + response.status);
	   	}
	});	
	
}


 	
  
 
 
 