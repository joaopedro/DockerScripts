<%@ taglib uri="/tags/html" prefix="html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<fmt:message key="ipdms.forms.anterior" var="anterior" />
<fmt:message key="ipdms.forms.anterior.title" var="anteriorTitle" />

<c:set var="JSPFIELDDIR" value="/ipdms/webflow/dynamic/field" />

<div>
    <table style="border: none;" cellpadding="0" cellspacing="0"
        class="headings">
        <tr>
            <td class="titulo1"><fmt:message
                    key="ipdms.dynamicform.form.edit.title" /></td>
        </tr>
        <tr>
            <td class="titulo2"><fmt:message
                    key="ipdms.dynamicform.form.previewform.subtitle" /></td>
        </tr>
    </table>
</div>

<form:form modelAttribute="define-dynamicform">
    <input type="hidden" name="_flowExecutionKey"
        value="${flowExecutionKey}">

    
    <c:set var="dynForm" value="${dynamicForm.form}" scope="request" />

    <c:if
        test="${dynamicForm.form.layout==null || dynamicForm.form.layout.nameResourceKey=='ipdms.dynamicform.form.linearlayout'}">

        <div>
            <%-- RENDER GROUPS --%>
            <c:forEach items="${dynamicForm.groups}" var="group">
                <c:if test="${not empty group.fields}">
                    <fieldset>
                        <legend>${group.label}</legend>
                        <c:set var="changeline" value="true" scope="request" />
                        <c:forEach items="${dynamicForm.fields}" var="field">
                            <c:if test="${group == field.group}">
                                <c:set var="field" value="${field}" scope="request" />
                                <jsp:include page="${JSPFIELDDIR}/renderFieldPart.jsp" />
                            </c:if>
                        </c:forEach>
                    </fieldset>
                </c:if>
            </c:forEach>

            <%-- RENDER rest of fields without group --%>
            <c:set var="changeline" value="true" scope="request" />
            <c:forEach items="${dynamicForm.fields}" var="field">
                <c:if test="${empty field.group}">
                    <c:set var="field" value="${field}" scope="request" />
                    <jsp:include page="${JSPFIELDDIR}/renderFieldPart.jsp" />
                </c:if>
            </c:forEach>
        </div>
    </c:if>
    
    <!-- Se for grelha -->
    <c:if test="${dynamicForm.form.layout!=null && dynamicForm.form.layout.nameResourceKey=='ipdms.dynamicform.form.gridlayout'}">
        <table border="0" class="dyncentro">
        <c:forEach items="${dynamicForm.presentationLayout.data}" var="gpldrow"> 
          <tr>
            <c:forEach items="${gpldrow}" var="gpld">                   
              <c:choose>
              <c:when test="${not empty gpld }">
                 <c:choose>
                  <c:when test="${gpld.object.layoutData.alignment=='LEFT' }">
                   <td style="text-align:left;">    
                  </c:when>
                  <c:when test="${gpld.object.layoutData.alignment=='RIGHT' }">
                   <td style="text-align:right;">   
                  </c:when>
                  <c:otherwise>
                    <td style="text-align:center;">
                  </c:otherwise>
                 </c:choose>
                    <c:choose>
                      <c:when test="${gpld.object.renderType=='FIELD'}">
                        <c:set var="field" value="${gpld.object}" scope="request" />
                        <jsp:include page="${JSPFIELDDIR}/renderFieldPart.jsp" />
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
                                   <c:when test="${g_gpld.object.layoutData.alignment=='LEFT' }">
                                    <td style="text-align:left;">   
                                   </c:when>
                                   <c:when test="${g_gpld.object.layoutData.alignment=='RIGHT' }">
                                    <td style="text-align:right;">  
                                   </c:when>
                                   <c:otherwise>
                                    <td style="text-align:center;">
                                   </c:otherwise>
                                  </c:choose>
                                  <c:set var="field" value="${g_gpld.object}" scope="request" />
                                  <jsp:include page="${JSPFIELDDIR}/renderFieldPart.jsp" />
                                 </c:when>
                                 <c:otherwise>
                                 <td/>
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
                 <td/>
               </c:otherwise>
               </c:choose>
              </c:forEach>     
            </c:forEach>
            </tr>
        </table>
    </c:if> 

    <br />
    <br />
    <div class="buttonRow">
        <input type="button" name="_eventId_back" value="${anterior}"
            class="btForm" onclick="webflowAjaxRequest(event);"
            title="${anteriorTitle}" />
    </div>
</form:form>
