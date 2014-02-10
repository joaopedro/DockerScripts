<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.instrucao.pedidoregistado" var="pedidoregistado" />
<fmt:message key="ipdms.instrucao.pedidoregistado.erro" var="pedidoregistadoErro" />
<fmt:message key="ipdms.instrucao.errogravar" var="errogravar" />
<fmt:message key="ipdms.instrucao.anexacao.erro" var="anexacaoErro" />
<fmt:message key="ipdms.instrucao.erroconversao" var="erroconversao" />
<fmt:message key="ipdms.instrucao.anexacao.erro.conversaopdfnemcertificado" var="conversaopdfnemcertificado" />
<fmt:message key="ipdms.instrucao.distribuirprocesso" var="distribuirprocesso" />
<fmt:message key="ipdms.instrucao.distruirprocesso.aqui" var="distruirprocessoAqui" />
<fmt:message key="ipdms.instrucao.gravarresumo" var="gravarresumo" />
<fmt:message key="ipdms.forms.terminar" var="terminar" />
<fmt:message key="ipdms.forms.terminar.title" var="terminarTitle" />

<script type="text/javascript">

    endFlow = function() {
        ajaxRequest('/newlayout/processeslist.do');
    };

</script>


<form:form action="${flowExecutionUrl}" class="dynForm">
    <input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">

    <table width="100%" cellpadding="1" cellspacing="1" style="border:none">
        <tr><td>&nbsp;</td></tr>

        <c:choose>
            <c:when test="${empty savingDocumentExceptions and empty conversionDocumentExceptions}">
                <tr>
                    <c:if test="${not dynamic.variante.visivelExterior}">
                        <td class="formlabel">
                    </c:if>
                    <c:if test="${dynamic.variante.visivelExterior}">
                        <td >
                    </c:if>
                        ${pedidoregistado} ${dynamic.servicoOnline.idProcessoEntidade}.
                    </td>
                </tr>
            </c:when>
            <c:otherwise>
                <tr>
                    <td class="formlabel">
                        ${pedidoregistadoErro}
                    </td>
                </tr>
            </c:otherwise>
        </c:choose>

        <c:if test="${not empty savingDocumentExceptions}">
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td class="fomlabel">
                    <fieldset>
                        <legend>${errogravar}</legend>
                        <table>
                            <c:forEach items="${savingDocumentExceptions}" var="ex">
                                <tr><td class="formfield">${anexacaoErro}</td></tr>
                            </c:forEach>
                        </table>
                    </fieldset>
                </td>
            </tr>
        </c:if>
        <c:if test="${not empty conversionDocumentExceptions}">
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td class="fomlabel">
                    <fieldset>
                        <legend>${erroconversao}</legend>
                        <table>
                            <c:forEach items="${conversionDocumentExceptions}" var="ex1">
                                <tr><td class="formfield">${conversaopdfnemcertificado}</td></tr>
                            </c:forEach>
                        </table>
                    </fieldset>
                </td>
            </tr>
        </c:if>
        <c:if test="${not dynamic.variante.visivelExterior}">
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td class="formlabel">${distribuirprocesso}
                    <%--<a href="${pageContext.request.contextPath}/currentNotification.do2?processId=${dynamic.servicoOnline.workflowId}&processType=${dynamic.servicoOnline.variante.processo.codigoWorkflow}" class="webflow_link">--%>
                    ${distruirprocessoAqui}
                    <%--</a>--%>
                </td>
            </tr>
        </c:if>
        <c:if test="${not empty teste.linkPDF }">
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td class="formlabel">
                    ${gravarresumo}
                    <a href="${pageContext.request.contextPath}/${dynamic.linkPDF}" class="webflow_link" target="_blank">
                    ${dynamic.servicoOnline.idProcessoEntidade}</a>.
                </td>
            </tr>
        </c:if>
        <tr><td>&nbsp;</td></tr>
        <tr>
            <td colspan="2" style="text-align:left;">
                <input type="button" name="_eventId_next" value="${terminar}" class="BT_primary" title="${terminarTitle}" onclick="endFlow();" />
            </td>
        </tr>
    </table>

</form:form>
