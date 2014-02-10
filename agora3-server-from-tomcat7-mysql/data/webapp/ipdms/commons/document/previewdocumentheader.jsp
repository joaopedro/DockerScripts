<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<form id="exportForm"  name="exportForm" action="bundle/downloadBundle.do2" method="post">
	<div class="texto" style="display: inline;">
		<c:if test="${not empty anterior || not empty proximo}">				
			[			
			<c:if test="${not empty anterior}">
				 <a href="#" onclick="javascript:previewDocumento('docdiv','${anterior}','');"><fmt:message key="ipdms.pdfpreview.anterior" /></a>						
			</c:if>
			<c:if test="${not empty proximo}">
				<a href="#" onclick="javascript:previewDocumento('docdiv','${proximo}','');"><fmt:message key="ipdms.pdfpreview.seguinte" /></a>	
			</c:if>
			]				
		</c:if>
	</div>
	<div class="texto" style="display: inline;">
		<a href="#" onclick="javascript:signDocuments();"><fmt:message key="ipdms.pdfpreview.assinardocs" /></a>			
	</div>					
	<div class="texto" style="display: inline;">
		<a href="${pageContext.request.contextPath}/file/getDocumento.do2?nc=${idDocumento}" class="texto"><fmt:message key="ipdms.pdfpreview.abrirdoc" /></a>
	</div>
	<div class="texto" style="display: inline;">
		<a href="#" onclick="javascript:hideDocPreview();" title="<fmt:message key="ipdms.listetapas.fechar" />">
			<img src="${pageContext.request.contextPath}/images/icon/icon-apagar.png" alt="<fmt:message key="ipdms.listetapas.fechar" />" class="cursorMao" />
		</a>								
	</div>
</form>
	

