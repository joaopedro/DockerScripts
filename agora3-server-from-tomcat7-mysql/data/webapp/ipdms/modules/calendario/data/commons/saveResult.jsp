<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<logic:messagesPresent>
	<html:errors/>
</logic:messagesPresent>
<logic:messagesNotPresent>
	<script>
		Ext.Msg.alert('<fmt:message key="data.${viewPrefix}.name" bundle="${calendarioBundle}" />', '<fmt:message key="data.${viewPrefix}.save.msg" bundle="${calendarioBundle}" />');
		list${viewPrefix}();
	</script>
</logic:messagesNotPresent>