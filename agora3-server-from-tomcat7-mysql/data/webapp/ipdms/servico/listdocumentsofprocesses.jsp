<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@page import="com.sinfic.ipdms.comum.wrapper.documento.TipoDocumento"%>

<fmt:message key="ipdms.documentos.list.docPreview" var="docPreview" />
<fmt:message key="ipdms.documentos.export.title" var="exportTitle" />
<fmt:message key="ipdms.processo.designacaosingular" var="processoDes" />
<fmt:message key="ipdms.comunicacaoparecer.criar.tipoProcesso" var="tipoProcesso" />
<fmt:message key="ipdms.documentos.list.data" var="data" />
<fmt:message key="ipdms.documentos.list.descricao" var="descricao" />
<fmt:message key="ipdms.documentos.list.tipo" var="tipo" />
<fmt:message key="ipdms.documentos.list.docNum" var="docNum" />
<fmt:message key="ipdms.documentos.list.etapa" var="etapa" />
<fmt:message key="ipdms.documentos.list.autor" var="autor" />
<fmt:message key="ipdms.documentos.list.consultarDoc" var="consultarDoc" />
<fmt:message key="ipdms.documentos.list.hash" var="hash" />
<fmt:message key="ipdms.documentos.list.consultarDocs" var="consultarDocs" />
<fmt:message key="ipdms.documentos.list.hashOk" var="hashOk" />
<fmt:message key="ipdms.documentos.list.hashNotOk" var="hashNotOk" />
<fmt:message key="ipdms.documentos.list.downloadTitle" var="downloadTitle" />
<fmt:message key="ipdms.documentos.list.downloadMsg" var="downloadMsg" />
<fmt:message key="ipdms.myprocesses.obterDocumentos" var="obterDocumentos" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />
<fmt:message key="ipdms.forms.cancelar" var="cancelar" />
<fmt:message key="ipdms.forms.cancelar.title" var="cancelarTitle" />
<fmt:message key="ipdms.notification.exportDocument.title" var="exportEmptyTitle" />
<fmt:message key="ipdms.notification.exportDocument.message" var="exportEmptyMessage" />

<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/ConfirmCancel.js"></script>

<script>
previewDocumento = function(idDocumento) {	
	var action = "${pageContext.request.contextPath}/file/previewDocumento.do2?idDocumento="+idDocumento+"&resize=true";
	ExtWindowSizeParam('${docPreview}',action,'','html', 500, 600); //width, height
};
</script>

<c:set var="tipoitemvalue"><%= TipoDocumento.INSTRUCAO %></c:set>
<c:set var="tipoTemplateValue"><%= TipoDocumento.TEMPLATE %></c:set>
<c:set var="tipoAssociadoInstrucaoValue"><%= TipoDocumento.ASSOCIADO %></c:set>


<div class="row" style="padding-top:0px; text-align:left; ">
	<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${exportTitle}</td>
		  </tr>
		</tbody>
	</table>					
</div>
<form id="exportForm" name="exportForm" action="${pageContext.request.contextPath}/bundle/downloadBundle.do2" method="post">
<table cellpadding="0" cellspacing="0" class="centro" style="margin-left:14px; width:97%">
<tr>
	<th class="centro">${processoDes}</th>
	<th class="centro">${tipoProcesso}</th>
	<th class="centro">${data}</th>
	<th class="centro">${descricao}</th>
	<th class="centro">${tipo}</th>
	<th class="centro">${docNum}</th>
	<th class="centro">${etapa}</th>
	<th class="centro">${autor}</th>
	<th class="centro">${consultarDoc}</th>
	<th class="centro">${hash}</th>
	<th class="centro">&nbsp;</th>
</tr>

<c:forEach var="docWrapper" items="${documentos}" varStatus="status">
<c:set var="documento" value="${docWrapper.documento}" />
<c:choose>
	<c:when test="${backgroundColor == 'rgb(221,238,248)'}"><c:set var="backgroundColor">white</c:set></c:when>
	<c:otherwise><c:set var="backgroundColor">rgb(221,238,248)</c:set></c:otherwise>
</c:choose>
	<tr>
		<td class="centro">${documento.servicoOnline.idProcessoEntidade}</td>
		<td class="centro">${documento.servicoOnline.variante.processo.titulo}</td>
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
		<td class="centro">${documento.tipoDocumento.name}</td>
		<td class="centro">${documento.numeroDocumento}</td>
		<td class="centro">
			<c:choose>
				<c:when test="${empty docWrapper.etapa}">-</c:when>
				<c:otherwise>${docWrapper.etapa.titulo}</c:otherwise>
			</c:choose>
		</td>
		<td class="centro">${documento.creator.titulo}</td>
		<td class="alignCenter">
			<c:if test="${docWrapper.exists}">
				<a href="${pageContext.request.contextPath}/file/getDocumento.do2?nc=${documento.numeroConteudo}" target="_blank" title="${consultarDocs}">
					<img src="${pageContext.request.contextPath}/images/icon/icon-consultarDoc.png" class="cursorMao" alt="${consultarDocs}" title="${consultarDocs}" />
				</a>
			</c:if>
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
</c:forEach>
<tr>
	<td colspan="9" class="alignCenter">&nbsp;</td>
	<td class="alignCenter">
		<a href="#" onclick="cancelar(event,'${downloadTitle}','${downloadMsg}',downloadBundle,'${sim}','${nao}');">
			<img src="${pageContext.request.contextPath}/images/icon/icon-anexo.png" title="${obterDocumentos}" alt="${obterDocumentos}"/>
		</a>
	</td>
</tr>
</table>
</form>
<br />
<input type="button" class="btForm" onclick="document.location='${pageContext.request.contextPath}'" value="${cancelar}" title="${cancelarTitle}"/>
<br />
<script>
 function downloadBundle(btn) {
	 if(btn=='yes'){
		 var p = $('exportForm').serialize();
		 if(p == '') {
			 //no documents selected
			 Ext.MessageBox.show({
		            title: '${exportEmptyTitle}',
		            msg: '${exportEmptyMessage}',
		            buttons: Ext.MessageBox.OK });
		 } else {
			 var url = $('exportForm').action + '?' + p;
			 $('exportForm').action = url;
			 $('exportForm').submit();
		 }
	 }
 }
</script>
