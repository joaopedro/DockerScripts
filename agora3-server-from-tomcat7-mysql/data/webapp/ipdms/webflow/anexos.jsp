<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key='ipdms.forms.adicionar' var="adicionar"/>
<fmt:message key="ipdms.forms.anterior" var="anterior" />
<fmt:message key="ipdms.forms.seguinte" var="seguinte" />
<fmt:message key='ipdms.forms.anterior.title' var="anteriorTitle"/>
<fmt:message key='ipdms.forms.seguinte.title' var="seguinteTitle"/>
<fmt:message key='ipdms.forms.recuperar' var="recuperar"/>
<fmt:message key='ipdms.forms.recuperar.title' var="recuperarTitle"/>


<%----  WEBFLOW ----%>
<c:if test="${empty _resumo}">

    <c:if test="${not empty dynamic.variante.tiposDocumentoInstrucao}">
		<c:set var="hasTipificacao" value="true" scope="request" />
		<c:set var="tipificacoes" value="${dynamic.variante.tiposDocumentoInstrucao}" scope="request" />

		<c:forEach items="${tipificacoes}" var="itemWithFile">
			<c:if test="${!itemWithFile.documentoFisico}">
				<c:set var="noDocumentoFisico" value="true" scope="request" />
			</c:if>
		</c:forEach>

	</c:if>




    <form:form  action="${flowExecutionUrl}" class="dynForm" method="post" enctype="multipart/form-data">

		<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">
		<div class="webflow_formdiv">
            <form:errors/>
            <br/>

            <%-- Documento Novos --%>
            <c:set var="formUploadListItens" value="${dynamic.newDocuments}" scope="request" />
            <c:import url="/ipdms/webflow/uploadparts/anexosFileList.jsp">
                <c:param name="formUploadListProperty" value="newDocuments" />
                <c:param name="visualizeFileAction" value="file/getDocumentoInstrucao" />
                <c:param name="anexarColumnTitle"><fmt:message key="ipdms.accoes.anexar.titulo" /></c:param>
            </c:import>

            <div class="buttonRow" style="margin-top:10px;">
                <input type="submit" name="_eventId_add" value="${adicionar} +" class="btForm" title="${adicionar}" />
            </div>

            <%-- Lista de documento activos--%>
            <c:if test="${not empty dynamic.addedDocuments}">
                <div style="margin-top:10px;">
                    <c:set var="formUploadListItens" value="${dynamic.addedDocuments}" scope="request" />
                    <c:import url="/ipdms/webflow/uploadparts/anexosFileList.jsp">
                        <c:param name="formUploadListProperty" value="addedDocuments" />
                        <c:param name="visualizeFileAction" value="file/getDocumentoInstrucao" />
                        <c:param name="anexarColumnTitle"><fmt:message key="ipdms.accoes.anexar.documentosanexados" /></c:param>
                        <c:param name="toDelete" value="true" />
                    </c:import>
                </div>
            </c:if>

            <%-- Lista de documentos inactivos --%>
            <c:if test="${not empty dynamic.removedDocuments}">
                <br />
                <fieldset>
                    <legend style="formlabel"><fmt:message key="ipdms.accoes.anexar.documentosapagados" />&nbsp;</legend>
                    <div style="margin-top:10px;">
                        <c:set var="formUploadListItens" value="${dynamic.removedDocuments}" scope="request" />
                        <c:import url="/ipdms/webflow/uploadparts/anexosFileList.jsp">
                            <c:param name="formUploadListProperty" value="removedDocuments" />
                            <c:param name="visualizeFileAction" value="file/getDocumentoInstrucao" />
                            <c:param name="anexarColumnTitle"><fmt:message key="ipdms.accoes.anexar.documentosapagados" /></c:param>
                        </c:import>
                    </div>
                    <div class="buttonRow" style="margin-top:10px; text-align: right;">
                        <input type="submit" name="_eventId_recover" value="${recuperar}" class="btForm" title="${recuperarTitle}" />
                    </div>
                </fieldset>
            </c:if>
            <br />

            <div style="clear:both"><br /></div>
            <div class="buttonRow">
                <input type="submit" name="_eventId_back" value="${anterior}" class="btForm" title="${anteriorTitle}"/>
                <input type="submit" name="_eventId_next" value="${seguinte}" class="btForm" title="${seguinteTitle}" />
            </div>

        </div>

    </form:form>

