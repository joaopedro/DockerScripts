<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.forms.gravar" var="gravar" />
<fmt:message key="ipdms.forms.anterior" var="anterior" />
<fmt:message key="ipdms.forms.anterior.title" var="anteriorTitle" />
<fmt:message key="ipdms.forms.submit" var="submit" />
<fmt:message key="ipdms.forms.submit.title" var="submitTitle" />
<fmt:message key="ipdms.forms.cancelar" var="cancelar" />
<fmt:message key="ipdms.forms.cancelar.title" var="cancelarTitle" />
<fmt:message key="ipdms.so.gestaoAusencias.pedidos" var="pedidos" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />
<fmt:message key="ipdms.etapa.formulariodinamico" var="formulariodinamico" />

<script type="text/javascript">

    cancelFlow = function() {
        ajaxRequest('/newlayout/processeslist.do');
    };

</script>

<c:set var="_resumo" value="true" scope="request"/>

<c:if test="${empty resumo_normal}">

    <form:form action="${flowExecutionUrl}" class="dynForm">

        <input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">
        <table width="100%" cellpadding="1" cellspacing="1" style="border:none">
            <tr><td><jsp:include page="formScreen.jsp" flush="true"/></td></tr>
        </table>

        <div class="button">
            <input type="button" name="_eventId_back" value="${anterior}" class="" onclick="webflowAjaxRequest(event);" title="${anteriorTitle}"/>
            <input type="button" name="_eventId_suspend" value="${gravar}" class="" onclick="webflowAjaxRequest(event);" title="Gravar informação"/>
            <input type="button" name="_eventId_next" value="${submit}" class="BT_primary" title="${submitTitle}" onclick="webflowAjaxRequest(event);" />
            <input type="button" name="_eventId_cancel" value="${cancelar}" class="" onclick="cancelFlow();" title="${cancelarTitle}"/>
        </div>

    </form:form>

</c:if>

<%-- RESUMO FORA DO WEBFLOW --%>
<c:if test="${not empty resumo_normal}">
    <c:set var="dynamic" value="${webflowActionForm}" scope="request"/>
    <table style="width:100%; border: none; vertical-align: top;" cellpadding="1" cellspacing="1">
        <tr><td class="titulo2">1. ${formulariodinamico}</td></tr>
        <tr><td><jsp:include page="formScreen.jsp" flush="true"/></td></tr>
    </table>
</c:if>

