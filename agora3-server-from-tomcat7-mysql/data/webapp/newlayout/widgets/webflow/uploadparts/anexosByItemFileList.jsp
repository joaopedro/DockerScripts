<%--
For this jsp be called the following variables should be defined:
	"formUploadListItens" - list of IFileUploadFormBean to iterate 
	"param.formUploadProperty" - property name (via parameter)
	"param.withDescription" - true if the description text box needs 
								to be visible (via parameter) 
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="webflow.anexos.obrigatorio" var="obrigatorio" />
<fmt:message key="webflow.anexos.documentoFisico" var="docFisico" />
<fmt:message key="webflow.anexos.descricao" var="descricao" />
<fmt:message key="webflow.anexos.docAnexado" var="docAnexado" />
<fmt:message key="webflow.anexos.docPrincipal" var="docPrincipal" />
<fmt:message key="webflow.anexos.abrirFicheiro" var="abrirFicheiro" />
<fmt:message key="webflow.anexos.apagarFicheiros" var="apagarFicheiros" />
<fmt:message key="webflow.anexos.apagarFicheiros.confirm" var="apagarFicheirosConfirm" />
<fmt:message key="ipdms.forms.eliminar" var="eliminar" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />

<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/ConfirmCancel.js"></script>

<c:set var="formUploadProperty" value="${param.formUploadProperty}" />
<c:set var="withDescription" value="${param.withDescription}" />

<script>

    //TODO: replace EXT invocation by jQuery
    deleteUploadedFiles = function(button) {
        /*
        if(button=='yes'){

            $$('input').each(
                function(e){
                    if(e.type == 'checkbox' && e.id.startsWith('checkbox_delete_') && e.checked == true) {
                        e.checked = false;
                        var index = e.id.substring(e.id.lastIndexOf('_') + 1);
                        deleteUploadedFile(index);
                    }
                }
            );

        }
        */
    };

    deleteUploadedFile = function(index) {

        //$('${formUploadProperty}[' + index + '].file.toDelete').value = 'true';
        //$('divfile' + index).toggle();
        //$('fileuploaded' + index).toggle();
        setDirty(index, false);
    };

    setDirty = function (index, value) {
        //$('${formUploadProperty}[' + index + '].file.dirty').value = value;
    };
</script>

	<div class="row" style="margin-bottom:20px;">
	  <div class="leftTab label" style="width: 90%; " title="${obrigatorio}">
	        <span class="formlabel_obrigatorio">${obrigatorio}</span>
	    </div>
	</div>
	<c:set var="visivel" value="${param.visivel}" />	
<table class="centro" cellpadding="0" cellspacing="0">
	<tr>
	    <c:if test="${!visivel}">			     
			<th class="centro" style="width:5%" >${docFisico}</th>
		</c:if>
		<th class="centro" style="width:39%" >${descricao}</th>
		<th class="centro" style="width:15%" >${docAnexado}</th>
		<th class="centro" style="width:3%">${eliminar}</th>
	</tr>

    <c:forEach items="${formUploadListItens}" var="itemWithFile" varStatus="i">
        <c:set var="fileForUpload" value="${itemWithFile.file}" />
        <c:set var="itemWithFileProperty" value="${formUploadProperty}[${i.index}]" />
        <c:set var="fileUploadProperty" value="${itemWithFileProperty}.file" />

        <tr>
        <c:if test="${!visivel}">
            <td class="alignCenter">
                    <label for="${itemWithFileProperty}.documentoFisico">
                        <c:choose>
                            <c:when test="${itemWithFile.documentoFisico}">
                                <input type="checkbox" name="${itemWithFileProperty}.documentoFisico"
                                    id="${itemWithFileProperty}.documentoFisico"  title="${docFisico}"
                                    style="border: 0;" checked="checked">
                            </c:when>
                            <c:otherwise>
                                <input type="checkbox" name="${itemWithFileProperty}.documentoFisico"
                                    id="${itemWithFileProperty}.documentoFisico"  title="${docFisico}" style="border: 0;">
                            </c:otherwise>
                        </c:choose>
                    </label>
        </c:if>
            </td>
            <td class="centro">
                <label for="${fileUploadProperty}.toDelete">
                <input type="hidden" id="${fileUploadProperty}.toDelete" name="${fileUploadProperty}.toDelete"
                    value="${fileForUpload.toDelete}"></label>
                <label for="${fileUploadProperty}.dirty">
                <input type="hidden" id="${fileUploadProperty}.dirty" name="${fileUploadProperty}.dirty"
                    value="${fileForUpload.dirty}"></label>

                <span class="textoBold">
                    ${itemWithFile.item.descricao}
                    <c:if test="${itemWithFile.mandatory}">&nbsp;*</c:if>
                </span>
                <c:if test="${not empty itemWithFile.item.extensoes}">(${itemWithFile.item.extensoes})</c:if>
                <br />
            </td>
            <td class="centro" style="padding-top:5px; padding-bottom:5px;">
                <c:choose>
                    <c:when test="${fileForUpload.formFileEmpty or fileForUpload.toDelete}">
                        <label for="${fileUploadProperty}.formFile"></label>
                        <input type="file" id="${fileUploadProperty}.formFile"
                            name="${fileUploadProperty}.formFile" onchange="setDirty(${i.index}, true);" />
                    </c:when>
                    <c:otherwise>
                        <div id="fileuploaded${i.index}">
                            <c:choose>
                                <c:when test="${not empty fileForUpload.webappRelativeFilename}">
                                    <c:set var="visualizeFileUrl" value="${pageContext.request.contextPath}/${fileForUpload.webappRelativeFilename}" />
                                </c:when>
                                <c:otherwise>
                                    <c:set var="visualizeFileUrl" value="${pageContext.request.contextPath}/file/getDocumentoAssociacao.do2?nc=${fileForUpload.id}&tmpfile=${fileForUpload.tmpFilename}" />
                                </c:otherwise>
                            </c:choose>
                            <a href="${visualizeFileUrl}" target="_blank" title="${abrirFicheiro}">
                                ${fileForUpload.formFile.fileName}
                            </a>
                            <c:if test="${itemWithFile.mainFile}">&nbsp;<b>(${docPrincipal})</b></c:if>
                        </div>
                        <div id="divfile${i.index}" style="display: none">
                            <label for="${formUploadProperty}.formFile"></label>
                            <input type="file" id="${formUploadProperty}.formFile"
                                name="${fileUploadProperty}.formFile" onchange="setDirty(${i.index},true);" />
                        </div>
                    </c:otherwise>
                </c:choose>
            </td>
            <td class="alignCenter">
                <label for="checkbox_delete_${i.index}"></label>
                <input type="checkbox" name="checkbox_delete_${i.index}" id="checkbox_delete_${i.index}" style="border:0" />
            </td>
        </tr>
    </c:forEach>
</table>

<!-- Icon eliminar -->
<div id="alignRight">
	<img src="${pageContext.request.contextPath}/images/icon/icon-lixo.png" class="" alt="${eliminar}" title="${eliminar}"
			onclick="" />
</div>