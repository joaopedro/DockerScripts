<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<script src='${JS_DIR}/jspdf/jspdf.min.js' type="text/javascript"></script>
<script src='${JS_DIR}/jspdf/FileSaver.min.js' type="text/javascript"></script>
<script type="text/javascript" src='${JS_DIR}/jquery/jquery-1.7.2.js' ></script>

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
<fmt:message key="ipdms.tarefas.anexarDocs.anexados" var="docsAnexados" />
<fmt:message key="ipdms.webflow.docsAdicionados" var="docsAdicionados" />
<fmt:message key="ipdms.webflow.gerarpdfresumo" var="gerarpdfresumo" />

<script type="text/javascript">
    jQuery.noConflict();
    decisao = function (btn) {
        if(btn=='yes') {
            extAjaxRequest('${referer}', '');
        } else {
            return false;
        }
    };

    var doPdf = function(){
        var doc = new jsPDF();

        // We'll make our own renderer to skip this editor
        var specialElementHandlers = {
            '#tableDocumentosAnexosByItem': function(element, renderer){
                var css={};
                css['display'] = "block";
                css['font-family'] = "times";
                css['font-size'] = 1;
                css['font-style'] = "normal";
                css['line-height'] = 1;
                css['margin-bottom'] = 0.5;
                css['margin-top'] = 0.5;
                css['padding-bottom'] = 0;
                css['padding-top'] = 0;
                var items = element.getElementsByTagName('tr');
                for (var i = 0; i < items.length; i++) {
                    var childs = items[i].getElementsByTagName('td');
                    if(childs.length>0){
    //             		renderer.setBlockBoundary();
                        renderer.addText(items[i].getElementsByTagName('td')[0].innerText, css);
                        renderer.addText(items[i].getElementsByTagName('td')[1].innerText, css);
    //             		renderer.setBlockBoundary();
                    }
                }
                return true;
            },
            '#tableDocumentosAnexos': function(element, renderer){
                var css={};
                css['display'] = "block";
                css['font-family'] = "times";
                css['font-size'] = 1;
                css['font-style'] = "normal";
                css['line-height'] = 1;
                css['margin-bottom'] = 0.5;
                css['margin-top'] = 0.5;
                css['padding-bottom'] = 0;
                css['padding-top'] = 0;
                var items = element.getElementsByTagName('tr');
                for (var i = 0; i < items.length; i++) {
                    var childs = items[i].getElementsByTagName('td');

                    if(childs.length>0){
                        renderer.setBlockBoundary();
                        renderer.addText(items[i].getElementsByTagName('td')[0].innerText, css);
                        renderer.addText(items[i].getElementsByTagName('td')[1].innerText, css);
                        renderer.setBlockBoundary();
                    }
                }
                return true;
            },
            '#tituloPdf': function(element, renderer){
                var css={};
                css['display'] = "block";
                css['font-family'] = "times";
                css['font-size'] = 1.5;
                css['font-style'] = "bold";
                css['line-height'] = 1;
                css['margin-bottom'] = 0.5;
                css['margin-top'] = 0.5;
                css['padding-bottom'] = 0;
                css['padding-top'] = 0;
                renderer.addText(element.innerText, css);
                return true;
            }
        };

        // All units are in the set measurement for the document
        // This can be changed to "pt" (points), "mm" (Default), "cm", "in"
        doc.fromHTML(jQuery('#resumo').html(), 15, 15, {
            'width': 1700,
            'elementHandlers': specialElementHandlers
        });
        doc.save('Test.pdf');
    }
</script>



<div id="resumo">

    <c:set var="_resumo" value="true" scope="request"/>
    <c:if test="${empty resumo_normal}">

        <form:form action="${flowExecutionUrl}" class="dynForm">
            <input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">

            <form:errors/>
            <c:set var="userExterno" value="${dynamic.userExterno}" scope="request"/>
            <table width="100%" cellpadding="1" cellspacing="1" style="border:none">
                <tr><td class="titulo2" id="tituloPdf">1 - ${formulariodinamico}</td></tr>
                <tr><td><jsp:include page="formscreen.jsp" flush="true"/></td></tr>

                <tr><td class="titulo2" id="tituloPdf">2 - ${docsAnexados}</td></tr>
                <tr><td><jsp:include page="/ipdms/webflow/anexos.jsp" flush="true"/></td></tr>

                <tr><td class="titulo2" id="tituloPdf">3 - ${docsAdicionados}</td></tr>
                <tr><td><jsp:include page="/ipdms/webflow/anexosByItem.jsp" flush="true"/></td></tr>
            </table>
            <a href="#" onclick="doPdf()">${gerarpdfresumo }</a>

            <c:if test="${userExterno}"></c:if>

            <div class="buttonRow">
                <input type="button" name="_eventId_back" value="${anterior}" class="btForm" onclick="webflowAjaxRequest(event);" title="${anteriorTitle}"/>
                <input type="button" name="_eventId_suspend" value="${gravar}" class="btForm" onclick="webflowAjaxRequest(event);" title="Gravar informação"/>
                <input type="button" name="_eventId_next" value="${submit}" class="btForm" title="${submitTitle}" onclick="webflowAjaxRequest(event);" />
                <input type="button" name="_eventId_cancel" value="${cancelar}" class="btFormEscuro" onclick="cancelar(event,'${pedidos}','${cancelarTitle}?',decisao,'${sim}','${nao}');" title="${cancelarTitle}"/>
            </div>

        </form:form>

    </c:if>

</div>




<%-- RESUMO FORA DO WEBFLOW --%>
<c:if test="${not empty resumo_normal}">

	<c:set var="dynamic" value="${webflowActionForm}" scope="request"/>
	<table style="width:100%; border: none; vertical-align: top;" cellpadding="1" cellspacing="1">
		<tr><td class="titulo2">1. ${formulariodinamico}</td></tr>
		<tr><td><jsp:include page="formscreen.jsp" flush="true"/></td></tr>

		<tr><td class="titulo2">2. ${docsAnexados}</td></tr>
		<tr><td><jsp:include page="/ipdms/webflow/anexos.jsp" flush="true"/></td></tr>

		<tr><td class="titulo2">3. ${docsAdicionados}</td></tr>
		<tr><td><jsp:include page="/ipdms/webflow/anexosByItem.jsp" flush="true"/></td></tr>
	</table>

</c:if>
