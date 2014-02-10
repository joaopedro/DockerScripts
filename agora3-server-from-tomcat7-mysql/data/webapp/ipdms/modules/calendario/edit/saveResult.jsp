<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="calendario.save.success.title" var="title" bundle="${calendarioBundle}" />
<fmt:message key="calendario.save.success.msg" var="msg" bundle="${calendarioBundle}" />

<script>
Ext.Msg.alert('${title}', '${msg}');
listCalendario();
</script>