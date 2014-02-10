<%@ taglib prefix="html" uri="/tags/html"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"%>
<%@ taglib prefix="nested" uri="http://struts.apache.org/tags-nested"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />

<SCRIPT src='${pageContext.request.contextPath}/ipdms/js/swf-ajax-ext.js' type="text/javascript"></script>

<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/ext-ux-slidezone.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/column-tree.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/CustomToolbar.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/ColumnNodeUI.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/GroupHeaderPlugin.css" />
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ConfirmCancel.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ColumnNodeUI.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/Window_Iframe.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/IPDMSTreePanel.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/Ext.ux.SliderTip.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/Ext.ux.SlideZone.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/slideAreaExample.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/GroupHeaderPlugin.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/GroupHeaderExtras.js"></script>	


<script type="text/javascript">

function decisao(btn){
	if(btn=='yes'){
		ajaxSubmitReferer(evento,'${referer}');
		 }
	else{
		return false;
	    }

}	

	
	editMoradaPopup = function(idPlaceHolder,cp4PlaceHolder,cp3PlaceHolder,cp4OutroPlaceHolder,
			cp3OutroPlaceHolder,localidadePlaceHolder,localidadeOutroPlaceHolder,moradaPlaceHolder,
			moradaOutroPlaceHolder,lotePlaceHolder,
			idProvinciaPlaceHolder,idMunicipioPlaceHolder,idComunaPlaceHolder,
			idLocalidadePlaceHolder,outraLocalidadePlaceHolder,domicilioPlaceHolder){

		Ext.onReady(function(){		

		action = "moradaPopupLocaleAware.do2"; 
		action += "?method=edit&id="+$('moradaInput').value;

		action += "&idPlaceHolder="+idPlaceHolder;
		
		action += "&cp4PlaceHolder="+cp4PlaceHolder;
		action += "&cp3PlaceHolder="+cp3PlaceHolder;
		action += "&cp4OutroPlaceHolder="+cp4OutroPlaceHolder;
		action += "&cp3OutroPlaceHolder="+cp3OutroPlaceHolder;
		action += "&localidadePlaceHolder="+localidadePlaceHolder;
		action += "&localidadeOutroPlaceHolder="+localidadeOutroPlaceHolder;
		action += "&moradaPlaceHolder="+moradaPlaceHolder;
		action += "&moradaOutroPlaceHolder="+moradaOutroPlaceHolder;
		action += "&lotePlaceHolder="+lotePlaceHolder;

		action += "&idProvinciaPlaceHolder="+idProvinciaPlaceHolder;
		action += "&idMunicipioPlaceHolder="+idMunicipioPlaceHolder;
		action += "&idComunaPlaceHolder="+idComunaPlaceHolder;
		action += "&idLocalidadePlaceHolder="+idLocalidadePlaceHolder;
		action += "&outraLocalidadePlaceHolder="+outraLocalidadePlaceHolder;
		action += "&domicilioPlaceHolder="+domicilioPlaceHolder;
		action += "&window=winchoose"
	
			ExtWindow('Moradas',action,'','html');
		});
	}
	
	function showEntidadesPopup(){
		var action = "${pageContext.request.contextPath}/listEntidadePopup.do2?method=showPopup";
		action += "&idEntidade=ecra1.entidadeId";
		action += "&idMorada=id_morada";
		action += "&idContacto=id_contacto";
		action += "&nomeEntidade=entidade_nome";
		action += "&nifEntidade=entidade_nif";
		action += "&nomeContacto=contacto_nome";
		action += "&localidadeMorada=localidade_morada";
		action += "&morada=morada";
		action += "&tipoEntidade=1";
		action += "&window=winchoose";
		
		ExtWindow('Entidades',action,'','html');
	}

	function showEntidadesSimplePopup(){
		var action = "${pageContext.request.contextPath}/listEntidadeSimplePopup.do2?method=showPopup";
		action += "&idEntidade=ecra1.entidadeId";
		action += "&nomeEntidade=entidade_nome";
		action += "&nifEntidade=entidade_nif";
//		action += "&tipoEntidade=2";
		action += "&window=winchoose";
		ExtWindow('Entidades',action,'','html');
	}
	
	function showOrganica(){
		var action = "${pageContext.request.contextPath}/ajaxListOrganica.do2";
		paramts = "valuePlaceOlder=organica.parent";
		paramts += "&descPlaceOlder=organicaDesc";
		paramts += "&window=winchoose";
		
		ExtWindow('Orgânica',action,paramts,'ext');
	}
	
	function showOrganicaMultiple(){
		var action = "${pageContext.request.contextPath}/ajaxListOrganica.do2";
		paramts =  "valuePlaceOlder=organica.parent";
		paramts += "&descPlaceOlder=organicaDesc";
		paramts += "&selectedids=" + $F('organica.parent');
		paramts += "&window=winchoose&multiple=true";
		
		ExtWindow('Orgânicas',action,paramts,'ext');
	}
	
	
	function showOrganicaColaboradores(){
		var action = "${pageContext.request.contextPath}/ajaxListOrganicaWithColaboradores.do2";
		paramts = "valuePlaceOlder=owner"; //organica.parent
		paramts += "&descPlaceOlder=organicaDesc";
		paramts += "&window=winchoose";
		
		ExtWindow('Colaborador',action,paramts,'ext');
	}

	function showOrganicaColaboradoresMultiple(){
		var action = "${pageContext.request.contextPath}/ajaxListOrganicaWithColaboradores.do2";
		paramts  = "valuePlaceOlder=organica.parent";
		paramts += "&descPlaceOlder=organicaDesc";
		paramts += "&selectedids=" + $F('organica.parent');
		paramts += "&window=winchoose&multiple=true";
		
		ExtWindow('Multiplos Colaboradores',action,paramts,'ext');
	}

	function showGruposMultiple() {
		var action = "${pageContext.request.contextPath}/ajaxGridColumnGroup.do2";
		paramts = "valuePlaceOlder=organica.parent";
		paramts += "&descPlaceOlder=organicaDesc" ;
		paramts += "&window=winchoose&multiple=true";

		ExtWindow('Grupos', action, paramts, 'ext');
	}

	function postFunction(){
		alert('this is a post select action');
	}	
	
