<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<fmt:message key="ipdms.processo.designacaoplural" var="processos"/>
<fmt:message key="ipdms.processos.reabrir.success" var="success"/>

<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" />
<c:set var="JS_DIR" value="${CONTEXT_PATH}/ipdms/js" />

<link rel="stylesheet" type="text/css" href="${CONTEXT_PATH}/ipdms/js/ext/resources/css/messageEditCreate.css" />
<script type="text/javascript" src="${CONTEXT_PATH}/ipdms/js/ext/ExtContentIPDMS/messageEditCreate.js" ></script>
<script type="text/javascript" src="${CONTEXT_PATH}/ipdms/js/ext/ExtContentIPDMS/AjaxRequest.js" ></script>



<script type="text/javascript">
	
	var rules = {
		'#worklist tbody tr': function(el) {
			el.onmouseover = function(){
				Element.addClassName(this,'active-row')				
			};
			el.onmouseout = function() {
				Element.removeClassName(this, 'active-row');
			};
		}
	};
	Behaviour.register(rules);

	//Faz a chamada Ajax para carregar a listagem de utilizadores dependentes  e dos processos a reabrir
	//loadListprocess('utilizadores','${CONTEXT_PATH}/listautilizadoresdependentesajax.do2?suspender=true');
	loadListprocess('processos','${CONTEXT_PATH}/listaprocessosreabrirajax.do2?suspender=true');		
	
</script>


<%-- div 'titulo' --%>
<div class="row" style="text-align:left; padding-top:0px; ">
	<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
		<tbody><tr><td class="titulo1"><fmt:message key="ipdms.processos.reabrir"/></td></tr></tbody>
	</table>					
</div>
<div id='extInfo' ></div>

<%-- message informing that the process was reopened--%>
<script>

	var reopen;

	if(${empty resume}){
		reopen = false;	
	} 
	else {

		reopen = true;
		
		if(reopen == true){
			Ext.example.msg('${processos}','${success}');
		}
	}
		
</script>

<%-- toggle method --%>
<script type="text/javascript">

toggleInfo = function (elementid) {
		$(elementid + '_close').toggle(); 
		$(elementid + '_open').toggle();
		$(elementid).toggle();	
	};
		
</script>


<%-- used in openClose to --%>
<input type="hidden" id="suspender" name="suspender" value="true">
<%-- div onde será listada o conjunto de utilizadores dependentes --%>
<jsp:include page="openClose.jsp" />
<br/>
<div id="utilizadores" style="display: none;">  
    <span class='formfield'>
        <img src="${JS_DIR}/ext/resources/images/default/grid/loading.gif" 
            style="width:16px; height:16px; vertical-align:top;" 
            alt="<fmt:message key='ipdms.ajax.utilizadores.dependentes.msg'/>" 
            title="<fmt:message key='ipdms.ajax.utilizadores.dependentes.msg'/>" /> 
        <fmt:message key="ipdms.ajax.utilizadores.dependentes.msg"/>    
    </span>     
</div>


<%-- div onde irão ser mostrados os processos a reabrir --%>
<br/>
<div id="processos" >           
    <span class='formfield'>
        <img src="${JS_DIR}/ext/resources/images/default/grid/loading.gif" 
            style="width:16px; height:16px; vertical-align:top;" 
            alt="<fmt:message key='ipdms.ajax.processos.msg'/>" 
            title="<fmt:message key='ipdms.ajax.processos.msg'/>" /> 
        <fmt:message key="ipdms.ajax.processos.msg"/>
    </span>             
</div>
 

