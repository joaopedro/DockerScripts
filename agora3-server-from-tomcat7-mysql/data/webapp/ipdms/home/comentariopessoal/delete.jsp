<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:message key="ipdms.comentariopessoal.remover.resultTitle" var="resultTitle" />
<fmt:message key="ipdms.comentariopessoal.remover.resultMsg" var="resultMsg" />

<script>
Ext.Msg.alert('${resultTitle}', '${resultMsg}');
refreshListComentarioPessoal();
</script>