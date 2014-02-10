<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div id="ver_ajuda" class="info" style="padding-top:0px; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr><td class="titulo1"><fmt:message key="ipdms.documentos.bundle.title" /></td></tr>
		</tbody>
	</table>					
</div>
<br/>
<c:choose>
	<c:when test="${result.invalidMetadata}">
		<p class="error"><fmt:message key="ipdms.documentos.bundle.result.metadataerror" /></p>
	</c:when>
	<c:when test="${result.invalidMetadata}">
		<p class="error"><fmt:message key="ipdms.documentos.bundle.result.error" /></p>
	</c:when>
	<c:otherwise>
		<p><fmt:message key="ipdms.documentos.bundle.result.success" /></p>
		<br/>
		<p><fmt:message key="ipdms.documentos.bundle.result.docsLista" />:</p>
		<br/>
		<table cellpadding="0" cellspacing="0" class="centro" style="margin-left:14px; width:97%">
			<tr>
				<th class="centro"><fmt:message key="ipdms.processo.designacaosingular" /></th>
				<th class="centro"><fmt:message key="ipdms.documentos.list.docNum" /></th>
				<th class="centro"><fmt:message key="ipdms.documentos.list.versao" /></th>
				<th class="centro" style="width:25%"><fmt:message key="ipdms.documentos.list.obs" /></th>
			</tr>
			<c:forEach var="documento" items="${result.importedFiles}" varStatus="status">
			<c:choose>
				<c:when test="${backgroundColor == 'rgb(221,238,248)'}"><c:set var="backgroundColor">white</c:set></c:when>
				<c:otherwise><c:set var="backgroundColor">rgb(221,238,248)</c:set></c:otherwise>
			</c:choose>
			<tr>
				<td class="centro">${documento.servicoOnline.idProcessoEntidade}</td>
				<td class="centro">${documento.numeroDocumento}</td>
				<td class="centro">${documento.versaoConteudo}</td>
				<td class="centro">${documento.comentario}</td>
			</tr>
			</c:forEach>
		</table>
	</c:otherwise>
</c:choose>

<br/>
<form action="${pageContext.request.contextPath}/homepage.do2">
	<div class="buttonRow">
		<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.terminar" />" title="<fmt:message key="ipdms.forms.terminar.title" />" />
	</div>
</form>
