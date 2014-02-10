<%--
For this jsp be called the following variables should be defined: 
	"formUploadListItens" - list of IFileUploadFormBean to iterate
	"param.formUploadListProperty" - list property name (via parameter)
	"param.visualizeFileAction" - action that visualizes the uploaded file
	"hasTipificacao"
	"tipificacoes"
	"anexarColumnTitle"
	"param.toDelete
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">

    //TODO: replace EXT invocation by jQuery
    enableFormFile = function(formFilePropertyId, tipoAnexoPropertyId) {
        alert('formFilePropertyId: ' + formFilePropertyId + 'tipoAnexoPropertyId: ' + tipoAnexoPropertyId);
        debugger;
        jQuery("#"+formFilePropertyId).attr('disabled', false);
        if(jQuery("#tipoAnexoPropertyId")) {
           jQuery("#tipoAnexoPropertyId").attr('disabled', false);
        }

        //$(formFilePropertyId).enable();
        //if($(tipoAnexoPropertyId)) {
        //    $(tipoAnexoPropertyId).enable();
        //}

    };
</script>

<c:set var="formUploadBeanList" value="${param.formUploadListProperty}" />

<table cellpadding="0" cellspacing="0" class="centro" style="width:60%;">
<tr>
	<th style="width:50%" class="centro">${param.anexarColumnTitle}</th>
	<th style="width:50%" class="centro"><fmt:message key="ipdms.accoes.anexar.ficheiro" /></th>
	<c:if test="${hasTipificacao && noDocumentoFisico}">
		<th style="width:50%" class="centro"><fmt:message key="ipdms.accoes.anexar.tipodocumento" /></th>
	</c:if>
	<c:if test="${param.toDelete}">
	<th style="width:10%" class="centro">
		<input type="image" id="_eventId_delete" name="_eventId_delete" alt="<fmt:message key='ipdms.forms.eliminar' />" title="<fmt:message key='ipdms.forms.eliminar' />" 
		src="${pageContext.request.contextPath}/images/icon/icon-lixo.png" style="border:none;">
	</th>
	</c:if>
</tr>
<c:forEach items="${formUploadListItens}" var="formUploadBean" varStatus="i">
	<c:set var="fileForUpload" value="${formUploadBean.file}" />
	<c:set var="formUploadProperty" value="${formUploadBeanList}[${i.index}].file" />
		<c:choose>
			<c:when test="${fileForUpload.formFileEmpty}"> <%-- Novo Ficheiro --%>
				<tr class="hoverTransparente">
					<td class="centro">
						<label for="${formUploadProperty}.description"></label>
						<input style="width:90%" type="text" id="${formUploadProperty}.description" name="${formUploadProperty}.description" 
							value="${fileForUpload.description}" 
							onkeypress="enableFormFile('${formUploadProperty}.formFile', '${formUploadProperty}.idTipoDocumentoAnexado');"/>				
					</td> 
					<td class="centro">
					<label for="${formUploadProperty}.formFile"></label>
						<input type="file" id="${formUploadProperty}.formFile" disabled="disabled" 
							name="${formUploadProperty}.formFile" style="width:90%"  />
					</td>
					<c:if test="${hasTipificacao && noDocumentoFisico}">
						<td class="centro">
						<label for="${formUploadProperty}.idTipoDocumentoAnexado"></label>
						<select id="${formUploadProperty}.idTipoDocumentoAnexado" name="${formUploadProperty}.idTipoDocumentoAnexado" style="style='width:97%'" disabled="disabled">
							<option value="0"><fmt:message key="ipdms.forms.select.default" /></option>
							<c:forEach items="${tipificacoes}" var="tipo">
								<c:if test="${!tipo.documentoFisico}">
									<option value="${tipo.id.tipoDocumento.id}">${tipo.id.tipoDocumento.descricao}</option>
								</c:if>	
							</c:forEach>					
						</select>
						</td>
	    			</c:if>		
			</c:when>
			<c:otherwise> <%-- Ficheiro já foi uploaded --%>			
				<tr title="${fileForUpload.description}">
					<td class="centro">
						<c:choose>
							<c:when test="${formUploadBean.mainFile}"><b>${fileForUpload.description}&nbsp;(Principal)</b></c:when>
							<c:otherwise>${fileForUpload.description}</c:otherwise>
						</c:choose>			
					</td>	
					<td class="centro">
						<a href="${pageContext.request.contextPath}/${param.visualizeFileAction}.do2?nc=${fileForUpload.id}&tmpfile=${fileForUpload.tmpFilename}" target="_blank" title="<fmt:message key='ipdms.documentos.list.consultarDocs' />">
							${fileForUpload.formFile.fileName}
						</a>
					</td>
					<c:if test="${hasTipificacao}">
						<td class="centro">
							<c:choose>
								<c:when test="${empty fileForUpload.tipoDocumentoAnexado}">-</c:when>
								<c:otherwise>${fileForUpload.tipoDocumentoAnexado.descricao}</c:otherwise>
							</c:choose>
						</td>
					</c:if>
					<td class="alignCenter">
						<label for="${formUploadProperty}.selected"></label>
						<input type="checkbox" id="${formUploadProperty}.selected" 
						name="${formUploadProperty}.selected" style="border:0;" >
					</td>			
			</c:otherwise>
		</c:choose>
</c:forEach>
</table>