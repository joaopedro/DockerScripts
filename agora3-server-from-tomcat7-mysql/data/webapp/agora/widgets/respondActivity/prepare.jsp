<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<fmt:message key="agora.respondactivity.message" var="message" />
<fmt:message key="ipdms.forms.submit" var="submit" />
<fmt:message key="ipdms.etapa.delegavel" var="delegavel"/>
<fmt:message key="ipdms.etapa.encerrar" var="encerrar"/>
<fmt:message key='ipdms.etapa.aguardar' var="aguardar"/>
<fmt:message key='ipdms.etapa.suspender' var="suspender"/>
<fmt:message key="ipdms.forms.cancelar" var="cancelar" />
<fmt:message key="ipdms.forms.submit.title" var="submitTitle" />
<fmt:message key="ipdms.forms.cancelar.title" var="cancelarTitle" />


<script type="text/javascript">

    function request(action, div){
        var result = $("input:radio[name=result]:checked").val();
        if(result == null){
            result = '';
        }

        var data = {taskId: '${taskId}', result: result};

        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/agora/respondActivity.do',
            data: data,
            dataType: 'html',
            beforeSend: function() {
                $("body").mask(fmtResources.loadingMsg);
            },
            complete: function() {
                $("body").unmask();
            },
            error: function(transport) {
                console.log('Server side Error : ' + transport.status);
            },
            success: function(data) {
                //  render server response on result div
                $("#respondActivityDiv").html(data);
            }
        });
    }

</script>


<form:form id="responseActivityForm" class="geral" action="agora/respondActivity.do">

    <fieldset style="width:100%" id="widgetsFieldSet" class="formGeralFieldset" style="font-size: 1em;">

        <div class="FormRow">
            <c:choose>
                <c:when test="${not empty question && not empty transitions}">
                    <legend class="formGeralLegend" style="font-size: 1em; background: #b7c922;">${question}</legend>
                    <c:forEach items="${transitions}" var="transition">
                        <input type="radio" id="result" name="result" value="${transition}" />  ${transition}
                        <br/>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    ${message}
                    <br />
                </c:otherwise>
            </c:choose>

            <br />
            <br />
            <div id="tabsBtnDiv" class="button" style="padding: 0px;">
                <input type="button" style="font-size: 1em;" value="${submit}" class="BT_primary" title="${submitTitle}"
                    onclick="request('/agora/respondActivity.do','respondActivityDiv')" />
                <input type="button" value="${delegavel}" class="" title="${delegavel}" onclick="" />
                <input type="button" value="${encerrar}" class="" title="${encerrar}" onclick="" />
                <input type="button" value="${aguardar}" class="" title="${aguardar}" onclick="" />
                <input type="button" value="${suspender}" class="" title="${suspender}" onclick="" />
                <input type="button" value="${cancelar}" title="${cancelarTitle}" onclick="javascript: location.reload();" />
            </div>
        </div>

	</fieldset>

</form:form>