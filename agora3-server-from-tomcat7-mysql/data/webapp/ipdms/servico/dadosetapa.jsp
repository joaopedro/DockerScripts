<%@ taglib prefix="html" uri="/tags/html"  %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>

<fmt:message key="ipdms.dynamicform.dadosetapa" var="dadosetapa" />
<fmt:message key="ipdms.instrucao.pedido.info.title" var="atencao" />
<fmt:message key="ipdms.dynamicform.dadosetapa.empty" var="emptyMsg" />

<br />
<c:choose>
<c:when test="${not empty dynamicForms}" > 
	<c:forEach items="${dynamicForms}" var="dynamicForm">
	<br />
	<fieldset>
	<legend>${dadosetapa} "${dynamicForm.solog.etapa.titulo}"</legend>
	<br />
	<table cellpadding="0" cellspacing="1" class="centro">
		<c:forEach items="${dynamicForm.values}" var="field">
		<tr>			
			<td class="centro">${field.fieldTemplate.label} </td>
			<td class="centro">
				<c:choose>
					<c:when test="${valueSurrogates[field.id]!=null}">
						${valueSurrogates[field.id]}
					</c:when>
					<c:otherwise>${field.value}</c:otherwise>
				</c:choose>
			</td> 
		</tr>
		</c:forEach>
	</table>
	</fieldset>	
	</c:forEach>
</c:when>

<c:otherwise>
	<div class="row formlabel_sf" style=" margin-left:4px; width:99%;" ><div class="mensagenCaixa"><div style="float:left; width:3%;"><img src="images/icon/icon-informacao.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;"  alt="${atencao}" title="${atencao}"/></div><div style="float:right; width:93%; vertical-align:middle; margin-top:4px; "><div class="info">${emptyMsg}</div></div><div style="clear:both"></div></div></div>
</c:otherwise>
</c:choose>
<br />