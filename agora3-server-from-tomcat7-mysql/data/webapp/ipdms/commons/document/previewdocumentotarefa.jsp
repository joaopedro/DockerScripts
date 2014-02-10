<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- div for top scroll bar 
	in case of lower resolutions --%>
<div id="topbar" class="topbar" style="height: 20px; overflow-x: scroll; overflow-y: hidden;">
	<div id="topbarContent" style="height: 20px;"></div>
</div>


<div class="docprev" style="overflow-x: scroll; overflow-y: hidden;overflow: auto; ">
	<div style="background-color: #CCC; overflow: none;">
			
	<%-- PREVIEW HEADER --%>		
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
			<tr>
				<td style="border-bottom: 0px; padding-left: 11px;" class="titulo1" >
					<fmt:message key="ipdms.pdfpreview.titulo">
						<fmt:param value="${docname}" />
						<fmt:param value="${previewResult.page+1}" />
						<fmt:param value="${previewResult.numberOfPages}" />
					</fmt:message>
				</td>			
			</tr>
		</tbody>
	</table>
		
	<div style="padding-top: 5px; padding-bottom: 5px; padding-left: 11px; text-align: left;">
		<div class="texto" style="display: inline;">
			<c:set var="previewurl" value="&tmpPdfFile=${previewResult.tmpPdf.name}&page=${previewResult.page}" />
			<a href="#" onclick="javascript:markToSign('${idDocumento}');" class="texto"><fmt:message key="ipdms.pdfpreview.marcarprassinar" /></a>			
		</div>	
		<div class="texto" style="display: inline;">
			<c:choose>
				<c:when test="${resolution == 'HIGH'}">
					<c:set var="paramsurl" value="${previewurl}&resize=${resize}&resolution=LOW&docname=${docname}" />
					<a href="#" onclick="javascript:changePreviewDocumentoSettings('previewdoc','${idDocumento}','${paramsurl}');" class="texto"><fmt:message key="ipdms.pdfpreview.ld" /></a>
				</c:when>
				<c:otherwise>
					<c:set var="paramsurl" value="${previewurl}&resize=${resize}&resolution=HIGH&docname=${docname}" />
					<a href="#" onclick="javascript:changePreviewDocumentoSettings('previewdoc','${idDocumento}','${paramsurl}');" class="texto"><fmt:message key="ipdms.pdfpreview.hd" /></a>
				</c:otherwise>
			</c:choose>
		</div>				
		<div class="texto" style="display: inline;">
			<c:choose>
				<c:when test="${resize}">
					<c:set var="paramsurl" value="${previewurl}&resize=false&resolution=${resolution}&docname=${docname}" />
					<a href="#" onclick="javascript:changePreviewDocumentoSettings('previewdoc','${idDocumento}','${paramsurl}');" class="texto"><fmt:message key="ipdms.pdfpreview.original" /></a>
				</c:when>
				<c:otherwise>
					<c:set var="paramsurl" value="${previewurl}&resize=true&resolution=${resolution}&docname=${docname}" />
					<a href="#" onclick="javascript:changePreviewDocumentoSettings('previewdoc','${idDocumento}','${paramsurl}');" class="texto"><fmt:message key="ipdms.pdfpreview.resize" /></a>
				</c:otherwise>
			</c:choose>
		</div>			
	</div>	
	
		<div style="text-align:center; margin-top: 5px; margin-bottom: 10px;">
			
			<%-- PREVIEW IMAGE --%>
			<p>
				<c:url var="fileimageurl" value="/file/previewImageDocumento.do2">
					<c:param name="previewFilename">${previewResult.previewImage.name}</c:param>
				</c:url>
				<c:if test="${resize}">
					<c:set var="img_style">style="width: 350px; height: 450px;"</c:set>
				</c:if>
				<img id="documentImage" src="${fileimageurl}" ${img_style} onload="resizeTopBar();"/>
			</p>	
		
			<%-- PAGINACAO --%>		
			<c:set var="previewurl" value="&tmpPdfFile=${previewResult.tmpPdf.name}&resize=${resize}&resolution=${resolution}&docname=${docname}&page=" />
			<c:set var="size" value="${previewResult.numberOfPages - 1}" />
			<c:set var="page" value="${previewResult.page}" />
			<c:if test="${size > 0}">
				
				<div style="margin: 10px 0 10px 0;">
					
					<c:set var="paramsurl" value="${previewurl}0" />
					[ <a href="#" onclick="javascript:changePreviewDocumentoSettings('previewdoc','${idDocumento}','${paramsurl}');" class="texto"><fmt:message key="ipdms.pdfpreview.primeira" /></a>
					<c:if test="${page > 0 }">
						<c:set var="paramsurl" value="${previewurl}${page-1}" />
						<a href="#" onclick="javascript:changePreviewDocumentoSettings('previewdoc','${idDocumento}','${paramsurl}');" class="texto"><fmt:message key="ipdms.pdfpreview.anterior" /></a>
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
								<c:set var="paramsurl" value="${previewurl}${pageNumber}" />
								<a href="#" onclick="javascript:changePreviewDocumentoSettings('previewdoc','${idDocumento}','${paramsurl}');" class="texto">${pageNumber+1}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${page < size}">
						<c:set var="paramsurl" value="${previewurl}${page+1}" />
						<a href="#" onclick="javascript:changePreviewDocumentoSettings('previewdoc','${idDocumento}','${paramsurl}');" class="texto"><fmt:message key="ipdms.pdfpreview.seguinte" /></a>
					</c:if>
					<c:set var="paramsurl" value="${previewurl}${size}" />	
					<a href="#" onclick="javascript:changePreviewDocumentoSettings('previewdoc','${idDocumento}','${paramsurl}');" class="texto"><fmt:message key="ipdms.pdfpreview.ultima" /></a> ]
					
				</div>
					
			</c:if>
			
		</div>
				
	</div>

</div>

<script type="text/javascript">
	
	jQuery(document).ready(function($){	
		
		$('div.topbar').scroll(function(){
			$('div.docprev').scrollLeft($('div.topbar').scrollLeft());
		});
		
		$('div.docprev').scroll(function(){
			$('div.topbar').scrollLeft($('div.docprev').scrollLeft());
		});
	});
	
	resizeTopBar = function(){
		//alterar o tamanho da div que está dentro da topbar para que o top scroll apareça em documentos maiores.
		$('topbarContent').style.width= $('documentImage').width+'px';
	}
	
</script>	



