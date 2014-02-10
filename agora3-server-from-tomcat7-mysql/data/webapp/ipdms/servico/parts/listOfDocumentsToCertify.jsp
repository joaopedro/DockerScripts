<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@page import="com.sinfic.ipdms.comum.wrapper.documento.TipoDocumento"%>
 
<br />
<table cellpadding="0" cellspacing="0" class="centro" style="margin-left:14px; width:97%">
<tr>
	<th class="centro"><fmt:message key="ipdms.documentos.list.data" /></th>
	<th class="centro">*</th>
	<th class="centro"><fmt:message key="ipdms.documentos.list.docNum" /></th>
	<th class="centro"><fmt:message key="ipdms.documentos.list.versao" /></th>
	<th class="centro"><fmt:message key="ipdms.documentos.list.etapa" /></th>
	<th class="centro"><fmt:message key="ipdms.documentos.list.autor" /></th>
	<th class="centro"><fmt:message key="ipdms.documentos.list.tipo" /></th>
	<th class="centro"><fmt:message key="ipdms.documentos.list.consultarDoc" /></th>
	<th class="centro" style="width:4%;"><fmt:message key="ipdms.documentos.list.locked" /></th>
	<th class="centro"><fmt:message key="ipdms.documentos.list.hash" /></th>
	<th class="centro"></th>
</tr>

<c:set var="tipoitemvalue"><%= TipoDocumento.INSTRUCAO %></c:set>

<c:forEach var="docWrapper" items="${activeDocuments}" varStatus="status">
<c:set var="documento" value="${docWrapper.documento}" />
<c:choose>
	<c:when test="${backgroundColor == 'rgb(221,238,248)'}"><c:set var="backgroundColor">white</c:set></c:when>
	<c:otherwise><c:set var="backgroundColor">rgb(221,238,248)</c:set></c:otherwise>
</c:choose>
	<tr>
		<td class="centro">		
			<%-- DATE OF THE DOCUMENT --%>		
			<c:if test="${not empty documento.dataEmissao}">
				<fmt:formatDate value="${documento.dataEmissao}" pattern="dd-MM-yyyy HH:mm" />
			</c:if>
		</td>
		<td class="centro">${documento.tipoDocumento.name}</td>
		<td class="centro">${documento.numeroDocumento}</td>
		<td class="centro">${documento.versaoConteudo}</td>
		<td class="centro">
			<c:choose>
				<c:when test="${empty docWrapper.etapa}">-</c:when>
				<c:otherwise>${docWrapper.etapa.titulo}</c:otherwise>
			</c:choose>
		</td>
		<td class="centro">${documento.creator.titulo}</td>
		<td class="centro">
			<c:choose>
				<c:when test="${documento.tipoDocumento.value != tipoitemvalue}">-</c:when>
				<c:otherwise>${documento.tipoDocumentoAnexado.descricao}</c:otherwise>
			</c:choose>
		</td>
		<td class="alignCenter">
			<c:if test="${docWrapper.exists}">
				<a href="${pageContext.request.contextPath}/file/getDocumento.do2?nc=${documento.numeroConteudo}" target="_blank" title="<fmt:message key='ipdms.documentos.list.consultarDoc' />">
					<img src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" class="cursorMao" alt="<fmt:message key='ipdms.forms.pesquisar' />" title="<fmt:message key='ipdms.forms.pesquisar' />" />
				</a>
			</c:if>
		</td>
		
		<td class="alignCenter">
			<%-- LOCK INFORMATION --%>
			<c:choose>	
			<c:when test="${documento.locked}">		
				<img src="${pageContext.request.contextPath}/images/icon/icon-lock-small.png" 
					onmouseover="showInfo('${documento.numeroConteudo}', this);" onmouseout="hideInfoWindow();" alt="<fmt:message key='ipdms.documentos.list.lockInfo' />" title="<fmt:message key='ipdms.documentos.list.lockInfo' />" />
				<div id="lock_info_${documento.numeroConteudo}" style="display: none;">
				<fmt:message key='ipdms.documentos.list.lockInfo.preMsg' /> ${documento.latestLock.lockUser.login} <fmt:message key='ipdms.documentos.list.lockInfo.postMsg' /> <fmt:formatDate value="${documento.latestLock.lockDate.time}" pattern="dd/MM/yyyy HH:mm"/>
				</div>
		   	</c:when>
		   	<c:otherwise>-</c:otherwise>
		   </c:choose>
		</td>
		<td class="alignCenter">
			<c:if test="${not empty documento.hash}">
				<c:choose>
					<c:when test="${docWrapper.hashOk}">
						<img src="${pageContext.request.contextPath}/images/icon/icon-OK.png"
							alt="<fmt:message key='ipdms.documentos.list.hashOk' />"
							title="<fmt:message key='ipdms.documentos.list.hashOk' />" 
							style="border:none;" />
					</c:when>
					<c:otherwise>
						<img src="${pageContext.request.contextPath}/images/icon/icon-atencao.png"
							alt="<fmt:message key='ipdms.documentos.list.hashNotOk' />"
							title="<fmt:message key='ipdms.documentos.list.hashNotOk' />" 
							style="border:none;" />
					</c:otherwise>
				</c:choose>
			</c:if>
		</td>
		<td class="alignCenter">
			<c:set var="document" value="${documento}" scope="request" />
			<jsp:include page="/ipdms/commons/document/certifyButton.jsp" />
		</td>
	</tr>
</c:forEach>
</table>
<br /><br />

<script>
 var infoWin;

 function showInfo(docId, imgElement) {
	var el = $('lock_info_' + docId);
	el.show();
	infoWin = new Ext.Window({
		animEl        : this,
		animCollapse  : true,
		maximizable   : false,
		width         : 150,
		height        : 50,
		closable      : false,
		contentEl     : 'lock_info_' + docId,
	});

	var el = Ext.get(imgElement);
	infoWin.setPosition(el.getXY()[0] - 150, el.getXY()[1]);
	infoWin.show();
 }	
 function hideInfoWindow() {
	 if(infoWin != null) {
		 infoWin.hide();
		 //infoWin.destroy();
	 }
 } 
</script>
