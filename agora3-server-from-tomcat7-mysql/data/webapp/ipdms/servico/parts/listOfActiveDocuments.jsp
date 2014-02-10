<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.notification.exportDocument.title" var="exportDocumentTitle" />
<fmt:message key="ipdms.notification.exportDocument.message" var="exportDocumentMsg" />
<fmt:message key="ipdms.documentos.list.docPreview" var="docPreview" />
<fmt:message key="ipdms.documentos.list.data" var="data" />
<fmt:message key="ipdms.documentos.list.descricao" var="descricao" />
<fmt:message key="ipdms.documentos.list.docNum" var="docNum" />
<fmt:message key="ipdms.documentos.list.versao" var="versao" />
<fmt:message key="ipdms.documentos.list.etapa" var="etapa" />
<fmt:message key="ipdms.documentos.list.autor" var="autor" />
<fmt:message key="ipdms.documentos.list.tipo" var="tipo" />
<fmt:message key="ipdms.documentos.list.obs" var="obs" />
<fmt:message key="ipdms.documentos.list.consultarDoc" var="consultarDoc" />
<fmt:message key="ipdms.documentos.list.hist" var="hist" />
<fmt:message key="ipdms.documentos.list.locked" var="locked" />
<fmt:message key="ipdms.documentos.list.hash" var="hash" />
<fmt:message key="ipdms.documentos.list.consultarDocs" var="consultarDocs" />
<fmt:message key="ipdms.documentos.list.consultarHistory" var="consultarHistory" />
<fmt:message key="ipdms.documentos.list.lockInfo" var="lockInfo" />
<fmt:message key="ipdms.documentos.list.lockInfo.preMsg" var="lockInfoPreMsg" />
<fmt:message key="ipdms.documentos.list.lockInfo.postMsg" var="lockInfoPostMsg" />
<fmt:message key="ipdms.documentos.list.hashOk" var="hashOk" />
<fmt:message key="ipdms.documentos.list.hashNotOk" var="hashNotOk" />
<fmt:message key="ipdms.documentos.list.downloadTitle" var="downloadTitle" />
<fmt:message key="ipdms.documentos.list.downloadMsg" var="downloadMsg" />
<fmt:message key="ipdms.myprocesses.obterDocumentos" var="obterDocumentos" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />

<%@page import="com.sinfic.ipdms.comum.wrapper.documento.TipoDocumento"%>

<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/ConfirmCancel.js"></script>

<script type="text/javascript">


downloadBundle = function(btn) {
	var accao = "bundle/downloadBundle.do2";
	 if(btn=='yes'){
		 var p = $('exportForm').serialize();
		 if(p == '') {
			 //no documents selected
			 Ext.MessageBox.show({
		            title: '${exportDocumentTitle}',
		            msg: '${exportDocumentMsg}',
		            buttons: Ext.MessageBox.OK });
		 } else {
			 var url = accao + '?' + p;
			 $('exportForm').action = url;
			 $('exportForm').submit();
		 }
	 }
};

previewDocumento = function(idDocumento) {	
	var action = "${pageContext.request.contextPath}/file/previewDocumento.do2?idDocumento="+idDocumento+"&resize=true";
	ExtWindowSizeParam('${docPreview}',action,'','html', 500, 600); //width, height
};

</script>

<form id="exportForm"  name="exportForm" action="bundle/downloadBundle.do2" method="post">
<table cellpadding="0" cellspacing="0" class="centro" style="margin-left:14px; width:97%">
<tr>
	<th class="centro">${data}</th>
	<th class="centro">${descricao}</th>
	<th class="centro">${docNum}</th>
	<th class="centro">${versao}</th>
	<th class="centro">${etapa}</th>
	<th class="centro">${autor}</th>
	<th class="centro">${tipo}</th>
	<th class="centro" style="width:25%">${obs}</th>
	<th class="centro">${consultarDoc}</th>
	<th class="centro">${hist}</th>
	<th class="centro" style="width:4%;">${locked}</th>
	<th class="centro">${hash}</th>
	<th class="centro">&nbsp;</th>
</tr>

