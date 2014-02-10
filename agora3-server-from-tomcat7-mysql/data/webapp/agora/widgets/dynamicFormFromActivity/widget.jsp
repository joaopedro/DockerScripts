<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>${dynamic.formTemplate.description}</h1>
<br />
<table class="dynFormTable" width="100%" cellpadding="15" cellspacing="1" style="border:none">
<tbody><tr><td>
<c:set var="dynForm" value="${dynamic.formTemplate}" scope="request" />
<c:if test="${dynamic.formTemplate.layout==null || dynamic.formTemplate.layout.nameResourceKey=='ipdms.dynamicform.form.linearlayout'}">
    <div style="font-size: 0.625em;">
        <%-- RENDER GROUPS --%>
        <c:forEach items="${dynamic.formTemplate.groups}" var="group">
            <c:if test="${not empty group.fields}">
                <fieldset>
                    <legend>${group.label}</legend>
                    <c:set var="changeline" value="true" scope="request" />
                    <c:forEach items="${dynamic.values}" var="fieldEntry">
                        <c:if test="${group.id == fieldEntry.fieldTemplate.group.id}">
                            <c:set var="field" value="${fieldEntry.fieldTemplate}" scope="request" />
                            <c:set var="fieldInstance" value="${fieldEntry}" scope="request" />
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
        <c:forEach items="${dynamic.values}" var="fieldEntry">
            <c:if test="${empty fieldEntry.fieldTemplate.group}">
                <c:set var="field" value="${fieldEntry.fieldTemplate}" scope="request" />
                <c:set var="fieldInstance" value="${fieldEntry}" scope="request" />
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
</td></tr>
</tbody></table>