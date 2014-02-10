<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.modules.templates.template.tipotemplate" var="tipotemplate" />
<fmt:message key="ipdms.modules.templates.tipotemplate.criar.success" var="success" />

<html:errors/>
<c:if test="${empty erro}">
<script>
Element.update('editTipoTemplatePane', '');
Ext.example.msg('${tipotemplate}','${success}');
refreshListTipoTemplate();
</script>	
</c:if>
