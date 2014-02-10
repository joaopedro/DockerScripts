<%@ taglib uri="/tags/html" prefix="html" %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"%>
<%@ taglib prefix="nested" uri="http://struts.apache.org/tags-nested"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<fmt:message key="ipdms.forms.editar" var="editar" />
<fmt:message key="ipdms.dynamicform.field.ordenar" var="ordenar" />
<fmt:message key="ipdms.forms.eliminar" var="eliminar" />
<fmt:message key="ipdms.dynamicform.field.editarCampoDinamico" var="editarCampoDinamico" />
<fmt:message key="ipdms.dynamicform.field.ordenar.subir" var="subir" />
<fmt:message key="ipdms.dynamicform.field.ordenar.descer" var="descer" />
<fmt:message key="ipdms.dynamicform.field.camposDinamicos" var="camposDinamicos" />
<fmt:message key="ipdms.dynamicform.field.eliminarMsg" var="eliminarMsg" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />
<fmt:message key="ipdms.instrucao.pedido.info.title" var="atencao" />
<fmt:message key="ipdms.forms.anterior" var="anterior" />
<fmt:message key="ipdms.forms.anterior.title" var="anteriorTitle" />
<fmt:message key="ipdms.dynamicform.field.adicionarCampo" var="adicionarCampo" />
<fmt:message key="ipdms.dynamicform.field.adicionarValidador" var="adicionarValidador" />
<fmt:message key="ipdms.dynamicform.field.gravarCampo" var="gravarCampo" />

<div>
	<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
		<tr><td class="titulo1"><fmt:message key="ipdms.dynamicform.form.edit.title" /></td></tr>
		<tr><td class="titulo2"><fmt:message key="ipdms.dynamicform.field.edittableoffields.subtitle" /></td></tr>
	</table>
</div>

<c:set var="newfield" scope="request">${dynamicForm.editTableField.field.id == 0}</c:set>

