<%@ taglib prefix="html" uri="/tags/html"  %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"  %>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
decisao = function (btn) {
	if(btn=='yes') {
		extAjaxRequest('${referer}', '');
	} else {
		return false;
	}
};
</script>


<bean:define id="_resumo" value="true" toScope="request"/>
<logic:notPresent name="resumo_normal">
	<html:form action="applicationFlow" method="post">
		<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">
		<html:errors/>
				
		<table width="100%" cellpadding="1" cellspacing="1" style="border:none">
			<tr><td class="titulo2">1 - Escolher Template</td></tr>
			<tr><td><jsp:include page="formScreen.jsp" flush="true"/></td></tr>
			
			<tr><td class="titulo2">2 - Documentos Gerados</td></tr>
			<tr><td><jsp:include page="anexos.jsp" flush="true"/></td></tr>
			
		</table>
		
		<div class="buttonRow">
			<html:submit property="_eventId_back" value="« Anterior" styleClass="btForm" onclick="webflowAjaxRequest(event);" title="Retroceder ao ecrã anterior"/>
			<html:submit property="_eventId_next" value="Submeter" styleClass="btForm" title="Submeter a informação" onclick="webflowAjaxRequest(event);" />
			<html:button property="_eventId_cancel" value="Cancelar" styleClass="btFormEscuro" onclick="cancelar(event,'Pedidos', 'Deseja cancelar pedido ?',decisao);" title="Cancelar a operação"/>
		</div>
	</html:form>
</logic:notPresent>

<%-- RESUMO FORA DO WEBFLOW --%>
<logic:present name="resumo_normal">
	<c:set var="templateFlow" value="${webflowActionForm}" scope="request"/>	
	<table style="width:100%; border: none; vertical-align: top;" cellpadding="1" cellspacing="1">
		<tr><td class="titulo2">1. Escolher Template</td></tr>
		<tr><td><jsp:include page="formScreen.jsp" flush="true"/></td></tr>
		
		<tr><td class="titulo2">2. Documentos Gerados</td></tr>
		<tr><td><jsp:include page="anexos.jsp" flush="true"/></td></tr>
	</table>
</logic:present>