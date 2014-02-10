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


	<html:errors/>
	
	<table width="100%" cellpadding="1" cellspacing="1" style="border:none">
		
		<tr><td class="titulo2">1 - Ecra 1</td></tr>
		<tr><td><jsp:include page="ecra1.jsp" flush="true"/></td></tr>
		
		<tr><td class="titulo2">2 - Ecra 2</td></tr>
		<tr><td><jsp:include page="ecra2.jsp" flush="true"/></td></tr>
		
		<tr><td class="titulo2">3 - Documentos Anexados</td></tr>
		<tr><td><jsp:include page="/ipdms/webflow/anexos.jsp" flush="true"/></td></tr>
		
		<tr><td class="titulo2">4 - Documentos Adicionados</td></tr>
		<tr><td><jsp:include page="/ipdms/webflow/anexosByItem.jsp" flush="true"/></td></tr>
		
		<tr><td class="titulo2">5 - Popup</td></tr>
		<tr><td><jsp:include page="popup.jsp" flush="true"/></td></tr>
	
	</table>

	
	<div class="buttonRow">
		<html:submit property="_eventId_back" value="« Anterior" styleClass="btForm" onclick="webflowAjaxRequest(event);" title="Retroceder ao ecrã anterior"/>
		<html:submit property="_eventId_next" value="Submeter" styleClass="btForm" title="Submeter a informação" onclick="webflowAjaxRequest(event);" />
		<html:submit property="_eventId_cancel" value="Cancelar" styleClass="btFormEscuro" 
					onclick="if( confirmaCancelar() ) ajaxSubmitReferer(event,'${referer}'); else return false;" title="Cancelar a operação"/>
	</div>

</html:form>
</logic:notPresent>

<%-- RESUMO FORA DO WEBFLOW --%>
<logic:present name="resumo_normal">

<c:set var="teste" value="${webflowActionForm}" scope="request"/>

<nested:root name="pubJORAM">

	<html:errors/>

	<table style="width:100%;" cellpadding="1" cellspacing="1" style="border:none;">
	
		<tr><td class="titulo2">1. Ecra 1</td></tr>
		<tr><td><jsp:include page="ecra1.jsp" flush="true"/></td></tr>
		
		<tr><td class="titulo2">2. Ecra 2</td></tr>
		<tr><td><jsp:include page="ecra2.jsp" flush="true"/></td></tr>
		
		<tr><td class="titulo2">3. Documentos Anexados</td></tr>
		<tr><td><jsp:include page="/ipdms/webflow/anexos.jsp" flush="true"/></td></tr>
		
		<tr><td class="titulo2">4. Documentos adicionados</td></tr>
		<tr><td><jsp:include page="/ipdms/webflow/anexosByItem.jsp" flush="true"/></td></tr>
		
		<tr><td class="titulo2">5. Popup</td></tr>
		<tr><td><jsp:include page="popup.jsp" flush="true"/></td></tr>
	
	</table>

</nested:root>	
</logic:present>