<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.myprocesses.darconhecimento" var="title" />
<fmt:message key="ipdms.organica.designacaoplural" var="organicas" />
<fmt:message key="ipdms.colaborador.designacaoplural" var="colaboradores" />
<fmt:message key="ipdms.grupo.designacaoplural" var="grupos" />
<fmt:message key="ipdms.funcao.designacaoplural" var="funcoes" />

<script type="text/javascript">	
	document.title = '${productName} - ${title}';
</script>

<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/ipdms/themes" />
<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />

<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/column-tree.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/CustomToolbar.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/ColumnNodeUI.css" />
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ColumnNodeUI.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ConfirmCancel.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/Window_Iframe.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/IPDMSTreePanel.js"></script>


<script  type="text/javascript">

	function showOrganicaDarConhecimento(version) {
		var action = "${pageContext.request.contextPath}/ajaxListOrganica.do2";
		paramts = "valuePlaceOlder=idOrganicas" + version;
		paramts += "&descPlaceOlder=organicas" + version;
		paramts += "&window=winchoose&multiple=true";

		winOrg = ExtWindow('${organicas}', action, paramts, 'ext');		
	}

	function showOrganicaColaboradoresDarConhecimento(version) {
		var action = "${pageContext.request.contextPath}/ajaxListOrganicaWithColaboradores.do2";
		paramts = "valuePlaceOlder=idColaboradores" + version;
		paramts += "&descPlaceOlder=colaboradores" + version;
		paramts += "&window=winchoose&multiple=true";

		winCol = ExtWindow('${colaboradores}', action, paramts, 'ext');		
	}

	function showGruposDarConhecimento(version) {
		var action = "${pageContext.request.contextPath}/ajaxListGrupos.do2";
		paramts = "valuePlaceOlder=idGrupos" + version;
		paramts += "&descPlaceOlder=grupos" + version;
		paramts += "&window=winchoose&multiple=true";

		winGrp = ExtWindow('${grupos}', action, paramts, 'ext');		
	}

	function showOrganicaFuncoesDarConhecimento(version) {
		var action = "${pageContext.request.contextPath}/ajaxListOrganicaWithFuncoes.do2";
		paramts = "valuePlaceOlder=idFuncoes" + version;
		paramts += "&descPlaceOlder=funcoes" + version;
		paramts += "&window=winchoose&multiple=true";

		winFunc = ExtWindow('${funcoes}', action, paramts, 'ext');		
	}
	
	function showColaboradorByNameDarConhecimento(version) {
		
		var action = "${pageContext.request.contextPath}/listColaboradoresByName.do2";
		action += "?valuePlaceOlder=idColaboradoresDN" + version;
		action += "&descPlaceOlder=colaboradoresDN" + version;
		action += "&window=winchoose";		
		action += "&sign=false";
		action += "&darConhecimento=true";
		
		winFunc = ExtWindowSizeParam('${colaboradores}', action, '', 'html', 800, 550);
		
	}
	
</script>

<div class="row" style="padding-top:0px; text-align:left;">
	<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${title}</td>
		  </tr>
		</tbody>
	</table>					
</div>

