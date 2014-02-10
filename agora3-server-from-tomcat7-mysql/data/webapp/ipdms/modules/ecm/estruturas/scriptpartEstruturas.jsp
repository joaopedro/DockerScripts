<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="sort" value="${param.sort}" />
<c:set var="dir" value="${param.dir}" />

<fmt:message key="ecm.conteudos.designacaosingular" var="conteudosDesSingular" bundle="${ecmBundle}" />
<fmt:message key="ecm.conteudos.designacaoplural" var="conteudosDesPlural" bundle="${ecmBundle}" />
<fmt:message key="ecm.conteudos.remover.emptyMsg" var="removerMsg" bundle="${ecmBundle}" />
<fmt:message key="ecm.conteudos.remover.confirmMsg" var="confirmMsg" bundle="${ecmBundle}" />
<fmt:message key="ipdms.sim" var="sim" bundle="${ecmBundle}" />
<fmt:message key="ipdms.nao" var="nao" bundle="${ecmBundle}" />
<fmt:message key="errors.title" var="errorsTitle" bundle="${ecmBundle}" />
<fmt:message key="errors.msg" var="errorsMsg" bundle="${ecmBundle}" />
<fmt:message key="ipdms.loading" var="loading" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.criar" var="criar" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.pesquisar" var="pesquisar" bundle="${ecmBundle}" />
<fmt:message key="ecm.estrutura.designacaosingular" var="estruturaDesSingular" bundle="${ecmBundle}" />
<fmt:message key="ecm.estrutura.designacaoplural" var="estruturaDesPlural" bundle="${ecmBundle}" />
<fmt:message key="ecm.estrutura.estado.publicado.confirmMsg" var="publicarConfirmMsg" bundle="${ecmBundle}" />
<fmt:message key="ecm.estrutura.estado.expirado.confirmMsg" var="inactivarConfirmMsg" bundle="${ecmBundle}" />
<fmt:message key="ecm.estrutura.estado.expirado.warnMsg" var="expiradoWarnMsg" bundle="${ecmBundle}" />

<script>
	var CONTEXT_PATH = '${pageContext.request.contextPath}';
</script>

<script type="text/javascript" src='${pageContext.request.contextPath}/ipdms/modules/ecm/ecm.js'></script>

