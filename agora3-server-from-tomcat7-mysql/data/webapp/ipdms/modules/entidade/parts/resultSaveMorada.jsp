<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<c:set var="entidade_locale" value="${sessionScope['ipdms.entidade.locale']}" scope="request" />


<html:errors/>

<c:if test="${empty erro}">
<script>
Element.update('divNewMorada', '' );
updateDivMoradas('${entidade_locale}');
enableButtons();
</script>	
</c:if>
