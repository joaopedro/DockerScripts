<%@ taglib prefix="html" uri="/tags/html"  %>
<%@ taglib prefix="nested" uri="http://struts.apache.org/tags-nested"  %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"  %>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<SCRIPT src='${pageContext.request.contextPath}/ipdms/js/swf-ajax-ext.js' type="text/javascript"></script>

<bean:define id="_resumo" value="true" toScope="request"/>

<logic:notPresent name="resumo_normal">
	<html:form action="applicationFlow" method="post">
		
		<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">	
	
		<c:set var="pessoa" value="${pessoa.pessoa}" scope="request"/>
				
		<html:errors/>
		
		<table width="100%" cellpadding="1" cellspacing="1" style="border:none">
			<tr><td class="titulo2">Pessoa</td></tr>			
			<tr><td><jsp:include page="pessoa.jsp" /></td></tr>		
		</table>
			
		<div class="buttonRow">
			<html:submit property="_eventId_back" value="« Anterior" styleClass="btForm" onclick="webflowAjaxRequest(event);" title="Retroceder ao ecrã anterior"/>
			<html:submit property="_eventId_next" value="Submeter" styleClass="btForm" title="Submeter a informação" onclick="webflowAjaxRequest(event);" />
			<html:button property="_eventId_cancel" value="Cancelar" styleClass="btFormEscuro" styleId="foo" onclick="cancelar(event,'Pedidos', 'Deseja cancelar pedido ?',decisao);" title="Cancelar a operação"/>
		</div>
		
		
	</html:form>
</logic:notPresent>

<%-- RESUMO FORA DO WEBFLOW --%>
<logic:present name="resumo_normal">

	<c:set var="pessoa" value="${webflowActionForm.pessoa}" scope="request"/>
			
	<html:errors/>
	
	<table style="width:100%;" cellpadding="1" cellspacing="1" style="border:none;">
		
		<tr><td class="titulo2">Pessoa</td></tr>
		<tr><td><jsp:include page="pessoa.jsp" flush="true"/></td></tr>
	
	</table>
		
</logic:present>
