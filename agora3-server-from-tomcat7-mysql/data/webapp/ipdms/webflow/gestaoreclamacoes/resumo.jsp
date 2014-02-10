<%@ taglib prefix="html" uri="/tags/html"%>

<%@ taglib prefix="nested" uri="http://struts.apache.org/tags-nested"  %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"  %>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:message key='ipdms.so.gestaoAusencias.anexos' var="anexos"/>
<fmt:message key='ipdms.forms.anterior' var="anterior"/>
<fmt:message key='ipdms.forms.anterior.title' var="anteriorTitle"/>
<fmt:message key='ipdms.forms.submit' var="submit"/>
<fmt:message key='ipdms.forms.submit.title' var="submitTitle"/>
<fmt:message key='ipdms.forms.cancelar' var="cancelar"/>
<fmt:message key='ipdms.forms.cancelar.title' var="cancelarTitle"/>
<fmt:message key='ipdms.servicoonline.docsAnexados' var="docsAnexados"/>

<script src='${pageContext.request.contextPath}/ipdms/js/swf-ajax.js' type="text/javascript"></script>


<bean:define id="_resumo" value="true" toScope="request"/>

<logic:notPresent name="resumo_normal">
<html:form	action="applicationFlow"
			method="post">
<!--		onsubmit="return false;" -->

	<input	type="hidden"
			name="_flowExecutionKey"
			value="${flowExecutionKey}" />

	<html:errors />
	
	<table width="100%" cellpadding="1" cellspacing="1" border="0">
		
		<!-- 
		<tr><td class="headline">não há titulo da página início</td></tr>
		 -->
		<tr><td><jsp:include page="inicio.jsp" flush="true"/></td></tr>
		
		<tr><td class="headline">${anexos}</td></tr>
		<tr><td><jsp:include page="/ipdms/webflow/anexos.jsp" flush="true"/></td></tr>
	
	</table>
	
	<div class="buttonRow">
		<html:submit	property="_eventId_prev" title="${anteriorTitle}"
						value="${anterior}" 
						styleClass="btForm" 
						onkeyup="doAjax(event);" 
						onmouseup="ajaxSubmit(event);"/>
						
		<html:submit	property="_eventId_next" title="${submitTitle}"
						value="${submit}" 
						styleClass="btForm" />			<!-- 
						onkeyup="doAjax(event);" 
						onmouseup="ajaxSubmit(event);"	-->
						
		<html:submit	property="_eventId_cancel" title="${cancelarTitle}" 
						value="${cancelar}" 
						styleClass="btFormEscuro"
						onclick="if( confirmaCancelar() ) ajaxSubmitReferer(event,'${referer}'); else return false;"/>
	</div>
</html:form>
</logic:notPresent>

<%-- RESUMO FORA DO WEBFLOW --%>
<logic:present name="resumo_normal">
<c:set var="gestaoReclamacoesFlowBean" value="${webflowActionForm}" scope="request" />
<nested:root name="pubJORAM">

	<html:errors/>

	<table style="width:100%;" cellpadding="1" cellspacing="1" border="0">
			
		<tr><td class="headline">
			<fmt:message key="ipdms.so.gestaoReclamacoes.gestaoReclamacoes"/>
		</td></tr>
		<tr><td><jsp:include page="inicio.jsp" flush="true"/></td></tr>
		
		<tr><td class="headline">${docsAnexados}</td></tr>
		<tr><td><jsp:include page="/ipdms/webflow/anexos.jsp" flush="true"/></td></tr>
		
	</table>
</nested:root>
</logic:present>
