<%@ taglib uri="/tags/html" prefix="html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>

<fmt:message key="ipdms.forms.adicionar" var="adicionar" />
<fmt:message key="ipdms.forms.eliminar" var="eliminar" />

<nested:root name="dynamicForm">
<c:choose>
	<c:when test="${not empty beanNameForValidatorList}">
		<c:set var="beanNameForValidatorList" value="${beanNameForValidatorList}" />
	</c:when>
	<c:otherwise>
		<c:set var="beanNameForValidatorList" value="editField" />
	</c:otherwise>
</c:choose>
<nested:nest property="${beanNameForValidatorList}">

<nested:notEmpty property="validators">
	<br />
	<fieldset>
	<legend><fmt:message key="ipdms.dynamicform.field.validator.title" /></legend>
	<input type="hidden" id="indexOfField" name="indexOfField">
	
	<table class="centro" cellpadding="0" cellspacing="0" style="width:100%; margin-top:10px;">
		<caption style="text-align:left !important; background:#EEE; color:#000; border:none; ">
			<input type="button" value="${adicionar}" name="_eventId_addValidatorEditField" onclick="webflowAjaxRequest(event);" style="font-size:11px;background:url(${pageContext.request.contextPath}/images/icon/icon-add.png) no-repeat left transparent;cursor:pointer;border:none;padding-left:15px"/>
		</caption>			
		<tr>
			<th class="centro"><fmt:message key="ipdms.dynamicform.field.validator.class" /> *</th>
			<th class="centro"><fmt:message key="ipdms.dynamicform.field.validator.args" /></th>
			<th class="centro" style="width:3%">${eliminar}</th>
		</tr>
		<nested:iterate property="validators" indexId="i">
			<tr class="hoverTransparente">
				<td class="centro"><nested:text property="classString" styleId="classString" style="width:100%"/></td>
				<td class="centro"><nested:text property="args" styleId="args" style="width:98%" /></td>
				<td class="alignCenter">				
					<input type="image" name="_eventId_removeValidatorEditField" class="btForm" onclick="$('indexOfField').value = '${i}'; webflowAjaxRequest(event);" 
						src="${pageContext.request.contextPath}/images/icon/icon-delete.png" 
						style="width: 15px; height: 15px;" />
				</td>
			</tr>
		</nested:iterate>
	</table>
		
	</fieldset>
</nested:notEmpty>
</nested:nest>
</nested:root>