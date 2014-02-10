<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.loading" var="loading" bundle="${ecmBundle}" />
<fmt:message key="ipdms.emptyRecords" var="emptyRecords" bundle="${ecmBundle}" />

<style>
	#gridDiv {
	    font-size: 85%;
	}
	
	.ui-paging-info {
	    font-size: 70%;
    	margin-top: 0px !important;
	}
	
	#gridNavDiv_center td {	
	    font-size: 70%;
	}
	
	.ui-jqgrid-sortable {
		font-size: 75%;
	}
	
	#gridNavDiv_center input {	
	    height: 20px;
	    font-size: 11px;
	}
	
	.ui-resizable-se {
    	height: 12px !important;
    	width: 12px !important;
	}
</style>

<div id="hiddenErrorDiv" style="display:none;">
	<html:errors />
</div>

<logic:messagesPresent message="false">
	<script type="text/javascript">
		var hiddenErrorDiv = document.getElementById("hiddenErrorDiv");
		var errorDivDados = document.getElementById("errorDivDados");
		errorDivDados.innerHTML = hiddenErrorDiv.innerHTML;
		$("errorDivDados").show();
	</script>
</logic:messagesPresent>

<c:if test="${empty erro}">
	<script type="text/javascript">	
		var errorDivDados = document.getElementById("errorDivDados");
		errorDivDados.innerHTML = "";
		
		hideAll();
		
		conteudo = conteudosArray["${descricaoConteudo}"];
		var gridModel = getGridModel(conteudo);

		rowsToInsert = new Array();
		rowsToInsertIDs = new Array();
		rowsToUpdate = new Array();
		rowsToDelete = new Array();
		
		newRowId = -1;
		
		jQuery("#gridDiv").jqGrid({
		   	url: 'listDados.do2?method=listDados',
		   	editurl: 'clientArray',
			datatype: 'json',
		   	colNames: gridModel.colNames,
		   	colModel: gridModel.colModel,
		   	rowNum: 20,
		   	pager: '#gridNavDiv',
		   	sortname: 'id',
		    viewrecords: true,
		    sortorder: 'desc',
			caption: '${estrutura} - ${descricaoConteudo}',
			height: 'auto',
			width: 750,
			hidegrid: false,
			loadtext: '${loading}',
			emptyrecords: '${emptyRecords}',
			onSelectRow: function(id){
				if(id && id!==lastSel){
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
					
					lastSel=id;
				}
			},
			ondblClickRow: function(id){
				toggleEditMode();
				
				jQuery('#gridDiv').editRow(id, false);
			}
		});
		
		jQuery('#gridDiv').jqGrid('navGrid','#gridNavDiv',{edit:false,add:false,del:false,search:false,refresh:false});
		jQuery("#gridDiv").jqGrid('inlineNav',"#gridNavDiv",{restoreAfterSelect:false, cancel:false, edit:false, add:false, del:false, save:false});
		jQuery('#gridDiv').jqGrid('gridResize');
		
		var navDiv = jQuery("#gridDiv").navGrid("#gridNavDiv");		
		createButtons(navDiv);
	</script>
</c:if>

<table id="gridDiv"></table>
<div id="gridNavDiv"></div>