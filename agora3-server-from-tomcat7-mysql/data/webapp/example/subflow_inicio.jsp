<%@ taglib prefix="html" uri="/tags/html"%>

<SCRIPT src='${pageContext.request.contextPath}/ipdms/js/swf-ajax-ext.js' type="text/javascript"></script>

<html:form action="applicationFlow" method="post">
<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">

	<html:errors/>
	<br/><span class="textoBold">Inicio SubFlow Dummy</span><br /><br /> 
	<br/><br/>

	<html:text property="ecra1.descricao"
												styleId="ecra1.descricao"
												errorStyleClass="webflow_erro"
												size="80" maxlength="250"
												/>
	<br/><br/>
	<span class="formfield">Irá agora ser criado um servicoOnline dummy</span>
	<br/><br/><br/><br/>
	<div class="webflow_formdiv" > 
		<div class="row formlabel_sf">
			<html:submit property="_eventId_cancelsub" value="Cancelar" styleClass="btFormEscuro" onclick="webflowAjaxRequest(event);" />
			<html:submit property="_eventId_next" value="Seguinte »" styleClass="btForm" onclick="webflowAjaxRequest(event);" />				
		</div>
</div>
</html:form>