<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<fmt:message key="ipdms.obrigatorio" var="obrigatorio" />

<c:set var="IMG_DIR" value="${pageContext.request.contextPath}/newlayout/images" />

<style>
	.widgetsGroupFieldset {
		border-color: #555555;
		border-style: solid;
	}

	.widgetsGroupLegend {
       	background: none;
       	color: #555555;
       	font-size: 1em;
       	margin: 0 0 5px;
       	padding: 2px 0 2px 2px;
       	text-indent: 5px;
       	width: auto;
   	}
</style>

<script src='${pageContext.request.contextPath}/newlayout/personalData/personalPreferences.js' type="text/javascript"></script>

<script type="text/javascript">
	var javaVariables = {
		contextPath: '${pageContext.request.contextPath}',
		imgDir: '${IMG_DIR}',
		user: '${pageContext.request.remoteUser}'
	};
	
	var tabsDefs;
	var widgetsDefs;
	
	$(document).ready(function() {
		var widgetsContainer = document.getElementById('main-body');
		widgetsContainer.style.height = "80%";
		
		var menuTab = document.getElementById('MenuTab');
		var exists = $("#MenuTab li:contains('Preferências Pessoais')").length > 0;
		if(!exists){		
			var processesTabsScroller = document.getElementById('ProcessesTabsScroller');
			
			var li = document.createElement("li");
			
			var a = document.createElement('a');
			a.innerHTML = 'Preferências Pessoais';
	        a.href =  '#';
			a.onclick = function(){
				ajaxRequest('/newlayout/editPersonalPreferences.do2');
			}
			
			li.appendChild(a);
			
			menuTab.insertBefore(li,processesTabsScroller);
		}
		
		toggleTab('Preferências Pessoais');
		
		var fixHelper = function(e, ui) {
			ui.children().each(function() {
				$(this).width($(this).width());
			});
			return ui;
		};
		
		//drag and drop da lista de tabs
		$("#sortableTabsDiv").sortable({
			containment: "#Table",
			helper: fixHelper,
			start: function(e, ui) {
				  // creates a temporary attribute on the element with the old index
				$(this).attr('data-previndex', ui.item.index());
			},
			update: function(e, ui) {
				// gets the new and old index then removes the temporary attribute
				var newIndex = parseInt(ui.item.index());
				var oldIndex = parseInt($(this).attr('data-previndex'));
				
				tabsDefs.tabs.move(oldIndex,newIndex);
			}
		});
		
		$("#processNotificationWidgets").droppable({
	        hoverClass: "ui-state-hover",
	        accept: function(d) { 
	        	if((!d.hasClass("com.sinfic.agora.widget.document")) && (!d.hasClass("ui-sortable-helper"))){
	            	return true;
		        }
		    },	        
	        drop: function( event, ui ) {
	        	$( this ).find(".placeholder").remove();
	        	var li = document.createElement("li");
	    		li.innerHTML = ui.draggable.text();
	    		li.value = ui.draggable.get(0).value;
	    		li.title = "Drag and Drop to reorder widgets.";
	    		li.style.cursor = "move";
	    		
	    		this.appendChild(li);
	        }
	    }).sortable();
		
		$("#documentNotificationWidgets").droppable({
	        hoverClass: "ui-state-hover",
	        accept: function(d) {
	        	if((!d.hasClass("com.sinfic.agora.widget.activity")) && (!d.hasClass("ui-sortable-helper"))){
	            	return true;
		        }
		    },
	        drop: function( event, ui ) {
	        	$( this ).find(".placeholder").remove();
	        	
	        	var li = document.createElement("li");
	    		li.innerHTML = ui.draggable.text();
	    		li.value = ui.draggable.get(0).value;
	    		li.title = "Drag and Drop to reorder widgets.";
	    		li.style.cursor = "move";
	    		
	    		this.appendChild(li);
	        }
	    }).sortable();
		
	    $("#editTabUL").droppable({
	        hoverClass: "ui-state-hover",
	        accept: function(d) {
	        	if((!d.hasClass("com.sinfic.agora.widget.activity")) && (!d.hasClass("com.sinfic.agora.widget.document")) && (!d.hasClass("ui-sortable-helper"))){
	            	return true;
		        }
		    },
	        drop: function( event, ui ) {
	    		var li = document.createElement("li");
	    		li.value = ui.draggable.get(0).value;
	    		li.title = "Drag and Drop to reorder widgets.";
	    		li.style.cursor = "move";
	    		li.style.listStyleType = "none";
	    		
	    		var deleteLink = document.createElement('a');
	            deleteLink.href =  '#';
	    		deleteLink.onclick = function(){
	    			var elem = $(this).parent();
	    			elem.remove();
	            };
	            
	            var deleteImg = document.createElement("img");
	            deleteImg.src = javaVariables.imgDir + "/icones/Ico_sair1.png";
	            deleteImg.width = 15;
	            deleteImg.height = 15;
	            deleteImg.title = "Apagar";
	            deleteImg.alt = "Apagar";
	            deleteImg.style.verticalAlign = "middle";
	            
	            var nameElm = document.createElement("span");
	            nameElm.innerHTML = ui.draggable.text();
	            nameElm.style.paddingLeft = "10px";
	            
	            deleteLink.appendChild(deleteImg);
	            li.appendChild(deleteLink);
	            li.appendChild(nameElm);
	    		
	    		this.appendChild(li);
 	        },
	        over: function(event, ui) {
	            $(this).css('z-index', -1);
	            ui.helper.css('z-index', 1);
	        }
	    }).sortable();
		
		var tabsCookie = readCookie('tabs');
		if(tabsCookie != null){
			tabsDefs = JSON.parse(tabsCookie);
			createTabsList(tabsDefs);
		}
		else{
			tabsDefs = {
				tabs:[]
			}
		}

		//cria a lista de widgets configurados
		$.getJSON( "${pageContext.request.contextPath}/widgets.do").done(function(json){
			widgetsDefs = {
				widgets:[
				{
					name: 'My Processes',
					group: 'com.sinfic.agora.widget.general',
					action: '/newlayout/myProcesses.do2',
					layout: 'full',
					position: null
				}]
			}
               var searchePreferencesCookie = readCookie('searches');
               if(searchePreferencesCookie != null){
                   searchePreferencesDefs = JSON.parse(searchePreferencesCookie);
                   $.each(searchePreferencesDefs.searches, function(i, item){
                       var itemJSON = JSON.parse(item);
                       widgetsDefs.widgets.push(
                       {
                           name: itemJSON.nome,
                           group: 'As Minhas Pesquisas',
                           action: '/newlayout/mySearchWidget.do?searchId='+escape(itemJSON.nome),
                           layout: itemJSON.searchLayout,
                           position: null
                       });

			    });
               }

			$.each(json, function(i, item){
          			widgetsDefs.widgets.push(item);
			});

           	createWidgetsList(widgetsDefs);
           	populateAwareTabsWidgets(tabsDefs, widgetsDefs);
		})
         	.fail(function(jqxhr, textStatus, error){
			var err = textStatus + ", " + error;
			console.log("Request Failed: " + err);
       	});
	});