<form:form modelAttribute="define-dynamicform">
	<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">
	<input type="hidden" id="indexOfField" name="indexOfField" />
	<html:errors/>

	<div class="row formlabel_sf" style="height:30%;">
		<div class="leftTab label" style="width: 20%; " title="<fmt:message key="ipdms.dynamicform.field.fieldid" />" >
			<label for="editTableField.field.siglaId">
				<c:choose>
					<c:when test="${newfield}">
						<fmt:message key="ipdms.dynamicform.field.fieldid" /> *	
					</c:when>
					<c:otherwise>
						<b><fmt:message key="ipdms.dynamicform.field.fieldid" />:</b>
					</c:otherwise>
				</c:choose>
			</label>
		</div>
		<div class="label" style="width: 75%;" title="<fmt:message key="ipdms.dynamicform.field.fieldid" />">
			<c:choose>
				<c:when test="${newfield}">
					<html:text name="dynamicForm" property="editTableField.field.siglaId"  styleId="editTableField.field.siglaId" size="30"/>	
				</c:when>
				<c:otherwise>
					${dynamicForm.editTableField.field.siglaId}
				</c:otherwise>
			</c:choose>
		</div>			
	</div>
	<div class="row formlabel_sf" style="height:30%;">
		<div class="leftTab label" style="width: 20%; " title="<fmt:message key="ipdms.dynamicform.field.label" />" >
			<label for="editTableField.field.label">
				<fmt:message key="ipdms.dynamicform.field.label" /> *
			</label>
		</div>
		<div class="label" style="width: 75%;" title="<fmt:message key="ipdms.dynamicform.field.label" />">
		  <html:text name="dynamicForm" property="editTableField.field.label" styleId="editTableField.field.label" size="30"/>	
		</div>			
	</div>		

	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.dynamicform.field.tableoffields.title' />">
	  		<label for="editTableField.field.title">
	  			<fmt:message key="ipdms.dynamicform.field.tableoffields.title" />
	  		</label>
	  	</div>	  	
	  	<div class="label" style="width: 75%;" title="<fmt:message key='ipdms.dynamicform.field.tableoffields.title' />">
	  		<html:text name="dynamicForm" property="editTableField.field.title" styleId="editTableField.field.title"/>
	  	</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.dynamicform.field.tableoffields.numberofrows' />">
	  		<label for="editTableField.field.numberOfRows">
	  			<fmt:message key="ipdms.dynamicform.field.tableoffields.numberofrows" /> *
	  		</label>
	  	</div>	  	
	  	<div class="label" style="width: 75%;" title="<fmt:message key='ipdms.dynamicform.field.tableoffields.numberofrows' />">
	  		<html:text name="dynamicForm" property="editTableField.field.numberOfRows" styleId="editTableField.field.numberOfRows"/>
	  	</div>
	</div>

	<br/><br/><br/>
	<c:choose>
		<c:when test="${not empty dynamicForm.editTableField.tableFields}">
			<table class="centro" width="80%" cellspacing="1">			
				<tr class="listHeader">
					<th class="centro" style="width:3%;">#</th>
					<th class="centro"><fmt:message key="ipdms.dynamicform.field.fieldid" /></th>
					<th class="centro"><fmt:message key="ipdms.dynamicform.field.fieldtype" /></th>
					<th class="centro"><fmt:message key="ipdms.dynamicform.field.label" /></th>
					<th class="centro" style="width:4%;">${editar}</th>
					<th class="centro" style="width:4%;">${ordenar}</th>
					<th class="centro" style="width:3%;">${eliminar}</th>
				</tr>
				<c:forEach var="field" items="${dynamicForm.editTableField.tableFields}" varStatus="status">
				<c:set var="i" value="${status.index}"></c:set>
				<tr>
					<td class="centro">${i+1}</td>
					<td class="centro">${field.siglaId}</td>
					<td class="centro">${field.type}</td>
					<td class="centro">${field.label}</td>
					<td class="centro" width="4%">
						<input onclick="$('indexOfField').value = '${i}'; webflowAjaxRequest(event);" 
							name="_eventId_editField" value="Editar" type="image"
							title="${editarCampoDinamico}" alt="${editarCampoDinamico}"
							src="${pageContext.request.contextPath}/images/icon/icon-editar.png"
							style="border: none;"/>
					</td>				
					<td class="centro" width="8%">
						<input onclick="$('indexOfField').value = '${i}'; webflowAjaxRequest(event);" 
							name="_eventId_upField" value="Subir Campo" type="image"
							title="${subir}" alt="${subir}"
							src="${pageContext.request.contextPath}/images/icon/seta_cima.png"
							style="border: none;"/>
						<input onclick="$('indexOfField').value = '${i}'; webflowAjaxRequest(event);" 
							name="_eventId_downField" value="Descer Campo" type="image"
							title="${descer}" alt="${descer}"
							src="${pageContext.request.contextPath}/images/icon/seta_baixo.png"
							style="border: none;"/>
						<%-- 
						<a href="applicationFlow.do2?_flowExecutionKey=${flowExecutionKey}&_eventId=upField&indexOfField=${i}">Up</a>
						<a href="applicationFlow.do2?_flowExecutionKey=${flowExecutionKey}&_eventId=downField&indexOfField=${i}">Down</a>
						--%>
					</td>
					<td class="centro" width="4%" style="text-align: center;">
						<c:if test="${field.id == 0 || !dynamicForm.existInstances}">
						<label for="removeRow_${i}">
							<input type="checkbox" id="removeRow_${i}" name="removeRow_${i}" value="checked" class="radion" style="text-align:center; border:none;"/>
						</label>
						</c:if>
					</td>	
				</tr>
				</c:forEach>				
			</table>
			<div id="alignRight">
				<img src="${pageContext.request.contextPath}/images/icon/icon-lixo.png"
							onclick="cancelar(event,'${camposDinamicos}','${eliminarMsg}',decisaoEliminar,'${sim}','${nao}');" 
							class="cursorMao" alt="${eliminar}" title="${eliminar}" />
			</div>		
		</c:when>
		<c:otherwise>
			<div class="row formlabel_sf" >
	        	 <div class="mensagenCaixa">
	             	<div style="float:left; width:3%;">
						<img src="images/icon/icon-informacao.png" style="vertical-align:middle; padding-left:10px; padding-right:4px;"  alt="${atencao}" title="${atencao}"/> 
	                </div>
	                <div style="float:right; width:93%; vertical-align:middle; margin-top:4px; ">
		                <div class="info"><fmt:message key="ipdms.dynamicform.form.edit.nofieldsmessage" /></div>
	                </div>
	            <div style="clear:both"></div>
	            </div>
	        </div>	
		</c:otherwise>
	</c:choose>
	<br/>
	<c:set var="beanNameForValidatorList" value="editTableField" scope="request" />
	<jsp:include page="fieldValidators.jsp" />
	<c:set var="beanNameForValidatorList" value="" scope="request" />
	<br/>
	
	<div class="buttonRow">
		<input type="button" name="_eventId_backToEditForm" value="${anterior}" class="btForm" onclick="webflowAjaxRequest(event);" title="${anteriorTitle}" />
		<input type="button" name="_eventId_newfield" value="${adicionarCampo}" class="btForm" onclick="webflowAjaxRequest(event);" title="${adicionarCampo}" />
		<input type="button" name="_eventId_addValidatorEditField" value="${adicionarValidador}" class="btForm" onclick="webflowAjaxRequest(event);" title="${adicionarValidador}" />
		<input type="button" name="_eventId_savefield" value="${gravarCampo}" class="btForm" onclick="webflowAjaxRequest(event);" title="${gravarCampo}" />
	</div>
</form:form>

<script>
decisaoEliminar = function(btn){
	if(btn=='yes'){
		extAjaxRequest('applicationFlow.do2', '_flowExecutionKey=${flowExecutionKey}&_eventId=removeFields&' + Form.serialize(document.forms[0]));
	} else{
		return false;
	}
};
</script>