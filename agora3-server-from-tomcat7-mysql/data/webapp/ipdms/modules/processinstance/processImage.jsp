<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.processo.imagemWorkflow" var="imagemWorkflow" />
<fmt:message key="ipdms.modules.processinstance.running" var="running" />
<fmt:message key="ipdms.modules.processinstance.suspended" var="suspended" />
<fmt:message key="ipdms.modules.processinstance.ended" var="ended" />
<fmt:message key="ipdms.modules.processinstance.colaboradores" var="colaboradores" />
<fmt:message key="ipdms.modules.processinstance.atencao" var="atencao" />
<fmt:message key="ipdms.modules.processinstance.colaboradoresMsg" var="colaboradoresMsg" />

<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/ipdms/themes" />
<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />

<link rel=stylesheet type=text/css href='${THEMES_DIR}/jbpm/processimage.css' />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/column-tree.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/CustomToolbar.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/ColumnNodeUI.css" />

<script type="text/javascript" src='${JS_DIR}/jquery/jquery-1.7.2.js' ></script>
<script type="text/javascript" src='${JS_DIR}/jquery/jquery.contextmenu.r2.js' ></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ColumnNodeUI.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ConfirmCancel.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/Window_Iframe.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/IPDMSTreePanel.js"></script>


<logic:present name="nodes">

	<%-- Carrega a imagem do processo --%>               
    <img alt="${imagemWorkflow}" src="loadworkflowprocessimage.do2?numero=${servicoOnline.numeroConteudo}"/>
                     
	<logic:iterate id="node" name="nodes">
	 		       		
			<%--set the positional and size values from token position --%>
			<c:set var="x" value="${node.x}" />                   
			<c:set var="y" value="${node.y}"/>
			<c:set var="width" value="${node.width}"/>
			<c:set var="height" value="${node.height}"/>	                                
	                    
	        <%-- The state area --%>
			<c:set var="style" value="top:${y - 14}px;left:${x}px;width:${width - 1}px;"/>
	        <c:set var="styleClass" value="pboxc"/>
	        <c:if test="${node.end}"><c:set var="styleClass" value="pboxc_e"/></c:if>
	        <c:if test="${node.suspended}"><c:set var="styleClass" value="pboxc_s"/></c:if>
	        <div style="${style}" class="pboxce">
		      	<div class="${styleClass}">
			       	<c:if test="${!node.end && !node.suspended}"><c:set var="status" value="${running}"/></c:if>
			        <c:if test="${!node.end && node.suspended}"><c:set var="status" value="${suspended}"/></c:if>
			        <c:if test="${node.end}"><c:set var="status" value="${ended}"/></c:if>
			        <c:if test="${node.entries == 1}">
						<a class="pboxc_e" href="">${status}</a>
					</c:if>
					<c:if test="${node.entries > 1}">
						<a class="pboxc_e" href="">${status} (${node.entries})</a>
					</c:if>		           
				</div>					
			</div>
			
			<%-- The task area --%>
	        <c:set var="style" value="top:${y}px;left:${x}px;width:${width - 3}px;height:${height - 3}px;"/>
	        <c:set var="styleClass" value="pbox"/>
	        <c:if test="${node.end}"><c:set var="styleClass" value="pbox_e"/></c:if>
	        <c:if test="${node.suspended}"><c:set var="styleClass" value="pbox_s"/></c:if>
	        <c:if test="${node.entries == 0}"><c:set var="styleClass" value="pbox_ns"/></c:if>
	        <div style="position: absolute; ${style}" class="${styleClass} jpa">
	        	<input type="hidden" id="taskname" name="taskname" value="${node.name}">
	        </div>	      
	       	              	                      
	</logic:iterate>        
           
</logic:present>   



<div id="result"></div>


<div id="colaboradores" style="visibility: hidden;"></div>	
<input type="hidden" id="idColaboradores" name="idColaboradores" value="">	

<!-- DIV COM O MENU DE CONTEXTO PARA ELEMENTOS NÃO ACTIVOS	-->
<div class="contextMenu" id="menuClosed">
	<ul>
    	<li id="reabrir"><fmt:message key="ipdms.menucontexto.reabrir" /></li>     
    </ul>
</div>

<!-- DIV COM O MENU DE CONTEXTO PARA ELEMENTOS ACTIVOS	-->
<div class="contextMenu" id="menuOpen">
	<ul>
    	<li id="terminar"><fmt:message key="ipdms.menucontexto.terminar" /></li>
      	<li id="reassignar"><fmt:message key="ipdms.menucontexto.reassignar" /></li>     
    </ul>
</div>





