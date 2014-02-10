<%@ taglib prefix="html" uri="/tags/html"  %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>

<br />

<c:choose>
<c:when test="${not empty comentarios}">
<fieldset>
<legend><fmt:message key="ipdms.servicoonline.info.coments" /></legend>

<br />
<table cellpadding="0" cellspacing="0" class="centro" id="worklist" style=" margin-bottom:20px; border:none;">
	<tr>
		
		<th width="100" class="centro"><fmt:message key="ipdms.servicoonline.info.data" /></th>
		<th width="100" class="centro"><fmt:message key="ipdms.servicoonline.info.nomeEtapa" /></th>
		<th width="100" class="centro"><fmt:message key="ipdms.servicoonline.info.utilizador" /></th>
		<th width="100" class="centro"><fmt:message key="ipdms.servicoonline.info.coment" /></th>
	</tr>
	<tbody>
		<c:forEach items="${comentarios}" var="comentario" >
			<tr>
				
				<td class="centro"><fmt:formatDate
				value="${comentario.dataPreenchimento.time}"
				pattern="dd-MM-yyyy" /></td>
				<td class="centro">
				 ${comentario.nomeEtapa}</td>
				<td class="centro">${comentario.colaborador.login}</td>
				<td class="centro">${comentario.comentario}</td>
			</tr>
		</c:forEach>

	</tbody>
</table>
</fieldset>
</c:when>
<c:otherwise>
<div class="row formlabel_sf" style=" margin-left:4px; width:99%;"><div class="mensagenCaixa"><div style="float:left; width:3%;"><img src="images/icon/icon-informacao.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;"  alt="<fmt:message key='ipdms.instrucao.pedido.info.title' />" title="<fmt:message key='ipdms.instrucao.pedido.info.title' />"/></div><div style="float:right; width:93%; vertical-align:middle; margin-top:4px; "><div class="info"><fmt:message key="ipdms.servicoonline.info.emptyComents" /></div></div><div style="clear:both"></div></div></div>
</c:otherwise>

</c:choose>
<br />