<c:set var="tipoitemvalue"><%= TipoDocumento.INSTRUCAO %></c:set>
<c:set var="tipoTemplateValue"><%= TipoDocumento.TEMPLATE %></c:set>
<c:set var="tipoAssociadoInstrucaoValue"><%= TipoDocumento.ASSOCIADO %></c:set>

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
				<a href="#" onclick="previewDocumento('${documento.numeroConteudo}');">
					<fmt:formatDate value="${documento.dataEmissao}" pattern="dd-MM-yyyy HH:mm" />
				</a>
			</c:if>
		</td>
		<td class="centro">
			<a href="#" onclick="previewDocumento('${documento.numeroConteudo}');">
			<c:choose>
				<c:when test="${documento.tipoDocumento.value==tipoTemplateValue}">${documento.documentTemplate.titulo}</c:when>
				<c:when test="${documento.tipoDocumento.value==tipoAssociadoInstrucaoValue}">${documento.tipoDocumentoAnexado.descricao}</c:when>
				<c:otherwise>${documento.designacao}</c:otherwise>
			</c:choose>		
			</a>
		</td>
		<td class="centro">${documento.numeroDocumento}</td>
		<td class="centro">${documento.versaoConteudo}</td>
		<td class="centro">
			<c:choose>
				<c:when test="${empty docWrapper.etapa}">-</c:when>
				<c:otherwise>${docWrapper.etapa.titulo}</c:otherwise>
			</c:choose>
		</td>
		<td class="centro">${documento.creator.titulo}</td>
		<td class="centro">${documento.tipoDocumento.name}</td>
		<td class="centro">${documento.comentario}</td>
		<td class="alignCenter">
			<c:if test="${docWrapper.exists}">
				<a href="${pageContext.request.contextPath}/file/getDocumento.do2?nc=${documento.numeroConteudo}" target="_blank" title="${consultarDocs}">
					<img src="${pageContext.request.contextPath}/images/icon/icon-consultarDoc.png" class="cursorMao" alt="${consultarDocs}" title="${consultarDocs}" />
				</a>
			</c:if>
		</td>
		<td class="centro">
			<c:if test="${documento.versaoConteudo > 1}">
				<a href="javascript:historicoDocumento(${documento.numeroConteudo}, '');" title="${consultarHistory}">
					<img src="${pageContext.request.contextPath}/images/icon/icon-mais.png" id="img_${documento.numeroConteudo}" class="cursorMao" alt="${consultarHistory}" title="${consultarHistory}" />
				</a>
			</c:if>
		</td>
		
		<td class="alignCenter">
			<%-- LOCK INFORMATION --%>
			<c:choose>	
			<c:when test="${documento.locked}">		
				<img src="${pageContext.request.contextPath}/images/icon/icon-lock-small.png" 
					onmouseover="showInfo('${documento.numeroConteudo}', this);" onmouseout="hideInfoWindow();" alt="${lockInfo}" title="${lockInfo}" />
				<div id="lock_info_${documento.numeroConteudo}" style="display: none;">
				${lockInfoPreMsg} ${documento.latestLock.lockUser.login} ${lockInfoPostMsg} <fmt:formatDate value="${documento.latestLock.lockDate.time}" pattern="dd/MM/yyyy HH:mm"/>
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
							alt="${hashOk}"
							title="${hashOk}" 
							style="border:none;" />
					</c:when>
					<c:otherwise>
						<img src="${pageContext.request.contextPath}/images/icon/icon-atencao.png"
							alt="${hashNotOk}"
							title="${hashNotOk}"
							style="border:none;" />
					</c:otherwise>
				</c:choose>
			</c:if>
		</td>
		<td class="alignCenter">
			<input type="checkbox" id="export_${documento.numeroConteudo}" name="export_${documento.numeroConteudo}" value="checked" />
		</td>
	</tr>
	<tr id="tr_${documento.numeroConteudo}" style="display: none;" class="hoverTransparente">
		<td class="centro" colspan="12" id="td_${documento.numeroConteudo}"></td>
	</tr>	
</c:forEach>
<tr>
	<td colspan="12" class="alignCenter">&nbsp;</td>
	<td class="alignCenter">
		<a href="#" onclick="cancelar(event,'${downloadTitle}','${downloadMsg}',downloadBundle,'${sim}','${nao}');">
			<img src="${pageContext.request.contextPath}/images/icon/icon-anexo.png" title="${obterDocumentos}" alt="${obterDocumentos}"/>
		</a>
	</td>
</tr>
</table>
</form>
<br /><br />

<script>
 var infoWin;

 showInfo = function(docId, imgElement) {
	var el = $('lock_info_' + docId);
	el.show();
	infoWin = new Ext.Window({
		id            : 'windowShowInfo',
		animEl        : this,
		animCollapse  : true,
		maximizable   : false,
		width         : 150,
		height        : 50,
		closable      : false,
		contentEl     : 'lock_info_' + docId
	});

	var el = Ext.get(imgElement);
	infoWin.setPosition(el.getXY()[0] - 150, el.getXY()[1]);
	infoWin.show();
 }	
 hideInfoWindow = function() {
	 if(infoWin != null) {
		 infoWin.hide();
		 //infoWin.destroy();
	 }
 }
 
</script>
