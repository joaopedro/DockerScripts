<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />

<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/column-tree.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/CustomToolbar.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/ColumnNodeUI.css" />

<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ConfirmCancel.js"></script>
<script type="text/javascript" src='${JS_DIR}/collectionUtils.js'></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ColumnNodeUI.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/IPDMSTreePanel.js"></script>
<script type="text/javascript" src="${JS_DIR}/jquery/jquery-1.7.2.js"></script>
<script type="text/javascript" src='${JS_DIR}/addRemoveItems.js'></script>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.modules.processinstance.atencao" var="atencao" />
<fmt:message key="ipdms.tramitacao.distribuicao.colaborador.empty" var="colaboradorEmpty" />
<fmt:message key="ipdms.organica.designacaoplural" var="organicaDes" />
<fmt:message key="ipdms.colaborador.designacaoplural" var="colaboradorDes" />
<fmt:message key="ipdms.grupo.designacaoplural" var="grupoDes" />
<fmt:message key="ipdms.funcao.designacaoplural" var="funcaoDes" />
<fmt:message key="ipdms.organica.designacaosingular" var="organicaDesigSingular" />
<fmt:message key="ipdms.grupo.designacaosingular" var="grupoDesigSingular" />
<fmt:message key="ipdms.funcao.designacaosingular" var="funcaoDesigSingular" />
<fmt:message key="ipdms.distribuicao.nome.designacaosingular" var="nomeDesigSingular" />
<fmt:message key="ipdms.distribuicao.nome.filtrar" var="pesquisarpor" />
<fmt:message key="ipdms.forms.pesquisar" var="pesquisar" />
<fmt:message key="ipdms.loading" var="loading" />
<fmt:message key="ipdms.forms.submit" var="submit" />
<fmt:message key="ipdms.forms.submit.title" var="submitTitle" />
<fmt:message key="ipdms.forms.cancelar" var="cancelar" />
<fmt:message key="ipdms.forms.cancelar.title" var="cancelarTitle" />
<fmt:message key="ipdms.etapa.cancelarPopupTitle" var="cancelarPopupTitle" />
<fmt:message key="ipdms.etapa.cancelarPopupMsg" var="cancelarPopupMsg" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />
<fmt:message key="ipdms.etapa.comboText" var="defaultComboText" />


<script  type="text/javascript">

	// to use another javascript alongside jQuery
    jQuery.noConflict();

	//funcao chamada pelo handler da messagebox do ext para executor as funcoes de acordo com o botao seleccionado
	function decisao(btn) {
		if (btn == 'yes') {
			$('condition').setAttribute("name", "org.apache.struts.taglib.html.CANCEL");
			$('condition').setAttribute("value", "Cancelar");
			document.forms[0].submit();
		} else {
			return false;
		}

	}
	
	
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
    	params += "&isPopup=" + 'false';
    	params += "&sign=true";
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
		
	//////////////////////////////////
	//		Submit the form			//
	//////////////////////////////////
	function submeter(event){
		
		//submit only if are users selected for assign
		//see collectionUtils.js
		if(!collectionIsEmpty(selectedIds)){	
			var value = '';
			for (var key in selectedIds) {
				if(key != ''){
					 value += key + ';';					
				}
			}
						
			//set the value into the hidden field
			jQuery('#colaboradores').val(value.substring(0, value.length - 1));
			return true;
		} else {
			Ext.MessageBox.alert('${atencao}', '${colaboradorEmpty}');
			return false;
		}
			
	}

	function updateLabel(elem){
    	var selectedIdx = elem.selectedIndex;
    	var value = elem.options[selectedIdx].text;
    	jQuery('#searchLabelDiv').text(value);
    }
	

</script>


<script  type="text/javascript">

	function showOrganicaMultiple(version) {
		var action = "${pageContext.request.contextPath}/ajaxListOrganica.do2";
		paramts = "valuePlaceOlder=idOrganicas" + version;
		paramts += "&descPlaceOlder=organicas" + version;
		paramts += "&window=winchoose&multiple=true";

		winOrg = ExtWindow('${organicaDes}', action, paramts, 'ext');
		
	}

	function showOrganicaColaboradoresMultiple(version) {
		var action = "${pageContext.request.contextPath}/ajaxListOrganicaWithColaboradores.do2";
		paramts = "valuePlaceOlder=idColaboradores" + version;
		paramts += "&descPlaceOlder=colaboradores" + version;
		paramts += "&window=winchoose&multiple=true";

		winCol = ExtWindow('${colaboradorDes}', action, paramts, 'ext');
		
	}

	function showGruposMultiple(version) {
		var action = "${pageContext.request.contextPath}/ajaxListGrupos.do2";
		paramts = "valuePlaceOlder=idGrupos" + version;
		paramts += "&descPlaceOlder=grupos" + version;
		paramts += "&window=winchoose&multiple=true";

		winGrp = ExtWindow('${grupoDes}', action, paramts, 'ext');
		
	}

	function showOrganicaFuncoesMultiple(version) {
		var action = "${pageContext.request.contextPath}/ajaxListOrganicaWithFuncoes.do2";
		paramts = "valuePlaceOlder=idFuncoes" + version;
		paramts += "&descPlaceOlder=funcoes" + version;
		paramts += "&window=winchoose&multiple=true";

		winFunc = ExtWindow('${funcaoDes}', action, paramts, 'ext');
		
	}
		
