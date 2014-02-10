<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:message key="ipdms.comentariopessoal.criar.resultTitle" var="resultTitle" />
<fmt:message key="ipdms.comentariopessoal.criar.resultMsg" var="resultMsg" />

<script>
Ext.Msg.alert('${resultTitle}', '${resultMsg}');
refreshListComentarioPessoal();
</script>