<script type="text/javascript">

	//create a new html element
	function createElement(item){
		
		var parentDiv = item.parentElement;
		var itemStyle = item.style.cssText;
		var itemClass = item.className;
		item.style.removeAttribute('position');
		item.style.setAttribute('background-color','white');
		item.style.setAttribute('filter','alpha(opacity=1)');				
		
		//create new div element
		var div = document.createElement("div");							
		div.setAttribute("style", itemStyle);
		div.setAttribute("class", itemClass);				
		
		//add item to new div
		div.appendChild(item);
		
		//add new div to parent
		parentDiv.appendChild(div);		
	
	}

</script>

<script type="text/javascript">	
				
	jQuery.noConflict();
		
	//jQuery ContextMenu js
	jQuery(document).ready(function($){		
				
		//hide div with the context menu options
		$('div.contextMenu').hide();
				
		//context menu for active elements
		$('div.pbox').contextMenu('menuOpen', {
			bindings: {				
				'terminar': function(t) {					
		        	terminar();
					//executeAction('${pageContext.request.contextPath}/manipulateInstance.do2?method=terminarEtapa&nid=${nid}','result');
		         },
		         'reassignar': function(t) {		        	
		        	 reassignar();		        	 		            
		         }
		    }
		 });
		
		
		//context menu for close elements
		$('div[class*="pbox_"]').contextMenu('menuClosed', {
			bindings: {				
				'reabrir': function(t) {
					var node = t.children[0].value;
					reabrir(node);					
		         }
		    }
		 });
		
		
		/* IE browser only */
		//return -1 if the search string is not found
		var found = navigator.userAgent.indexOf('MSIE'); 
		var isIE = found != -1 ? true : false;
		if(isIE){			
			$$('div.jpa').each(function(item){
				createElement(item);						
			});			
		}
		
	});
	
</script>

<script type="text/javascript">

	//executa o pedido Ajax
	function executeAction(url, div){
		new Ajax.Updater( {success: div}, url,  {method: 'get', evalScripts: true} );		
	}

	//executa o pedido Ajax
	function executeActionWithParams(action, div, params){		
		var url = action + '?' + params;
		executeAction(url, div);
	}
			
	//popup that show all users
	function reassignar() {
		var action = "${pageContext.request.contextPath}/ajaxListOrganicaWithColaboradores.do2";
		paramts = "valuePlaceOlder=idColaboradores";
		paramts += "&descPlaceOlder=colaboradores";
		paramts += "&window=winchoose&multiple=true";		

		winCol = ExtWindow('${colaboradores}', action, paramts, 'ext');
		winCol.on('close', function( p ) {
							
			var cols = $('idColaboradores').value;
			if(cols != ''){				
				//Execute Ajax request with the selected users
				var params = 'method=reAssignarEtapa';
				params += '&nid=${nid}';
				params += '&idColaboradores='+cols;
				params += '&numero=${servicoOnline.numeroConteudo}';
				executeActionWithParams('${pageContext.request.contextPath}/manipulateInstance.do2', 'result', params);
			} else {
				showWarningMessage('${atencao}', '${colaboradoresMsg}');
			}			
								            
		});
		
	}
	
	//popup that show all users
	function reabrir(node) {
		var action = "${pageContext.request.contextPath}/ajaxListOrganicaWithColaboradores.do2";
		paramts = "valuePlaceOlder=idColaboradores";
		paramts += "&descPlaceOlder=colaboradores";
		paramts += "&window=winchoose&multiple=true";		

		winCol = ExtWindow('${colaboradores}', action, paramts, 'ext');
		winCol.on('close', function( p ) {
							
			var cols = $('idColaboradores').value;
			if(cols != ''){
				//Execute Ajax request with the selected users
				var params = 'method=reabrirEtapa';
				params += '&numero=${servicoOnline.numeroConteudo}';
				params += '&etapa=' + node;
				params += '&idColaboradores='+cols;				
				executeActionWithParams('${pageContext.request.contextPath}/manipulateInstance.do2', 'result', params);									
			} else {
				showWarningMessage('${atencao}', '${colaboradoresMsg}');
			}			
								            
		});
		
	}
	
	//
	function terminar() {
		var params = 'method=terminarEtapa';
		params += '&nid=${nid}';
		params += '&numero=${servicoOnline.numeroConteudo}';
		executeActionWithParams('${pageContext.request.contextPath}/manipulateInstance.do2', 'result', params);		
	}
	
	
	
	function showWarningMessage(title, msg){
		
		Ext.MessageBox.show({
			title: title,
			msg: msg,
			buttons: {yes:'Ok'},
			modal : true,
			closable: false,
			icon: Ext.MessageBox.WARNING
		});	
		
	}

</script>

