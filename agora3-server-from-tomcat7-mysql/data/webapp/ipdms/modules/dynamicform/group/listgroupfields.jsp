<%@ taglib uri="/tags/html" prefix="html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested"%>

<fmt:message key="ipdms.dynamicform.field.posicao.coluna" var="x_pos" />
<fmt:message key="ipdms.dynamicform.field.posicao.alignment" var="cell_alignment" />
<fmt:message key="ipdms.dynamicform.field.posicao.linha" var="y_pos" />

<fmt:message key="ipdms.forms.editar" var="editar" />
<fmt:message key="ipdms.dynamicform.field.ordenar" var="ordenar" />
<fmt:message key="ipdms.forms.eliminar" var="eliminar" />
<fmt:message key="ipdms.dynamicform.group.subirOrdem" var="subirOrdem" />
<fmt:message key="ipdms.dynamicform.group.descerOrdem" var="descerOrdem" />
<fmt:message key="ipdms.dynamicform.field.camposDinamicos"
    var="camposDinamicos" />
<fmt:message key="ipdms.dynamicform.group.eliminarMsg" var="eliminarMsg" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />
<fmt:message key="ipdms.instrucao.pedido.info.title" var="atencao" />
<fmt:message key="ipdms.dynamicform.group.emptyMsg" var="emptyMsg" />
<fmt:message key="ipdms.forms.anterior" var="anterior" />
<fmt:message key="ipdms.forms.anterior.title" var="anteriorTitle" />
<fmt:message key="ipdms.dynamicform.group.novo" var="novo" />

<div>
    <table style="border: none;" cellpadding="0" cellspacing="0"
        class="headings">
        <tr>
            <td class="titulo1"><fmt:message
                    key="ipdms.dynamicform.form.edit.title" /></td>
        </tr>
        <tr>
            <td class="titulo2"><fmt:message
                    key="ipdms.dynamicform.form.listgroup.subtitle" /></td>
        </tr>
    </table>
</div>

