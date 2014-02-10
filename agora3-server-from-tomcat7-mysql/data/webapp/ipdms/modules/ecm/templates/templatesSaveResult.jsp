<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ecm.template.designacaoplural" var="designacaoplural" bundle="${ecmBundle}" />
<fmt:message key="ecm.template.saveResult" var="saveResult" bundle="${ecmBundle}" />

<script>	
	jQuery("<div title='${designacaoplural}' >${saveResult}</div>").dialog({
		modal: true,
		resizable: false,
		dialogClass: 'ecm-dialog',
		buttons: {
			Ok: function() {
				jQuery(this).dialog("close");
				listTemplateEstruturas();
			}
		}
	});	
</script>