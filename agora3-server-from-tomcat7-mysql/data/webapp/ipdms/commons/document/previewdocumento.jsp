<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/ipdms/themes" />
<link href='${THEMES_DIR}/estilos.css' type=text/css rel=stylesheet media="screen" />
<link href='${THEMES_DIR}/forms.css' type=text/css rel=stylesheet />

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<script type="text/javascript" src="${JS_DIR}/jquery/jquery-1.7.2.js"></script>

<fmt:message key="ipdms.etapa.comboText" var="defaultComboText" />

<body style="background-color: #CCC; overflow: scroll;">

	<c:if test="${resize}">
		<c:set var="img_style">style="width: 350px; height: 450px;"</c:set>
	</c:if>

	<%-- PREVIEW HEADER --%>
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody><tr><td style="border-bottom: 0px" class="titulo1" >
			<fmt:message key="ipdms.pdfpreview.titulo">
				<fmt:param value="${previewResult.page+1}" />
				<fmt:param value="${previewResult.numberOfPages}" />
			</fmt:message>
		</td></tr></tbody>
	</table>

	<table width="95%">
		<tr><td align="right">
			<c:url var="previewurl" value="/file/previewDocumento.do2">
				<c:param name="tmpPdfFile" value="${previewResult.tmpPdf.name}" />
				<c:param name="page" value="${previewResult.page}" />
				<c:param name="isEmail" value="${isEmail}" />
                <c:param name="haveAttachs" value="${haveAttachs}" />
                <c:param name="emailFileNames" value="${emailFileNames}" />
			</c:url>
			<c:choose>
				<c:when test="${resolution == 'HIGH'}">
					<a href="${previewurl}&resize=${resize}&resolution=LOW"
						class="texto"> <fmt:message key="ipdms.pdfpreview.ld" /> </a>
				</c:when>
				<c:otherwise>
					<a href="${previewurl}&resize=${resize}&resolution=HIGH"
						class="texto"> <fmt:message key="ipdms.pdfpreview.hd" />
					</a>
				</c:otherwise>
			</c:choose>
			|
			<c:choose>
				<c:when test="${resize}">
					<a href="${previewurl}&resize=false&resolution=${resolution}"
						class="texto"> <fmt:message key="ipdms.pdfpreview.original" />
					</a>
				</c:when>
				<c:otherwise>
					<a href="${previewurl}&resize=true&resolution=${resolution}"
						class="texto"> <fmt:message key="ipdms.pdfpreview.resize" />
					</a>
				</c:otherwise>
			</c:choose>
			<c:if test="${isEmail && haveAttachs}">
                |
            	<select name="email_files" onchange="showEmailFile(this)">
            	    <c:forEach items="${emailFiles}" var="file">
            	        <c:if test="${file.tmpPdf.name == currentDocument}">
            	   	        <option value="${file.tmpPdf.name}" selected="selected">${file.name}</option>
            	        </c:if>
            	        <c:if test="${file.tmpPdf.name != currentDocument}">
            	       	    <option value="${file.tmpPdf.name}">${file.name}</option>
                	    </c:if>
            	    </c:forEach>
                </select>
            </c:if>
		</td></tr>
	</table>


    <%-- PREVIEW IMAGE --%>
	<div style="text-align:center">
		<p>
			<c:url var="fileimageurl" value="/file/previewImageDocumento.do2">
				<c:param name="previewFilename">${previewResult.previewImage.name}</c:param>
			</c:url>
			<img src="${fileimageurl}" ${img_style} />
		</p>


		<%-- PAGINACAO --%>
		<c:url var="previewurl" value="/file/previewDocumento.do2">
			<c:param name="tmpPdfFile" value="${previewResult.tmpPdf.name}" />
			<c:param name="resize" value="${resize}" />
			<c:param name="resolution" value="${resolution}" />
			<c:param name="isEmail" value="${isEmail}" />
            <c:param name="haveAttachs" value="${haveAttachs}" />
            <c:param name="emailFileNames" value="${emailFileNames}" />
			<c:param name="page" />
		</c:url>

		<c:set var="size" value="${previewResult.numberOfPages - 1}" />
		<c:set var="page" value="${previewResult.page}" />
		<c:if test="${size > 0}">
			<div style="margin: 10px 0 10px 0;">
				[ <a href="${previewurl}0" class="texto"><fmt:message key="ipdms.pdfpreview.primeira" /></a>
				<c:if test="${page > 0 }">
					<a href="${previewurl}${page-1}" class="texto"><fmt:message key="ipdms.pdfpreview.anterior" /></a>
				</c:if>
				
				<c:set var="begin" value="0" />
				<c:set var="end" value="${size}" />
				<c:if test="${size > 10}">
					<%-- TOO many pages, lets abbreviate --%>
					<c:if test="${page - 5 > 0}"><c:set var="begin" value="${page-5}" /></c:if>
					<c:if test="${begin + 10 < size}"><c:set var="end" value="${begin+10}" /></c:if>
				</c:if>

				<c:forEach begin="${begin}" end="${end}" step="1" var="pageNumber">
					<c:choose>
						<c:when test="${page == pageNumber}"><span class="texto">${pageNumber+1}</span></c:when>
						<c:otherwise>
							<a href="${previewurl}${pageNumber}" class="texto">${pageNumber+1}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${page < size}">
					<a href="${previewurl}${page+1}" class="texto"><fmt:message key="ipdms.pdfpreview.seguinte" /></a>
				</c:if>
				<a href="${previewurl}${size}" class="texto"><fmt:message key="ipdms.pdfpreview.ultima" /></a> ]
			</div>
		</c:if>
	</div>
</body>


<script type="text/javascript">

function showEmailFile(elem){

	var selectedIdx = elem.selectedIndex;
	var value = elem.options[selectedIdx].value;

	// change document to preview but mantain the resolution and resize options
	// load allways page 0
	var action = "${pageContext.request.contextPath}/file/previewDocumento.do2";
	var params = "tmpPdfFile=" + value;
	params += "&page=0";
	params += "&resolution=${resolution}";
	params += "&resize=${resize}";
	params += "&isEmail=${isEmail}";
	params += "&haveAttachs=${haveAttachs}";
	params += "&emailFileNames=${emailFileNames}";
	var url = action + '?' + params;

	// reload the page
	window.location = url;

}

</script>