//funcoes para testar popups distrito concelho freguesia
	function showDistritosPopup(){
		var action = "${pageContext.request.contextPath}/listDistritosPopup.do2";
		action += "?valuePlaceHolder=distritoValuePlaceHolder";
		action += "&descPlaceHolder=distritoDescriptionPlaceHolder";
		action += "&window=winchoose";
		
		ExtWindow('Distritos',action,'','html');
	}
	
	function showConcelhosPopup(){
		var action = "${pageContext.request.contextPath}/listConcelhosPopup.do2";
		action += "?valuePlaceHolder=concelhoValuePlaceHolder";
		action += "&descPlaceHolder=concelhoDescriptionPlaceHolder";
		action += "&window=winchoose";

		//filtrar por distrito
		distritoElement = document.getElementById('distritoValuePlaceHolder');
		if(distritoElement && distritoElement.value && (distritoElement.value.length>0))
				action += "&dd=" + distritoElement.value;
		
		ExtWindow('Concelhos',action,'','html');
	}
	
	function showFreguesiasPopup(){
		var action = "${pageContext.request.contextPath}/listFreguesiasPopup.do2";
		action += "?valuePlaceHolder=freguesiaValuePlaceHolder";
		action += "&descPlaceHolder=freguesiaDescriptionPlaceHolder";
		action += "&window=winchoose";

		//filtrar por distrito
		distritoElement = document.getElementById('distritoValuePlaceHolder');
		if(distritoElement && distritoElement.value && (distritoElement.value.length>0))
				action += "&dd=" + distritoElement.value;

		//filtrar por concelho
		concelhoElement = document.getElementById('concelhoValuePlaceHolder');
		if(concelhoElement && concelhoElement.value && (concelhoElement.value.length>0))
				action += "&cc=" + concelhoElement.value;

		
		ExtWindow('Freguesias',action,'','html');
	}
	
