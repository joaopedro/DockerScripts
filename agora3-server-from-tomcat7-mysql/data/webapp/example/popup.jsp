<%@ taglib prefix="html" uri="/tags/html"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"%>
<%@ taglib prefix="nested" uri="http://struts.apache.org/tags-nested"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="kcms" uri="http://www.sinfic.pt/kcms/tags" %>

<SCRIPT src='${pageContext.request.contextPath}/ipdms/js/swf-ajax-ext.js' type="text/javascript"></script>

<logic:notPresent name="_resumo" scope="request">
<html:form action="applicationFlow" method="post" onsubmit="return false;">
<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">

	<html:errors/>
	<br/>

	<fieldset>
		<legend>Teste de Popup</legend>
		<img src="images/icon/icon-pesquisa.png" onclick="listarTextoSample()" style="border:none; cursor: pointer;" title="Seleccionar um Texto" alt="Seleccionar um Texto" />
		<label for="retorno"><input type="text" id="retorno" name="retorno"></label>
	</fieldset>
	<br/>
	</div>

	<div class="buttonRow">
		<html:submit property="_eventId_back" value="« Anterior" styleClass="btForm" onclick="webflowAjaxRequest(event);" title="Retroceder ao ecrã anterior"/>
		<html:submit property="_eventId_suspend" value="Gravar" styleClass="btForm" onclick="webflowAjaxRequest(event);" title="Gravar informação"/>		
		<html:submit property="_eventId_next" value="Resumo" styleClass="btForm" onclick="webflowAjaxRequest(event);" title="Ver resumo do processo"/>
		<html:submit property="_eventId_cancel" value="Cancelar" styleClass="btFormEscuro"
					onclick="if( confirmaCancelar() ) ajaxSubmitReferer(event,'${referer}');" title="Cancelar a operação"/>
	</div>
</html:form>

</logic:notPresent>

<%------------------------ RESUMO ------------------------%>
<logic:present name="_resumo" scope="request">

<html:errors/>
	<div class="row formlabel_sf">
	  	<div class="leftTab label" style="width: 98%;" title="Ajax Combo">
	  		Resumo do ecrã de teste popup: vazio.
	  	</div>
	</div>

</logic:present>

