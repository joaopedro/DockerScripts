<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script>
	Ext.Msg.alert('<fmt:message key="data.${viewPrefix}.name" bundle="${calendarioBundle}" />', '<fmt:message key="data.${viewPrefix}.delete.msg" bundle="${calendarioBundle}" />');
	list${viewPrefix}();
</script>