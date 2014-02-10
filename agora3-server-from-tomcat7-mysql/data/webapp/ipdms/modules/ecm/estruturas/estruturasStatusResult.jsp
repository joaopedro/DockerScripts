<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ecm.estrutura.designacaoplural" var="designacaoplural" bundle="${ecmBundle}" />
<fmt:message key="ecm.estrutura.estado.publicado.resultMsg" var="publicadoMsg" bundle="${ecmBundle}" />
<fmt:message key="ecm.estrutura.estado.expirado.resultMsg" var="expiradoMsg" bundle="${ecmBundle}" />

<script>
	var resultmsg;
	if('${status}' == 'publicada'){
		resultmsg = '${publicadoMsg}';
	}
	else if('${status}' == 'inactiva'){
		resultmsg = '${expiradoMsg}';
	}
	
	jQuery("<div title='${designacaoplural}' >" + resultmsg + "</div>").dialog({
		modal: true,
		resizable: false,
		dialogClass: 'ecm-dialog',
		buttons: {
			Ok: function() {
				jQuery(this).dialog("close");
				listEstruturas();
			}
		}
	});	
</script>