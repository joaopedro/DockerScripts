<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<fmt:message key="ipdms.instrucao.pedido.info.title" var="atencao" />
<fmt:message key="ipdms.tramitacao.distribuicao.colaborador.empty" var="colaboradorEmpty" />
<fmt:message key="ipdms.organica.designacaosingular" var="organicaDesigSingular" />
<fmt:message key="ipdms.grupo.designacaosingular" var="grupoDesigSingular" />
<fmt:message key="ipdms.funcao.designacaosingular" var="funcaoDesigSingular" />
<fmt:message key="ipdms.distribuicao.nome.designacaosingular" var="nomeDesigSingular" />
<fmt:message key="ipdms.distribuicao.nome.filtrar" var="pesquisarpor" />
<fmt:message key="ipdms.etapa.comboText" var="defaultComboText" />


<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/ipdms/themes" />
<link type=text/css rel=stylesheet href='${THEMES_DIR}/forms.css' />
<link type=text/css rel=stylesheet  href='${THEMES_DIR}/estilos.css' />

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<script type="text/javascript" src='${JS_DIR}/prototype.js'></script>
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/ext-all.css" />
<script type="text/javascript" src="${JS_DIR}/ext/ext-base.js"></script>
<script type="text/javascript" src='${JS_DIR}/ext/ext-all.js'></script>
<script type="text/javascript" src="${JS_DIR}/jquery/jquery-1.7.2.js"></script>
<script type="text/javascript" src='${JS_DIR}/addRemoveItems.js'></script>
<script type="text/javascript" src='${JS_DIR}/collectionUtils.js'></script>

<%-- Ajax tags --%>
<script type="text/javascript" src='${JS_DIR}/scriptaculous.js'></script>
<script type="text/javascript" src='${JS_DIR}/ajax/ajaxtags.js'></script>
<script type="text/javascript" src='${JS_DIR}/ajax/ajaxtags_controls.js'></script>

<script type="text/javascript" src='${JS_DIR}/utils.js'></script>

<script  type="text/javascript">

    // to use another javascript alongside jQuery
    jQuery.noConflict();
	
	///////////////////////////////////////////////////
    //	Ajax request that find all users dynamically //
    ///////////////////////////////////////////////////
    function listColaboradoresDynamic(div, filter, value) {

    	var filterBy = '';
    	if(filter == '1'){
    		filterBy = 'ORGANICA';
    	} else if(filter == '2'){
    		filterBy = 'GRUPO';
    	} else if(filter == '3'){
    		filterBy = 'FUNCAO';
    	}

    	var action = "${pageContext.request.contextPath}/ajaxListColaboradoresDynamic.do2";
    	var params = "filterBy=" + filterBy;
    	params += "&searchBy=" + value;
    	params += "&isPopup=" + 'true';
    	params += "&darConhecimento=${param.darConhecimento}";
    	params += "&sign=${param.sign}";
    	var url = action + '?' + params;

    	jQuery('#' + div).css('visibility','visible');
    	jQuery.ajax({
    		url: url,
    		}).done(function(response) {
    			jQuery('#' + div).html(response);
    		}).fail(function(response, textStatus){
    			console.log('Server side Error : ' + textStatus);
    		});

    }
	
	
	//	Submit the form
	function submeter(){
		
		//submit only if are users selected for assign
		//see collectionUtils.js
		if(!collectionIsEmpty(selectedIds)){	
			var value = '';
			var description = '';
			for (var key in selectedIds) {
				if(key != ''){
					 value += key + ';';
					 description += selectedIds[key] + ';';
				}
			}
				
			value = value.substring(0, value.length - 1);	
			affectParentValues('${param.valuePlaceOlder}', '${param.descPlaceOlder}', value, description);			
		} 
		
		if(!collectionIsEmpty(selectedIdsDarConhecimento)){
			var value = '';
			var description = '';
			for (var key in selectedIdsDarConhecimento) {
				if(key != ''){
					 value += key + ';';
					 description += selectedIdsDarConhecimento[key] + ';';
				}
			}
				
			value = value.substring(0, value.length - 1);
			
			var valuePlace = '${param.valuePlaceOlderDConhec}';
			var descPlace = '${param.descPlaceOlderDConhec}';
			if(valuePlace == '' && descPlace == ''){
				valuePlace = '${param.valuePlaceOlder}';
				descPlace = '${param.descPlaceOlder}';
			}
			
			affectParentValues(valuePlace, descPlace, value, description);
		}
		
		if(collectionIsEmpty(selectedIds) && collectionIsEmpty(selectedIdsDarConhecimento)){
			Ext.MessageBox.alert('${atencao}', '${colaboradorEmpty}');
		}
		
		//close window
		closeWindow(false);
			
	}	
		
	function affectParentValues(valueElement, descElement, value, description){
		
		//set element value
		var elementValue = parent.document.getElementById(valueElement);
		elementValue.value = value;
		
		//set and format element description
		var elementDescription = parent.document.getElementById(descElement);
		elementDescription.innerHTML = description;
		elementDescription.innerHTML = '>' + elementDescription.innerHTML.gsub(';', '<br /> >');
		elementDescription.innerHTML = elementDescription.innerHTML.substring(0, elementDescription.innerHTML.lastIndexOf("&gt;") - 1);	
		
	}
	
	function closeWindow(clean){
				
		if(clean){
			if(parent.document.getElementById('${param.valuePlaceOlder}') != null){
				parent.document.getElementById('${param.valuePlaceOlder}').value = '';
			}
			if(parent.document.getElementById('${param.descPlaceOlder}') != null){
				parent.document.getElementById('${param.descPlaceOlder}').innerHTML = '';
			}
			if(parent.document.getElementById('${param.valuePlaceOlderDConhec}') != null){
				parent.document.getElementById('${param.valuePlaceOlderDConhec}').value = '';
			}
			if(parent.document.getElementById('${param.descPlaceOlderDConhec}') != null){
				parent.document.getElementById('${param.descPlaceOlderDConhec}').innerHTML = '';
			}
			
		}
		
		parent.${param.window}.close();
	}
	
	function enterEvent(event) {
		var keycode = findKeyCode(event);
		if(keycode == 13){
			listColaboradoresByName('result',$('colaboradorName').value);
		}		
	}

	function updateLabel(elem){
    	var selectedIdx = elem.selectedIndex;
    	var value = elem.options[selectedIdx].text;
    	jQuery('#searchLabelDiv').text(value);
    }
	
	
