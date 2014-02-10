<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.forms.anterior" var="anterior" />
<fmt:message key="ipdms.forms.seguinte" var="seguinte" />
<fmt:message key='ipdms.forms.anterior.title' var="anteriorTitle"/>
<fmt:message key='ipdms.forms.seguinte.title' var="seguinteTitle"/>
<fmt:message key="webflow.anexos.docsAdicionados.empty" var="docsAdicionadosEmpty" />
<fmt:message key="webflow.anexos.titulo" var="titulo" />
<fmt:message key="ipdms.tarefas.anexarDocs.doc" var="doc" />
<fmt:message key="ipdms.myprocesses.estado" var="estado" />
<fmt:message key="webflow.anexos.documentoFisico" var="documentoFisico" />
<fmt:message key="ipdms.forms.inactivo" var="inactivo" />
<fmt:message key="ipdms.dynamicform.field.enabled" var="activo" />
<fmt:message key="webflow.anexos.docPrincipal" var="docPrincipal" />
<fmt:message key="ipdms.documentos.list.consultarDocs" var="consultarDocs" />

<c:if test="${empty _resumo}">

    <form:form modelAttribute="dynamic-flow-withfiles" class="dynForm" method="post" enctype="multipart/form-data">
        <input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">

        <div class="webflow_formdiv">
            <html:errors/>

            <c:set var="itensWithFiles" value="${dynamic.itensWithFile}" scope="request"/>
            <c:set var="visivel" value="${dynamic.variante.visivelExterior}" scope="request"/>

            <c:choose>
                <c:when test="${empty itensWithFiles}">
                    <div class="mensagenCaixa" >
                        <img src="${pageContext.request.contextPath}/images/icon/icon-atencao.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;"/>
                        <span class="info"><fmt:message key="ipdms.documentos.instrucao.inexistentes" /></span>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:set var="formUploadListItens" value="${itensWithFiles}" scope="request" />
                    <c:import url="/newlayout/widgets/webflow/uploadparts/anexosByItemFileList.jsp">
                        <c:param name="formUploadProperty" value="itensWithFile" />
                        <c:param name="withDescription" value="false" />
                        <c:param name="visivel" value="${visivel}" />
                    </c:import>

                </c:otherwise>
            </c:choose>

            <div style="clear:both"><br /></div>
            <div class="button" style="top:20px;">
                <input type="button" name="_eventId_back" value="${anterior}" class="" onclick="webflowAjaxRequest(event);" title="${anteriorTitle}"/>
                <input type="button" name="_eventId_next" value="${seguinte}" class="BT_primary" onclick="webflowAjaxRequest(event);" title="${seguinteTitle}" />
            </div>
        </div>
    </form:form>

</c:if>




<%-- RESUMO --%>
<c:set var="secure" value="" />
<c:if test="${userExterno}">
	<c:set var="secure" value="/guichetelectronico/secure" />
</c:if>

<c:if test="${not empty _resumo}">

    <c:if test="${empty dynamic.itensWithFile}">
		<div class="mensagenCaixa" >
			<img src="${pageContext.request.contextPath}/images/icon/icon-atencao.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;"/> 
			<span class="info"><fmt:message key="ipdms.documentos.instrucao.inexistentes" /></span>
		</div>
	</c:if>

	<c:if test="${not empty dynamic.itensWithFile}">

	    <c:set var="itensWithFiles" value="${dynamic.itensWithFile}" scope="request"/>
		<c:choose>
			<c:when test="${empty itensWithFiles}">
					<div class="row formlabel_sf" style="height:13px;">
					  	<div class="leftTab label" style="width: 98%;">
					  		${docsAdicionadosEmpty}
					  	</div>
					</div>
			</c:when>
			<c:otherwise>
				<c:set var="added" value="false" />
				
				<table cellpadding="0" cellspacing="0" class="centro" style="width:100%;" id="tableDocumentosAnexosByItem">
					<tr>
		  				<th style="width:40%;" class="centro">${titulo}</th>
		  				<th style="width:30%;" class="centro">${doc}</th>
		  				<th style="width:30%;" class="centro">${estado}</th>				  				
		  			</tr>
	
					<c:forEach var="itemWithFile" items="${itensWithFiles}">
						<c:if test="${not empty itemWithFile.file.formFile or itemWithFile.mainFile or itemWithFile.documentoFisico}">
							<c:set var="added" value="true" />
					
				  			<tr class="hoverTransparente">
				  				<td style="width:40%;" class="centro">
				  					${itemWithFile.item.descricao}
				  				</td>
				  				<td class="centro" >
				  					<c:choose>
				  					<c:when test="${not empty itemWithFile.file.formFile}">
					  					<a href="${pageContext.request.contextPath}${secure}/file/getDocumentoAssociacao.do2?nc=${itemWithFile.file.id}&tmpfile=${itemWithFile.file.tmpFilename}"  target="_blank" >
											<img src="${pageContext.request.contextPath}/images/icon/icon-consultarDoc.png" class="cursorMao" style="border-left:none" title="${consultarDocs}" alt="${consultarDocs}" />
										</a> &nbsp; (${itemWithFile.file.formFile.fileName})
									</c:when>
									<c:otherwise>
										${documentoFisico}
									</c:otherwise>
									</c:choose>
				  				</td>
				  				<td style="width:35%; border-right:none" class="centro">
				  					${estado}:
										<c:choose>
											<c:when test="${itemWithFile.file.toDelete}">${inactivo}</c:when>
											<c:otherwise>${activo}</c:otherwise>
										</c:choose>
										<c:if test="${itemWithFile.mainFile}">
											&nbsp;<b>(${docPrincipal})</b>
										</c:if>
				  				</td>
				  			</tr>
						</c:if>
					</c:forEach>
		  		</table>
				<c:if test="${!added}">
					<div class="row formlabel_sf" style="height:13px;">
					  	<div class="leftTab label" style="width: 98%;">
					  		${docsAdicionadosEmpty}
					  	</div>
					</div>
				</c:if>
			</c:otherwise>
		</c:choose>

	</c:if>
    <br/>

</c:if>