<c:choose>
	<c:when test="${etapaActual.darConhecimento}">

		<div class="row formlabel_sf">
			<div class="leftTab label" style="width: 18%; " title="<fmt:message key='ipdms.estruturaorganica' />">
		  		<fmt:message key="ipdms.estruturaorganica" />
		  	</div>
		  	
		  	<div class="label" style="width: 5%;" title="<fmt:message key='ipdms.estruturaorganica' />">
		  		<img class="cursorMao" alt="<fmt:message key='ipdms.estruturaorganica' />" title="<fmt:message key='ipdms.estruturaorganica' />" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" 
					onclick="showOrganicaDarConhecimento('Conhecimento');"/>
		  	</div>
		  	
		  	<div class="label" style="width: 74%;">
		  		<span class="textoAzul" title="<fmt:message key='ipdms.seleccionados' />" ><fmt:message key="ipdms.seleccionados" /></span> 
		  		<div class="listaCinzenta" style="width: 70%;" id="organicasConhecimento"></div>
				<input type="hidden" name="idOrganicasConhecimento" id="idOrganicasConhecimento"/><br /><br />
		  	</div>
		</div>
		
		<div class="row formlabel_sf">
			<div class="leftTab label" style="width: 18%; " title="<fmt:message key='ipdms.colaboradores' />">
		  		<fmt:message key="ipdms.colaboradores" />
		  	</div>
		  	
		  	<div class="label" style="width: 5%;" title="<fmt:message key='ipdms.colaboradores' />">
		  		<img class="cursorMao" alt="<fmt:message key='ipdms.colaboradores' />" title="<fmt:message key='ipdms.colaboradores' />" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" 
					onclick="showOrganicaColaboradoresDarConhecimento('Conhecimento');"/>
		  	</div>
		  	
		  	<div class="label" style="width: 74%;">
		  		<span class="textoAzul" title="<fmt:message key='ipdms.seleccionados' />" ><fmt:message key="ipdms.seleccionados" /></span> 
		  		<div class="listaCinzenta" style="width: 70%;" id="colaboradoresConhecimento"></div>
				<input type="hidden" name="idColaboradoresConhecimento" id="idColaboradoresConhecimento"/><br /><br />
		  	</div>
		</div>
		
		<div class="row formlabel_sf">
			<div class="leftTab label" style="width: 18%; " title="<fmt:message key='ipdms.grupos' />">
		  		<fmt:message key="ipdms.grupos" />
		  	</div>
		  	
		  	<div class="label" style="width: 5%;" title="<fmt:message key='ipdms.grupos' />">
		  		<img class="cursorMao" alt="<fmt:message key='ipdms.grupos' />" title="<fmt:message key='ipdms.grupos' />" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" 
					onclick="showGruposDarConhecimento('Conhecimento');"/>
		  	</div>
		  	
		  	<div class="label" style="width: 74%;">
		  		<span class="textoAzul" title="<fmt:message key='ipdms.seleccionados' />" ><fmt:message key="ipdms.seleccionados" /></span> 
		  		<div class="listaCinzenta" style="width: 70%;" id="gruposConhecimento"></div>
				<input type="hidden" name="idGruposConhecimento" id="idGruposConhecimento"/><br /><br />
		  	</div>
		</div>
		
		<div class="row formlabel_sf">
			<div class="leftTab label" style="width: 18%; " title="<fmt:message key='ipdms.funcoes' />">
		  		<fmt:message  key="ipdms.funcoes" />
		  	</div>
		  	
		  	<div class="label" style="width: 5%;" title="<fmt:message key='ipdms.funcoes' />">
		  		<img class="cursorMao" alt="<fmt:message key='ipdms.funcoes' />" title="<fmt:message key='ipdms.funcoes' />" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" 
					onclick="showOrganicaFuncoesDarConhecimento('Conhecimento');"/>
		  	</div>
		  	
		  	<div class="label" style="width: 74%;">
		  		<span class="textoAzul" title="<fmt:message key='ipdms.seleccionados' />" ><fmt:message key="ipdms.seleccionados" /></span> 
		  		<div class="listaCinzenta" style="width: 70%;" id="funcoesConhecimento"></div>
				<input type="hidden" name="idFuncoesConhecimento" id="idFuncoesConhecimento"/><br /><br />
		  	</div>
		</div>
		
		<div class="row formlabel_sf">
			<div class="leftTab label" style="width: 18%; " title="<fmt:message  key='ipdms.nome' />" >
		  		<fmt:message  key="ipdms.nome" />
		  	</div>
		  	
		  	<div class="label" style="width: 5%;" title="<fmt:message  key='ipdms.nome' />">
		  		<img class="cursorMao" alt="<fmt:message  key='ipdms.nome' />" title="<fmt:message  key='ipdms.nome' />" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" 
					onclick="showColaboradorByNameDarConhecimento('Conhecimento');"/>
		  	</div>
		  	
		  	<div class="label" style="width: 74%;">
		  		<span class="textoAzul" title="<fmt:message key='ipdms.seleccionados' />" ><fmt:message key="ipdms.seleccionados" /></span> 
		  		<div class="listaCinzenta" style="width: 70%;" id="colaboradoresDNConhecimento"></div>
				<input type="hidden" name="idColaboradoresDNConhecimento" id="idColaboradoresDNConhecimento"/>
				<br /><br />
		  	</div>
		</div>
		
		<div class="row formlabel_sf">
			<div class="leftTab label" style="width: 18%; " title="<fmt:message key='ipdms.observacoes' />">
		  		<fmt:message key="ipdms.observacoes" />
		  	</div> 	
		  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.observacoes' />">
		  		<textarea rows="2" name="observacoesConhecimento" ></textarea>
		  	</div>
		  	
		</div>
		<br/><br/>
		
	</c:when>
	<c:otherwise>
		<div class="info"><fmt:message key="ipdms.tramitacao.distribuicao.darconhecimento.sempermissao" /></div>
	</c:otherwise>
</c:choose>