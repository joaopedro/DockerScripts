<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.forms.gravar" var="gravar" />
<fmt:message key="ipdms.forms.seguinte" var="seguinte" />
<fmt:message key="ipdms.forms.seguinte.title" var="seguinteTitle" />
<fmt:message key="ipdms.forms.cancelar" var="cancelar" />
<fmt:message key="ipdms.forms.cancelar.title" var="cancelarTitle" />
<fmt:message key="ipdms.so.gestaoAusencias.pedidos" var="pedidos" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<script type="text/javascript" src='${JS_DIR}/jquery/jquery-1.7.2.js'></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ConfirmCancel.js"></script>
<script type="text/javascript" src='${JS_DIR}/dynamicFormFunctions.js'></script>

<script type="text/javascript">

    decisao = function(btn) {
        if (btn == 'yes') {
            window.location.href = '${referer}';
        } else {
            return false;
        }
    };

    refreshDynamicValues = function() {
        extAjaxRequest('applicationFlow.do2',
                '_flowExecutionKey=${flowExecutionKey}&_eventId=refreshDynamicValues&'
                        + Form.serialize(document.forms[0]));
    };

</script>

<c:set var="customTableSize" value="${dynamic.customTableSize}" scope="request" />
<form:form action="${flowExecutionUrl}" class="dynForm">
    <div id='tree-div'></div>
    <input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">

    <form:errors />
    <br />

    <c:set var="dynForm" value="${dynamic.formTemplate}" scope="request" />
    <c:if test="${dynamic.formTemplate.layout==null || dynamic.formTemplate.layout.nameResourceKey=='ipdms.dynamicform.form.linearlayout'}">
        <div>
            <%-- RENDER GROUPS --%>
            <c:forEach items="${dynamic.formTemplate.groups}" var="group">
                <c:if test="${not empty group.fields}">
                    <fieldset>
                        <legend>${group.label}</legend>
                        <c:set var="changeline" value="true" scope="request" />
                        <c:forEach items="${dynamic.fields}" var="fieldEntry">
                            <c:if test="${group.id == fieldEntry.key.group.id}">
                                <c:set var="field" value="${fieldEntry.key}" scope="request" />
                                <c:set var="fieldInstance" value="${fieldEntry.value}" scope="request" />
                                <c:if test="${not empty _resumo}">
                                    <c:set var="resumo" value="true" scope="request" />
                                </c:if>
                                <jsp:include page="field/renderFieldPart.jsp" />
                            </c:if>
                        </c:forEach>
                    </fieldset>
                </c:if>
            </c:forEach>

            <%-- RENDER rest of fields without group --%>
            <c:set var="changeline" value="true" scope="request" />
            <c:forEach items="${dynamic.fields}" var="fieldEntry">
                <c:if test="${empty fieldEntry.key.group}">
                    <c:set var="field" value="${fieldEntry.key}" scope="request" />
                    <c:set var="fieldInstance" value="${fieldEntry.value}" scope="request" />
                    <c:if test="${not empty _resumo}">
                        <c:set var="resumo" value="true" scope="request" />
                    </c:if>
                    <jsp:include page="field/renderFieldPart.jsp" />
                </c:if>
            </c:forEach>
        </div>



    </c:if>

    <!-- Se for grelha -->
    <c:if test="${dynamic.formTemplate.layout!=null && dynamic.formTemplate.layout.nameResourceKey=='ipdms.dynamicform.form.gridlayout'}">
        <table border="0" class="dyncentro">
            <c:forEach items="${dynamic.presentationLayout.data}" var="gpldrow">
                <tr>
                    <c:forEach items="${gpldrow}" var="gpld">
                        <c:choose>
                            <c:when test="${not empty gpld }">
                                <c:choose>
                                    <c:when test="${gpld.object.layoutData.alignment=='LEFT' }">
                                        <td style="text-align: left;">
                                    </c:when>
                                    <c:when test="${gpld.object.layoutData.alignment=='RIGHT' }">
                                        <td style="text-align: right;">
                                    </c:when>
                                    <c:otherwise>
                                        <td style="text-align: center;">
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${gpld.object.renderType=='FIELD'}">
                                        <c:set var="field" value="${gpld.object}" scope="request" />
                                        <c:set var="fieldInstance" value="${gpld.instance}" scope="request" />
                                        <c:if test="${not empty _resumo}">
                                            <c:set var="resumo" value="true" scope="request" />
                                        </c:if>
                                        <jsp:include page="field/renderFieldPart.jsp" />
                                    </c:when>
                                    <c:when test="${gpld.object.renderType=='GROUP'}">
                                        <fieldset>
                                            <legend>${gpld.object.label}</legend>
                                            <table border="0" class="dyncentro">
                                                <c:forEach items="${gpld.data}" var="g_gpldrow">
                                                    <tr>
                                                        <c:forEach items="${g_gpldrow}" var="g_gpld">
                                                            <c:choose>
                                                                <c:when test="${not empty g_gpld }">
                                                                    <c:choose>
                                                                        <c:when
                                                                            test="${g_gpld.object.layoutData.alignment=='LEFT' }">
                                                                            <td style="text-align: left;">
                                                                        </c:when>
                                                                        <c:when
                                                                            test="${g_gpld.object.layoutData.alignment=='RIGHT' }">
                                                                            <td style="text-align: right;">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <td style="text-align: center;">
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                    <c:set var="field" value="${g_gpld.object}"
                                                                        scope="request" />
                                                                    <c:set var="fieldInstance" value="${g_gpld.instance}" scope="request" />
                                                                    <c:if test="${not empty _resumo}">
                                                                        <c:set var="resumo" value="true" scope="request" />
                                                                    </c:if>
                                                                    <jsp:include page="field/renderFieldPart.jsp" />
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <td />
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </tr>
                                                </c:forEach>
                                            </table>
                                        </fieldset>
                                    </c:when>
                                </c:choose>
                                </td>
                            </c:when>
                            <c:otherwise>
                                <td />
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
            </c:forEach>
            </tr>
        </table>
    </c:if>

    <c:if test="${empty _resumo}">

        <div style="clear: both"></div>
        <br />
        <div class="buttonRow">
            <input type="button" name="_eventId_next" value="${seguinte}" class="btForm" onclick="enableAllInputFieds('dynForm');webflowAjaxRequest(event);" title="${seguinteTitle}" />
            <input type="button" name="_eventId_suspend" value="${gravar}" class="btForm" onclick="webflowAjaxRequest(event);" title="Gravar informação" />
            <input type="button" name="_eventId_cancel" value="${cancelar}" class="btFormEscuro" onclick="cancelar(event,'${pedidos}', '${cancelarTitle}?',decisao,'${sim}','${nao}');" title="${cancelarTitle}" />
        </div>
        <div style="clear: both"></div>
    </c:if>

    <br />
    <br />
</form:form>
