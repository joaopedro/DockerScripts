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
		  		<span class="textoBold">Formulario do processo de formação teste:</span>
		  	</div>
		  	
		  	<div class="label" style="width: 80%;"></div>
		</div>
		
		<div style="clear:both"></div><br />
				
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; ">
		  		<bean:message key="ipdms.ecraFormacao.titulo" locale="locale" /> *
		  	</div>
		  	
		  	<div class="label" style="width: 80%;">
		  		<html:text property="ecraFormacao.titulo" styleId="ecraFormacao.titulo" errorStyleClass="webflow_erro" size="80" maxlength="80" />
		  	</div>
		</div>
		
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; ">
		  		<bean:message key="ipdms.ecraFormacao.descricao" locale="locale" />		  		
		  	</div>
		  	
		  	<div class="label" style="width: 80%;">
		  		<html:text property="ecraFormacao.descricao" styleId="ecraFormacao.descricao" size="80" maxlength="100" />
		  	</div>
		</div>
		
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 18%; ">
		  		<bean:message key="ipdms.ecraFormacao.sistema" locale="locale" />
		  	</div>
		  	
		  	<div class="label" style="width: 79%;">
		  		<html:checkbox property="ecraFormacao.sistema" styleClass="radion" style="border:0;"/>
		  	</div>
		</div>
		
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; ">
		  		<bean:message key="ipdms.ecraFormacao.valor" locale="locale" /> 
		  	</div>
		  	
		  	<div class="label" style="width: 80%;">
		  		<html:text property="ecraFormacao.valor" maxlength="40" size="40" />
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
	  		<bean:message key="ipdms.ecraFormacao.titulo" locale="locale" /> do Ecrã Formação:
	  	</div>
	  		
	  	<div class="label formtext_sf" style="width: 75%;">
	  		${ecraFormacao.titulo}
		</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label textoBold" style="width: 18%;">
	  		<bean:message key="ipdms.ecraFormacao.descricao" locale="locale" /> do Ecrã Formação:
	  	</div>
	  		
	  	<div class="label formtext_sf" style="width: 75%;">
	  		${ecraFormacao.descricao}
		</div>
	</div>
	
	<div class="row formlabel_sf">		
		<div class="leftTab label textoBold" style="width: 18%;">
	  		<bean:message key="ipdms.ecraFormacao.sistema" locale="locale" />:
	  	</div>
	  		
	  	<div class="label formtext_sf" style="width: 75%;">
	  		${ecraFormacao.sistema}
		</div>
	</div>
	
	<div class="row formlabel_sf">	
		<div class="leftTab label textoBold" style="width: 18%;">
	  		<bean:message key="ipdms.ecraFormacao.valor" locale="locale" />:
	  	</div>
	  		
	  	<div class="label formtext_sf" style="width: 75%;">
	  		${ecraFormacao.valor}
		</div>
	</div>
	
</div>

<br/>
</logic:present>