</script>

<h1>Preferências Pessoais</h1>

<form id="widgetsForm" class="Geral">
	<div class="FormRow">${obrigatorio}</div>	
	<fieldset style="width:100%" id="widgetsFieldSet" class="formGeralFieldset">
	  <legend class="formGeralLegend">List of Widgets by Group</legend>
	  
	  <div class="FormRow">Drag and Drop to the New TAB configuration.</div>
	  
	  <div class="FormRow">
	  	<div class="FormCellLeft">	  
			<div id="widgetsGroup" class="FormCellLeft"></div>
			<div class="FormCellRight">
			  	<fieldset class="widgetsGroupFieldset">
				  <legend class="widgetsGroupLegend">Create New TAB</legend>
					<div style="float: left; padding-bottom: 10px; white-space: nowrap;">
						<label title="Nome da TAB">* TAB Name:</label>
						<input type="text" id="newTabName" name="newTabName" title="Nome da TAB" value="">
					</div>
	
					<ul id="newTabUL" class="ui-state-default" style="min-height: 50px; clear: both;">
						<li class="placeholder">Drop your Widgets here!</li>
					</ul>
					
					<input type="button" value="Gravar" class="BT_primary" onclick="createTab();" style="font-size: 1em;">
					<input type="button" value="Limpar" onclick="clearTabForm('newTabName', 'newTabUL');" style="font-size: 1em;">
			  	</fieldset>
			</div>
		</div>
		<div class="FormCellRight">
			<div id="widgetsGroup" class="FormCellLeft">
				<fieldset class="widgetsGroupFieldset">
				  <legend class="widgetsGroupLegend">Activity Aware Widgets TAB</legend>
				  
				    <ul id="processNotificationWidgets" class="ui-state-default" style="min-height: 50px; clear: both;">
						<li class="placeholder">Drop your Widgets here!</li>
					</ul>
					
					<input type="button" value="Gravar" class="BT_primary" onclick="saveAwareWidgets('com.sinfic.agora.widget.activity', 'processNotificationWidgets');" style="font-size: 1em;">
					<input type="button" value="Limpar" onclick="clearWidgetsList('processNotificationWidgets');" style="font-size: 1em;">
			    </fieldset>
			</div>
			<div class="FormCellRight">
				<fieldset class="widgetsGroupFieldset">
				  <legend class="widgetsGroupLegend">Document Aware Widgets TAB</legend>
				  
				    <ul id="documentNotificationWidgets" class="ui-state-default" style="min-height: 50px; clear: both;">
						<li class="placeholder">Drop your Widgets here!</li>
					</ul>
					
					<input type="button" value="Gravar" class="BT_primary" onclick="saveAwareWidgets('com.sinfic.agora.widget.document', 'documentNotificationWidgets');" style="font-size: 1em;">
					<input type="button" value="Limpar" onclick="clearWidgetsList('documentNotificationWidgets');" style="font-size: 1em;">				  
			    </fieldset>
			</div>
		</div>
	  </div>		
	</fieldset>
