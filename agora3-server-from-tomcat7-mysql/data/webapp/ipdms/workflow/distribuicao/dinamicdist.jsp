<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.organica.designacaoplural" var="organicaDes" />
<fmt:message key="ipdms.colaborador.designacaoplural" var="colaboradorDes" />
<fmt:message key="ipdms.grupo.designacaoplural" var="grupoDes" />
<fmt:message key="ipdms.funcao.designacaoplural" var="funcaoDes" />
<fmt:message key="ipdms.estruturaorganica" var="selectEstruturaorganica" />
<fmt:message key="ipdms.seleccionados" var="seleccionados" />
<fmt:message key="ipdms.colaboradores" var="selectColaboradores" />
<fmt:message key="ipdms.grupos" var="selectGrupos" />
<fmt:message key="ipdms.funcoes" var="selectFuncoes" />
<fmt:message key="ipdms.forms.submit" var="submit" />
<fmt:message key="ipdms.forms.submit.title" var="submitTitle" />
<fmt:message key="ipdms.forms.cancelar" var="cancelar" />
<fmt:message key="ipdms.forms.cancelar.title" var="cancelarTitle" />
<fmt:message key="ipdms.etapa.cancelarPopupTitle" var="cancelarPopupTitle" />
<fmt:message key="ipdms.etapa.cancelarPopupMsg" var="cancelarPopupMsg" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />

<c:set var="THEMES_DIR"
	value="${pageContext.request.contextPath}/ipdms/themes" />
<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />

<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/column-tree.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/CustomToolbar.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/ColumnNodeUI.css" />
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ColumnNodeUI.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ConfirmCancel.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/Window_Iframe.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/IPDMSTreePanel.js"></script>

<script  type="text/javascript">

	//funcao chamada pelo handler da messagebox do ext para executor as funcoes de acordo com o botao seleccionado
	function decisao(btn) {
		if (btn == 'yes') {
			$('condition').setAttribute("name",
					"org.apache.struts.taglib.html.CANCEL");
			$('condition').setAttribute("value", "Cancelar");
			document.forms[0].submit();
		} else {
			return false;
		}

	}
	
	// add info related to darConhecimento to parameters
	function addDarConhecimentoParams(value, desc){
		
		var params = ""
		if(${etapaActual.darConhecimento}){
			params += "&darConhecimento=${etapaActual.darConhecimento}";
			params += "&valuePlaceOlderDConhec=" + value;
			params += "&descPlaceOlderDConhec=" + desc;
		}
		
		return params;
		
	}
	
	function showOrganicaMultiple(version) {
		var action = "${pageContext.request.contextPath}/ajaxListOrganica.do2";
		paramts = "valuePlaceOlder=idOrganicas" + version;
		paramts += "&descPlaceOlder=organicas" + version;
		paramts += "&window=winchoose&multiple=true";
		paramts += addDarConhecimentoParams('idOrganicasConhecimento', 'organicasConhecimento');		
				
		winOrg = ExtWindow('${organicaDes}', action, paramts, 'ext');
		
	}

	function showOrganicaColaboradoresMultiple(version) {
		var action = "${pageContext.request.contextPath}/ajaxListOrganicaWithColaboradores.do2";
		paramts = "valuePlaceOlder=idColaboradores" + version;
		paramts += "&descPlaceOlder=colaboradores" + version;
		paramts += "&window=winchoose&multiple=true";
		paramts += addDarConhecimentoParams('idColaboradoresConhecimento', 'colaboradoresConhecimento');		
		
		winCol = ExtWindow('${colaboradorDes}', action, paramts, 'ext');
		
	}

	function showGruposMultiple(version) {
		var action = "${pageContext.request.contextPath}/ajaxListGrupos.do2";
		paramts = "valuePlaceOlder=idGrupos" + version;
		paramts += "&descPlaceOlder=grupos" + version;
		paramts += "&window=winchoose&multiple=true";
		paramts += addDarConhecimentoParams('idGruposConhecimento', 'gruposConhecimento');	

		winGrp = ExtWindow('${grupoDes}', action, paramts, 'ext');
		
	}

	function showOrganicaFuncoesMultiple(version) {
		var action = "${pageContext.request.contextPath}/ajaxListOrganicaWithFuncoes.do2";
		paramts = "valuePlaceOlder=idFuncoes" + version;
		paramts += "&descPlaceOlder=funcoes" + version;
		paramts += "&window=winchoose&multiple=true";
		paramts += addDarConhecimentoParams('idFuncoesConhecimento', 'funcoesConhecimento');	

		winFunc = ExtWindow('${funcaoDes}', action, paramts, 'ext');
		
	}
	
	//////////////////////////////////////////////////
	//	Ajax request that find all users by name	//
	//////////////////////////////////////////////////
	function showColaboradorByName(version) {
		
		var action = "${pageContext.request.contextPath}/listColaboradoresByName.do2";
		action += "?valuePlaceOlder=idColaboradoresDN";
		action += "&descPlaceOlder=colaboradoresDN";
		action += "&window=winchoose";
		action += "&sign=true";
		action += addDarConhecimentoParams('idColaboradoresDNConhecimento', 'colaboradoresDNConhecimento');	
		
		winFunc = ExtWindowSizeParam('${colaboradorDes}', action, '', 'html', 800, 550);
		
	}
	
