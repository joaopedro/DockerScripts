<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="barraTitulo">
	<div class="textoTitulo"><fmt:message key="guichetelectronico.homepage.noticias.titulo" bundle="${guichetBundle}"/></div>
</div>

<script>

	//funcao para ir buscar listas de processos/processos a conhecimento
	function loadNoticias(url,div){
		Ext.Ajax.timeout=0;
		Ext.Ajax.request({
			   url: url,
			   method: 'get',
		   	success: function(response, opts) {
		   		$(div).innerHTML=response.responseText;
		   	},
		   	failure: function(response, opts) {
		   	   console.log('Server side Error : ' + response.status);
		   	}
			});
	
	}
	
	//quando pagina estiver desenhada carregar listas de processos
	Ext.onReady(function(){
	
		loadNoticias('listnoticiasvalidas.do2','noticiasDiv');
	});
	
</script>
			
<div id="areaCentral">
	<div id="noticiasDiv"></div>
</div>