</form>
<form id="tabsForm" class="Geral" style="padding-top:25px;">
	<fieldset style="width:100%" id="tabsFieldSet" class="formGeralFieldset">
		<legend class="formGeralLegend">List of TABs</legend>
		
		<div class="FormRow">Drag and Drop to reorder.</div>
		
		<div class="FormRow">
	  		<div class="FormCellLeft">
				<div id="Table">
					<table style="font-size: 1em;">
					  <thead>
						<tr>
						  <th>Name</th>
						  <th>Visibility</th>
						  <th>Delete</th>
						  <th>Edit</th>
						</tr>
					  </thead>
					  <tbody id="sortableTabsDiv"></tbody>
					</table>
				</div>
				
				<div id="tabsBtnDiv" class="button">
					<input type="button" value="Gravar" class="BT_primary" onclick="saveTabs();" style="font-size: 1em;">
					<input type="button" value="Cancelar" onclick="javascript: location.reload();" style="font-size: 1em;">
				</div>
			</div>
			<div class="FormCellRight">
			  	<fieldset id="editTabFS" class="widgetsGroupFieldset" style="display:none">
					<legend class="widgetsGroupLegend">Edit TAB</legend>
					<div style="float: left; padding-bottom: 10px; white-space: nowrap;">
						<label title="Nome da TAB">* TAB Name:</label>
						<input type="text" id="editTabName" title="Nome da TAB" value="">
					</div>
	
					<ul id="editTabUL" class="ui-state-default" style="min-height: 50px; clear: both;"></ul>
					
					<input type="button" value="Gravar" class="BT_primary" onclick="saveTabEdits(this);" style="font-size: 1em;">
					<input type="button" value="Limpar" onclick="clearTabForm('editTabName', 'editTabUL');" style="font-size: 1em;">
			  	</fieldset>
			</div>
		</div>	
	</fieldset>
</form>