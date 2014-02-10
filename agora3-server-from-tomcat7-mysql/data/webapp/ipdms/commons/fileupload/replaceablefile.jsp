<%--
For this jsp be called the following variables should be defined: 
	"fileForUpload" - object (via request scope)	
	"param.formUploadProperty" - property name (via parameter)
	"param.withDescription" - true if the description text box needs 
		to be visible (via parameter) 
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="formUploadProperty" value="${param.formUploadProperty}" />
<c:set var="withDescription" value="${param.withDescription}" />
<c:set var="visualizeFileAction" value="${param.visualizeFileAction}" />

<script>
deleteUploadedFile = function() {
	$('${formUploadProperty}.toDelete').value = true;
	$('divfile').toggle();
	$('fileuploaded').toggle();
	if($('${formUploadProperty}.description')) {
		$('${formUploadProperty}.description').value = "";
	}
	$('${formUploadProperty}.formFile').enable();
	setDirty(false);
};

setDirty = function (value) {
	$('${formUploadProperty}.dirty').value = value;
};
</script>

<div class="label" style="width: 80%;">
	<input type="hidden" id="${formUploadProperty}.toDelete" name="${formUploadProperty}.toDelete" 
		value="${fileForUpload.toDelete}">
	<input type="hidden" id="${formUploadProperty}.dirty" name="${formUploadProperty}.dirty" 
		value="${fileForUpload.dirty}" >
	
	<c:choose>
		<c:when test="${fileForUpload.formFileEmpty or fileForUpload.toDelete}">
			<c:if test="${withDescription}">
				<label for="formUploadProperty"><input type="text" id="${formUploadProperty}.description" name="${formUploadProperty}.description" 
					value="${fileForUpload.description}" /></label>
			</c:if>
			<label for="formUploadProperty"><input type="file" id="${formUploadProperty}.formFile" 
				name="${formUploadProperty}.formFile" onchange="setDirty(true);" /></label>
		</c:when>
		<c:otherwise>
			<div id="divfile" style="display: none">
				<c:if test="${withDescription}">
					<label for="formUploadProperty"><input type="text" id="${formUploadProperty}.description" name="${formUploadProperty}.description" 
						value="${fileForUpload.description}"/></label>
				</c:if>
				<label for="formUploadProperty">
					<input type="file" id="${formUploadProperty}.formFile" 
						name="${formUploadProperty}.formFile" onchange="setDirty(true);" 
						disabled="disabled" />
				</label>
			</div>
			<div id="fileuploaded">
				<img src="${pageContext.request.contextPath}/images/icon/icon-lixo.png" class="cursorMao" alt="<fmt:message key='ipdms.forms.eliminar' />" title="<fmt:message key='ipdms.forms.eliminar' />" onclick="deleteUploadedFile();" />
				<c:choose>
					<c:when test="${not empty fileForUpload.webappRelativeFilename}">
						<c:set var="visualizeFileUrl" value="${pageContext.request.contextPath}/${fileForUpload.webappRelativeFilename}" />
					</c:when>
					<c:otherwise>
						<c:set var="visualizeFileUrl" value="${pageContext.request.contextPath}/${visualizeFileAction}.do2?id=${fileForUpload.id}" />
					</c:otherwise>
				</c:choose>
				<a href="${visualizeFileUrl}" target="_blank">
					<img src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" class="cursorMao" alt="<fmt:message key='ipdms.myprocesses.consultar' />" title="<fmt:message key='ipdms.myprocesses.consultar' />" style="border:none" />
				</a> &nbsp; (${fileForUpload.formFile.fileName})	
			</div>
		</c:otherwise>
	</c:choose>
</div>