<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<script type="text/javascript" src='${JS_DIR}/jquery/jquery-1.7.2.js'></script>
<script type="text/javascript" src='${JS_DIR}/dynamicFormFunctions.js'></script>


<c:set var="dynForm" value="${notificationForm.formTemplate}" scope="request" />
<c:if test="${not empty notificationForm.fields}">

    <c:set var="obrigatorio" value="false" />

    <div class="row formlabel_sf">
        <div class="leftTab label"
            style="width: 97%; height: 25px; margin-left: 11px;"
            title="<fmt:message key='ipdms.etapa.atributosetapa' />">
            <span class="textoCinzento"><fmt:message
                    key="ipdms.etapa.atributosetapa" /></span>
        </div>
    </div>

    <c:if test="${notification.closed}">
        <c:set var="inputDisabled" value="true" scope="request" />
    </c:if>
    <c:set var="customTableSize"
        value="${notificationForm.customTableSize}" scope="request" />
    <c:if
        test="${notificationForm.formTemplate.layout==null
         || notificationForm.formTemplate.layout.nameResourceKey=='ipdms.dynamicform.form.linearlayout'}">
        <%-- RENDER GROUPS --%>
        <c:forEach items="${notificationForm.formTemplate.groups}" var="group">
            <c:if test="${not empty group.fields}">
                <fieldset>
                    <legend>${group.label}</legend>
                    <c:set var="changeline" value="true" scope="request" />
                    <c:forEach items="${notificationForm.fields}" var="fieldEntry">
                        <c:if test="${group.id == fieldEntry.key.group.id}">
                            <c:set var="field" value="${fieldEntry.key}" scope="request" />
                            <c:if test="${field.required}">
                                <c:set var="obrigatorio" value="true" />
                            </c:if>
                            <c:set var="fieldInstance" value="${fieldEntry.value}"
                                scope="request" />
                            <jsp:include page="../webflow/dynamic/field/renderFieldPart.jsp" />
                        </c:if>
                    </c:forEach>
                </fieldset>
            </c:if>
        </c:forEach>

        <%-- RENDER rest of fields without group --%>
        <c:set var="changeline" value="true" scope="request" />
        <c:forEach items="${notificationForm.fields}" var="fieldEntry">
            <c:if test="${empty fieldEntry.key.group}">
                <c:set var="field" value="${fieldEntry.key}" scope="request" />
                <c:if test="${field.required}">
                    <c:set var="obrigatorio" value="true" />
                </c:if>
                <c:set var="fieldInstance" value="${fieldEntry.value}"
                    scope="request" />
                <c:set var="isTramitacao" value="true" scope="request" />
                <jsp:include page="../webflow/dynamic/field/renderFieldPart.jsp" />
            </c:if>
        </c:forEach>

    </c:if>

</c:if>

<!-- Se for grelha -->
<c:if
    test="${notificationForm.formTemplate.layout!=null && notificationForm.formTemplate.layout.nameResourceKey=='ipdms.dynamicform.form.gridlayout'}">
    <table border="0" class="dyncentro">
        <c:forEach items="${notificationForm.presentationLayout.data}"
            var="gpldrow">
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
                                    <c:set var="fieldInstance" value="${gpld.instance}"
                                        scope="request" />
                                    <jsp:include
                                        page="../webflow/dynamic/field/renderFieldPart.jsp" />


                                    <c:if test="${gpld.object.required}">
                                        <c:set var="obrigatorio" value="true" />
                                    </c:if>
                                    <c:set var="isTramitacao" value="true" scope="request" />


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
                                                                <c:set var="fieldInstance" value="${g_gpld.instance}"
                                                                    scope="request" />
                                                                <jsp:include
                                                                    page="../webflow/dynamic/field/renderFieldPart.jsp" />


                                                                <c:set var="isTramitacao" value="true" scope="request" />

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


<div style="clear: both; padding-bottom: 10px;"></div>

<c:if test="${obrigatorio}">
    <div class="row" style="padding-bottom: 20px;">
        <div class="leftTab label" style="width: 95%;"
            title="<fmt:message key='ipdms.legenda' />">
            <span class="formlabel_obrigatorio"><fmt:message
                    key="ipdms.obrigatorio" /></span><br /> <span
                class="formlabel_obrigatorio"><fmt:message
                    key="ipdms.etapa.obrigatorio" /></span>
        </div>
    </div>
</c:if>
