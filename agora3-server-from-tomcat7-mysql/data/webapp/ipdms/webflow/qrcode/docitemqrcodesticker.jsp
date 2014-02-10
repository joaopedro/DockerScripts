<%@ taglib uri="/tags/html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="webflow.qrcode.textoQRCODE" var="textoQRCODE" />
<fmt:message key="webflow.qrcode.designacaosingular" var="designacaosingular" />
<fmt:message key="webflow.qrcode.impressao" var="impressao" />
<fmt:message key="ipdms.forms.imprimir" var="imprimir" />
<fmt:message key="webflow.qrcode.stickerList.empty" var="stickerListEmpty" />
<fmt:message key="webflow.qrcode.criarCodigo" var="criarCodigo" />
<fmt:message key="ipdms.forms.anterior" var="anterior" />
<fmt:message key="ipdms.forms.anterior.title" var="anteriorTitle" />
<fmt:message key="ipdms.forms.seguinte" var="seguinte" />
<fmt:message key="ipdms.forms.seguinte.title" var="seguinteTitle" />

<SCRIPT src='${pageContext.request.contextPath}/ipdms/js/swf-ajax-ext.js' type="text/javascript"></script>

<c:if test="${empty _resumo}">
<html:form action="applicationFlow" method="post">
	<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}"><br/>
	<div class="webflow_formdiv">
		<html:errors/>

		<c:choose>
			<c:when test="${not empty teste.docItemBarcodeStickerList}">
			<table cellpadding="0" cellspacing="0" class="centro" style="width:300px;">
				<tr>
					<th class="centro">${textoQRCODE}</th>
					<th class="borderBranco"></th>
					<th class="centro" style="width:60px">${designacaosingular}</th>
					<th class="borderBranco"></th>
					<th class="centro" style="width:70px">${impressao}</th>
				</tr>
				<c:forEach items="${teste.docItemBarcodeStickerList}" var="sticker" varStatus="i">
					<tr>
						<td class="centro">${sticker.text}</td>
						<td class="borderBranco"></td>
						<td class="alignCenter">
							<img src="${pageContext.request.contextPath}/file/getQrCodeImage.do2?qrCodeFilename=${sticker.imageFileName}" width="60" height="60" />
						</td>
						<td class="borderBranco"></td>
						<td class="alignCenter">
							<c:url value="ipdms/webflow/qrcode/imprimirQrCode.jsp?qrCodeFilename=${sticker.imageFileName}&text=${sticker.text}" var="printurl"/>
							<a href="#" onclick="printQrCode('${printurl}');"> ${imprimir} </a>
						</td>
					</tr>
				</c:forEach>
			</table>
			</c:when>
			<c:otherwise>
				<div class="mensagenCaixa" >
					<img src="${pageContext.request.contextPath}/images/icon/icon-atencao.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;"/> 
					<span class="info">${stickerListEmpty}</span>
				</div>
				<br/>
			</c:otherwise>
		</c:choose>
	
		<div style="margin-top:10px;">
			<html:submit property="_eventId_back" value="${anterior}" title="${anteriorTitle}" styleClass="btForm" />
			<html:submit property="_eventId_createqrcode" value="${criarCodigo}" title="${criarCodigo}" styleClass="btForm" />
			<html:submit property="_eventId_next" value="${seguinte}" title="${seguinteTitle}" styleClass="btForm" />
		</div>
	</div>
</html:form>
</c:if>

<script>
	printQrCode = function(url) {
		window.open(url, 'printwindow', "status=1, resizable=Disallow, height=250, width=250")
	};
</script>
