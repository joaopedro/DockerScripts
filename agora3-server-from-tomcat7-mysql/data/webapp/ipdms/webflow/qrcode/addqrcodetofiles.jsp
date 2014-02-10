<%@ taglib uri="/tags/html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="webflow.qrcode.docsAnexados" var="docsAnexados" />
<fmt:message key="webflow.qrcode.localQRCODE" var="localQRCODE" />
<fmt:message key="webflow.qrcode.aplicarQRCODE" var="aplicarQRCODE" />
<fmt:message key="webflow.qrcode.preview" var="preview" />
<fmt:message key="webflow.qrcode.superiorEsquerdo" var="superiorEsquerdo" />
<fmt:message key="webflow.qrcode.superiorCentral" var="superiorCentral" />
<fmt:message key="webflow.qrcode.superiorDireito" var="superiorDireito" />
<fmt:message key="webflow.qrcode.centralEsquerdo" var="centralEsquerdo" />
<fmt:message key="webflow.qrcode.central" var="central" />
<fmt:message key="webflow.qrcode.centralDireito" var="centralDireito" />
<fmt:message key="webflow.qrcode.inferiorEsquerdo" var="inferiorEsquerdo" />
<fmt:message key="webflow.qrcode.inferiorCentral" var="inferiorCentral" />
<fmt:message key="webflow.qrcode.inferiorDireito" var="inferiorDireito" />
<fmt:message key="webflow.qrcode.notPDF" var="notPDF" />
<fmt:message key="webflow.qrcode.containsBarCode" var="containsBarCode" />
<fmt:message key="webflow.qrcode.convertPDF" var="convertPDF" />
<fmt:message key="ipdms.forms.anterior" var="anterior" />
<fmt:message key="ipdms.forms.anterior.title" var="anteriorTitle" />
<fmt:message key="ipdms.forms.seguinte" var="seguinte" />
<fmt:message key="ipdms.forms.seguinte.title" var="seguinteTitle" />

<SCRIPT src='${pageContext.request.contextPath}/ipdms/js/swf-ajax-ext.js' type="text/javascript"></script>


