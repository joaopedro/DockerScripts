<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<br />
<div id="templateDiv"><jsp:include page="renderTemplatesList.jsp" /></div>
<br />

<script type="text/javascript">
	var templateActionUrl = "${pageContext.request.contextPath}/templates/templatesAction.do2";
	var templateListDiv = "templateDiv";

	removeTemplate = function() {
		submitDiv(templateListDiv, templateActionUrl + '?method=remove', templateListDiv, true);
	}
	
	refreshListTemplates = function() {
		new Ajax.Updater( {success: templateListDiv}, templateActionUrl + '?method=list',  {method: 'get', evalScripts: true} );
	}	
</script>
