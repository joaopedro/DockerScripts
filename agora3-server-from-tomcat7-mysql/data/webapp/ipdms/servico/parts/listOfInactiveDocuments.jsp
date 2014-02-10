<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%--<c:set var="getfileaction" value="${pageContext.request.contextPath}/file/getDocumento.do2" />--%>

<br />
<table cellpadding="0" cellspacing="0" class="centro" style="width:97%; margin-left:10px;">
	<tr>
		<th class="centro" style="width:11%"><fmt:message key="ipdms.documentos.list.data" /></th>
		<th class="centro"><fmt:message key="ipdms.documentos.list.docNum" /></th>
		<th class="centro"><fmt:message key="ipdms.documentos.list.versao" /></th>
		<th class="centro"><fmt:message key="ipdms.documentos.list.autor" /></th>
		<th class="centro"><fmt:message key="ipdms.documentos.list.tipo" /></th>
		<th class="centro" style="width:50%"><fmt:message key="ipdms.documentos.list.obs" /></th>	
	</tr>
		
	<c:forEach var="docWrapper" items="${inactiveDocuments}" varStatus="status">
		<c:set var="documento" value="${docWrapper.documento}" />
	
		<c:choose>
			<c:when test="${backgroundColor == 'rgb(221,238,248)'}"><c:set var="backgroundColor">white</c:set></c:when>
			<c:otherwise><c:set var="backgroundColor">rgb(221,238,248)</c:set></c:otherwise>
		</c:choose>
		<tr>
			<td class="centro">
				<c:if test="${not empty documento.dataEmissao}">
					<fmt:formatDate value="${documento.dataEmissao}" pattern="dd-MM-yyyy HH:mm" />
				</c:if>
			</td>
			<td class="centro">${documento.numeroDocumento}</td>
			<td class="centro">${documento.versaoConteudo}</td>
			<td class="centro">${documento.creator.titulo}</td>
			<td class="centro">${documento.tipoDocumento.name}</td>
			<td class="centro">${documento.comentario}</td>		
		</tr>
		<tr id="tr_${documento.numeroConteudo}" style="display: none;">
			<td class="alignCenter" colspan="9" id="td_${documento.numeroConteudo}" ></td>
			<td class="centro"></td>
			<td class="centro"></td>
		</tr>
	</c:forEach>
</table>
<br /><br />