//funcoes para testar popups municipio comuna localidade
	function showMunicipiosPopup(idProvincia){
		var action = "${pageContext.request.contextPath}/listMunicipiosPopup.do2";
		action += "?valuePlaceHolder=municipioValuePlaceHolder";
		action += "&descPlaceHolder=municipioDescriptionPlaceHolder";
		action += "&window=winchoose";
		if(idProvincia) {
			action += "&idProvincia=" + idProvincia;
		}
		ExtWindow('Municipios',action,'','html');
	}
	
	function showComunasPopup(){
		var action = "${pageContext.request.contextPath}/listComunasPopup.do2";
		action += "?valuePlaceHolder=comunaValuePlaceHolder";
		action += "&descPlaceHolder=comunaDescriptionPlaceHolder";
		action += "&window=winchoose";

		//filtrar por municipio
		municipioElement = document.getElementById('municipioValuePlaceHolder');
		if(municipioElement && municipioElement.value && (municipioElement.value.length>0))
				action += "&idMunicipio=" + municipioElement.value;
		
		ExtWindow('Comunas',action,'','html');
	}
	
	function showLocalidadesPopup(){
		var action = "${pageContext.request.contextPath}/listLocalidadesPopup.do2";
		action += "?valuePlaceHolder=localidadeValuePlaceHolder";
		action += "&descPlaceHolder=localidadeDescriptionPlaceHolder";
		action += "&window=winchoose";

		//filtrar por comuna
		comunaElement = document.getElementById('comunaValuePlaceHolder');
		if(comunaElement && comunaElement.value && (comunaElement.value.length>0))
				action += "&idComuna=" + comunaElement.value;
		
		ExtWindow('Localidades',action,'','html');
	}

    function groupTabTest(){
    	var action = "${pageContext.request.contextPath}/grouptabing.do2";
		ExtWindow('Grouping Tabs',action,'','html');

        }
        
    function checkTreeDragtest(){
    	var action="${pageContext.request.contextPath}/checkTreeDragnDrop.do2";

		ExtWindow('Ext tab Test',action,'','html');
        }
    
    showDimensoesPopup = function(){
		var action = "${pageContext.request.contextPath}/popupDimensao.do2";
		action += "?valuePlaceHolder=dimensaoValue";
		action += "&descPlaceHolder=dimensaoDesc";
		action += "&window=winchoose";
		
		ExtWindow('Dimensões',action,'','html');
	};
       
