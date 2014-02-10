<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.emitirtemplate.docsExistentes" var="docsExistentes" />
<fmt:message key="ipdms.emitirtemplate.docsEmpty" var="docsEmpty" />
<fmt:message key="ipdms.documentos.list.docNum" var="docNum" />
<fmt:message key="ipdms.documentos.list.descricao" var="descricao" />
<fmt:message key="ipdms.documentos.list.versao" var="versao" />
<fmt:message key="ipdms.documentos.list.obs" var="obs" />
<fmt:message key="ipdms.documentos.list.autor" var="autor" />
<fmt:message key="ipdms.documentos.list.data" var="data" />
<fmt:message key="ipdms.documentos.list.hist" var="hist" />
<fmt:message key="ipdms.forms.editar" var="editar" />
<fmt:message key="ipdms.documentos.list.hash" var="hash" />
<fmt:message key="ipdms.documentos.list.consultarHistory" var="consultarHistory" />
<fmt:message key="ipdms.modules.entidade.contacto.expandir" var="expandir" />
<fmt:message key="ipdms.emitirtemplate.actualizacao" var="actualizacao" />
<fmt:message key="ipdms.instrucao.documento" var="documento" />
<fmt:message key="ipdms.documentos.list.hashOk" var="hashOkMsg" />
<fmt:message key="ipdms.documentos.list.hashNotOk" var="hashNotOkMsg" />

<c:choose>
	<c:when test="${not empty documentos}">
	<div id="ver_ajuda" class="row" style="padding-top:0px; text-align:left;">
		<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
			<tbody>
			  <tr>
			    <td class="titulo2">${docsExistentes}</td>
			  </tr>
			</tbody>
		</table>					
	</div>
		<table cellpadding="0" cellspacing="0" class="centro" style="width:99%">
			<tr>
				<th class="centro" width="15%">${docNum}</th>
				<th class="centro" width="15%">${descricao}</th>
				<th class="centro" width="5%">${versao}</th>
				<th class="centro" width="30%">${obs}</th>
				<th class="centro" width="10%">${autor}</th>
				<th class="centro" width="17%">${data}</th>
				<th class="centro" width="5%">${hist}</th>
				<th class="centro" width="3%">${editar}</th>
				<th class="centro" width="3%">${hash}</th>
				<th class="centro" width="3%">&nbsp;</th>
			</tr>
			<c:forEach items="${documentos}" var="docWrapper" varStatus="vs">
				<c:set var="doc" value="${docWrapper.documento}"></c:set>
				<c:set var="color"><c:choose><c:when test="${vs.count % 2 == 0}">rgb(221,238,248)</c:when><c:otherwise>white</c:otherwise></c:choose></c:set>
				<tr>
					<td class="alignCenter">${doc.numeroDocumento}</td>
					<td class="centro">${doc.designacao}</td>
					<td class="alignCenter">${doc.versaoConteudo}</td>
					<td class="centro">${doc.comentario}</td>
					<td class="centro" style="text-align:left;">${doc.creator.titulo}</td>
					<td class="alignCenter"><fmt:formatDate value="${doc.dataEmissao}" pattern="dd-MM-yyyy HH:mm" /></td>
					<td class="alignCenter">
						<c:if test="${doc.versaoConteudo > 1}">
							<a href="javascript:historicoDocumento(${doc.numeroConteudo}, '${pageContext.request.contextPath}');" title="${consultarHistory}">
								<img src="${pageContext.request.contextPath}/images/icon/icon-mais.png" id="img_${doc.numeroConteudo}" alt="${expandir}" title="${expandir}" class="cursorMao" />
							</a>
						</c:if>
					</td>
					<td class="alignCenter"
						onmouseover="window.status='${actualizacao} ${doc.numeroDocumento}.'; return true;"
						onmousedown="window.status='${actualizacao} ${doc.numeroDocumento}.'; return true;"
						onmouseup="window.status=window.defaultStatus; return true;"
						onmouseout="window.status=window.defaultStatus; return true;"
					>
						<a href="javascript:actualizar( ${doc.numeroConteudo},
														${doc.versaoConteudo},
														'${doc.numeroDocumento}',
														'${doc.designacao}',
														'${doc.comentario}',
														'${doc.extensao}' );">
								<img src="${pageContext.request.contextPath}/images/icon/icon-editar.png" alt="${editar} ${documento}" title="${editar} ${documento}" class="cursorMao" />
						</a>
					</td>
					<td class="alignCenter">
						<c:if test="${not empty doc.hash}">
							<c:choose>
								<c:when test="${docWrapper.hashOk}">
									<img src="${pageContext.request.contextPath}/images/icon/icon-OK.png"
										alt="${hashOkMsg}"
										title="${hashOkMsg}" 
										style="border:none;" />
								</c:when>
								<c:otherwise>
									<img src="${pageContext.request.contextPath}/images/icon/icon-atencao.png"
										alt="${hashNotOkMsg}"
										title="${hashNotOkMsg}" 
										style="border:none;" />
								</c:otherwise>
							</c:choose>
						</c:if>
					</td>
					<td class="alignCenter">
						<c:set var="documentId" value="${doc.numeroConteudo}" />
						<c:choose>
							<c:when test="${doc.locked}">
								<input id="${documentId}_lock" style="display: none;" 
									type="button" title="Lock" value="Lock" class="btFormEscuro" onclick="documentLock('${documentId}');">
								<input id="${documentId}_unlock" 
									type="button" value="Unlock" 
									class="btFormEscuro" onclick="documentUnlock('${documentId}');">
							</c:when>
							<c:otherwise>
								<input id="${documentId}_lock" 
									type="button" value="Lock" class="btFormEscuro" onclick="documentLock('${documentId}');">
								<input id="${documentId}_unlock" 
									type="button" value="Unlock" style="display: none;" 
									class="btFormEscuro" onclick="documentUnlock('${documentId}');">
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr id="tr_${doc.numeroConteudo}" style="display: none;">
					<td class="alignCenter" colspan="10" id="td_${doc.numeroConteudo}"></td>
					<td class="centro"></td>
					<td class="centro"></td>
				</tr>
			</c:forEach>
		</table>	
	</c:when>
	<c:otherwise>
		<div class="mensagenCaixa" >
			<span class="info" >${docsEmpty}</span>
		</div>
		
	</c:otherwise>
</c:choose>

<script>
function documentLock(ncDocumento) {
	lock('${pageContext.request.contextPath}', ncDocumento);
}

function documentUnlock(ncDocumento) {
	unlock('${pageContext.request.contextPath}', ncDocumento);
}
</script>
