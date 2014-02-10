<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />

<div class="row" style="padding-top:0px; text-align:left;">

	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1" ><fmt:message key="ipdms.myprocesses.title"/> </td>
		  </tr>
		</tbody>
	</table>					
</div>


<div id="myprocesses"><span class='formfield'><img src="${JS_DIR}/ext/resources/images/default/grid/loading.gif" style="width:16px; height:16px; vertical-align:top;" align="top" title="<fmt:message key='ipdms.ajax.processos.msg'/>" alt="<fmt:message key='ipdms.ajax.processos.msg'/>"><fmt:message key="ipdms.ajax.processos.msg"/></span> </div>

<script>

	//funcao para ir buscar listas de processos/processos a conhecimento
	function loadListprocess(url,div){
		
		new Ajax.Updater( {success: div}, url, 
		   		  {method: 'get'
			   		  , evalScripts: true
			   		  ,onFailure: function(transport){
			   			 console.log('Server side Error : ' + transport.status); 
			   		  }} );
	}
	//metodo seleccionar todos/nenhum checkboxes
	 function Checkboxes(state) {
			
		 	$$('input[type="checkbox"][id^="checkconhec"]').each(function filter(item) {
		     	        {
		         	    item.checked=state
		             	}
		 	});		 
	}   
			
	
	//quando pagina estiver desenhada carregar listas de processos
	Ext.onReady(function(){
	
		loadListprocess('${pageContext.request.contextPath}/myprocesses.do2','myprocesses');
		loadListprocess('${pageContext.request.contextPath}/myprocessesConhecim.do2','myprocessesconhec');
	});
	
</script>

<br/>


<div id="myprocessesconhec"><span class='formfield'><img src="${JS_DIR}/ext/resources/images/default/grid/loading.gif" style="width:16px; height:16px; vertical-align:top;" title="<fmt:message key='ipdms.ajax.processos.msg'/>" alt="<fmt:message key='ipdms.ajax.processos.msg'/>"><fmt:message key="ipdms.ajax.processos.msg"/></span> </div>
