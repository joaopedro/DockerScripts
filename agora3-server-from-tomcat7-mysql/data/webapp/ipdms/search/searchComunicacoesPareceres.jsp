<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/ipdms/themes" />
<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />

<script type="text/javascript" language="JavaScript" src="${JS_DIR}/processoutil.js"></script>

<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/column-tree.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/CustomToolbar.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/ColumnNodeUI.css" />

<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ColumnNodeUI.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ConfirmCancel.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/Window_Iframe.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/IPDMSTreePanel.js"></script>

<fmt:message key="ipdms.colaborador.designacaoplural" var="colaboradores" />

<script>

Ext.onReady(function(){
	//cololcar formato de data caso nao haja datas reais
	dateFormatCheckonLoad();
});


function showAutorDiv(flag) {
	if(flag == 'E') {
		$('autorDiv').style.display = 'none';
	}
	else {
		$('autorDiv').style.display = 'block';

	}		
}

function showOrganicaColaboradoresMultiple(){
		var action = "${pageContext.request.contextPath}/ajaxListOrganicaWithColaboradores.do2";
		var paramts = "valuePlaceOlder=idAutores";
		paramts += "&descPlaceOlder=autores";
		paramts += "&window=winchoose&multiple=true";
		
		winCol = ExtWindow('${colaboradores}', action, paramts, 'ext');		
	}

</script>


<html:form method="post" action="/procuraComunicPareceres.do2?method=list" onsubmit="dateFormatCheckonSubmit();">
	<html:hidden property="page" value="1" />

<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%;" title="<fmt:message key="ipdms.comunicacaoparecer.pesquisa.tipo" />"><fmt:message key="ipdms.comunicacaoparecer.pesquisa.tipo" /></div>
  	<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.comunicacaoparecer.pesquisa.tipo" />">
  		<html:radio property="params(tipoComunic)" value="R" onclick="javascript:showAutorDiv('R');" style="border:none;"></html:radio>
  			<fmt:message key="ipdms.comunicacaoparecer.pesquisa.recebidas" />
  		<html:radio property="params(tipoComunic)" value="E" onclick="javascript:showAutorDiv('E');" style="border:none;"></html:radio>
		<fmt:message key="ipdms.comunicacaoparecer.pesquisa.enviadas" />
  	</div>
</div>

<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.comunicacaoparecer.pesquisa.areaProcesso" />">
  		<fmt:message key="ipdms.comunicacaoparecer.pesquisa.areaProcesso" />
  	</div>
  	
  	<div class="label" style="width: 31%;" title="<fmt:message key="ipdms.comunicacaoparecer.pesquisa.areaProcesso" />">
  		<html:select  property="params(organicaProcesso)" onchange="reCarregarProcessos(this, 'listaprocessos');" style="width: 94%;">
			<option value=""></option>
			<html:options collection="listOrganicas" property="id" labelProperty="designacao" />
		</html:select>
  	</div>
 
 	<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.comunicacaoparecer.pesquisa.tipoProcesso" />">
  		<fmt:message key="ipdms.comunicacaoparecer.pesquisa.tipoProcesso" />
  	</div>

  	<div class="label" style="width: 31%;" title="<fmt:message key="ipdms.comunicacaoparecer.pesquisa.tipoProcesso" />">
		<div id="listaprocessos">
			<c:choose>
				<c:when test="${not empty searchComunicacoesPareceres.map.params['organicaProcesso']}">
					<c:url var="selectEtapas" value="selectprocessos.do2">
						<c:param name="organica" value="${searchComunicacoesPareceres.map.params['organicaProcesso']}"></c:param>
						<c:param name="processoId" value="${searchComunicacoesPareceres.map.params['tipoProcesso']}" />
					</c:url> 
					<c:import url="/${selectEtapas}" />
				</c:when>
				<c:otherwise>
			  		<html:select  property="params(tipoProcesso)" style="width: 94%;">
						<option value="" />
						<html:options collection="listTiposProcesso" property="numeroConteudo" labelProperty="titulo" />
					</html:select>
				</c:otherwise>
			</c:choose>
		</div>	
  	</div> 	
	<div style="clear:both"></div>
</div>	

