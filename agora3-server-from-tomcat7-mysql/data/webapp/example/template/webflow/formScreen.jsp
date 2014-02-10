<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>


<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/ConfirmCancel.js"></script>

<script type="text/javascript">

decisao = function (btn) {
	if(btn=='yes') {
		window.location.href = '${referer}';
	} else {
		return false;
	}
};

loadTemplates = function(select) {
	var value = $F(select);
	new Ajax.Updater( {success: 'templates'}, '${pageContext.request.contextPath}/listTemplateDocument.do2',  
						{method: 'get', parameters: 'tipo=' + value, evalScripts: true} );
};

submitForm = function(e) {	

	//affect "templateId" hidden field value with the template choosen
	$$('input[type="radio"]').each(function filter(item) {
		if(item.checked) {			
			$('templateId').value = item.value;
		}		
	});
		
	//affect "selectedIds" hidden field value with the ids selected
	var ids = '';
	$$('input[type="checkbox"]').each(function filter(item) {		
		if(item.id.indexOf('check_') != -1 && item.checked) {			
			ids += item.id.sub("check_","") + ';';
		}
	});
	
	ids = ids.substring(0,ids.lastIndexOf(';'));	
	$('selectedIds').value = ids;
	
	webflowAjaxRequest(e);
	
};

</script>

<logic:notPresent name="_resumo" scope="request">

	<html:errors/>
	
	<div class="row formlabel_sf" style="margin-bottom:40px;">
		<div class="leftTab label" style="width: 10%; "><fmt:message key="ipdms.instrucao.tipotemplate" /> *</div>
		<div class="label" style="width: 85%;">
			<select id="tipoTemplate" onchange="loadTemplates(this);">
				<option value=""></option>
				<c:forEach var="tipo" items="${templateFlow.tipos}">
					<option value="${tipo.id}" title="${tipo.designacao}">${tipo.designacao}</option>
				</c:forEach>
			</select>
		</div>
	</div>

	<html:form styleId="templateForm" action="applicationFlow" method="post">
		<input type="hidden" id="templateId" name="templateId" value="" />
		<input type="hidden" id="selectedIds" name="selectedIds" value="" />
		<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">	
	
		<fieldset>
			<legend><fmt:message key="ipdms.instrucao.templates" /></legend>
			<div id="templates" style="margin-left: -10px;"></div>
		</fieldset>
		
		<fieldset>
			<legend><fmt:message key="ipdms.instrucao.entidades" /></legend>
				<c:forEach var="entity" items="${templateFlow.entities}">					
					<div style="">
						<c:if test="${entity.value}">
							<input type="checkbox" checked="checked" name="check_${entity.key.id}" id="check_${entity.key.id}" />${entity.key.nome}
						</c:if>
						<c:if test="${!entity.value}">
							<input type="checkbox" name="check_${entity.key.id}" id="check_${entity.key.id}" />${entity.key.nome}
						</c:if>										
					</div>					
				</c:forEach>					
		</fieldset>
						
		<div class="buttonRow">
			<html:submit property="_eventId_next" value="Seguinte »" styleClass="btForm" onclick="submitForm(event);" title="Avançar para o ecrã seguinte"/>
			<html:button property="_eventId_cancel" value="Cancelar" styleClass="btFormEscuro" onclick="cancelar(event,'Pedidos', 'Deseja cancelar pedido ?',decisao);" title="Cancelar a operação"/>
		</div>		
	</html:form>
	
</logic:notPresent>


<%------------------------ RESUMO ------------------------%>
<logic:present name="_resumo" scope="request">

	<div class="row formlabel_sf">
	  	<div class="leftTab label textoBold" style="width: 18%;">
	  		<fmt:message key="ipdms.instrucao.template" />
	  	</div>
	  		
	  	<div class="label formtext_sf" style="width: 75%;">
	  		${templateFlow.template.titulo}
		</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label textoBold" style="width: 18%;">
	  		<fmt:message key="ipdms.instrucao.entidades" />
	  	</div>
	  		
	  	<div class="label formtext_sf" style="width: 75%;">
	  		<c:forEach var="entity" items="${templateFlow.entities}">
	  			<c:if test="${entity.value}">
	  				${entity.key.nome}
	  				<br/>	
	  			</c:if>											
			</c:forEach>	
		</div>
	</div>
	<br/>
	<br/>
	
</logic:present>