</script>
<logic:notPresent name="_resumo" scope="request">
<html:form action="applicationFlow" method="post" >
<div id='tree-div'></div>
<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">
	<html:errors/>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="Título">
	  		<span class="textoBold">Formulario de teste:</span>
	  	</div>
	  	
	  	<div class="label" style="width: 80%;" title="Título">
	  		
	  	</div>
	</div>
	<div style="clear:both"></div><br />
	<fieldset>
		<legend>Dados do requerente</legend>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%;">
		  		<a href="#" onclick="showEntidadesPopup();" class="texto" id="entidades" title="Teste Entidade Popup">Teste Entidade Popup</a>
		  	</div>
		  	<div class="leftTab label" style="width: 17%;">
		  		<a href="#" onclick="showEntidadesSimplePopup();" class="texto" id="entidades" title="Entidade Simple Popup">Entidade Simple Popup</a>
		  	</div>
			<div class="leftTab label" style="width: 17%;">
		  		<a href="#" onclick="showAnexarDocumentosPopup(27101);" class="texto" id="anexarDoc" title="Anexar Documento Popup">Anexar Documento Popup</a>
		  	</div>
		</div>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="Nome Entidade">
		  		<label for="entidade_nome">Nome Entidade</label>
		  	</div>

		  	<div class="label" style="width: 80%;" title="Nome Entidade">
		  		<input type="text" id="entidade_nome" value="" size="40"/>
		  	</div>
		</div>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="Numero Fiscal Entidade">
		  		<label for="entidade_nif">Numero Fiscal Entidade</label>
		  	</div>
		  	
		  	<div class="label" style="width: 80%;" title="Numero Fiscal Entidade">
		  		<input type="text" id="entidade_nif" value="" />
		  	</div>
		</div>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%;" title="Parametrizar Atributos">
		  		<label for="entidadeId">Ids</label>
		  	</div>
		  	
		  	<div class="label" style="width: 17%; " title="Parametrizar Atributos">
		  		<html:text property="ecra1.entidadeId" styleId="entidadeId"/>
		  	</div>
		
			<div class="label" style="width: 17%;" title="Parametrizar Atributos">
		  		<input type="text" id="id_contacto" value="" />
		  	</div>
		  	
		  	<div class="label" style="width: 47%;" title="Parametrizar Atributos">
		  		<input type="text" id="id_contacto" value="" />
		  	</div>
		
		</div>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="Nome Contacto">
		  		<label for="contacto_nome">Nome Contacto</label>
		  	</div>
		  	
		  	<div class="label" style="width: 80%;" title="Nome Contacto">
		  		<input type="text" id="contacto_nome" value="" size="80"/>
		  	</div>
		</div>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="Localidade Morada">
		  		<label for="localidade_morada">Localidade Morada</label>
		  	</div>
		  	
		  	<div class="label" style="width: 80%;" title="Localidade Morada">
		  		<input type="text" id="localidade_morada" value="" size="80"/>
		  	</div>
		</div>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="Morada">
		  		<label for="morada">Morada</label>
		  	</div>
		  	
		  	<div class="label" style="width: 80%;" title="Morada">
		  		<input type="text" id="morada" value="" size="80"/>
		  	</div>
		</div>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="Papel da Entidade">
		  		<label for="roleId">Papel da Entidade</label>
		  	</div>
		  	
		  	<div class="label" style="width: 80%;" title="Papel da Entidade">
		  		<html:select property="ecra1.roleId" styleId="roleId">
					<html:optionsCollection property="roles" value="value" label="title"/>
				</html:select>
		  	</div>
		</div>		
		<!-- assunto -->
		<%--
		--%>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="Assunto">
		  		<label for="assunto">Assunto</label>
		  	</div>
		  	
		  	<div class="label" style="width: 80%;" title="Assunto">
		  		<html:text property="assunto" styleId="assunto" errorStyleClass="webflow_erro" size="80" maxlength="250" />
		  	</div>
		</div>
	</fieldset>
	<fieldset>
		<legend>Orgânica</legend>
			<div class="row formlabel_sf" >
				<div class="leftTab label" style="width: 17%; " title="Owner">
			  		<label for="owner">Owner</label>
			  	</div>
			  	
			  	<div class="label" style="width: 80%;" title="Owner">
			  		<input name="owner" id="owner"/>
			  	</div>
			</div>
			<div class="row formlabel_sf" >
				<div class="leftTab label" style="width: 15%;">
			  		<a href="#" onclick="showOrganica();" class="texto" id="org" title="Orgânica PopUp">Orgânica PopUp</a>
			  	</div>
			  	
			  	<div class="label" style="width: 15%;">
			  		<a href="#" onclick="showOrganicaMultiple();" class="texto" id="orgMulti" title="Orgânica PopUp Multiple">Orgânica PopUp Multiple</a>
			  	</div>
			  	
			  	<div class="label" style="width: 20%;">
			  		<a href="#" onclick="showOrganicaColaboradores();" class="texto" id="orgCol" title="Orgânica Colaboradores PopUp">Orgânica Colaboradores PopUp</a><br />
			  		<a href="#" onclick="showDistritosPopup();" class="texto" id="distritos" title="Distritos PopUp">Distritos PopUp</a>
			  	</div>
			  	
			  	<div class="label" style="width: 48%;">
			  		<a href="#" onclick="showOrganicaColaboradoresMultiple();" class="texto" id="orgColMulti" title="Orgânica Colaboradores PopUp Multiple">Organica Colaboradores PopUp Multiple</a><br />
			  		<a href="#" onclick="showGruposMultiple();" class="texto" id="orgColMulti" title="Grupos com agrupamento colunas">Grupos com agrupamento colunas</a><br />
			  		<a href="#" onclick="groupTabTest();" class="texto" id="grupoTabs" title="Grupos de tabs">Grupos de tabs</a><br />
			  		<a href="#" onclick="checkTreeDragtest();" class="texto" id="checkTree">CheckedTreePanelDragnDrop</a><br />
			  		<a href="#" onclick="showAreaSlider();" class="texto" id="checkTree">slideZone Areas</a>
			  	</div>
			</div>
			<div style="clear:both"></div>
			<div class="row formlabel_sf" >
				<div class="leftTab label" style="width: 17%; " title="Orgânica Escolhida">
			  		<label for="organica.parent">Orgânica Escolhida</label>
			  	</div>
			  	
			  	<div class="label" style="width: 80%;" title="Orgânica Escolhida">
			  		<input type="hidden" name="organica.parent" id="organica.parent" value="${organicaFormBean.organica.parent.id}">
					<div id="organicaDesc"> ${organicaFormBean.organica.parent.designacao}</div>
			  	</div>
			</div>
	</fieldset>

	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="Exemplo Data">
	  		<label for="data1">Exemplo Data</label>
	  	</div>
	  	
	  	<div class="label" style="width: 80%;" title="Exemplo Data">
	  		<input type="text" id="data1" name="data1" size="10" maxlength="10" class="date" onkeypress="return false;">			
            <script type='text/javascript'>
            	Calendar.setup({ inputField : 'data1', ifFormat : '%d-%m-%Y', showsTime : false });
            </script>
	  	</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="Descrição do Ecrã 1 *">
	  		<label for="ecra1.descricao">Descrição do Ecrã 1 *</label>
	  	</div>
	  	
	  	<div class="label" style="width: 80%;" title="Descrição do Ecrã 1 *">
	  		<html:text property="ecra1.descricao"
				styleId="ecra1.descricao"
				errorStyleClass="webflow_erro"
				size="80" maxlength="250"
				/>
	  	</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="Ajax Combo">
	  		<label for="ajaxCombo">Ajax Combo</label>
	  	</div>

	  	<div class="label" style="width: 80%;" title="Ajax Combo">
	  		<html:select property="ecra1.conteudo" styleId="ajaxCombo"
				onchange="new Ajax.Updater('ajaxdiv', 'ajaxupdatesample.do2', {method: 'get', parameters: 'value='+${'ajaxCombo'}.value});">
				<html:option value="0"></html:option>
			</html:select>
	  	</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="Ajax Div">
	  		Ajax Div:
	  	</div>
	  	
	  	<div class="label" style="width: 80%;" title="Título">
	  		<div id="ajaxdiv"></div>
	  	</div>
	</div>
	<br /><br />
	 
	<div class="buttonRow">
		<html:submit property="_eventId_next" value="Seguinte »" styleClass="btForm" onclick="webflowAjaxRequest(event);" title="Avançar para o ecrã seguinte"/>
		<html:button property="_eventId_cancel" value="Cancelar" styleClass="btFormEscuro" styleId="foo" onclick="cancelar(event,'Pedidos', 'Deseja cancelar pedido ?',decisao);" title="Cancelar a operação"/>
	</div>
		<div style="clear:both"></div><br />
				
		<div id="popupsGeograficas">
			<!-- distritos -->
			<fieldset>
				<legend>Distrito/Ilha</legend>
						<div class="row formlabel_sf" >
							<div class="leftTab label" style="width: 17%;">
						  		<a href="#" onclick="showDistritosPopup();" class="texto" id="distritos" title="Distritos PopUp">Distritos PopUp</a>
						  	</div>
						  	
						  	<div class="label" style="width: 80%;" title="Título" id="treta" title="asdasd">asdasd						  
						  	</div>
						</div>
						<div class="row formlabel_sf" >
							<div class="leftTab label" style="width: 10%; " title="Value">
						  		<label for="distritoValuePlaceHolder">Value</label>
						  	</div>
						  	
						  	<div class="label" style="width: 26%;" title="Value">
						  		<input type="text" id="distritoValuePlaceHolder" name="distritoValuePlaceHolder" />
						  	</div>
						  	
						  	<div class="label" style="width: 10%;" title="Description">
						  		Description: 
						  	</div>
						  	
						  	<div class="label" style="width: 43%;" title="Description">
						  		<div id="distritoDescriptionPlaceHolder"></div>
						  	</div>
						</div>
			</fieldset>
			
			<!-- concelhos -->
			<fieldset>
				<legend>Concelho</legend>
					<div class="row formlabel_sf" >
							<div class="leftTab label" style="width: 17%;">
						  		<a href="#" onclick="showConcelhosPopup();" class="texto" id="concelhos" title="Concelhos PopUp">Concelhos PopUp</a>
						  	</div>
						  	
						  	<div class="label" style="width: 80%;" title="Título">
						  
						  	</div>
						</div>
						<div class="row formlabel_sf" >
							<div class="leftTab label" style="width: 10%; " title="Value">
						  		<label for="concelhoValuePlaceHolder">Value</label>
						  	</div>
						  	
						  	<div class="label" style="width: 26%;" title="Value">
						  		<input
								type="text" 
								id="concelhoValuePlaceHolder" 
								name="concelhoValuePlaceHolder" />
						  	</div>
						  	
						  	<div class="label" style="width: 10%;" title="Description">
						  		Description:
						  	</div>
						  	
						  	<div class="label" style="width: 43%;" title="Description">
						  		<div id="concelhoDescriptionPlaceHolder"></div>
						  	</div>
						</div>
			</fieldset>
			
			<!-- freguesias -->
			<fieldset>
				<legend>Freguesia</legend>
					<div class="row formlabel_sf" >
							<div class="leftTab label" style="width: 17%;">
						  		<a href="#" onclick="showFreguesiasPopup();" class="texto" id="freguesias" title="Freguesias PopUp">Freguesias PopUp</a>
						  	</div>
						  	
						  	<div class="label" style="width: 80%;" title="Título">
						  
						  	</div>
						</div>
						<div class="row formlabel_sf" >
							<div class="leftTab label" style="width: 10%;" title="Value">
						  		<label for="freguesiaValuePlaceHolder">Value</label>
						  	</div>
						  	
						  	<div class="label" style="width: 26%;" title="Value">
						  			<input
								type="text" 
								id="freguesiaValuePlaceHolder" 
								name="freguesiaValuePlaceHolder" />
						  	</div>
						  	
						  	<div class="label" style="width: 10%;" title="Description">
						  		Description:
						  	</div>
						  	
						  	<div class="label" style="width: 43%;" title="Description">
						  		<div id="freguesiaDescriptionPlaceHolder"></div>
						  	</div>
						</div>
			</fieldset>
			
			<!-- municipios -->
			<fieldset>
				<legend>Municipio</legend>
					<div class="row formlabel_sf" >
							<div class="leftTab label" style="width: 17%; " title="Título">
						  		<a href="#" onclick="showMunicipiosPopup();" class="texto">Municipios PopUp</a>
						  	</div>
						  	<div class="leftTab label" style="width: 17%; " title="Título">
						  		<a href="#" onclick="showMunicipiosPopup('P8');" class="texto">Municipios PopUp com filtragem (Luanda Norte)</a>
						  	</div>
						  	<div class="label" style="width: 80%;" title="Título">
						  
						  	</div>
						</div>
						<div class="row formlabel_sf" >
							<div class="leftTab label" style="width: 10%; " title="Título">
						  		<label for="municipioValuePlaceHolder">Value</label>
						  	</div>
						  	
						  	<div class="label" style="width: 26%;" title="Título">
						  			<input
								type="text" 
								id="municipioValuePlaceHolder" 
								name="municipioValuePlaceHolder" />
						  	</div>
						  	
						  	<div class="label" style="width: 10%;" title="Description">
						  		Description:
						  	</div>
						  	
						  	<div class="label" style="width: 43%;" title="Description">
						  		<div id="municipioDescriptionPlaceHolder"></div>
						  	</div>
						</div>
			</fieldset>
			
			<!-- comunas -->
			<fieldset>
				<legend>Comuna</legend>
					<div class="row formlabel_sf" >
							<div class="leftTab label" style="width: 17%;">
						  		<a href="#" onclick="showComunasPopup();" class="texto" title="Comunas PopUp">Comunas PopUp</a>
						  	</div>
						  	
						  	<div class="label" style="width: 80%;" title="Título">
						  
						  	</div>
						</div>
						<div class="row formlabel_sf" >
							<div class="leftTab label" style="width: 10%; " title="Value">
						  		<label for="comunaValuePlaceHolder">Value</label>
						  	</div>
						  	
						  	<div class="label" style="width: 26%;" title="Value">
						  			<input
								type="text" 
								id="comunaValuePlaceHolder" 
								name="comunaValuePlaceHolder" />
						  	</div>
						  	
						  	<div class="label" style="width: 10%;" title="Description">
						  		Description:
						  	</div>
						  	
						  	<div class="label" style="width: 43%;" title="Description">
						  		<div id="comunaDescriptionPlaceHolder"></div>
						  	</div>
						</div>
			</fieldset>
			
			<!-- localidades -->
			<fieldset>
				<legend>Localidade</legend>
					<div class="row formlabel_sf" >
							<div class="leftTab label" style="width: 17%; " title="Título">
						  		<a href="#" onclick="showLocalidadesPopup();" class="texto">Localidades PopUp</a>
						  	</div>
						  	
						  	<div class="label" style="width: 80%;" title="Título">
						  
						  	</div>
						</div>
						<div class="row formlabel_sf" >
							<div class="leftTab label" style="width: 10%; " title="Título">
						  		<label for="localidadeValuePlaceHolder">Value</label>
						  	</div>
						  	
						  	<div class="label" style="width: 26%;" title="Título">
						  			<input
								type="text" 
								id="localidadeValuePlaceHolder" 
								name="localidadeValuePlaceHolder" />
						  	</div>
						  	
						  	<div class="label" style="width: 10%;" title="Título">
						  		Description: 
						  	</div>
						  	
						  	<div class="label" style="width: 43%;" title="Título">
						  		<div id="localidadeDescriptionPlaceHolder"></div>
						  	</div>
						</div>
			</fieldset>
		</div>
	
	<fieldset>
		<legend>Morada Popup</legend>
		<div id="moradaField" class="row formlabel_sf">
			<div class="leftTab label">
				<label for="moradaInput"><a class="texto" href="#" onclick="editMoradaPopup('id','cp4','cp3','cp4Outro','cp3Outro','localidade','localidadeOutro','moradaIpdms','moradaOutro','lote','idProvincia','idMunicipio','idComuna','idLocalidade','outraLocalidade','domicilio');" id="moradas">criar nova morada</a></label>
			</div>
			<div>
				<span class="label">
					<input type="text" id="moradaInput" />
				</span>
			</div>
		</div>
		<hr />
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="id">
		  		<label for="id">Id</label>
		  	</div>
		  	
		  	<div class="label" style="width: 80%;" title="id">
		  		<input type="text" name="id" id="id" />
		  	</div>
		</div>
				
		<div class="row formlabel_sf" >
			<div class="leftTab label textoBold" style="width: 97%; " title="id">
		  		AO
		  	</div>
		</div>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="idProvincia">
		  		<label for="idProvincia">idProvincia</label>
		  	</div>
		  	
		  	<div class="label" style="width: 80%;" title="idProvincia">
		  		<input type="text" name="idProvincia" id="idProvincia" />
		  	</div>
		</div>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="idMunicipio">
		  		<label for="idMunicipio">idMunicipio</label>
		  	</div>
		  	
		  	<div class="label" style="width: 80%;" title="idMunicipio">
		  		<input type="text" name="idMunicipio" id="idMunicipio" />
		  	</div>
		</div>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="idComuna">
		  		<label for="idComuna">idComuna</label>
		  	</div>
		  	
		  	<div class="label" style="width: 80%;" title="idComuna">
		  		<input type="text" name="idComuna" id="idComuna" />
		  	</div>
		</div>		
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="idLocalidade">
		  		<label for="idLocalidade">idLocalidade</label>
		  	</div>
		  	
		  	<div class="label" style="width: 80%;" title="idLocalidade">
		  		<input type="text" name="idLocalidade" id="idLocalidade" />
		  	</div>
		</div>	
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="outraLocalidade">
		  		<label for="outraLocalidade">outraLocalidade</label>
		  	</div>
		  	
		  	<div class="label" style="width: 80%;" title="outraLocalidade">
		  		<input type="text" name="outraLocalidade" id="outraLocalidade" />
		  	</div>
		</div>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="domicilio">
		  		<label for="domicilio">domicilio</label>
		  	</div>
		  	
		  	<div class="label" style="width: 80%;" title="domicilio">
		  		<input type="text" name="domicilio" id="domicilio" />
		  	</div>
		</div>
		<div class="row formlabel_sf" >
			<div class="leftTab label textoBold" style="width: 97%; " title="id">
		  		PT
		  	</div>
		</div>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="cp4">
		  		<label for="cp4">cp4</label>
		  	</div>
		  	
		  	<div class="label" style="width: 80%;" title="cp4">
		  		<input type="text" name="cp4" id="cp4" />
		  	</div>
		</div>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="cp3">
		  		<label for="cp3">cp3</label>
		  	</div>
		  	
		  	<div class="label" style="width: 80%;" title="cp3">
		  		<input type="text" name="cp3" id="cp3" />
		  	</div>
		</div>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="cp4Outro">
		  		<label for="cp4Outro">cp4Outro</label>
		  	</div>
		  	
		  	<div class="label" style="width: 80%;" title="cp4Outro">
		  		<input type="text" name="cp4Outro" id="cp4Outro" />
		  	</div>
		</div>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="cp3Outro">
		  		<label for="cp3Outro">cp3Outro</label>
		  	</div>
		  	
		  	<div class="label" style="width: 80%;" title="cp3Outro">
		  		<input type="text" name="cp3Outro" id="cp3Outro" />
		  	</div>
		</div>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="localidadeOutro">
		  		<label for="localidadeOutro">localidadeOutro</label>
		  	</div>
		  	
		  	<div class="label" style="width: 80%;" title="localidadeOutro">
		  		<input type="text" name="localidadeOutro" id="localidadeOutro" />
		  	</div>
		</div>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="morada">
		  		<label for="morada">morada</label>
		  	</div>
		  	
		  	<div class="label" style="width: 80%;" title="morada">
		  		<input type="text" name="moradaIpdms" id="moradaIpdms" />
		  	</div>
		</div>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="moradaOutro">
		  		<label for="moradaOutro">moradaOutro</label>
		  	</div>
		  	
		  	<div class="label" style="width: 80%;" title="moradaOutro">
		  		<input type="text" name="moradaOutro" id="moradaOutro" />
		  	</div>
		</div>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="lote">
		  		<label for="lote">lote</label>
		  	</div>
		  	
		  	<div class="label" style="width: 80%;" title="lote">
		  		<input type="text" name="lote" id="lote" />
		  	</div>
		</div>
	</fieldset>
		
	<div id="dimensao-div">
		<fieldset>
			<legend><fmt:message key="ipdms.instrucao.teste.ecra1.dimensao"/></legend>
				<div class="row formlabel_sf" >
					<div class="leftTab label" style="width: 17%;">
						<a href="#" onclick="showDimensoesPopup();" class="texto" id="dimensao" title="Dimensão PopUp">
							<fmt:message key="ipdms.instrucao.teste.ecra1.dimensao.popup"/>
						</a>
					</div>						  	
					<div class="label" style="width: 80%;"></div>
				</div>
				<div class="row formlabel_sf" >
					<div class="leftTab label" style="width: 10%; " title="Value">
				  		<label for="dimensaoValue"><fmt:message key="ipdms.instrucao.teste.ecra1.dimensao.valor"/></label>
				  	</div>
						  	
				  	<div class="label" style="width: 26%;" title="Value">
				  		<input type="text" id="dimensaoValue" name="dimensaoValue" />
				  	</div>
					  	
				  	<div class="label" style="width: 10%;" title="Description">
				  		<label for="dimensaoDesc"><fmt:message key="ipdms.instrucao.teste.ecra1.dimensao.descricao"/></label>
				  	</div>
				  	
				  	<div class="label" style="width: 43%;" title="Description">
				  		<div id="dimensaoDesc"></div>
				  	</div>
				</div>
		</fieldset>
	</div>	
		
	<br/>
