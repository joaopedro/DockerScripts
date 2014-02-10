<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="codigoTemplateEstrutura" value="${param.codigoTemplateEstrutura}" />
<c:set var="sort" value="${param.sort}" />
<c:set var="dir" value="${param.dir}" />

<fmt:message key="ecm.conteudos.designacaoplural" var="titulo" bundle="${ecmBundle}" />
<fmt:message key="errors.title" var="errorsTitle" bundle="${ecmBundle}" />
<fmt:message key="errors.msg" var="errorsMsg" bundle="${ecmBundle}" />
<fmt:message key="ipdms.loading" var="loading" bundle="${ecmBundle}" />

<script>
	var CONTEXT_PATH = '${pageContext.request.contextPath}';
</script>

<script type="text/javascript" src='${pageContext.request.contextPath}/ipdms/modules/ecm/ecm.js'></script>

<script type="text/javascript">
	var createTemplateBtn = document.getElementById("createBtn");
	createTemplateBtn.style.visibility='hidden';
	
	var searchTemplateBtn = document.getElementById("searchBtn");
	searchTemplateBtn.style.visibility='hidden';
	
	var fmtMessages = new Array();
	fmtMessages["errorsTitle"] = "${errorsTitle}";
	fmtMessages["errorsMsg"] = "${errorsMsg}";
	fmtMessages["loading"] = "${loading}";

	function templateConteudosDetail(div) {
		jQuery("#" + div).dialog({
			title: '${titulo}',
			autoOpen: false,
			width:600,
			modal: true,
			resizable: false,
			dialogClass: 'ecm-form'
		});

		jQuery("#" + div).dialog("open");
	}
	
	var listDivId = '${viewName}ListDiv';
	
	listTemplateConteudos = function(pageNumber) {
		callAjaxRequest('listTemplateConteudos.do2', 'page='+pageNumber+'&codigoTemplateEstrutura=${codigoTemplateEstrutura}&sort=${sort}&dir=${dir}', listDivId, fmtMessages);
	};
	
	listTemplateConteudos();
</script>