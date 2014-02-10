<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/ipdms/themes" />
<link href='${THEMES_DIR}/estilos.css' type=text/css rel=stylesheet media="screen" />
<link href='${THEMES_DIR}/forms.css' type=text/css rel=stylesheet />
<script src='${pageContext.request.contextPath}/ipdms/js/prototype.js' type="text/javascript"></script>

<body style="background-color: #CCC; overflow: scroll;">

	<%-- PREVIEW HEADER --%>
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody><tr><td style="border-bottom: 0px" class="titulo1" >
			<fmt:message key="ipdms.pdfpreview.image.titulo" />
		</td></tr></tbody>
	</table>

	<table width="95%">
		<tr>
			<td align="right">
				<a id="linkResized" href="#" onclick="toggleImageSize();" class="texto"> 
					<fmt:message key="ipdms.pdfpreview.original" />
				</a>
				<a id="linkOriginal" href="#" onclick="toggleImageSize();" 
					class="texto" style="display: none;"> 
					<fmt:message key="ipdms.pdfpreview.resize" />
				</a>				
		</td></tr>
	</table>


	<div style="text-align:center">
		<%-- PREVIEW IMAGE --%>
		<p>
			<c:url var="fileimageurl" value="/file/previewImageDocumento.do2">
				<c:param name="previewFilename">${previewResult.previewImage.name}</c:param>
			</c:url>
			<img id="resizedImage" src="${fileimageurl}" style="width: 350px; height: 450px;" />
			<img id="originalImage" src="${fileimageurl}" style="display: none;" />
		</p>
	</div>
</body>
<script>
	toggleImageSize = function() {
		$('resizedImage','originalImage','linkResized','linkOriginal').invoke('toggle');
	};
</script>