</script>


<body style="overflow:auto;">

	<div class="row" style="width:100%; text-align:left;">
		<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
			<tbody>
				<tr><td class="titulo2"><fmt:message key="ipdms.tramitacao.distribuicao.mensagem" /></td></tr>
			</tbody>
		</table>
	</div>	
	
	<form action="listColaboradoresByName.do2" onsubmit="return false;" onkeypress="enterEvent(event);">				
		<div class="row formlabel_sf" style="margin-top: 10px;">

            <div class="row formlabel_sf" >
                <div class="leftTab label" style="width: 15%;" title="${pesquisarpor}">${pesquisarpor}</div>
            	<div class="label" style="width: 80%;" >
            	    <select id="filterDiv" onchange="updateLabel(this)">
            		    <option value="0">${defaultComboText}</option>
            			<option value="1">${organicaDesigSingular}</option>
            			<option value="2">${grupoDesigSingular}</option>
            			<option value="3">${funcaoDesigSingular}</option>
            			<option value="4" selected="selected">${nomeDesigSingular}</option>
            		</select>
            	</div>
            </div>

			<div id="searchLabelDiv" class="leftTab label" style="width: 15%;" title="${nomeDesigSingular}">${nomeDesigSingular}</div>
						  	
			<div class="label" style="width: 80%;">
				<input type="text" id="filterValueDiv" maxlength="1000" size="30" title="<fmt:message key='ipdms.tramitacao.distribuicao.nome' />">
				<input type="button" class="btForm" name="search" value="<fmt:message key='ipdms.forms.pesquisar' />" title="<fmt:message key='ipdms.forms.pesquisar' />" 
						onclick="listColaboradoresDynamic('result',$('filterDiv').value, $('filterValueDiv').value);"/>
			</div>			
		
		</div>
	</form>


    <div class="row formlabel_sf">

        <div class="row formlabel_sf">
            <div id="result" class="row formlabel_sf" style="padding-left: 5px; margin-top: 15px; margin-bottom:15px; visibility: hidden;">
        	    <span class='formfield' style="margin-left: 16%;">
        		    <img src="${JS_DIR}/ext/resources/images/default/grid/loading.gif" style="width:16px; height:16px; vertical-align:top;" alt="<fmt:message key='ipdms.loading' />" title="<fmt:message key='ipdms.loading' />" />
        			   	<fmt:message key="ipdms.ajax.colaboradores.msg"/>
        		</span>
        	</div>
       	</div>

        <div class="leftTab label" style="width: 25%; margin-top: 2px;">
            <div id="assignados" style="display: none;">
        	    <fieldset id="assignados-fs" style="margin-top: 15px; margin-left: 0; width: 85%; padding:10px; " >
        		    <legend><fmt:message key="ipdms.tramitacao.distribuicao.colaboradoresassignados" /></legend>
        		</fieldset>
        	</div>

        	<div id="darconhec" style="display: none;">
        		<fieldset id="darconhec-fs" style="margin-top: 15px; margin-left: 0; width: 85%; padding:10px; " >
        			<legend><fmt:message key="ipdms.tramitacao.distribuicao.colaboradoresdarconhecimento" /></legend>
        		</fieldset>
        	</div>
        </div>

    </div>

	<div class="row formlabel_sf" style="padding-left: 5px;">
		<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.submit"/>" onclick="submeter();" title="<fmt:message key="ipdms.forms.submit.title"/>" />
		<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.fechar" />" onclick="closeWindow(false);" title="<fmt:message key="ipdms.forms.fechar.title" />" />		
	</div>

</body>







