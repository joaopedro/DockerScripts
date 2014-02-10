<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.documentos.list.docNum" var="docNum" />
<fmt:message key="ipdms.documentos.list.versao" var="versao" />
<fmt:message key="ipdms.documentos.list.obs" var="obs" />
<fmt:message key="ipdms.documentos.list.autor" var="autor" />
<fmt:message key="ipdms.documentos.list.data" var="data" />
<fmt:message key="ipdms.documentos.list.hash" var="hash" />
<fmt:message key="ipdms.documentos.list.hashOk" var="hashOkMsg" />
<fmt:message key="ipdms.documentos.list.hashNotOk" var="hashNotOkMsg" />
<fmt:message key="ipdms.documentos.list.etapa" var="etapa" />
<fmt:message key="ipdms.documentos.list.tipo" var="tipo" />
<fmt:message key="ipdms.tarefas.assinar.doc" var="doc" />
<fmt:message key="ipdms.forms.pesquisar" var="pesquisar" />

<%@page import="com.sinfic.ipdms.comum.wrapper.documento.TipoDocumento"%>

<c:set var="documentoVersions" value="${list_documents_versions}" />

<table style="border:none;" cellpadding="0" cellspacing="1" class="centroInner" width="100%"> 
<tr>
	<th class="centroInner" width="10%">${data}</th>
	<th class="centroInner" width="3%">*</th>
	<th class="centroInner" width="6%">${docNum}</th>
	<th class="centroInner" width="6%">${versao}</th>
	<th class="centroInner" width="">${etapa}</th>
	<th class="centroInner" width="">${autor}</th>
	<th class="centroInner" width="">${tipo}</th>
	<th class="centroInner" width="25%">${obs}</th>
	<th class="centroInner" width="">${doc}</th>
	<th class="centroInner">${hash}</th>
</tr>

<c:set var="tipoitemvalue"><%= TipoDocumento.INSTRUCAO %></c:set>

<c:forEach var="docWrapper" items="${documentoVersions}" varStatus="status">
<c:set var="documento" value="${docWrapper.documento}" />
<c:set var="color">
	<c:choose>
		<c:when test="${status.count % 2 == 0}">rgb(177,204,225)</c:when>
		<c:otherwise>rgb(209,232,244)</c:otherwise>
	</c:choose>
</c:set>
<tr>
	<td class="centroInner" align="center" nowrap="nowrap">
		<c:if test="${not empty documento.dataEmissao}">
			<fmt:formatDate value="${documento.dataEmissao}" pattern="dd-MM-yyyy HH:mm" />
		</c:if>
	</td>
	<td class="alignCenter">${documento.tipoDocumento.name}</td>
	<td class="centroInner">${documento.numeroDocumento}</td>
	<td class="alignCenter">${documento.versaoConteudo}</td>
	<td class="centroInner">
		<c:choose>
			<c:when test="${empty docWrapper.etapa}">-</c:when>
			<c:otherwise>${docWrapper.etapa.titulo}</c:otherwise>
		</c:choose>
	</td>
	<td class="centroInner">${documento.creator.titulo}	</td>
	<td class="centroInner">
		<c:choose>
			<c:when test="${documento.tipoDocumento.value != tipoitemvalue}">-</c:when>
			<c:otherwise>${documento.tipoDocumentoAnexado.descricao}</c:otherwise>
		</c:choose>	
	</td>
	<td class="centroInner">${documento.comentario}</td>
	<td class="centroInner">
		<c:if test="${docWrapper.exists}">
			<a href="${pageContext.request.contextPath}/file/getDocumento.do2?nc=${documento.numeroConteudo}&vc=${documento.versaoConteudo}" target="_blank">
				<img src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" style="border:none" alt="${pesquisar}" title="${pesquisar}" />
			</a>
		</c:if>
	</td>
	<td class="alignCenter">
		<c:if test="${not empty documento.hash}">
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
</tr>
</c:forEach>
</table>
