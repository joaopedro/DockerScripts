<%@ taglib uri="/tags/html" prefix="html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<fmt:message key="ipdms.dynamicform.form.designacaosingular" var="designacaosingular" />
<fmt:message key="ipdms.dimensoes.designacaoplural" var="dimensoes" />
<fmt:message key="ipdms.forms.anterior" var="anterior" />
<fmt:message key="ipdms.forms.anterior.title" var="anteriorTitle" />
<fmt:message key="ipdms.dynamicform.field.adicionarRelacao" var="adicionarRelacao" />
<fmt:message key="ipdms.dynamicform.field.adicionarValidador" var="adicionarValidador" />
<fmt:message key="ipdms.dynamicform.field.gravarCampo" var="gravarCampo" />

<c:set var="newfield" scope="request">${dynamicForm.editField.field.id == 0}</c:set> 

<div>
	<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
		<tr><td class="titulo1"><fmt:message key="ipdms.dynamicform.form.edit.title" /></td></tr>
		<tr><td class="titulo2"><fmt:message key="ipdms.dynamicform.field.editniveldimensional.subtitle" /></td></tr>
	</table>
</div>

<form:form modelAttribute="define-dynamicform" method="post" >
	<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">
	<html:errors/>

	<jsp:include page="editStandardField.jsp"></jsp:include>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 20%;" title="<fmt:message key='ipdms.dynamicform.field.niveldimensional' />">
  		<fmt:message key="ipdms.dynamicform.field.niveldimensional" />
  		</div>
  	<div class="label" style="width: 5%; " title="<fmt:message key='ipdms.dynamicform.field.niveldimensional' />">
  		<img class="cursorMao" alt="<fmt:message key='ipdms.dynamicform.field.niveldimensional' />" title="<fmt:message key='ipdms.dynamicform.field.niveldimensional' />" 
  			src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" 
				onclick="showDimensoes();"/>
  	</div>
  	<div class="label" style="width: 70%; " title="${designacaosingular}">
  		<span id="nivelDesignacaoSpan">
  			<c:if test="${not empty dynamicForm.editField.field.nivel}">
  				${dynamicForm.editField.field.nivel.designacao}
  			</c:if>
  		</span>
  		<html:hidden name="dynamicForm" property="editField.field.nivel.numeroConteudo" styleId="numeroConteudoNivel" />
  	</div>
</div>
<script>
showDimensoes = function (){	
	var action = "${pageContext.request.contextPath}/popupDimensional.do2";
	action += "?window=winchoose";
	action += "&tipo=1";
	action += "&valuePlaceOlder=numeroConteudoNivel";
	action += "&descPlaceOlder=nivelDesignacaoSpan";
	action += "&multiple=false";
	ExtWindow('${dimensoes}',action,'','ext');	
};

</script>
	<br/><br/>
	<%-- LIST OPTIONS IF AVAILABLE --%>
	<c:if test="${not empty dynamicForm.editField.field.nivel.valoresDimensionais}">
		<table class="formtable" cellspacing="5">			
			<tr class="listHeader">
				<th class="textoBold"><fmt:message key="ipdms.dynamicform.field.option.value" /></th>
				<th class="textoBold"><fmt:message key="ipdms.dynamicform.field.option.label" /></th>
			</tr>
			<c:forEach var="nivel" items="${dynamicForm.editField.field.nivel.valoresDimensionaisActivos}">			
			<tr>
				<td class="formfield">${nivel.numeroConteudo}</td>
				<td class="formfield">${nivel.descricao}</td>
			</tr>
			</c:forEach>
		</table>
	</c:if>
	
	<jsp:include page="fieldRelations.jsp"></jsp:include>

	<jsp:include page="fieldValidators.jsp"></jsp:include>
	
	<br/>
	<div class="buttonRow">
		<input type="button" name="_eventId_cancelEditField" value="${anterior}" class="btForm" onclick="webflowAjaxRequest(event);" title="${anteriorTitle}" />
		<c:if test="${empty dynamicForm.editTableField}">
		<c:if test="${newfield}">
			<input type="button" name="_eventId_addRelationEditField" value="${adicionarRelacao}" class="btForm" onclick="webflowAjaxRequest(event);" title="${adicionarRelacao}" />
		</c:if>
		<input type="button" name="_eventId_addValidatorEditField" value="${adicionarValidador}" class="btForm" onclick="webflowAjaxRequest(event);" title="${adicionarValidador}" />
		</c:if>
		<input type="button" name="_eventId_savefield" value="${gravarCampo}" class="btForm" onclick="webflowAjaxRequest(event);" title="${gravarCampo}" />
	</div>
</form:form>
