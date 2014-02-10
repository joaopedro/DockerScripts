<%@ taglib prefix="html" uri="/tags/html"%>

<SCRIPT src='${pageContext.request.contextPath}/ipdms/js/swf-ajax-ext.js' type="text/javascript"></script>


<html:form action="applicationFlow" method="post">
<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">

	<html:errors/>
	<br/><span class="textoBold">Fim do SubFlow Dummy</span><br /><br /> 
	<br/><br/><br/><br/>
	<span class="formfield">Foi criado o servico online: ${subFlowTesteFlowBean.servicoOnline.idProcessoEntidade}</span>
	<br/><br/><br/><br/>
	<div class="webflow_formdiv" > 
		<div class="row formlabel_sf">
			<html:submit property="_eventId_next" value="Seguinte »" styleClass="btForm" onclick="webflowAjaxRequest(event);" />				
		</div>
</div>
</html:form>