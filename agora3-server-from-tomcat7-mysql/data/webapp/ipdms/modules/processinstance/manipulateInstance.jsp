<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.modules.processinstance.reabrirProcesso" var="reabrirProcesso" />
<fmt:message key="ipdms.modules.processinstance.fecharProcesso" var="fecharProcesso" />
<fmt:message key="ipdms.modules.processinstance.motivo" var="motivo" />
<fmt:message key="ipdms.forms.cancelar" var="cancelar" />

<script type="text/javascript">

	function executar(valor){
		
		var message = '${reabrirProcesso} ${servicoOnline.idProcessoEntidade}?<br />${motivo}: ';
		var title= '${reabrirProcesso}';
		
		if(valor == 'close'){
			message = '${fecharProcesso} ${servicoOnline.idProcessoEntidade}?<br />${motivo}: ';
			title= '${fecharProcesso}';
		}
		
		Ext.Msg.show({
			title: title,
			msg: message,			
			prompt:true,
			buttons: {ok:'Ok', cancel:'${cancelar}'},
			width:300,			
			fn: function(btn,text){
				
				if(btn == 'ok') {
					var url = "${pageContext.request.contextPath}/manipulateInstance.do2";
					if(valor == "close"){						
						window.location= url + "?method=terminarProcesso&numero="+${servicoOnline.numeroConteudo} + "&motivo=" + text;
					} else if(valor == "reopen"){
				  	 	window.location= url + "?method=reabrirProcesso&numero="+${servicoOnline.numeroConteudo} + "&motivo=" + text;;
					}					
				}
				
			},
			animEl: 'elId',
			icon: Ext.MessageBox.INFO
		});  
	}

</script>

<div style="padding-left: 16px;">
	
	<c:if test="${servicoOnline.dataTerminus == null}">
		<input type="button" class="btForm" value="${fecharProcesso}" title="${fecharProcesso}" styleId="fecharButton" 
			onclick="executar('close');"/>		
	</c:if>
	<c:if test="${servicoOnline.dataTerminus != null}">
		<input type="button" class="btForm" value="${reabrirProcesso}" title="${reabrirProcesso}" styleId="reabrirButton" 
			onclick="executar('reopen');"/>
	</c:if>
	
		
</div>

<div style="position: relative; top: 0; left: -10;">
	<logic:present name="imagebei">
		<jsp:include page="/ipdms/modules/processinstance/processImageBEI.jsp" />
	</logic:present>
	<logic:notPresent name="imagebei">
		<jsp:include page="/ipdms/modules/processinstance/processImage.jsp" />
	</logic:notPresent>
	
</div>