</script>



<bean:define id="mapping" name="<%= org.apache.struts.Globals.MAPPING_KEY %>" />
<bean:define id="formpath" name="mapping" property="path" />

<html:form action="<%=formpath.toString()%>" onsubmit="return submeter(event);">
	<html:hidden property="method" value="distribuirNome" />
	<html:hidden property="nid" />
	<html:hidden property="processType" />
	<html:hidden property="processId" />
	<html:hidden property="activityName" />	
	<input type="hidden" name="servicoO" value='${servicoO}'/> <%-- Notificao Simples --%>
	<input type="hidden" name="soIds" value='${soIds}'/> <%-- Multiplas notificacoes --%>
	<input type="hidden" id="colaboradores" name="colaboradores" value=''/>

	<%-- If etapa is distribuivel --%>
	<div id='distribuicao' style="width: 98%; float: left">

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
						
			<div class="row" style="padding-top:0px; text-align:left;">
				<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
					<tbody>
						<tr>
							<td class="titulo2"><fmt:message key="ipdms.tramitacao.distribuicao.mensagem" /></td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</logic:present>
		
		<html:errors />
	
		<logic:present name="etapa">
	
			<c:if test="${etapa.distribuivel}">

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


				<div class="row formlabel_sf" >

                    <div id="searchLabelDiv" class="leftTab label" style="width: 15%;" title="${nomeDesigSingular}">${nomeDesigSingular}</div>
    			  	<div class="label" style="width: 80%;" >
				  		<input type="text" id="filterValueDiv" maxlength="1000" size="30">
				  		<input type="button" class="btForm" name="search" value="${pesquisar}" title="${pesquisar}" 
							onclick="listColaboradoresDynamic('result',$('filterDiv').value, $('filterValueDiv').value);"/>
				  	</div>
				</div>


                <div class="row formlabel_sf">

                    <div id="result" class="row formlabel_sf" style="margin-top: 15px; margin-bottom:15px; visibility: hidden;">
                    	<span class='formfield' style="margin-left: 16%;">
                        	<img src="${JS_DIR}/ext/resources/images/default/grid/loading.gif" style="width:16px; height:16px; vertical-align:top;"
                    	        alt="${loading}" title="${loading}" />
                        	    <fmt:message key="ipdms.ajax.colaboradores.msg"/>
                    	</span>
                    </div>

                    <div id="assignados" class="leftTab label" style="width: 25%; margin-top: 2px; display: none;">
                        <fieldset id="assignados-fs" style="margin-top: 15px; margin-left: 0; width: 85%; padding:10px; " >
                    	    <legend><fmt:message key="ipdms.tramitacao.distribuicao.colaboradoresassignados" /></legend>
                    	</fieldset>
                    </div>

                    <div id="darconhec" class="leftTab label" style="width: 25%; margin-top: 2px; display: none;">
                        <fieldset id="darconhec-fs" style="margin-top: 15px; margin-left: 0; width: 85%; padding:10px; " >
                    	    <legend><fmt:message key="ipdms.tramitacao.distribuicao.colaboradoresdarconhecimento" /></legend>
                    	</fieldset>
                    </div>

                </div>

				
			</c:if>	
		
		</logic:present>
	
	</div>
	
	
	<%-- If etapaActual.darConhecimento is active --%>
	<c:if test="${etapaActual.darConhecimento}">
		<div style="width: 99%; float: left">
			<jsp:include page="darconhecimentodist.jsp" />
		</div>	
	</c:if>
	
	
	<div class="buttonRow">
		<html:submit value="${submit}" styleClass="btForm" title="${submitTitle}"/>
		<input id="condition" type="hidden" class="cancel"/>
		<input type="button" value="${cancelar}" class="btFormEscuro" onclick="cancelar(event,'${cancelarPopupTitle}','${cancelarPopupMsg}',decisao,'${sim}','${nao}')" title="${cancelarTitle}"/>
	</div>
</html:form>