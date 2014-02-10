<%@ taglib uri="/tags/html" prefix="html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<fmt:message key="ipdms.forms.eliminar" var="eliminar" />
<fmt:message key="ipdms.instrucao.pedido.info.title" var="atencao" />
<fmt:message key="ipdms.dynamicform.form.validator.empty" var="emptyMsg" />
<fmt:message key="ipdms.forms.anterior" var="anterior" />
<fmt:message key="ipdms.forms.anterior.title" var="anteriorTitle" />
<fmt:message key="ipdms.dynamicform.field.adicionarValidador" var="adicionarValidador" />

<div>
	<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
		<tr><td class="titulo1"><fmt:message key="ipdms.dynamicform.form.edit.title" /></td></tr>
		<tr><td class="titulo2"><fmt:message key="ipdms.dynamicform.form.validator.subtitle" /></td></tr>
	</table>
</div>

<form:form modelAttribute="define-dynamicform">
	<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">
	<html:errors/>

	<c:choose>
		<c:when test="${not empty dynamicForm.formValidators}">
			<div class="row" style="margin-bottom:20px;">
				<div class="leftTab label" style="width: 90%;">
			  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
			  	</div>
			</div>
			<fieldset>
			<legend><fmt:message key="ipdms.dynamicform.field.validator.title" /></legend>
			<nested:iterate name="dynamicForm" property="formValidators" id="formValidators" indexId="i">
				<div class="row formlabel_sf" >
		           <div class="leftTab label" style="width: 13%; " title="<fmt:message key='ipdms.dynamicform.field.validator.class' />">
	           			<fmt:message key="ipdms.dynamicform.field.validator.class" /> *
		           </div>
		           <div class="leftTab label" style="width: 60%; " title="<fmt:message key='ipdms.dynamicform.field.validator.class' />">
		           		<nested:text property="classString" styleId="classString" size="80"/>
		           </div>
		        </div>
		        <div class="row formlabel_sf" >
		           <div class="leftTab label" style="width: 13%; " title="<fmt:message key='ipdms.dynamicform.field.validator.args' />">
		           		<fmt:message key="ipdms.dynamicform.field.validator.args" />
		           </div>
		           <div class="leftTab label" style="width: 50%; " title="<fmt:message key='ipdms.dynamicform.field.validator.args' />">
		           		<nested:text property="args" styleId="args" size="50"/>
		           </div>           
		           <div class="leftTab label" style="width: 15%; " >
		           		<input type="hidden" id="validatorIndex" name="validatorIndex">
		           		<input type="button" name="_eventId_removevalidator" title="${eliminar}" value="${eliminar}" class="btForm" onclick="$('validatorIndex').value = '${i}'; webflowAjaxRequest(event);" />
		           </div>
				</div>
			</nested:iterate>
			</fieldset>
		</c:when>
		<c:otherwise>
			<div class="row formlabel_sf" >
		       	 <div class="mensagenCaixa">
		            	<div style="float:left; width:3%;">
						<img src="${pageContext.request.contextPath}/images/icon/icon-informacao.png" style="vertical-align:middle; padding-left:10px; padding-right:4px;"  alt="${atencao}" title="${atencao}"/> 
		               </div>
		               <div style="float:right; width:93%; vertical-align:middle; margin-top:4px; ">
		                <div class="info">${emptyMsg}</div>
		               </div>
		           <div style="clear:both"></div>
		           </div>
		       </div>
		</c:otherwise>
	</c:choose>
	
	<br/>
	<div class="buttonRow">
		<input type="button" name="_eventId_back" value="${anterior}" class="btForm" onclick="webflowAjaxRequest(event);" title="${anteriorTitle}" />
		<input type="button" name="_eventId_addvalidator" value="${adicionarValidador}" class="btForm" onclick="webflowAjaxRequest(event);" title="${adicionarValidador}" />
	</div>
</form:form>
