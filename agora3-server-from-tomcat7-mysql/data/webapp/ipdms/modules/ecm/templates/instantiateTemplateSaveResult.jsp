<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ecm.template.designacaoplural" var="designacaoplural" bundle="${ecmBundle}" />
<fmt:message key="ecm.instancia.saveResult" var="saveResult" bundle="${ecmBundle}" />

<html:errors/>

<c:if test="${empty erro}">
	<form id="estruturasAction" action="${pageContext.request.contextPath}/ecm/estruturas.do2"></form>

	<script>		
		jQuery("#divInstantiateTemplate").dialog("close");
		
		jQuery("<div title='${designacaoplural}' >${saveResult}</div>").dialog({
			modal: true,
			resizable: false,
			dialogClass: 'ecm-dialog',
			buttons: {
				Ok: function() {
					jQuery(this).dialog("close");
					document.getElementById("estruturasAction").submit();
				}
			}
		});
	</script>
</c:if>