<html:form action="applicationFlow" method="post">
    <input type="hidden" name="_flowExecutionKey"
        value="${flowExecutionKey}">
    <input type="hidden" id="indexOfGroup" name="indexOfGroup" />
    <html:errors />

    <c:choose>
        <c:when test="${not empty dynamicForm.groups}">

            <table class="centro" width="80%" cellspacing="1">
                <tr class="listHeader">
                    <th class="centro" style="width: 3%;">#</th>
                    <th class="centro"><fmt:message
                            key="ipdms.dynamicform.group.label" /></th>
                    <th class="centro"><fmt:message
                            key="ipdms.dynamicform.group.fields" /></th>
                    <th class="centro" style="width: 4%;">${editar}</th>
                    <c:if
                        test="${dynamicForm.form.layout==null || dynamicForm.form.layout.nameResourceKey=='ipdms.dynamicform.form.linearlayout'}">
                        <th class="centro" style="width: 4%;">${ordenar}</th>
                    </c:if>
                    <!-- Header da coluna - posicao no eixo dos xx -->
                    <c:if
                        test="${dynamicForm.form.layout.nameResourceKey=='ipdms.dynamicform.form.gridlayout'}">
                        <th class="centro" style="width: 4%;">${x_pos}</th>
                    </c:if>
                    <!-- Header da coluna - posicao no eixo dos yy -->
                    <c:if
                        test="${dynamicForm.form.layout.nameResourceKey=='ipdms.dynamicform.form.gridlayout'}">
                        <th class="centro" style="width: 4%;">${y_pos}</th>
                    </c:if>
                    <!-- Header da coluna - posicao no eixo dos alignment -->
                    <c:if
                        test="${dynamicForm.form.layout.nameResourceKey=='ipdms.dynamicform.form.gridlayout'}">
                        <th class="centro" style="width: 4%;">${cell_alignment}</th>
                    </c:if>
                    
                    <th class="centro" style="width: 3%;">${eliminar}</th>
                </tr>
                <logic:iterate name="dynamicForm" property="groups" id="groups"
                    indexId="i">
                    <nested:root name="groups">
                        <tr>
                            <td class="centro">${i+1}</td>
                            <td class="centro">${groups.label}</td>
                            <td class="centro"><c:forEach var="f"
                                    items="${groups.fields}">${f.label},</c:forEach></td>
                            <td class="centro" width="4%"><input
                                onclick="$('indexOfGroup').value = '${i}'; webflowAjaxRequest(event);"
                                name="_eventId_editgroup" value="Editar" type="image"
                                title="${editar}" alt="${editar}"
                                src="${pageContext.request.contextPath}/images/icon/icon-editar.png"
                                style="border: none;" /></td>
                            <c:if
                                test="${dynamicForm.layout==null || dynamicForm.form.layout.nameResourceKey=='ipdms.dynamicform.form.linearlayout'}">

                                <td class="centro" width="8%"><input
                                    onclick="$('indexOfGroup').value = '${i}'; webflowAjaxRequest(event);"
                                    name="_eventId_upGroup" value="Subir Grupo" type="image"
                                    title="${subirOrdem}" alt="${subirOrdem}"
                                    src="${pageContext.request.contextPath}/images/icon/seta_cima.png"
                                    style="border: none;" /> <input
                                    onclick="$('indexOfGroup').value = '${i}'; webflowAjaxRequest(event);"
                                    name="_eventId_downGroup" value="Descer Grupo" type="image"
                                    title="${descerOrdem}" alt="${descerOrdem}"
                                    src="${pageContext.request.contextPath}/images/icon/seta_baixo.png"
                                    style="border: none;" /> <%-- 
                        <a href="applicationFlow.do2?_flowExecutionKey=${flowExecutionKey}&_eventId=upGroup&indexOfGroup=${i}">Up</a>
                        <a href="applicationFlow.do2?_flowExecutionKey=${flowExecutionKey}&_eventId=downGroup&indexOfGroup=${i}">Down</a>
                        --%></td>
                            </c:if>


                            <!-- 3 Colunas para quando o layout 'e uma grelha -->
                            <c:if
                                test="${groups.layout.nameResourceKey=='ipdms.dynamicform.form.gridlayout'}">
                                <td class="alignCenter" width="4%"><input name="icol_${i}"
                                    type="text" value=" ${groups.layoutData.col}"
                                    onkeypress="return isDigit();"
                                    onblur="$('indexOfGroup').value = '${i}'; webflowAjaxRequestEv(event,'_eventId_changeGroupColumn');" />
                                </td>
                                <td class="alignCenter" width="4%"><input name="irow_${i}"
                                    type="text" value="${groups.layoutData.row}"
                                    onkeypress="return isDigit();"
                                    onblur="  $('indexOfGroup').value = '${i}'; webflowAjaxRequestEv(event,'_eventId_changeGroupRow');" />
                                </td>
                                <td class="alignCenter" width="4%"><select
                                    name="ialignment_${i}" type="text"
                                    value="${groups.layoutData.alignment}"
                                    onchange="$('indexOfGroup').value = '${i}'; webflowAjaxRequestEv(event,'_eventId_changeGroupAlignment');">
                                        <c:forEach items="${dynamicForm.alignments}" var="al">
                                            <option value="${al}"
                                                <c:if test="${groups.layoutData.alignment==al}">selected</c:if>>
                                                <fmt:message key="${al.resourceKey}" />
                                            </option>
                                        </c:forEach>
                                </select></td>
                            </c:if>

                            <td class="centro" width="4%" style="text-align: center;"><label
                                for="removeRow_${i}"> <input type="checkbox"
                                    id="removeRow_${i}" name="removeRow_${i}" value="checked"
                                    class="radion" style="text-align: center; border: none;" />
                            </label></td>
                        </tr>
                    </nested:root>
                </logic:iterate>
            </table>
            <div id="alignRight">
                <img
                    src="${pageContext.request.contextPath}/images/icon/icon-lixo.png"
                    onclick="cancelar(event,'${camposDinamicos}','${eliminarMsg}',decisaoEliminar,'${sim}','${nao}');"
                    class="cursorMao" alt="${eliminar}" title="${eliminar}" />
            </div>
        </c:when>
        <c:otherwise>
            <div class="row formlabel_sf">
                <div class="mensagenCaixa">
                    <div style="float: left; width: 3%;">
                        <img
                            src="${pageContext.request.contextPath}/images/icon/icon-informacao.png"
                            style="vertical-align: middle; padding-left: 10px; padding-right: 4px;"
                            alt="${atencao}" title="${atencao}" />
                    </div>
                    <div
                        style="float: right; width: 93%; vertical-align: middle; margin-top: 4px;">
                        <div class="info">${emptyMsg}</div>
                    </div>
                    <div style="clear: both"></div>
                </div>
            </div>
        </c:otherwise>
    </c:choose>

    <br />
    <div class="buttonRow">
        <input type="button" name="_eventId_back" value="${anterior}"
            class="btForm" onclick="webflowAjaxRequest(event);"
            title="${anteriorTitle}" /> <input type="button"
            name="_eventId_newgroup" value="${novo}" class="btForm"
            onclick="webflowAjaxRequest(event);" title="${novo}" />
    </div>
</html:form>

<script>
decisaoEliminar = function(btn){
    if(btn=='yes'){
        extAjaxRequest('applicationFlow.do2', '_flowExecutionKey=${flowExecutionKey}&_eventId=removegroups&' + Form.serialize(document.forms[0]));
    } else{
        return false;
    }
};
</script>