</script>


<bean:define id="mapping" name="<%= org.apache.struts.Globals.MAPPING_KEY %>" />
<bean:define id="formpath" name="mapping" property="path" />
<html:form action="<%=formpath.toString()%>">
	<html:hidden property="method" value="distribuirDinamicamente" />
	<html:hidden property="nid" />
	<html:hidden property="processType" />
	<html:hidden property="processId" />
	<html:hidden property="activityName" />
	<input type="hidden" name="servicoO" value='${servicoO}'/> <%-- Notificao Simples --%>
	<input type="hidden" name="soIds" value='${soIds}'/> <%-- Multiplas notificacoes --%>

	<div id='distribuicao' style="width: 50%; float: left">			

		<logic:present name="etapa">
		<script type="text/javascript">	
			document.title = '${productName} - <bean:write name="etapa" property="titulo" />';	 
		</script>
		<div class="row" style="padding-top:0px; text-align:left;">
			<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
				<tbody>
				  <tr>
				    <td class="titulo1"><bean:write name="etapa" property="titulo" /></td>
				  </tr>
				</tbody>
			</table>					
		</div>
		</logic:present>
		<html:errors />
	
		<c:if test="${etapa.distribuivel}">
				<div class="row formlabel_sf">
					<div class="leftTab label" style="width: 18%; " title="${selectEstruturaorganica}">
				  	${selectEstruturaorganica}
				  	</div>
				  	
				  	<div class="label" style="width: 5%;" title="${selectEstruturaorganica}">
				  		<img class="cursorMao" alt="${selectEstruturaorganica}" title="${selectEstruturaorganica}" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" 
							onclick="showOrganicaMultiple('');"/>
				  	</div>
				  	
				  	<div class="label" style="width: 74%;" title="${seleccionados}">
				  		<span class="textoAzul">${seleccionados}</span> 
				  		<div class="listaCinzenta" style="width: 70%;" id="organicas"></div>
						<html:hidden property="idOrganicas" styleId="idOrganicas" /><br /><br />
				  	</div>
				</div>
				
				<div class="row formlabel_sf">
					<div class="leftTab label" style="width: 18%; " title="${selectColaboradores}">
				  	${selectColaboradores}
				  	</div>
				  	
				  	<div class="label" style="width: 5%;" title="${selectColaboradores}">
				  		<img class="cursorMao" alt="${selectColaboradores}" title="${selectColaboradores}" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" 
							onclick="showOrganicaColaboradoresMultiple('');"/>
				  	</div>
				  	
				  	<div class="label" style="width: 74%;" title="${seleccionados}">
				  		<span class="textoAzul">${seleccionados}</span> 
				  		<div class="listaCinzenta" style="width: 70%;" id="colaboradores"></div>
						<html:hidden property="idColaboradores" styleId="idColaboradores" /><br /><br />
				  	</div>
				</div>
				
				<div class="row formlabel_sf">
					<div class="leftTab label" style="width: 18%; " title="${selectGrupos}">
				  	${selectGrupos}
				  	</div>
				  	
				  	<div class="label" style="width: 5%;" title="${selectGrupos}">
				  		<img class="cursorMao" alt="${selectGrupos}" title="${selectGrupos}" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" 
							onclick="showGruposMultiple('');"/>
				  	</div>
				  	
				  	<div class="label" style="width: 74%;" title="${seleccionados}">
				  		<span class="textoAzul">${seleccionados}</span> 
				  		<div class="listaCinzenta" style="width: 70%;" id="grupos"></div>
						<html:hidden property="idGrupos" styleId="idGrupos" /><br /><br />
				  	</div>
				</div>
				
				<div class="row formlabel_sf">
					<div class="leftTab label" style="width: 18%; " title="${selectFuncoes}">
				  	${selectFuncoes}
				  	</div>
				  	
				  	<div class="label" style="width: 5%;" title="${selectFuncoes}">
				  		<img class="cursorMao" alt="${selectFuncoes}" title="${selectFuncoes}" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" 
							onclick="showOrganicaFuncoesMultiple('');"/>
				  	</div>
				  	
				  	<div class="label" style="width: 74%;" title="${seleccionados}">
				  		<span class="textoAzul">${seleccionados}</span> 
				  		<div class="listaCinzenta" style="width: 70%;" id="funcoes"></div>
						<html:hidden property="idFuncoes" styleId="idFuncoes" /><br /><br />
				  	</div>
				</div>
				
				<div class="row formlabel_sf">
					<div class="leftTab label" style="width: 18%; " title="<fmt:message key='ipdms.tramitacao.distribuicao.nome'/>">
				  		<fmt:message key="ipdms.tramitacao.distribuicao.nome"/>
				  	</div>
				  	
				  	<div class="label" style="width: 5%;" title="${selectColaboradores}">
				  		<img class="cursorMao" alt="${selectColaboradores}" title="${selectColaboradores}" 
				  			src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" 
							onclick="showColaboradorByName('');" />
				  	</div>
				  	
				  	<div class="label" style="width: 74%;" title="${seleccionados}">
				  		<span class="textoAzul">${seleccionados}</span> 
				  		<div class="listaCinzenta" style="width: 70%;" id="colaboradoresDN"></div>
						<html:hidden property="idColaboradoresDN" styleId="idColaboradoresDN" /><br /><br />
				  	</div>
				</div>
				
		</c:if>
	</div>	
	<%-- If etapaActual.darConhecimento is active --%>
	<c:if test="${etapaActual.darConhecimento}">
		<div style="width: 50%; float: left">
			<jsp:include page="darconhecimentodist.jsp"></jsp:include>
		</div>	
	</c:if>
	<c:if test="${!etapaActual.darConhecimento}">
		<script type="text/javascript">
			$('distribuicao').setStyle({width: '100%'});
		</script>
	</c:if>
	
	&nbsp;&nbsp;&nbsp;
	<br/>
	<br/>
	
	<div class="row formlabel_sf">
		<html:submit value="${submit}" styleClass="btForm" title="${submitTitle}" />
		<input id="condition" type="hidden" class="cancel"/>
		<input type="button" value="${cancelar}" class="btFormEscuro" onclick="cancelar(event,'${cancelarPopupTitle}','${cancelarPopupMsg}',decisao,'${sim}','${nao}')" title="${cancelarTitle}"/>
	</div>
</html:form>