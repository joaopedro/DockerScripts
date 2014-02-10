<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:choose>
	<c:when test="${not empty exportFilename}">
		<%-- EXPORT OK --%>
		<div class="mensagenCaixa" >
			<img src="${pageContext.request.contextPath}/images/icon/icon-OK.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;"/> 
			<span class="info"><fmt:message key="ipdms.administration.export.ok" /></span>
		</div>
		<br />		
		<c:url value="/admin/downloadexportfile.do2" var="downloadurl">
			<c:param name="exportFilename" value="${exportFilename}" />
		</c:url>
		<div class="alignLeft">
			<div class="left">
				<img src="${pageContext.request.contextPath}/images/icon/icon-anexo.png" onclick="${downloadurl}" /> 
			</div>
			<div class="right">
				<div class="texto">
					<a href="${downloadurl}" class="formfield" target="_blank" style="margin-left:0; vertical-align:bottom;" title="<fmt:message key='ipdms.administration.export.downloadfile' />">
						<fmt:message key="ipdms.administration.export.downloadfile" />						
					</a>
				</div>
			</div>
		</div>
		
		
		
	</c:when>	
	<c:otherwise>
		<%-- EXPORT FAILED: SHOW EXCEPTION in request exportException--%>
		<div class="mensagenCaixa" >
			<img src="${pageContext.request.contextPath}/images/icon/icon-stop.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;"/> 
			<span class="info">
				<fmt:message key="ipdms.administration.export.fail" />
				<fmt:message key="ipdms.administration.export.fail.info" />
				<br />
				<span class="mensagenErro1" style="font-weight:normal; margin-left:55px;">${exportException}</span>
			</span>
		</div>
	</c:otherwise>
</c:choose>

<div class="buttonRow">
	<c:url value="/admin/exportimporthomepage.do2" var="exporthomepageurl" />
	<form action="${exporthomepageurl}">
		<input type="submit" class="btForm" value="<fmt:message key='ipdms.forms.anterior' />" title="<fmt:message key='ipdms.forms.anterior.title' />" />
	</form>
</div>