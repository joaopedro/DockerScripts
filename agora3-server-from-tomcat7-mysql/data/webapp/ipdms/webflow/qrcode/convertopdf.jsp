<%@ taglib uri="/tags/html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="webflow.qrcode.docsAnexados" var="docsAnexados" />
<fmt:message key="webflow.qrcode.transformarPDF" var="transformarPDF" />
<fmt:message key="ipdms.forms.anterior" var="anterior" />
<fmt:message key="ipdms.forms.anterior.title" var="anteriorTitle" />
<fmt:message key="webflow.qrcode.converter" var="converter" />

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
			<th class="centro" style="width:150px">${transformarPDF}</th>
		</tr>
		<!-- Documentos Anexados -->
		<logic:notEmpty name="webflowActionForm" property="addedDocuments">
			<logic:iterate name="webflowActionForm" property="addedDocuments" id="addedDocuments">
				<nested:root name="addedDocuments">
					<tr>
						<td class="centro">
							<a href="${pageContext.request.contextPath}/file/getDocumentoInstrucao.do2?nc=${addedDocuments.file.id}&tmpfile=${addedDocuments.file.tmpFilename}" target="_blank">
								${addedDocuments.file.description}</td>
							</a>
						<td class="borderBranco"></td>
						<td class="alignCenter">
							<c:choose>
								<c:when test="${addedDocuments.pdfFile}">
									<img src="${pageContext.request.contextPath}/images/icon/icon-PDF.png" style="border:none" title="PDF" alt="PDF" />
								</c:when>
								<c:otherwise>
									<nested:checkbox property="toConvertToPdf" styleClass="radion" indexed="true"/></td>		
								</c:otherwise>
							</c:choose>
						</td>
					</tr>			
				</nested:root>
			</logic:iterate>
		</logic:notEmpty>
		
		<!-- Documentos Itens -->
		<logic:notEmpty name="webflowActionForm" property="itensWithFile">
			<logic:iterate name="webflowActionForm" property="itensWithFile" id="itensWithFile" >
				<c:if test="${not empty itensWithFile.file.formFile and !itensWithFile.file.toDelete}">
				<nested:root name="itensWithFile">
					<tr>
						<td class="centro">
							<a href="${pageContext.request.contextPath}/file/getDocumentoAssociacao.do2?nc=${itensWithFile.file.id}&tmpfile=${itensWithFile.file.tmpFilename}"  target="_blank" >
								${itemWithFile.item.descricao}	
							</a>
						</td>
						<td class="borderBranco"></td>
						<td class="alignCenter">
							<c:choose>
								<c:when test="${itensWithFile.pdfFile}">
									<img src="${pageContext.request.contextPath}/images/icon/icon-PDF.png" style="border:none" title="PDF" alt="PDF" />
								</c:when>
								<c:otherwise>
									<nested:checkbox property="toConvertToPdf" styleClass="radion" indexed="true"/></td>		
								</c:otherwise>
							</c:choose>
						</td>
					</tr>			
				</nested:root>
				</c:if>
			</logic:iterate>
		</logic:notEmpty>
	</table>
	
	<div style="margin-top:10px;">
		<html:submit property="_eventId_back" value="${anterior}" title="${anteriorTitle}" styleClass="btForm" onclick="webflowAjaxRequest(event);"/>
		<html:submit property="_eventId_convert" value="${converter}" title="${converter}" styleClass="btForm" onclick="webflowAjaxRequest(event);"/>
	</div>

	</div>
</html:form>
</c:if>
