<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.processo.designacaosingular" var="processoDes" />

<script src="${pageContext.request.contextPath}/ipdms/js/certifydocument.js" type="text/javascript"></script>

<script type="text/javascript">	
	document.title = '${productName} - ${processoDes} ${servico.variante.titulo} (${servico.idProcessoEntidade})';	 
</script>

<div class="row" style="padding-top:0px; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${processoDes} ${servico.variante.titulo} (${servico.idProcessoEntidade})</td>
		  </tr>
		</tbody>
	</table>					
</div>

<c:set var="wrapper" value="${list_documents_wrapper}" />
<c:set var="backgroundColor">rgb(221,238,248)</c:set>

<br />

<%-- LIST OF ACTIVE DOCUMENTS OF THE PROCESS --%>
<div class="row" style="padding-bottom:20px;">
	<div class="leftTab label" style="width: 90%; " title="<fmt:message key='ipdms.documentos.list.documentos.activos' />">
  		<fmt:message key="ipdms.documentos.list.documentos.activos" />
  	</div>
</div>
<c:set var="activeDocuments" value="${wrapper.processo.documentos}" scope="request"/>
<jsp:include page="parts/listOfDocumentsToCertify.jsp"></jsp:include>

<%-- LIST OF ACTIVE DOCUMENTS OF THE SUBPROCESSES (if exist)--%>
<c:forEach var="subProcessoWrapper" items="${wrapper.subProcessos}">

	<span class="formlabel">&nbsp;&nbsp;<fmt:message key="ipdms.documentos.list.documentos.subprocesso.activos" />: 
	<i>${subProcessoWrapper.servicoOnline.variante.titulo}</i> - ${subProcessoWrapper.servicoOnline.idProcessoEntidade}</span>
	
	<c:set var="activeDocuments" value="${subProcessoWrapper.documentos}" scope="request"/>
	<jsp:include page="parts/listOfDocumentsToCertify.jsp"></jsp:include>

</c:forEach>

<%-- LEGEND DIVS --%>
<div class="row formlabel_sf">
	<span class="leftTab label" style="width: 95%; margin-left:10px;" title="<fmt:message key='ipdms.documentos.tipo.instrucao' />">*</span><br />
	<span class="leftTab label" style="width: 95%;" title="<fmt:message key='ipdms.documentos.tipo.instrucao' />">
  		<fmt:message key="ipdms.documentos.tipo.instrucao" />
  	</span>
</div>
<div class="row formlabel_sf">
	<span class="leftTab label" style="width: 95%;" title="<fmt:message key='ipdms.documentos.tipo.tramitacao' />">
  		<fmt:message key="ipdms.documentos.tipo.tramitacao" />
  	</span>
</div>
<div class="row formlabel_sf">
	<span class="leftTab label" style="width: 95%;" title="<fmt:message key='ipdms.documentos.tipo.outros' />">
  		<fmt:message key="ipdms.documentos.tipo.outros" />
  	</span>
</div>


<%-- BACK FORM --%>
<br/>
<form action="" method="post">
	<div class="buttonRow">
		<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.anterior" />"
			onclick="this.form.action='${pageContext.request.contextPath}${sessionScope.urlAnterior}';" title="<fmt:message key='ipdms.forms.anterior.title' />" />
	</div>
</form>

<script>			
function certifyDocument(ncDocumento) {
	certify('${pageContext.request.contextPath}', ncDocumento);
}
</script>
				