<c:if test="${empty _resumo}">
<html:form action="applicationFlow" method="post" onsubmit="return false;" >

	<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}"><br/>
	<div class="webflow_formdiv">
	<html:errors/>

	<table cellpadding="0" cellspacing="0" class="centro" style="width:700px;">
		<tr>
			<th class="centro">${docsAnexados}</th>
			<th class="borderBranco"></th>
			<th class="centro" style="width:150px">${localQRCODE}</th>
			<th class="borderBranco"></th>
			<th class="centro" style="width:55px">${aplicarQRCODE}</th>
			<th class="borderBranco"></th>
			<th class="centro" style="width:200px">${preview}</th>
		</tr>
		
		<%-- 
			Documentos Anexados de Instrucao
		--%>
		<logic:notEmpty name="webflowActionForm" property="addedDocuments">
			<logic:iterate name="webflowActionForm" property="addedDocuments" id="addedDocuments" indexId="index">
				<nested:root name="addedDocuments">
					<tr>
						<td class="centro">
							<a href="${pageContext.request.contextPath}/file/getDocumentoInstrucao.do2?nc=${addedDocuments.file.id}&tmpfile=${addedDocuments.file.tmpFilename}" target="_blank">
								${addedDocuments.file.description}</td>
							</a>
						<td class="borderBranco"></td>
						<td class="alignCenter">
							<c:if test="${addedDocuments.pdfFile && !addedDocuments.containsBarCode}">
							<nested:select property="barCodeLocation" indexed="true" styleId="docAnexadoBarCodeLocation${index}">
								<html:option value="UPPER_LEFT">${superiorEsquerdo}</html:option>
								<html:option value="UPPER_CENTER">${superiorCentral}</html:option>
								<html:option value="UPPER_RIGTH">${superiorDireito}</html:option>
								<html:option value="CENTER_LEFT">${centralEsquerdo}</html:option>
								<html:option value="CENTER">${central}</html:option>
								<html:option value="CENTER_RIGTH">${centralDireito}</html:option>
								<html:option value="LOWER_LEFT">${inferiorEsquerdo}</html:option>
								<html:option value="LOWER_CENTER">${inferiorCentral}</html:option>
								<html:option value="LOWER_RIGTH">${inferiorDireito}</html:option>
							</nested:select>
							</c:if>
						</td>
						<td class="borderBranco">
						<td class="alignCenter">
							<c:choose>
								<c:when test="${!addedDocuments.pdfFile}">${notPDF}</c:when>
								<c:when test="${addedDocuments.containsBarCode}">${containsBarCode}</c:when>
								<c:otherwise>
									<nested:checkbox property="toInsertBarcode" styleClass="radion" indexed="true"/></td>		
								</c:otherwise>
							</c:choose>
						</td>
						<td class="borderBranco"></td>
						<td class="alignCenter">
							<c:if test="${addedDocuments.pdfFile && !addedDocuments.containsBarCode}">
								<a href="#" onclick="previewDocAnexadoBarCode(${addedDocuments.file.id},'${addedDocuments.file.tmpFilename}',${index});">
									Preview
								</a>
							</c:if>
						</td>
					</tr>			
				</nested:root>
			</logic:iterate>
		</logic:notEmpty>
		
		<%-- 
			Documentos Itens 
		--%>
		<logic:notEmpty name="webflowActionForm" property="itensWithFile">
			<logic:iterate name="webflowActionForm" property="itensWithFile" id="itensWithFile" indexId="index">
				<c:if test="${not empty itensWithFile.file.formFile and !itensWithFile.file.toDelete}">
				<nested:root name="itensWithFile">
					<tr>
						<td class="centro">
							<a href="${pageContext.request.contextPath}/file/getDocumentoAssociacao.do2?nc=${itensWithFile.file.id}&tmpfile=${itensWithFile.file.tmpFilename}"  target="_blank" >
								${itensWithFile.item.descricao}	
							</a>
						</td>
						<td class="borderBranco"></td>
						<td class="alignCenter">
							<c:if test="${itensWithFile.pdfFile && !itensWithFile.containsBarCode}">
							<nested:select property="barCodeLocation" indexed="true" styleId="itemBarCodeLocation${index}">
								<html:option value="UPPER_LEFT">${superiorEsquerdo}</html:option>
								<html:option value="UPPER_CENTER">${superiorCentral}</html:option>
								<html:option value="UPPER_RIGTH">${superiorDireito}</html:option>
								<html:option value="CENTER_LEFT">${centralEsquerdo}</html:option>
								<html:option value="CENTER">${central}</html:option>
								<html:option value="CENTER_RIGTH">${centralDireito}</html:option>
								<html:option value="LOWER_LEFT">${inferiorEsquerdo}</html:option>
								<html:option value="LOWER_CENTER">${inferiorCentral}</html:option>
								<html:option value="LOWER_RIGTH">${inferiorDireito}</html:option>
							</nested:select>
							</c:if>
						</td>
						<td class="borderBranco">
						<td class="alignCenter">
							<c:choose>
								<c:when test="${!itensWithFile.pdfFile}">${notPDF}</c:when>
								<c:when test="${itensWithFile.containsBarCode}">${containsBarCode}</c:when>
								<c:otherwise>
									<nested:checkbox property="toInsertBarcode" styleClass="radion" indexed="true"/></td>		
								</c:otherwise>
							</c:choose>
						</td>
						<td class="borderBranco"></td>
						<td class="alignCenter">
							<c:if test="${itensWithFile.pdfFile && !itensWithFile.containsBarCode}">
								<a href="#" onclick="previewDocAssociadoBarCode(${itensWithFile.file.id},'${itensWithFile.file.tmpFilename}',${index});">
									Preview
								</a>
							</c:if>
						</td>
					</tr>			
				</nested:root>
				</c:if>
			</logic:iterate>
		</logic:notEmpty>
	</table>
	
	
	<div style="margin-top:10px;">
		<html:submit property="_eventId_back" value="${anterior}" title="${anteriorTitle}" styleClass="btForm" onclick="webflowAjaxRequest(event);"/>
		<html:submit property="_eventId_convertToPdf" value="${convertPDF}" title="${convertPDF}" styleClass="btForm" onclick="webflowAjaxRequest(event);"/>
		<html:submit property="_eventId_next" value="${seguinte}" title="${seguinteTitle}" styleClass="btForm" onclick="webflowAjaxRequest(event);"/>
	</div>

	</div>
</html:form>
</c:if>

<script>

previewDocAnexadoBarCode = function(nc, tmpFile, index) {
	previewDocumentWithBarCode(
			'previewBarCodeDocumentoInstrucao.do2', nc, tmpFile, 
			$('docAnexadoBarCodeLocation' + index).value);
};

previewDocAssociadoBarCode = function(nc, tmpFile, index) {
	previewDocumentWithBarCode(
			'previewBarCodeDocumentoAssociacao.do2', nc, tmpFile, 
			$('itemBarCodeLocation' + index).value);	
};

previewDocumentWithBarCode = function(action, nc, tmpFile, barCodeLocation) {
	var link = '${pageContext.request.contextPath}/file/' + action + '?';
	link += 'nc=' + nc;
	link += '&tmpfile=' + tmpFile;
	link += '&barcodelocation=' + barCodeLocation;
	window.open(link,'previewpdf');
};

</script>