</html:form>

</logic:notPresent>

<%------------------------ RESUMO ------------------------%>
<logic:present name="_resumo" scope="request">

<div class="row formlabel_sf">
  	<div class="leftTab label textoBold" style="width: 18%;" title="Nome Entidade">
  		Nome Entidade:
  	</div> 
  	<div class="label formtext_sf" style="width: 75%;" title="Nome Entidade">
  		Entidade de teste
	</div>
</div>
<div class="row formlabel_sf">
  	<div class="leftTab label textoBold" style="width: 18%;" title="Numero Fiscal Entidade">
  		Numero Fiscal Entidade:
  	</div>
  		
  	<div class="label formtext_sf" style="width: 75%;" title="Numero Fiscal Entidade">
  		100100112
	</div>
</div>
<div class="row formlabel_sf">
  	<div class="leftTab label textoBold" style="width: 18%;" title="Descrição do Ecrã 1">
  		Descrição do Ecrã 1:
  	</div>
  		
  	<div class="label formtext_sf" style="width: 75%;" title="Descrição do Ecrã 1">
  		${ecra1.descricao}
	</div>
</div>
<div class="row formlabel_sf">
  	<div class="leftTab label textoBold" style="width: 18%;" title="Ajax Combo">
  		Ajax Combo:
  	</div>
  		
  	<div class="label formtext_sf" style="width: 75%;" title="Ajax Combo">
  		${ecra1.conteudo}
	</div>
</div>

<br/>
</logic:present>
