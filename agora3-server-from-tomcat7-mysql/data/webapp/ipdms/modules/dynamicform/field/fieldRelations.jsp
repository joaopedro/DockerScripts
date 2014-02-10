<%@ taglib uri="/tags/html" prefix="html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>

<fmt:message key="ipdms.dynamicform.field.relation.title" var="relation" />
<fmt:message key="ipdms.forms.adicionar" var="adicionar" />
<fmt:message key="ipdms.forms.eliminar" var="eliminar" />

<c:if test="${not empty dynamicForm.editField.relations}">
	<br />
	<br />
	<fieldset>
	<legend>${relation}</legend>
		<table class="centro" cellpadding="0" cellspacing="0" style="width:100%; margin-top:10px;">
		<caption style="text-align:left !important; background:#EEE; color:#000; border:none; ">
			<input type="button" value="${adicionar}" name="_eventId_addRelationEditField" onclick="webflowAjaxRequest(event);" style="font-size:11px;background:url(${pageContext.request.contextPath}/images/icon/icon-add.png) no-repeat left transparent;cursor:pointer;border:none;padding-left:15px"/>
		</caption>			
		<tr>
			<th class="centro"><fmt:message key="ipdms.dynamicform.field.relation.onvalue" /></th>
			<th class="centro"><fmt:message key="ipdms.dynamicform.field.relation.action" /></th>
			<th class="centro"><fmt:message key="ipdms.dynamicform.field.relation.affectedfield" /></th>
			<th class="centro" style="width:3%">${eliminar}</th>
		</tr>
    	<nested:root name="dynamicForm">
    	<nested:nest property="editField">
		<nested:iterate property="relations" indexId="i">
			<tr class="hoverTransparente">
				<td class="centro">
					<nested:text property="onValue" />
				</td>
				<td class="centro">
					<nested:select property="relationType" style="formtext_sf">
					<c:forEach items="${dynamicForm.relationTypes}" var="ft">
						<html:option value="${ft}">${ft}</html:option>
					</c:forEach>	
					</nested:select>					
				</td>
				<td class="centro">
					<nested:select property="siglaAffectedField" style="formtext_sf">
					<c:forEach items="${dynamicForm.fields}" var="f">
						<html:option value="${f.siglaId}">${f.label}&nbsp;(${f.siglaId})</html:option>
					</c:forEach>
					</nested:select>					
				</td>
				<td class="alignCenter">
					<input type="image" name="_eventId_removeRelationEditField" class="btForm" onclick="$('indexOfField').value = '${i}'; webflowAjaxRequest(event);" 
						src="${pageContext.request.contextPath}/images/icon/icon-delete.png" 
						style="width: 15px; height: 15px;" />		
				</td>
			</tr>
		</nested:iterate>
		</nested:nest>
		</nested:root>
		</table>
	</fieldset>
</c:if>
