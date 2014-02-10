<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ecm.dados.condicao.designacaoplural" var="condicaoDesPlural" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.condicao.remover.emptyMsg" var="condicaoEmptyMsg" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.condicao.remover.confirmMsg" var="condicaoConfirmMsg" bundle="${ecmBundle}" />
<fmt:message key="ipdms.sim" var="sim" bundle="${ecmBundle}" />
<fmt:message key="ipdms.nao" var="nao" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.importar" var="importar" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.designacaoplural" var="dadosDesPlural" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.edit" var="editDes" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.edit.emptyMsg" var="editEmptyMsg" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.stopEdit" var="stopEdit" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.cancelEdit" var="cancelEdit" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.cancelEdit.confirmMsg" var="cancelConfirmMsg" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.add" var="add" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.delete" var="delete" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.delete.confirmMsg" var="deleteConfirmMsg" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.delete.emptyMsg" var="deleteEmptyMsg" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.save" var="save" bundle="${ecmBundle}" />
<fmt:message key="errors.msg" var="errorMsg" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.save.resultMsg" var="saveResultMsg" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.save.resultMsg.inserts" var="inserts" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.save.resultMsg.updates" var="updates" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.save.resultMsg.deletes" var="deletes" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.export" var="export" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.import.resultMsg" var="importResultMsg" bundle="${ecmBundle}" />
<fmt:message key="errors.title" var="errorsTitle" bundle="${ecmBundle}" />
<fmt:message key="errors.msg" var="errorsMsg" bundle="${ecmBundle}" />
<fmt:message key="ipdms.loading" var="loading" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.pesquisar" var="pesquisar" bundle="${ecmBundle}" />

<div id="hiddenImportErrorDiv" style="display:none;">
	<html:errors/>
</div>

