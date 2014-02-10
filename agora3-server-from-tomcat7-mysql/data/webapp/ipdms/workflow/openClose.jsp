<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" />
<c:set var="JS_DIR" value="${CONTEXT_PATH}/ipdms/js" />

<%--<c:set var="title"><fmt:message key="ipdms.utilizadoresdependentes.carregar"/></c:set>--%>
<c:set var="show_users"><fmt:message key="ipdms.utilizadoresdependentes.mostrar"/></c:set>
<c:set var="hide_users"><fmt:message key="ipdms.utilizadoresdependentes.esconder"/></c:set>


<script>

function loadUtilizadoresFirstTime(div, param){

    //verifica se é acção de suspender ou aguardar
    var isSuspender = false;
    if($('suspender') != null){
        isSuspender = $('suspender').value;
    }
            
    var action = param + '?suspender=' + isSuspender;
                    
    //only the first time the users are loaded
    if($('firstTimeLoaded') == null){
        loadListprocess(div,action);    
    }
    toggleInfo('utilizadores'); 

}

</script>

<div id="utilizadores_open" class="titulo2">
    <a href="#" onclick="loadUtilizadoresFirstTime('utilizadores','${CONTEXT_PATH}/listautilizadoresdependentesajax.do2');"><img src="images/icon/seta_seccao_fecha.png" alt="${show_users}" title="${show_users}"/></a>    
    <a href="#" onclick="loadUtilizadoresFirstTime('utilizadores','${CONTEXT_PATH}/listautilizadoresdependentesajax.do2');" class="formfield">${show_users}</a>     
</div>
<div id="utilizadores_close" class="titulo2" style="display: none;">
    <a href="#" onclick="toggleInfo('utilizadores');"><img src="images/icon/seta_seccao_abre.png" alt="${hide_users}" title="${hide_users}"/></a>
    <a href="#" onclick="toggleInfo('utilizadores');" class="formfield">${hide_users}</a>
</div>