<script type="text/javascript">
	var editFormDivId = '${viewName}EditFormDiv';
	var searchFormDivId = '${viewName}SearchFormDiv';
	var listDivId = '${viewName}ListDiv';
	
	var fmtMessages = new Array();
	fmtMessages["errorsTitle"] = "${errorsTitle}";
	fmtMessages["errorsMsg"] = "${errorsMsg}";
	fmtMessages["loading"] = "${loading}";
	
	function hideAll() {
		$(editFormDivId).hide();
		$(searchFormDivId).hide();
	}
	
	function searchEstruturas() {
		hideAll();
		$(searchFormDivId).show();
	}
	
	function cancelSearch() {
		hideAll();
		$('${viewName}SearchForm').reset();
	}	
	
	function cancelEdit() {
		hideAll();
	}
	
	function createEstrutura() {
		hideAll();
		callAjaxRequest('${moduleAction}', 'method=edit', editFormDivId, fmtMessages);
		$(editFormDivId).show();
	}
	
	function createConteudo(index){
		var p  = '';
		if(index) {
			p = 'conteudo_index=' + index;
		}
		new Ajax.Updater( {success: 'divCreateConteudo'}, 'createConteudo.do2?method=edit', {method: 'get', parameters: p, evalScripts:true} );
		
		jQuery("#divCreateConteudo").dialog({
			title: '${criar} ${conteudosDesSingular}',
			autoOpen: false,
			width: 800,
			modal: true,
			resizable: false,
			dialogClass: 'ecm-form'
		});

		jQuery("#divCreateConteudo").dialog("open");
	}
	
	function saveConteudo(){
		submitDiv('divCreateConteudo', 'createConteudo.do2?method=save', 'errorDivConteudo', true);
	}
	
	function cancelConteudo(){
		jQuery("#divCreateConteudo").dialog("close");
	}
	
	function updateDivListConteudos() {
		new Ajax.Updater( {success: 'divListConteudos'}, 'createConteudo.do2?method=list', {method: 'get', evalScripts: true} );
	}
	
	function removeConteudos(index) {
		var vals='';
		var i;
		var j=0;
		for(i=0;i<index.length;i++){
			if(index[i].checked){
				vals+=index[i].value +',';
				j++;
			}
		}

		if(vals==''){
			jQuery("<div title='${conteudosDesPlural}' >${removerMsg}</div>").dialog({
				modal: true,
				resizable: false,
				dialogClass: 'ecm-dialog',
				buttons: {
					Ok: function() {
						jQuery(this).dialog("close");
					}
				}
			});
		}
		else{
			jQuery("<div title='${conteudosDesPlural}' >${confirmMsg}</div>").dialog({
				modal: true,
				resizable: false,
				dialogClass: 'ecm-dialog',
				buttons: {
					"${nao}": function() {
						jQuery(this).dialog("close");
					},
					"${sim}": function() {
						new Ajax.Updater( {success: 'divListConteudos'}, 'createConteudo.do2?method=remove', {method: 'get', parameters: 'conteudos_index='+vals, evalScripts: true} );
						jQuery(this).dialog("close");
					}
		        }
			});
		}
	}
	
	function save(formName) {
		var p = $(formName).serialize();		
		callAjaxRequest('saveEstrutura.do2', 'method=save&'+ p, editFormDivId, fmtMessages);
	}
	
	function setStatus(descricaoEstrutura, codigoEstado){
		if(codigoEstado != 3){
			var confirmMsg = "";
			if(codigoEstado == 1){
				confirmMsg = '${publicarConfirmMsg}';
			}
			else if(codigoEstado == 2){
				confirmMsg = '${inactivarConfirmMsg}';
			}
			
			jQuery("<div title='${estruturaDesPlural}' >" + confirmMsg + "</div>").dialog({
				modal: true,
				resizable: false,
				dialogClass: 'ecm-dialog',
				buttons: {
					"${nao}": function() {
						jQuery(this).dialog("close");
					},
					"${sim}": function() {
						callAjaxRequest('setEstruturaStatus.do2', 'method=status&descricaoEstrutura=' + descricaoEstrutura + '&codigoEstado=' + codigoEstado, null, fmtMessages);
						jQuery(this).dialog("close");
					}
		        }
			});
		}
		else {
			jQuery("<div title='${estruturaDesPlural}' >${expiradoWarnMsg}</div>").dialog({
				modal: true,
				resizable: false,
				dialogClass: 'ecm-dialog',
				buttons: {
					Ok: function() {
						jQuery(this).dialog("close");
					}
		        }
			});
		}
	}
	
	var createEstruturaBtn = document.getElementById("createBtn");
	createEstruturaBtn.value = "${criar} ${estruturaDesSingular}";
	createEstruturaBtn.title = "${criar} ${estruturaDesSingular}";
	createEstruturaBtn.onclick = function(){createEstrutura();};
	
	var searchEstruturaBtn = document.getElementById("searchBtn");	
	searchEstruturaBtn.value="${pesquisar} ${estruturaDesPlural}";
	searchEstruturaBtn.title = "${pesquisar} ${estruturaDesPlural}";	
	searchEstruturaBtn.onclick = function(){searchEstruturas();};

	listEstruturas = function(pageNumber) {
		var form = $('${viewName}SearchForm');
		var p = Form.serialize(form);
		
		callAjaxRequest('listEstruturas.do2', 'page='+pageNumber+'&sort=${sort}&dir=${dir}&'+p, listDivId, fmtMessages);
	};
	
	listEstruturas();
</script>