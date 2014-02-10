<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="errors.title" var="errorsTitle" bundle="${calendarioBundle}" />
<fmt:message key="errors.msg" var="errorsMsg" bundle="${calendarioBundle}" />
<fmt:message key="ipdms.loading" var="loading" bundle="${calendarioBundle}" />
<fmt:message key="data.fl.organica" var="organicaDes" bundle="${calendarioBundle}" />

<script>
var CONTEXT_PATH = '${pageContext.request.contextPath}';
</script>
<script type="text/javascript" src='${pageContext.request.contextPath}/ipdms/modules/calendario/calendario.js'></script>

<%-- SCRIPT THAT WILL LOAD LIST OF ELEMENTS, AMONG OTHER THINGS --%>
<script type="text/javascript">
	
	var ${viewPrefix}editFormDivId = '${viewPrefix}EditFormDiv';
	var ${viewPrefix}searchFormDivId = '${viewPrefix}SearchFormDiv';
	var ${viewPrefix}listDivId = '${viewPrefix}ListDiv';
	
	var fmtMessages = new Array();
	fmtMessages["errorsTitle"] = "${errorsTitle}";
	fmtMessages["errorsMsg"] = "${errorsMsg}";
	fmtMessages["loading"] = "${loading}";

	function hideAll${viewPrefix}() {
		$(${viewPrefix}editFormDivId).hide();
		$(${viewPrefix}searchFormDivId).hide();
	}

	function editForm${viewPrefix}(id) {
		hideAll${viewPrefix}();
		cal_AjaxRequest('${viewPrefix}/edit.do2', 'method=edit&calendarioid=${param.id}&id='+id, 'POST', ${viewPrefix}editFormDivId, fmtMessages);
		$(${viewPrefix}editFormDivId).show();
	}
	
	function search${viewPrefix}() {
		hideAll${viewPrefix}();
		$(${viewPrefix}searchFormDivId).show();
	}
	
	function cancelEdit${viewPrefix}() {
		hideAll${viewPrefix}();
	}

	function cancelSearch${viewPrefix}() {
		hideAll${viewPrefix}();
		$('${viewPrefix}SearchForm').reset();
	}

	function save${viewPrefix}(formName) {
		hideAll${viewPrefix}();
		var p = $(formName).serialize();
		cal_AjaxRequest('${viewPrefix}/save.do2', 'method=save&'+ p, 'POST', ${viewPrefix}editFormDivId, fmtMessages);
		$(${viewPrefix}editFormDivId).show();
	}

	function delete${viewPrefix}() {
		var p = $('${viewPrefix}DeleteForm').serialize();
		cal_AjaxRequest('${viewPrefix}/delete.do2', 'method=deleteMultiple&'+ p, 'POST', fmtMessages);
	}

	
	function list${viewPrefix}(pageNumber) {
		var form = $('${viewPrefix}SearchForm');
		var p = Form.serialize(form);
		cal_AjaxRequest('${viewPrefix}/list.do2', 'page='+pageNumber+'&'+p, 'POST', ${viewPrefix}listDivId, fmtMessages);
	}
	list${viewPrefix}();
	
</script>

<script>
function showOrganica${viewPrefix}(){
	var action = "${pageContext.request.contextPath}/ajaxListOrganica.do2";
	paramts = "valuePlaceOlder=${viewPrefix}_organicaid";
	paramts += "&descPlaceOlder=${viewPrefix}_organicadesc";
	paramts += "&window=winchoose";
	
	ExtWindow('${organicaDes}',action,paramts,'ext');
}
</script>