<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.dimensoes.criar.novoValor" var="titulo" />

<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/ipdms/themes" />
<LINK href='${THEMES_DIR}/forms.css' type=text/css rel=stylesheet />
<LINK href='${THEMES_DIR}/estilos.css' type=text/css rel=stylesheet />

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<script src='${JS_DIR}/prototype.js' type="text/javascript"></script>
<script src='${JS_DIR}/utils.js' type="text/javascript"></script>
	


<script type="text/javascript">
editValorDim = function(){

	var parametros = "method=save";
	parametros += "&nodeId=${nodeId}";
	parametros += "&create=${create}";
	parametros += "&nivel=${nivel}";
	parametros += "&codigo="+document.valoresForm.codigo.value;
	parametros += "&descricao="+document.valoresForm.descricao.value;
	parametros += "&popupWindowName=${popupWindowName}";
	
	var myAjax = new Ajax.Updater(
			{success: "msgErro"},
			"ajaxEditValorDimensional.do2",
			{method: 'post', parameters: parametros, onComplete: checkState}
		);
	
	
};


deleteValorDim = function(){

	var parametros = "method=delete";
	parametros += "&nodeId=${nodeId}";
	
	var myAjax = new Ajax.Updater(
			{success: "msgErro"},
			"ajaxEditValorDimensional.do2",
			{method: 'post', parameters: parametros, onSuccess: checkState}
		);
};

function isEmpty(mytext) {
	var re = /^\s{1,}$/g; //match any white space including space, tab, form-feed, etc.
	if ((mytext.length==0) || (mytext==null) || ((mytext.search(re)) > -1)) {
		return true;
	}
	else {
		return false;
	}
}

checkState = function (response) {
	if(isEmpty(response.responseText))
		parent.${param.window}.close();
	else {
		parent.${param.window}.setHeight(320);
		parent.${param.window}.setWidth(520);
	}
}

</script>	
<script type="text/javascript">	
	document.title = '${productName} - ${titulo}';	 
</script>

<div id="msgErro">
</div>
<div class="row" style="text-align:left; padding-top:0;">
     <table border="0" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${titulo}</td>
		  </tr>
		</tbody>
	</table>					
</div>
<div style="padding-left:1%;">
<form action="/ajaxEditValorDimensional" name="valoresForm">
	<div class="row" style="padding-bottom:1%; padding-top:0;">
		<div class="label" style="width: 90%; " title="<fmt:message key='ipdms.obrigatorio' />">
	  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
	  	</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 20%; " title="<fmt:message key="ipdms.dimensoes.nivel.titulo" />">
			<fmt:message key="ipdms.dimensoes.nivel.titulo" /> :
		</div>
  	
  		<div class="label" style="width: 75%;" title="<fmt:message key="ipdms.dimensoes.nivel.titulo" />">
  			${nivelDim.designacao}
  		</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 20%; " title="<fmt:message key="ipdms.dimensoes.valor.codigo" />">
			<label for="codigo"><fmt:message key="ipdms.dimensoes.valor.codigo" /> *</label>
		</div>
  	
  		<div class="label" style="width: 75%;" title="<fmt:message key="ipdms.dimensoes.valor.codigo" />">
  			<input type="text" class="textinput" name="codigo" id="codigo" value="${valorDimensional.codigo}"/>
  		</div>
	</div>
	
	<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 20%; " title="<fmt:message key="ipdms.dimensoes.valor.descricao" />">
			<label for="descricao"><fmt:message key="ipdms.dimensoes.valor.descricao" /> *</label>
		</div>
  	
  		<div class="label" style="width: 75%;" title="<fmt:message key="ipdms.dimensoes.valor.descricao" />">
  			<input type="text" class="textinput" name="descricao" id="descricao" value="${valorDimensional.descricao}"/>
  		</div>
	</div>
</form>		
<div style="clear:both"></div>
<div class="buttonRow">
		<c:if test="${!IPDMSInteropReceiver}">
			<input type="button" class="btForm" title="<fmt:message key='ipdms.forms.submit.title' />" value="<fmt:message key='ipdms.forms.submit' />"  onclick="editValorDim();"/>
			<!-- input type="button" class="btForm" value="<fmt:message key="ipdms.forms.fechar" />" onclick="parent.${param.window}.close();"/-->
			<c:if test="${valorDimensional != null}">
				<input type="button" class="btForm" title="<fmt:message key='ipdms.forms.eliminar' />" value="<fmt:message key='ipdms.forms.eliminar' />"  onclick="deleteValorDim();"/>
			</c:if>
		</c:if>
</div>
</div>