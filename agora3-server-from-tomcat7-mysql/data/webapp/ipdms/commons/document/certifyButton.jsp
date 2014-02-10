<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/sslext.tld" prefix="sslext" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.documentos.certificateInfo" var="certificateInfo" />
<fmt:message key="ipdms.documentos.certificateEmpty.title" var="certificateEmptyTitle" />
<fmt:message key="ipdms.documentos.certificateEmpty.msg" var="certificateEmptyMsg" />

<c:set var="documentId" value="${document.numeroConteudo}" />
<c:choose>
	<c:when test="${not empty document.certificateInfo}">
		<img id="${documentId}_certified" src="${pageContext.request.contextPath}/images/icon/icon-lock-small.png" 
			onclick="ExtWindow('${certificateInfo}', '${pageContext.request.contextPath}/certifyDocumentoByUser.do2?method=showCertifiedInfo&ncDocumento=${documentId}','','html');"/>
	</c:when>
	<c:when test="${not empty sessionScope['com.sinfic.ipdms.security.x509certificate']}">
		<input id="${documentId}_certify" type="button" class="btFormEscuro" value="Certify"
			onclick="certifyDocument('${documentId}');" />
		<img id="${documentId}_certified" src="${pageContext.request.contextPath}/images/icon/icon-lock-small.png" 
			style="display: none;" 
			onclick="ExtWindow('${certificateInfo}', '${pageContext.request.contextPath}/certifyDocumentoByUser.do2?method=showCertifiedInfo&ncDocumento=${documentId}','','html');"/>		
	</c:when>
	<c:otherwise>
		<span title="${certificateEmptyTitle}">${certificateEmptyMsg}</span>
		<%--sslext:link action="/ssl/certifyDocument.do2?ncDocumento=${documentId}" styleClass="texto">
			Certify
		</sslext:link--%>
	</c:otherwise>
</c:choose>

