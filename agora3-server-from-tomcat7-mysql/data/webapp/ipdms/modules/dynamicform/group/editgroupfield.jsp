<%@ taglib uri="/tags/html" prefix="html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>

<fmt:message key="ipdms.instrucao.pedido.info.title" var="atencao" />
<fmt:message key="ipdms.dynamicform.group.emptyFieldMsg" var="emptyFieldMsg" />
<fmt:message key="ipdms.forms.anterior" var="anterior" />
<fmt:message key="ipdms.forms.anterior.title" var="anteriorTitle" />
<fmt:message key="ipdms.forms.gravar" var="gravar" />

<div>
    <table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
        <tr><td class="titulo1"><fmt:message key="ipdms.dynamicform.form.edit.title" /></td></tr>
        <tr><td class="titulo2"><fmt:message key="ipdms.dynamicform.form.editgroup.subtitle" /></td></tr>
    </table>
</div>

<html:form action="applicationFlow" method="post" >
    <input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">
    <html:errors/>
    <div class="row" style="padding-bottom:2%;">
        <div class="leftTab label" style="width: 90%; " title="<fmt:message key='ipdms.obrigatorio' />">
            <span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
        </div>
    </div>
        
    <div class="row formlabel_sf" >
        <div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.dynamicform.group.label' />" >
            <label for="externalId">
                <fmt:message key="ipdms.dynamicform.group.label" /> *
            </label>
        </div>      
        <div class="label" style="width: 80%;" title="<fmt:message key='ipdms.dynamicform.group.label' />">
            <html:text name="dynamicForm" property="editGroup.label" styleId="externalId"/>
        </div>
    </div>
    
    <c:if test="${dynamicForm.editGroup.layout.nameResourceKey=='ipdms.dynamicform.form.gridlayout'}">
        <div class="row formlabel_sf">
            <div class="leftTab label" style="width: 17%;"
                title="<fmt:message key="ipdms.dynamicform.form.gridlayout.rows" />">
                <label for="rows"> <fmt:message
                        key="ipdms.dynamicform.form.gridlayout.rows" /> * 
                </label>
            </div>
            <div class="label" style="width: 80%;"
                title="<fmt:message key="ipdms.dynamicform.form.gridlayout.rows" />">
                <html:text maxlength="2" onkeypress="return isDigit();"
                    name="dynamicForm" property="editGroup.layout.numbOfRows" size="5" /> 
            </div>
        </div>
    </c:if>

    <c:if test="${dynamicForm.editGroup.layout.nameResourceKey=='ipdms.dynamicform.form.gridlayout'}">
        <div class="row formlabel_sf">
            <div class="leftTab label" style="width: 17%;"
                title="<fmt:message key="ipdms.dynamicform.form.gridlayout.cols" />">
                <label for="rows"> <fmt:message
                        key="ipdms.dynamicform.form.gridlayout.cols" /> * 
                </label>
            </div>
            <div class="label" style="width: 80%;"
                title="<fmt:message key="ipdms.dynamicform.form.gridlayout.cols" />">
                <html:text name="dynamicForm" property="editGroup.layout.numbOfCols"
                    size="5" maxlength="2" onkeypress="return isDigit();" /> 
            </div>
        </div>
    </c:if>
        
    <div class="row formlabel_sf" >
        <c:choose>
        <c:when test="${not empty dynamicForm.editGroupFields}">
            <nested:iterate name="dynamicForm" property="editGroupFields" >
                <div class="leftTab label" style="width: 17%;">
                    <label for="dynaimcCheck">
                        ${editGroupFields.label}    
                    </label>
                </div>      
                <div class="label" style="width: 80%;">
                    <nested:checkbox property="checked" styleId="dynaimcCheck" />
                </div>
                </nested:iterate>
            </c:when>
            <c:otherwise>
                <br />
                <div class="row formlabel_sf" >
                <div class="mensagenCaixa">
                        <div style="float:left; width:3%;">
                        <img src="${pageContext.request.contextPath}/images/icon/icon-informacao.png" style="vertical-align:middle; padding-left:10px; padding-right:4px;"  alt="${atencao}" title="${atencao}"/> 
                       </div>
                       <div style="float:right; width:93%; vertical-align:middle; margin-top:4px; ">
                        <div class="info">${emptyFieldMsg}</div>
                       </div>
                   <div style="clear:both"></div>
                   </div>
               </div>
            </c:otherwise>
        </c:choose> 
    </div>
    
    <br/>
    <div class="buttonRow">
        <input type="button" name="_eventId_back" value="${anterior}" class="btForm" onclick="webflowAjaxRequest(event);" title="${anteriorTitle}" />
        <input type="button" name="_eventId_savegroup" value="${gravar}" class="btForm" onclick="webflowAjaxRequest(event);" title="${gravar}" />
    </div>
</html:form>
