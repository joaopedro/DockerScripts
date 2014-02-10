<%@ taglib uri="/tags/html" prefix="html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>

<fmt:message key="ipdms.dynamicform.field.novaOpcao" var="novaOpcao" />
<fmt:message key="ipdms.forms.adicionar" var="adicionar" />
<fmt:message key="ipdms.forms.eliminar" var="eliminar" />
<fmt:message key="ipdms.dynamicform.field.option.designacaoplural" var="options" />
<fmt:message key="ipdms.dynamicform.field.option.eliminarMsg" var="eliminarMsg" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />

<div class="row" >
	<fieldset style="margin-left:14px;">
    <legend>${novaOpcao}</legend>
	
		<table class="centro" cellpadding="0" cellspacing="0" style="width:100%; margin-top:10px;">
			<caption style="text-align:left !important; background:#EEE; color:#000; border:none;font-size:11px ">
				<input type="button" value="${adicionar}" name="_eventId_addoption" onclick="webflowAjaxRequest(event);" style="font-size:11px;background:url(${pageContext.request.contextPath}/images/icon/icon-add.png) no-repeat left transparent;cursor:pointer;border:none;padding-left:15px"/>
			</caption>			
			<tr>
				<th class="centro"><fmt:message key="ipdms.dynamicform.field.option.value" /></th>
				<th class="centro"><fmt:message key="ipdms.dynamicform.field.option.label" /></th>
				<th class="centro" style="width:6%">
						${eliminar}
				</th>
				
			</tr>
			<nested:root name="dynamicForm">
			<nested:nest property="editField">
			<nested:iterate property="optionValues" indexId="i">
			
			<c:set var="disablevalue" value="" />
			<nested:notEqual value="0" property="id">
				<c:set var="disablevalue" value="true" />
			</nested:notEqual>
			<c:if test="${not empty dynamicForm.editField.optionValues}">
				<tr class="hoverTransparente">
					<td class="centro">
						<nested:text property="value" disabled="${disablevalue}" />
					</td>
					<td class="centro">
						<nested:text property="label" />
					</td>
					<c:if test="${optionValues.id == 0}">
						<td class="alignCenter">
							<label for="removeRow_${i}">
								<input type="checkbox" id="removeRow_${i}" name="removeRow_${i}" 
									value="checked" class="radion" style="text-align:center; border:none;"/>
							</label>
						</td>
					</c:if>
					<c:if test="${optionValues.id > 0}">
						<td class="alignCenter">
							-
						</td>
					</c:if>
				</tr>
			</c:if>
			</nested:iterate>	
			</nested:nest>
			</nested:root>
			<tr class="hoverTransparente">
				<td class="centro" colspan="2">&nbsp;</td>
				<td class="alignCenter">
					<img src="${pageContext.request.contextPath}/images/icon/icon-lixo.png" 
						onclick="cancelar(event,'${options}','${eliminarMsg}',decisaoApagarOpcoes,'${sim}','${nao}');" 
						class="cursorMao" alt="${eliminar}" title="${eliminar}" />
				</td>
			</tr>
		</table>
</fieldset>
</div>

<script>
decisaoApagarOpcoes = function(btn){
	if(btn=='yes'){
		extAjaxRequest('applicationFlow.do2', '_flowExecutionKey=${flowExecutionKey}&_eventId=removeoption&' + Form.serialize(document.forms[0]));
	} else{
		return false;
	}
};
</script>