</c:if>


<%----  RESUME ----%>
<c:if test="${not empty _resumo}">



    <c:if test="${not empty dynamic.addedDocuments}">

        <c:set var="secure" value="" />
        <c:if test="${userExterno}">
            <c:set var="secure" value="/guichetelectronico/secure" />
        </c:if>
        <table cellspacing="0" cellpadding="0" width="100%" class="centro" id="tableDocumentosAnexos">
            <tr>
                <th class="centro" style="width:40%"><fmt:message key='ipdms.conteudos.titulo' /></th>
                <th class="centro" style="width:30%"><fmt:message key='ipdms.instrucao.documento' /></th>
                <th class="centro" style="width:40%">
                    <fmt:message key="ipdms.accoes.anexar.tipodocumento" />
                </th>
            </tr>


            <c:forEach items="${dynamic.addedDocuments}" var="documento">
                <tr >
                    <td class="centro">
                        <c:choose>
                            <c:when test="${documento.mainFile}">${documento.file.description}&nbsp;(Principal)</c:when>
                            <c:otherwise>${documento.file.description}</c:otherwise>
                        </c:choose>
                    </td>
                    <td class="centro">
                        <a class="formfield" href="${pageContext.request.contextPath}${secure}/file/getDocumentoInstrucao.do2?nc=${documento.file.id}&tmpfile=${documento.file.tmpFilename}" target="_blank">
                            <img src="${pageContext.request.contextPath}/images/icon/icon-consultarDoc.png" class="cursorMao" style="border-left:none" title="${consultarDocs}" alt="${consultarDocs}" />
                        </a> &nbsp; (${documento.file.formFile.fileName})
                    </td>
                    <td class="centro" style="width:35%; border-right:none">--</td>
                </tr>
            </c:forEach>


        </table>

    </c:if>


    <c:if test="${empty dynamic.addedDocuments}">
        <div class="row formlabel_sf" style="height:13px;">
            <div class="leftTab label" style="width: 98%;" title="Ajax Combo">
                <fmt:message key="ipdms.so.gestaoAusencias.anexos.emptyMsg" />
            </div>
        </div>
    </c:if>
    <br/>

    <%-- DOCUMENTOS INACTIVOS--%>
    <c:if test="${not empty dynamic.removedDocuments}">
        <fieldset>
            <legend class="formlabel"><fmt:message key='ipdms.accoes.anexar.documentosapagados' /></legend>
            <br />
            <table cellspacing="0" cellpadding="0" width="100%" class="centro">
                <tr>
                    <th class="centro" width="40%"><fmt:message key='ipdms.conteudos.titulo' /></th>
                    <th class="centro" width="40%"><fmt:message key='ipdms.instrucao.documento' /></th>
                    <th class="centro" width="40%">
                        <fmt:message key="ipdms.accoes.anexar.tipodocumento" />
                    </th>
                </tr>

                <c:forEach items="${dynamic.removedDocuments}" var="documento">
                    <tr>
                        <td class="centro">
                            <c:choose>
                                <c:when test="${documento.mainFile}">${documento.file.description}&nbsp;(Principal)</c:when>
                                <c:otherwise>${documento.file.description}</c:otherwise>
                            </c:choose>
                        </td>
                        <td class="centro">
                            <a class="formfield" href="${pageContext.request.contextPath}/file/getDocumentoInstrucao.do2?nc=${documento.file.id}&tmpFile=${documento.file.tmpFilename}" target="_blank">
                                ${documento.file.formFile.fileName}
                            </a>
                        </td>
                        <td class="centro">--</td>
                    </tr>
                </c:forEach>

            </table>
        </fieldset>
    </c:if>

</c:if>