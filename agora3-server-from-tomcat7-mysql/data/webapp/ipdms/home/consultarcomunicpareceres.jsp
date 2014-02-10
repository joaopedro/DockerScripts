<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.forms.ajuda" var="ajuda" />
<fmt:message key="ipdms.forms.ocultarAjuda" var="ocultarAjuda" />

<LINK href='${pageContext.request.contextPath}/ipdms/themes/window/alphacube.css' type=text/css rel=stylesheet>
<LINK href='${pageContext.request.contextPath}/ipdms/themes/window/window-default.css' type=text/css rel=stylesheet>

<script src='${pageContext.request.contextPath}/ipdms/js/window/window.js' type="text/javascript"></script>
<script type="text/javascript">	
	document.title = '${productName} - <fmt:message key="ipdms.comunicacaoparecer.consultar.titulo" />';	 
</script>
<div id="ver_ajuda" class="row" style="padding-top:0px; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1"><fmt:message key="ipdms.comunicacaoparecer.consultar.titulo" /></td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('s');" class="cursorMao" alt="${ajuda}" title="${ajuda}" /></td>
		  </tr>
		</tbody>
	</table>					
</div>

<c:if test="${not empty comunicPareceres}">
<div id="ajuda" class="info" style="padding-top:0px; display: none; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1"><fmt:message key="ipdms.comunicacaoparecer.consultar.titulo" /></td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('n');" class="cursorMao" alt="${ocultarAjuda}" title="${ocultarAjuda}" /></td>
		  </tr>
		</tbody>
	</table>	
	<fmt:message key="ipdms.comunicacaoparecer.consultar.help" />
</div>
</c:if>

<div class="alignLeft">
	<div class="left">
	<c:url var="criarComunicacao" value="/tarefas/criarComunicacao.do2">
		<c:param name="fromTarefa" value="0" />
		<c:param name="tipo" value="C" />
		<c:param name="urlAnterior" value="/comunicacoesPareceres.do2?method=show" />
	</c:url>
	<a href="<c:out value="${criarComunicacao}"/>">
		<img src="${pageContext.request.contextPath}/images/icon/icon-criarNovo.png"  class="cursorMao" alt="<fmt:message key="ipdms.comunicacaoparecer.consultar.criarNovaComunic" />" title="<fmt:message key="ipdms.comunicacaoparecer.consultar.criarNovaComunic" />" />
	</a>
	</div>
	<div class="right" onclick="<c:out value="${criarComunicacao}"/>">
	<div class="texto"><a href="<c:out value="${criarComunicacao}"/>" title="<fmt:message key="ipdms.comunicacaoparecer.consultar.criarNovaComunic" />"><fmt:message key="ipdms.comunicacaoparecer.consultar.criarNovaComunic" /></a></div></div>
</div>

<html:form action="/comunicacoesPareceres" method="post" styleClass="form" styleId="comunicacoesPareceresForm">
	<html:hidden property="method" value="show" />
	<div id="listComunicParecerDiv"><jsp:include page="listacomunicpareceres.jsp"/></div>
</html:form>

<br/>
<div id="detailComunicParecerDiv"></div>


<script>
	var actionUrl = "${pageContext.request.contextPath}/comunicacoesPareceres.do2";

	updateList = function() {
		new Ajax.Updater( {success: 'listComunicParecerDiv'}, actionUrl + '?method=list', 
				   		  {method: 'get', parameters: '', evalScripts: true} );
	}

	showComunicParecerDetail = function(id, action) {
		if(action != ''){
			var url = "${pageContext.request.contextPath}/" + action;
			actionUrl = url;					
		}
				
		var p = 'id=' + id;
		new Ajax.Updater( {success: 'detailComunicParecerDiv'}, actionUrl + '?method=detail', 
				   		  {method: 'get', parameters: p, evalScripts: true} );
	}

	responderComunic = function(id) {
		submitDiv('detailComunicParecerDiv', actionUrl + '?method=save&id='+id, 'comunicacaoParecerErrorDiv', true);
	}

	responderComunicAll = function() {
		submitDiv('listComunicParecerDiv', actionUrl + '?method=saveAll', 'comunicacaoParecerListErrorDiv', true);
	}

	show2 = function() {
		document.forms['comunicacoesPareceresForm'].submit();
	}
	
	function enableField(textField){		
		var index = textField.name.substring(textField.name.indexOf("[")+1, textField.name.indexOf("]") );
		var elems = textField.form.elements;
		for( i = 0; i < elems.length; i++ ){
			if( elems[i].type == "file" && elems[i].name.indexOf("["+index+"]") != -1 ){
				textField.value = trim(textField.value);
				elems[i].disabled = textField.value == "";
				if( elems[i].disabled ){
					elems[i].value = "";
				}
			}
		}
	}
	
</script>