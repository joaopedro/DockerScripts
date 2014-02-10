<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="wrapper" value="${list_documents_wrapper}" />
<c:set var="backgroundColor">rgb(221,238,248)</c:set>

<c:if test="${wrapper.hasPdfInstrucao}">
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 97%;">
	<fmt:message key="ipdms.documentos.documento.instrucao.titulo" />
	<a href="${pageContext.request.contextPath}/file/getPdfInstrucao.do2?nc=${wrapper.processo.servicoOnline.numeroConteudo}" target="_blank" title="<fmt:message key='ipdms.documentos.documento.instrucao.titulo' />">
		<img src="images/icon/icon-PDF.png" style="border:none" title="PDF" alt="PDF" />
	</a>
	</div>
</div>
<br /><br />
</c:if>

<%-- LIST OF ACTIVE DOCUMENTS OF THE PROCESS --%>
<div class="row" style="padding-top:0px; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo2"><fmt:message key="ipdms.documentos.list.documentos.activos" /></td>
		  </tr>
		</tbody>
	</table>					
</div>
<c:set var="activeDocuments" value="${wrapper.processo.documentos}" scope="request"/>
<jsp:include page="parts/listOfActiveDocuments.jsp"></jsp:include>

<%-- LIST OF DELETED DOCUMENTS OF THE PROCESS --%>
<c:if test="${fn:length(wrapper.processo.documentosApagados) > 0 }" >
	<span class="formlabel">&nbsp;&nbsp;<fmt:message key="ipdms.documentos.list.documentos.apagados" /></span>

	<c:set var="deletedDocuments" value="${wrapper.processo.documentosApagados}" scope="request" />
	<jsp:include page="parts/listOfDeletedDocuments.jsp"></jsp:include>
</c:if>

<%-- LIST OF INACTIVE DOCUMENTS OF THE PROCESS --%>
<c:if test="${fn:length(wrapper.processo.documentosInactivos) > 0 }" >
	<span class="formlabel">&nbsp;&nbsp;<fmt:message key="ipdms.documentos.list.documentos.inactivos" /></span>

	<c:set var="inactiveDocuments" value="${wrapper.processo.documentosInactivos}" scope="request" />
	<jsp:include page="parts/listOfInactiveDocuments.jsp"></jsp:include>
</c:if>


<%-- LIST OF ACTIVE AND DELETED DOCUMENTS OF THE SUBPROCESSES (if exist)--%>
<c:forEach var="subProcessoWrapper" items="${wrapper.subProcessos}">


	<span class="formlabel">&nbsp;&nbsp;<fmt:message key="ipdms.documentos.list.documentos.subprocesso.activos" />: 
	<i>${subProcessoWrapper.servicoOnline.variante.titulo}</i> - ${subProcessoWrapper.servicoOnline.idProcessoEntidade}</span>
	
	<c:set var="activeDocuments" value="${subProcessoWrapper.documentos}" scope="request"/>
	<jsp:include page="parts/listOfActiveDocuments.jsp"></jsp:include>

	<c:if test="${fn:length(subProcessoWrapper.documentosApagados) > 0 }" >
		<span class="formlabel">&nbsp;&nbsp;<fmt:message key="ipdms.documentos.list.documentos.subprocesso.apagados" />: 
		<i>${subProcessoWrapper.servicoOnline.variante.titulo}</i> - ${subProcessoWrapper.servicoOnline.idProcessoEntidade}</span>
		
		<c:set var="deletedDocuments" value="${subProcessoWrapper.documentosApagados}" scope="request" />
		<jsp:include page="parts/listOfDeletedDocuments.jsp"></jsp:include>
	</c:if>	
</c:forEach>