<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.comunicacaoparecer.pesquisa.numProcesso" />">
  		<fmt:message key="ipdms.comunicacaoparecer.pesquisa.numProcesso" />
  	</div>
  	<div class="label" title="<fmt:message key="ipdms.comunicacaoparecer.pesquisa.numProcesso" />" style="width: 80%;">
  		<html:text styleClass="textinput" property="params(numProcesso)" size="20" maxlength="20" />
  	</div>
  	<div style="clear:both"></div>
</div>

<div class="row formlabel_sf" id="autorDiv">
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.comunicacaoparecer.pesquisa.areaOrigem" />">
  		<fmt:message key="ipdms.comunicacaoparecer.pesquisa.areaOrigem" /> 
  	</div>
  	
  	<div class="label" style="width: 31%;" title="<fmt:message key="ipdms.comunicacaoparecer.pesquisa.areaOrigem" />">
  		<html:select  property="params(organicaOrigem)" style="width: 94%;">
			<option value="" />
			<html:options collection="listOrganicas" property="id" labelProperty="designacao" />
		</html:select>
  	</div>
  	
	<div class="leftTab label" title="<fmt:message key="ipdms.comunicacaoparecer.pesquisa.autor" />" style="width: 13%;"> 
		<fmt:message key="ipdms.comunicacaoparecer.pesquisa.autor" />
	</div>
	<div class="label" style="width: 4%;">
		<a href="#" onclick="showOrganicaColaboradoresMultiple();"><img class="cursorMao" title="<fmt:message key="ipdms.forms.pesquisar" /> <fmt:message key="ipdms.comunicacaoparecer.pesquisa.autor" />" alt="<fmt:message key="ipdms.forms.pesquisar" /> <fmt:message key="ipdms.comunicacaoparecer.pesquisa.autor" />" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png"/></a>
	</div>
	<div class="label" title="<fmt:message key="ipdms.comunicacaoparecer.pesquisa.autor" />" style="width: 30%;">
		<input type="hidden" name="idAutores" id="idAutores"/>	
					<div class="label" id="autores"></div>
	</div>
	<div style="clear:both"></div>
</div>	


<div class="row formlabel_sf">
	<div class="leftTab label" title="<fmt:message key="ipdms.comunicacaoparecer.pesquisa.dataInicio" />" style="width: 17%;"> <fmt:message key="ipdms.comunicacaoparecer.pesquisa.dataInicio" /> </div>
	<div class="label" title="<fmt:message key="ipdms.comunicacaoparecer.pesquisa.dataInicio" />" style="width: 16%;">
  		<html:text styleId="dataInicio" property="params(dataInicio)" size="10" maxlength="10" styleClass="date" onkeypress="return false;"
							onfocus="Calendar.setup({ inputField : this.id, ifFormat : '%d-%m-%Y', showsTime : false });"/>						
	</div>

	<div class="leftTab label" title="<fmt:message key="ipdms.comunicacaoparecer.pesquisa.dataFim" />" style="width: 10%;"> <fmt:message key="ipdms.comunicacaoparecer.pesquisa.dataFim" /> </div>
	<div class="label" title="<fmt:message key="ipdms.comunicacaoparecer.pesquisa.dataFim" />" style="width: 45%;">
			<html:text styleId="dataFim" property="params(dataFim)" size="10" maxlength="10" styleClass="date" onkeypress="return false;"
							onfocus="Calendar.setup({ inputField : this.id, ifFormat : '%d-%m-%Y', showsTime : false });"/>
	</div>
</div>
	<div style="clear:both"></div>

<div class="row formlabel_sf" >
		<div class="leftTabButton label" style="width: 10%;" title="">
			<input type="submit" name="search" title="<fmt:message key="ipdms.forms.pesquisar" />" value="<fmt:message key="ipdms.forms.pesquisar" />" class="btForm"/>
		</div>
		<div style="clear:both"></div>
	</div>
<br />

<script>
showAutorDiv('${searchComunicacoesPareceres.map.params['tipoComunic']}');
</script>

<script>
	var actionUrl = "${pageContext.request.contextPath}/procuraComunicPareceres.do2";
	
	showComunicParecerDetail = function(id) {
		var p = 'id=' + id;
		new Ajax.Updater( {success: 'resumoComunicParecerDiv'}, actionUrl + '?method=detail', 
				   		  {method: 'get', parameters: p, evalScripts: true} );
	}
</script>
</html:form>
