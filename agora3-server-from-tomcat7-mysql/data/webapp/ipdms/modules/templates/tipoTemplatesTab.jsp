<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<div id="tipoTemplateDiv">
<br />
	<jsp:include page="renderTipoTemplateList.jsp" />
</div>
<br />

<script>
	var tipoActionUrl = "${pageContext.request.contextPath}/templates/tipoTemplateAction.do2";
	var tipoListDiv = "tipoTemplateDiv";

	removeTipoTemplate = function() {
		submitDiv(tipoListDiv, tipoActionUrl + '?method=remove', tipoListDiv, true);
	};

	editTipoTemplate = function(tipoTemplateId) {
		var p = '';
		if(tipoTemplateId) { 
			p += 'tipoTemplateId=' + tipoTemplateId; 
		}
		new Ajax.Updater( {success: 'editTipoTemplatePane'}, tipoActionUrl + '?method=edit', 
				   		  {method: 'get', parameters: p, evalScripts: true} );

	};

	saveTipoTemplate = function() {
		submitDiv('editTipoTemplatePane', tipoActionUrl + '?method=save', 'errorDivTipoTemplate', true);
	};
	
	refreshListTipoTemplate = function() {
		new Ajax.Updater( {success: tipoListDiv}, tipoActionUrl + '?method=list',  {method: 'get', evalScripts: true} );
	};
</script>