<script>
	var CONTEXT_PATH = '${pageContext.request.contextPath}';
	
	var estruturasArray = new Array();
	var conteudosArray = new Array();
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
	
	function importDados(errorDiv){
		hideAll();
		$(listDivId).hide();
		callAjaxRequest('importDados.do2', 'method=importDados', editFormDivId, fmtMessages);
		
		if(errorDiv == null){
			$(editFormDivId).show();
		}
		else{
			jQuery("#"+editFormDivId).show(400, function() {
			    var importErrorDiv = document.getElementById("importErrorDiv");
			    importErrorDiv.innerHTML = errorDiv.innerHTML;
			    $("importErrorDiv").show();
			});
		}
	}
	
	function cancelImport(){
		hideAll();
	}

	function searchDados() {
		hideAll();
		callAjaxRequest('listDados.do2', 'method=listEstruturas', searchFormDivId, fmtMessages);
		$(searchFormDivId).show();
	}
	
	function cancelSearch() {
		hideAll();
		$('${viewName}SearchForm').reset();
	}
	
	function updateConteudos(selectedValue){
		var codigoEstrutura = estruturasArray[selectedValue];
		var p = "codigoEstrutura=" + codigoEstrutura;
		
		new Ajax.Updater({success: 'conteudosSelectDiv'}, 'listDados.do2?method=listConteudos', {method: 'post', parameters: encodeURI(p), evalScripts: true } );
	}
	
	function createCondicao(index){
		var p  = '';
		if(index) {
			p = 'condicao_index=' + index;
		}
		new Ajax.Updater( {success: 'divCreateCondicao'}, 'createCondicao.do2?method=editCondicao', {method: 'get', parameters: p, evalScripts:true} );
		
		jQuery("#divCreateCondicao").dialog({
			title: '${condicaoDesPlural}',
			autoOpen: false,
	        width: 600,
			modal: true,
			resizable: false,
			dialogClass: 'ecm-form'
		});

		jQuery("#divCreateCondicao").dialog("open");
	}
	
	function saveCondicao(){
		submitDiv('divCreateCondicao', 'createCondicao.do2?method=saveCondicao', 'errorDivCondicao', true);
	}
	
	function cancelCondicao(){
		jQuery("#divCreateCondicao").dialog("close");
	}
	
	function updateDivListCondicao() {
		new Ajax.Updater( {success: 'divListCondicao'}, 'createCondicao.do2?method=listCondicao', {method: 'get', evalScripts: true} );
	}
	
	function removeCondicao(index) {
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
			jQuery("<div title='${condicaoDesPlural}' >${condicaoEmptyMsg}</div>").dialog({
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
			jQuery("<div title='${condicaoDesPlural}' >${condicaoConfirmMsg}</div>").dialog({
				modal: true,
				resizable: false,
				dialogClass: 'ecm-dialog',
				buttons: {
					"${nao}": function() {
						jQuery(this).dialog("close");
					},
					"${sim}": function() {
						new Ajax.Updater( {success: 'divListCondicao'}, 'createCondicao.do2?method=removeCondicao', {method: 'get', parameters: 'condicao_index='+vals, evalScripts: true} );
						jQuery(this).dialog("close");
					}
		        }
			});
		}
	}
	
	var importDadosBtn = document.getElementById("createBtn");
	importDadosBtn.value = "${importar} ${dadosDesPlural}";
	importDadosBtn.title = "${importar} ${dadosDesPlural}";
	importDadosBtn.onclick = function(){importDados();};
	
	var searchDadosBtn = document.getElementById("searchBtn");	
	searchDadosBtn.value="${pesquisar} ${dadosDesPlural}";
	searchDadosBtn.title = "${pesquisar} ${dadosDesPlural}";	
	searchDadosBtn.onclick = function(){
		window.location = "dados.do2";
	};	

	listDados = function() {
		var form = $('${viewName}SearchForm');
		var p = Form.serialize(form);
		
		callAjaxRequest('listDados.do2', 'method=renderGrid&'+p, listDivId, fmtMessages);
	};
	
	
	/*
	Grid
	*/
	if(window.Prototype) {
	    delete Array.prototype.toJSON; //incorrect extra quotes around the arrays
	}
	
	var conteudo;
	
	var rowsToInsert;
	var rowsToInsertIDs;
	var rowsToUpdate;
	var rowsToDelete;
	
	var lastSel;
	var newRowId;
	
	function getGridModel(fields){
		var colNames = new Array();
		var colModel = new Array();
		
		colNames.push("id");
		colModel.push({name:'id',index:'id', hidden:true});
		
		colNames.push("codigoConteudo");
		colModel.push({name:'codigoConteudo',index:'codigoConteudo', hidden:true});
		
		if(fields.texto_curto_1 != ""){
			colNames.push(fields.texto_curto_1);
			colModel.push({name:'texto_curto_1',index:'texto_curto_1',width:150,editable:true});
		}
		
		if(fields.texto_curto_2 != ""){
			colNames.push(fields.texto_curto_2);
			colModel.push({name:'texto_curto_2',index:'texto_curto_2',width:150,editable:true});
		}
		
		if(fields.texto_curto_3 != ""){
			colNames.push(fields.texto_curto_3);
			colModel.push({name:'texto_curto_3',index:'texto_curto_3',width:150,editable:true});
		}
		
		if(fields.texto_curto_4 != ""){
			colNames.push(fields.texto_curto_4);
			colModel.push({name:'texto_curto_4',index:'texto_curto_4',width:150,editable:true});
		}
		
		if(fields.texto_longo_1 != ""){
			colNames.push(fields.texto_longo_1);
			colModel.push({name:'texto_longo_1',index:'texto_longo_1',width:150,editable:true});
		}
		
		if(fields.texto_longo_2 != ""){
			colNames.push(fields.texto_longo_2);
			colModel.push({name:'texto_longo_2',index:'texto_longo_2',width:150,editable:true});
		}
		
		if(fields.texto_longo_3 != ""){
			colNames.push(fields.texto_longo_3);
			colModel.push({name:'texto_longo_3',index:'texto_longo_3',width:150,editable:true});
		}
		
		if(fields.texto_longo_4 != ""){
			colNames.push(fields.texto_longo_4);
			colModel.push({name:'texto_longo_4',index:'texto_longo_4',width:150,editable:true});
		}
		
		if(fields.inteiro_1 != ""){
			colNames.push(fields.inteiro_1);
			colModel.push({name:'inteiro_1',index:'inteiro_1',width:150,editable:true,editrules:{number:true}});
		}
		
		if(fields.inteiro_2 != ""){
			colNames.push(fields.inteiro_2);
			colModel.push({name:'inteiro_2',index:'inteiro_2',width:150,editable:true,editrules:{number:true}});
		}
		
		if(fields.inteiro_3 != ""){
			colNames.push(fields.inteiro_3);
			colModel.push({name:'inteiro_3',index:'inteiro_3',width:150,editable:true,editrules:{number:true}});
		}
		
		if(fields.inteiro_4 != ""){
			colNames.push(fields.inteiro_4);
			colModel.push({name:'inteiro_4',index:'inteiro_4',width:150,editable:true,editrules:{number:true}});
		}
		
		if(fields.inteiro_5 != ""){
			colNames.push(fields.inteiro_5);
			colModel.push({name:'inteiro_5',index:'inteiro_5',width:150,editable:true,editrules:{number:true}});
		}
		
		if(fields.inteiro_6 != ""){
			colNames.push(fields.inteiro_6);
			colModel.push({name:'inteiro_6',index:'inteiro_6',width:150,editable:true,editrules:{number:true}});
		}
		
		if(fields.inteiro_7 != ""){
			colNames.push(fields.inteiro_7);
			colModel.push({name:'inteiro_7',index:'inteiro_7',width:150,editable:true,editrules:{number:true}});
		}
		
		if(fields.inteiro_8 != ""){
			colNames.push(fields.inteiro_8);
			colModel.push({name:'inteiro_8',index:'inteiro_8',width:150,editable:true,editrules:{number:true}});
		}
		
		if(fields.data_1 != ""){
			colNames.push(fields.data_1);
			colModel.push({name:'data_1',index:'data_1',width:150,editable:true,editrules:{required:false,date:true}, 
				editoptions: {
					dataEvents: [{type: 'focus', fn: function(e) {
						var id = jQuery(e.target).attr("id");
						Calendar.setup({inputField: id, ifFormat: '%Y-%m-%d', showsTime: false});
					}}]
				}
			});
		}
		
		if(fields.data_2 != ""){
			colNames.push(fields.data_2);
			colModel.push({name:'data_2',index:'data_2',width:150,editable:true,editrules:{required:false,date:true}, 
				editoptions: {
					dataEvents: [{type: 'focus', fn: function(e) {
						var id = jQuery(e.target).attr("id");
						Calendar.setup({inputField: id, ifFormat: '%Y-%m-%d', showsTime: false});
					}}]
				}
			});
		}
		
		if(fields.data_3 != ""){
			colNames.push(fields.data_3);
			colModel.push({name:'data_3',index:'data_3',width:150,editable:true,editrules:{required:false,date:true}, 
				editoptions: {
					dataEvents: [{type: 'focus', fn: function(e) {
						var id = jQuery(e.target).attr("id");
						Calendar.setup({inputField: id, ifFormat: '%Y-%m-%d', showsTime: false});
					}}]
				}
			});
		}
		
		return {
	        'colNames': colNames,
	        'colModel': colModel
	    };
	}
	
	function createButtons(navDiv){
		var editButton = {
			caption:"",
			buttonicon:"ui-icon-pencil",
			position:"last",
			title:"${editDes}",
			cursor:"pointer",
			id: 'editButton',
			onClickButton: function(){
				if(lastSel){
					jQuery('#gridDiv').editRow(lastSel, false);
					
					toggleEditMode();
				}
				else{					
					jQuery("<div title='${editDes}'>${editEmptyMsg}</div>").dialog({
						resizable: false,
						modal: true,
						dialogClass: 'ecm-dialog',
						buttons: {
						  	"Ok": function() {
						  		jQuery(this).dialog("close");
						  	}
						}
					});
				}
			}
		};
		
		navDiv.navButtonAdd("#gridNavDiv",editButton);
		
		var stopEditButton = {
			caption:"",
			buttonicon:"ui-icon-check",
			position:"last",
			title:"${stopEdit}",
			cursor:"pointer",
			id: 'stopEditButton',
			onClickButton: function(){
				jQuery("#gridDiv").jqGrid('saveRow', lastSel, {
				    url: 'clientArray',
				    aftersavefunc: function (id) {
				    	var rowData = jQuery('#gridDiv').jqGrid ('getRowData', id);
				    	if(id > 0){
		    				rowsToUpdate.push(rowData);
				    	}
				    	else{
				    		var index = rowsToInsertIDs.indexOf(id);
				    		if(index == -1){
					    		rowsToInsert.push(rowData);
					    		rowsToInsertIDs.push(id);
				    		}
				    		else{
				    			rowsToInsert.splice(index, 1, rowData);
				    			rowsToInsertIDs.splice(index, 1, id);
				    		}
				    	}
				    	
				    	toggleListMode();
				    }
				});
			}
		};
		
		navDiv.navButtonAdd("#gridNavDiv",stopEditButton);
		jQuery("#stopEditButton").addClass('ui-state-disabled');
		
		var cancelButton = {
			caption:"",
			buttonicon:"ui-icon-cancel",
			position:"last",
			title:"${cancelEdit}",
			cursor:"pointer",
			id: 'cancelButton',
			onClickButton: function(){
				jQuery("<div title='${cancelEdit}'>${cancelConfirmMsg}</div>").dialog({
					resizable: false,
					modal: true,
					dialogClass: 'ecm-dialog',
					buttons: {
						"${sim}": function() {
							jQuery(this).dialog("close");
							jQuery("#gridDiv").restoreRow(lastSel);
							toggleListMode();
					  	},
					  	"${nao}": function() {
					  		jQuery(this).dialog("close");
					  	}
					}
				});
			}
		};		
		
		navDiv.navButtonAdd("#gridNavDiv",cancelButton);
		jQuery("#cancelButton").addClass('ui-state-disabled');
		
		var addButton = {
			caption:"",
			buttonicon:"ui-icon-plus",
			position:"last",
			title:"${add}",
			cursor:"pointer",
			id: 'addButton',
			onClickButton: function(){
				jQuery("#gridDiv").jqGrid('addRow', {rowID:newRowId, position:"first"});
				
				newRowId --;
				
				toggleEditMode();
			}
		};		
		
		navDiv.navButtonAdd("#gridNavDiv",addButton);
		
		var delButton = {
			caption:"",
			buttonicon:"ui-icon-trash",
			position:"last",
			title:"${delete}",
			cursor:"pointer",
			id: 'delButton',
			onClickButton: function(){
				if(lastSel){
					jQuery("<div title='${delete}'>${deleteConfirmMsg}</div>").dialog({
						resizable: false,
						modal: true,
						dialogClass: 'ecm-dialog',
						buttons: {
							"${sim}": function() {
								jQuery(this).dialog("close");
								
								var rowData = jQuery('#gridDiv').jqGrid ('getRowData', lastSel);

			                	if(rowData.id > 0){
				    				rowsToDelete.push(rowData);
				    				
				    				jQuery("#saveButton").removeClass('ui-state-disabled');
			                	}
			                	
			                	else if(rowData.id < 0){
			                		var index = rowsToInsertIDs.indexOf(rowData.id);
			                		
			                		if(index != -1){
			                			rowsToInsert.splice(index, 1);
			                			rowsToInsertIDs.splice(index, 1);
			                		}			                		
			                	}
			    				
			    				jQuery('#gridDiv').jqGrid('delRowData', lastSel);
			    				
			    				lastSel = null;
						  	},
						  	"${nao}": function() {
						  		jQuery(this).dialog("close");
						  	}
						}
					});
				}
				else{
					jQuery("<div title='${delete}'>${deleteEmptyMsg}</div>").dialog({
						resizable: false,
						modal: true,
						dialogClass: 'ecm-dialog',
						buttons: {
						  	"Ok": function() {
						  		jQuery(this).dialog("close");
						  	}
						}
					});
				}
			}
		};

		navDiv.navButtonAdd("#gridNavDiv",delButton);
		
		var saveButton = {
			caption:"",
			buttonicon:"ui-icon-disk",
			position:"last",
			title:"${save} ${dadosDesPlural}",
			cursor:"pointer",
			id: 'saveButton',
			onClickButton: function(){
				
				var rowsToInsertJson = JSON.stringify(rowsToInsert);
				var rowsToUpdateJson = JSON.stringify(rowsToUpdate);
				var rowsToDeleteJson = JSON.stringify(rowsToDelete);

				var codigoConteudo = conteudo.codigoConteudo;
				var url = "editDados.do2";
				
				var successMsg = "${saveResultMsg}";
				var uList = document.createElement("ul");
				
				jQuery.ajax({
					type: "POST",
					url: url,
					data: "method=insert&json=" + rowsToInsertJson + "&codigoConteudo=" + codigoConteudo,
					beforeSend: function() {
						jQuery("body").mask('${loading}');
					},
					success: function(data) {						
						var listItem = document.createElement("li");
						var textNode = document.createTextNode(data + " ${inserts}");
						listItem.appendChild(textNode);
						uList.appendChild(listItem);
						
						rowsToInsert.length = 0;
						
						jQuery.ajax({
							type: "POST",
							url: url,
							data: "method=update&json=" + rowsToUpdateJson,
							success: function(data) {						
								var listItem = document.createElement("li");
								var textNode = document.createTextNode(data + " ${updates}");
								listItem.appendChild(textNode);
								uList.appendChild(listItem);
								
								rowsToUpdate.length = 0;
								
								jQuery.ajax({
									type: "POST",
									url: url,
									data: "method=delete&json=" + rowsToDeleteJson,
									complete: function() {
										jQuery("body").unmask();
									},
									success: function(data) {
										var listItem = document.createElement("li");
										var textNode = document.createTextNode(data + " ${deletes}");
										listItem.appendChild(textNode);
										uList.appendChild(listItem);
										
										var msgDiv = document.createElement("div");
										msgDiv.title = "${save} ${dadosDesPlural}";
										
										var msgTxtNode = document.createTextNode(successMsg);
										msgDiv.appendChild(msgTxtNode);
										
										msgDiv.appendChild(uList);
										
										jQuery(msgDiv).dialog({
											modal: true,
											resizable: false,
											dialogClass: 'ecm-dialog',
											buttons: {
												"Ok": function() {
													jQuery(this).dialog("close");
												}
											}
										});
										
										rowsToDelete.length = 0;
										
										jQuery('#gridDiv').trigger('reloadGrid');
										
										jQuery("#saveButton").addClass('ui-state-disabled');
													
									},
									error: function() {
										showErrorMsg();
									}
								});
							},
							error: function() {
								showErrorMsg();
							}
						});									
					},
					error: function() {
						showErrorMsg();
					}
				});
			}
		};
		
		navDiv.navButtonAdd("#gridNavDiv",saveButton);
		jQuery("#saveButton").addClass('ui-state-disabled');
		
		var exportButton = {
			caption:"",
			buttonicon:"ui-icon-document",
			position:"last",
			title:"${export}",
			cursor:"pointer",
			id: 'exportButton',
			onClickButton: function(){
				window.location = "listDados.do2?method=exportDados";
			}
		};		
		
		navDiv.navButtonAdd("#gridNavDiv",exportButton);
	};
	
	function showErrorMsg(){
		jQuery("body").unmask();
		
		jQuery("<div title='${save} ${dadosDesPlural}'>${errorMsg}</div>").dialog({
			modal: true,
			resizable: false,
			dialogClass: 'ecm-dialog',
			buttons: {
			  	"Ok": function() {
			  		jQuery(this).dialog("close");
			  	}
			}
		});
	}
	
	function toggleEditMode(){
		jQuery("#saveButton").addClass('ui-state-disabled');
		jQuery("#editButton").addClass('ui-state-disabled');
		jQuery("#addButton").addClass('ui-state-disabled');
		jQuery("#delButton").addClass('ui-state-disabled');
		jQuery("#cancelButton").removeClass('ui-state-disabled');
		jQuery("#stopEditButton").removeClass('ui-state-disabled');
	};
	
	function toggleListMode(){
		if(rowsToInsert.length > 0 || rowsToUpdate.length > 0 || rowsToDelete.length > 0){
			jQuery("#saveButton").removeClass('ui-state-disabled');
		}
		
		jQuery("#editButton").removeClass('ui-state-disabled');
		jQuery("#addButton").removeClass('ui-state-disabled');
		jQuery("#delButton").removeClass('ui-state-disabled');
		jQuery("#cancelButton").addClass('ui-state-disabled');
		jQuery("#stopEditButton").addClass('ui-state-disabled');
	};
</script>

<c:choose>
	<c:when test="${not empty import}">
		<logic:messagesNotPresent >
			<script>
				importDados();
				
				jQuery("<div title='${importar} ${dadosDesPlural}'>${nDados} ${importResultMsg}</div>").dialog({
					modal: true,
					resizable: false,
					dialogClass: 'ecm-dialog',
					buttons: {
					  	"Ok": function() {
					  		jQuery(this).dialog("close");
					  		window.location = "dados.do2";
					  	}
					}
				});				
			</script>
		</logic:messagesNotPresent>		
		<logic:messagesPresent>
			<script>			
				var hiddenImportErrorDiv = document.getElementById("hiddenImportErrorDiv");				
				importDados(hiddenImportErrorDiv);			
			</script>
		</logic:messagesPresent>
	</c:when>
	<c:otherwise>
		<script>
			searchDados();
		</script>
	</c:otherwise>
</c:choose>