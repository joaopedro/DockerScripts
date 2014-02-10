<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.myprocesses.darconhecimento" var="title" />
<fmt:message key="ipdms.organica.designacaoplural" var="organicas" />
<fmt:message key="ipdms.colaborador.designacaoplural" var="colaboradores" />
<fmt:message key="ipdms.grupo.designacaoplural" var="grupos" />
<fmt:message key="ipdms.funcao.designacaoplural" var="funcoes" />
<fmt:message key="ipdms.forms.submit.title" var="submitTitle" />

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />

<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/column-tree.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/CustomToolbar.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/ColumnNodeUI.css" />
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ColumnNodeUI.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/IPDMSTreePanel.js"></script>


<script  type="text/javascript">

	function showOrganicaMultiple(version) {
		var action = "${pageContext.request.contextPath}/ajaxListOrganica.do2";
		paramts = "valuePlaceOlder=idOrganicas" + version;
		paramts += "&descPlaceOlder=organicas" + version;
		paramts += "&window=winchoose&multiple=true";

		winOrg = ExtWindow('${organicas}', action, paramts, 'ext');		
	}

	function showOrganicaColaboradoresMultiple(version) {
		var action = "${pageContext.request.contextPath}/ajaxListOrganicaWithColaboradores.do2";
		paramts = "valuePlaceOlder=idColaboradores" + version;
		paramts += "&descPlaceOlder=colaboradores" + version;
		paramts += "&window=winchoose&multiple=true";

		winCol = ExtWindow('${colaboradores}', action, paramts, 'ext');		
	}

	function showGruposMultiple(version) {
		var action = "${pageContext.request.contextPath}/ajaxListGrupos.do2";
		paramts = "valuePlaceOlder=idGrupos" + version;
		paramts += "&descPlaceOlder=grupos" + version;
		paramts += "&window=winchoose&multiple=true";

		winGrp = ExtWindow('${grupos}', action, paramts, 'ext');		
	}

	function showOrganicaFuncoesMultiple(version) {
		var action = "${pageContext.request.contextPath}/ajaxListOrganicaWithFuncoes.do2";
		paramts = "valuePlaceOlder=idFuncoes" + version;
		paramts += "&descPlaceOlder=funcoes" + version;
		paramts += "&window=winchoose&multiple=true";

		winFunc = ExtWindow('${funcoes}', action, paramts, 'ext');		
	}
	
</script>

<script type="text/javascript">	
	document.title = '${productName} - ${title}';
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

<html:form  action="darconhecimento.do2">

	<html:hidden property="method" value="darConhecimento" />
	<html:hidden property="id" value="${id}" />
	<html:hidden property="urlAnterior" value="${urlAnterior}" />
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.estruturaorganica' />"><fmt:message key="ipdms.estruturaorganica" /></div>
			  	
		<div class="label" style="width: 5%;">
			<img class="cursorMao" alt="Escolher Estrutura Hierarquica" title="<fmt:message key='ipdms.estruturaorganica' />" 
				src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" onclick="showOrganicaMultiple('Conhecimento');"/>
		</div>
			  	
		<div class="label" style="width: 74%;" >
			<span class="textoAzul" title="<fmt:message key='ipdms.seleccionados' />" ><fmt:message key="ipdms.seleccionados" /></span> 
			<div class="listaCinzenta" style="width: 70%;" id="organicasConhecimento"></div>
				<input type="hidden" name="idOrganicasConhecimento" id="idOrganicasConhecimento"/>
		</div>
	</div>

	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.colaboradores' />" ><fmt:message key="ipdms.colaboradores" /></div>
			  	
		<div class="label" style="width: 5%;">
			<img class="cursorMao" alt="<fmt:message key='ipdms.colaboradores' />" title="<fmt:message key='ipdms.colaboradores' />" 
				src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" 	onclick="showOrganicaColaboradoresMultiple('Conhecimento');"/>
		</div>
			  	
		<div class="label" style="width: 74%;">
			<span class="textoAzul" title="<fmt:message key='ipdms.seleccionados' />" ><fmt:message key="ipdms.seleccionados" /></span> 
			<div class="listaCinzenta" style="width: 70%;" id="colaboradoresConhecimento"></div>
			<input type="hidden" name="idColaboradoresConhecimento" id="idColaboradoresConhecimento"/><br /><br />
		</div>
	</div>

	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.grupos' />" ><fmt:message key="ipdms.grupos" /></div>
		
		<div class="label" style="width: 5%;">
			<img class="cursorMao" alt="<fmt:message key='ipdms.grupos' />" title="<fmt:message key='ipdms.grupos' />" 
				src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" onclick="showGruposMultiple('Conhecimento');"/>
		</div>
			  	
		<div class="label" style="width: 74%;">
			<span class="textoAzul" title="<fmt:message key='ipdms.seleccionados' />" ><fmt:message key="ipdms.seleccionados" /></span> 
			<div class="listaCinzenta" style="width: 70%;" id="gruposConhecimento"></div>
			<input type="hidden" name="idGruposConhecimento" id="idGruposConhecimento"/><br /><br />
		</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.funcoes' />" ><fmt:message key="ipdms.funcoes" /></div>
			  	
		<div class="label" style="width: 5%;">
			<img class="cursorMao" alt="<fmt:message key='ipdms.funcoes' />" title="<fmt:message key='ipdms.funcoes' />" 
				src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" onclick="showOrganicaFuncoesMultiple('Conhecimento');"/>
		</div>
			  	
		<div class="label" style="width: 74%;">
			<span class="textoAzul" title="<fmt:message key='ipdms.seleccionados' />" ><fmt:message key="ipdms.seleccionados" /></span> 
			<div class="listaCinzenta" style="width: 70%;" id="funcoesConhecimento"></div>
			<input type="hidden" name="idFuncoesConhecimento" id="idFuncoesConhecimento"/><br /><br />
		</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.myprocesses.darconhecimento.observacoes' />" ><fmt:message key="ipdms.myprocesses.darconhecimento.observacoes" /></div>
		
		<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.myprocesses.darconhecimento.observacoes' />">
			<textarea rows="2" name="observacoesConhecimento" ></textarea>
		</div>		  	
	</div>			
			
	
	<div class="row formlabel_sf" >
		<div class="buttonRow">						
			<html:submit styleClass="btForm" title="submitTitle" ><fmt:message key="ipdms.forms.submit" /></html:submit>
			<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.anterior" />" title="<fmt:message key='ipdms.forms.anterior.title' />"
				onclick="setActionAndSubmit(this.form, '${urlAnterior}');">	
		</div>
	</div>
	
</html:form>


