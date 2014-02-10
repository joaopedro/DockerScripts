<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="errors.title" var="errorsTitle" bundle="${calendarioBundle}" />
<fmt:message key="errors.msg" var="errorsMsg" bundle="${calendarioBundle}" />
<fmt:message key="ipdms.loading" var="loading" bundle="${calendarioBundle}" />

<%-- SCRIPT THAT WILL LOAD LIST OF ELEMENTS, AMONG OTHER THINGS --%>
<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<script src="${JS_DIR}/prototype.js" type="text/javascript" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/IPDMSTreePanel.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/ColumnNodeUI.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/Window_Iframe.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/ConfirmCancel.js"></script>

<script>
var CONTEXT_PATH = '${pageContext.request.contextPath}';
</script>
<script type="text/javascript" src='${pageContext.request.contextPath}/ipdms/modules/calendario/calendario.js'></script>

<script type="text/javascript">

	var editFormDivId = '${viewName}EditFormDiv';
	var searchFormDivId = '${viewName}SearchFormDiv';
	var listDivId = '${viewName}ListDiv';
	
	var fmtMessages = new Array();
	fmtMessages["errorsTitle"] = "${errorsTitle}";
	fmtMessages["errorsMsg"] = "${errorsMsg}";
	fmtMessages["loading"] = "${loading}";

	function hideAll() {
		$(editFormDivId).hide();
		$(searchFormDivId).hide();
	}

	function editForm(id) {
		hideAll();
		cal_AjaxRequest('${moduleAction}', 'method=edit&id='+id, 'POST', editFormDivId, fmtMessages);
		$(editFormDivId).show();
	}
	
	function search() {
		hideAll();
		$(searchFormDivId).show();
	}
	
	function cancelEdit() {
		hideAll();
	}

	function cancelSearch() {
		hideAll();
		$('${viewName}SearchForm').reset();
	}

	function save(formName) {
		var p = $(formName).serialize();
		cal_AjaxRequest('save.do2', 'method=save&'+ p, 'POST', editFormDivId, fmtMessages);
	}
	
	function activate(id) {
		cal_AjaxRequest('activate.do2', 'method=activate&id='+id, 'POST', null, fmtMessages);
	}

	listCalendario = function(pageNumber) {
		var form = $('${viewName}SearchForm');
		var p = Form.serialize(form);
		cal_AjaxRequest('list.do2', 'page='+pageNumber+'&'+p, 'POST', listDivId, fmtMessages);
	};
	
	listCalendario();
	
</script>