<%@ taglib prefix="html" uri="/tags/html"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />

<script type="text/javascript" src='${pageContext.request.contextPath}/ipdms/js/swf-ajax-ext.js'></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ConfirmCancel.js"></script>



<script type="text/javascript">

function decisao(btn){
	if(btn=='yes'){
		ajaxSubmitReferer(evento,'${referer}');
	}
	else {
		return false;
	}

}	
	
</script>


<logic:notPresent name="_resumo" scope="request">
	<html:form action="applicationFlow" method="post" >
		
		<div id='tree-div'></div>	
		
		<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">		
		
		<html:errors/>
		
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="Título">
		  		<span class="textoBold">Formulario do processo Pessoa:</span>
		  	</div>
		  	
		  	<div class="label" style="width: 80%;"></div>
		</div>
		
		<div style="clear:both"></div><br />
				
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; ">
		  		<bean:message key="ipdms.pessoa.nome" locale="locale" /> *
		  	</div>
		  	
		  	<div class="label" style="width: 80%;">
		  		<html:text property="pessoa.nome" styleId="pessoa.nome" errorStyleClass="webflow_erro" size="80" maxlength="80" />
		  	</div>
		</div>
			
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; ">
		  		<bean:message key="ipdms.pessoa.idade" locale="locale" /> 
		  	</div>
		  	
		  	<div class="label" style="width: 80%;">
		  		<html:text property="pessoa.idade" maxlength="40" size="40" />
		  	</div>
		</div>
				
		
		<br /><br />
		 
		<div class="buttonRow">
			<html:submit property="_eventId_next" value="Seguinte »" styleClass="btForm" onclick="webflowAjaxRequest(event);" title="Avançar para o ecrã seguinte"/>
			<html:button property="_eventId_cancel" value="Cancelar" styleClass="btFormEscuro" styleId="foo" onclick="cancelar(event,'Pedidos', 'Deseja cancelar pedido ?',decisao);" title="Cancelar a operação"/>
		</div>
			
		<br/>
	</html:form>

</logic:notPresent>

<%------------------------ RESUMO ------------------------%>
<logic:present name="_resumo" scope="request">

	<div class="row formlabel_sf">
	  	<div class="leftTab label textoBold" style="width: 18%;">
	  		<bean:message key="ipdms.pessoa.nome" locale="locale" /> do Ecrã Pessoa:
	  	</div>
	  		
	  	<div class="label formtext_sf" style="width: 75%;">
	  		${pessoa.nome}
		</div>
	</div>
	
	
	<div class="row formlabel_sf">	
		<div class="leftTab label textoBold" style="width: 18%;">
	  		<bean:message key="ipdms.pessoa.idade" locale="locale" />:
	  	</div>
	  		
	  	<div class="label formtext_sf" style="width: 75%;">
	  		${pessoa.idade}
		</div>
	</div>
	
</div>

<br/>
</logic:present>
