Array.prototype.move = function (old_index, new_index) {
    if (new_index >= this.length) {
        var k = new_index - this.length;
        while ((k--) + 1) {
            this.push(undefined);
        }
    }
    this.splice(new_index, 0, this.splice(old_index, 1)[0]);
};

function createTab(){
	var tabDefs = {
		tabName: '',
		visible: true,
		awareness: null,
		widgets: []		
	};

	var tabNameInput = $('#widgetsForm').find('input[type=text]').filter(':first');
	tabNameInput.each(function() {
		tabDefs.tabName = $(this).val();
	});

	var lis = $("#newTabUL li");		
	for(var i=0;i<lis.length;i++){
		var li = lis.get(i);
		var index = li.value;
		var widget = widgetsDefs.widgets[index];
		tabDefs.widgets.push(widget);
	}
	
	tabsDefs.tabs.push(tabDefs);
	
	createTabsList(tabsDefs);

	var tabsDefsJson = JSON.stringify(tabsDefs);
	createCookie('tabs', tabsDefsJson, 6);

	clearTabForm('newTabName', 'newTabUL');
};

function createTabsList(tabsDefs){
	$("#sortableTabsDiv tr").remove();
	
	var table = document.getElementById('sortableTabsDiv');
	
	for(var i=0;i<tabsDefs.tabs.length;i++){		
		if(tabsDefs.tabs[i].awareness == undefined){
			var row=table.insertRow(-1);
			
			var cell0=row.insertCell(0);
			cell0.innerHTML=tabsDefs.tabs[i].tabName;
			cell0.title = "Drag and Drop to reorder TABs.";
			cell0.style.cursor = "move";
			
			var input = document.createElement('input');
			input.type = "checkbox";
			input.checked = tabsDefs.tabs[i].visible;
			input.name = "checkbox";
			input.value = tabsDefs.tabs[i].tabName;
			input.title = "Seleccionar";
			input.onclick = function(){
				var tabName = $(this.parentNode).prev('td').text();			
				var index;			
				var result = $.grep(tabsDefs.tabs, function(e,i){
					if(e.tabName ==  tabName){
						index = i;
					} 
				});
				
				tabsDefs.tabs[index].visible = this.checked;			
			};
			
			var cell1=row.insertCell(1);
			cell1.align="center";
			cell1.appendChild(input);
			
			var deleteLink = document.createElement('a');
	        deleteLink.href =  '#';
			deleteLink.onclick = function(){
				var tabName = $(this.parentNode).prev('td').prev('td').text();
				
				var index;			
				var result = $.grep(tabsDefs.tabs, function(e,i){
					if(e.tabName ==  tabName){
						index = i;
					} 
				});
				
				tabsDefs.tabs.splice(index,1);
				
				var row = $(this.parentNode.parentNode);
				row.remove();	
	        };
	        
	        var deleteImg = document.createElement("img");
	        deleteImg.src = javaVariables.imgDir + "/icones/Ico_sair1.png";
	        deleteImg.width = 15;
	        deleteImg.height = 15;
	        deleteImg.title = "Apagar";
	        deleteImg.alt = "Apagar";
	        
	        deleteLink.appendChild(deleteImg);
			
			var cell2=row.insertCell(2);
			cell2.align="center";
			cell2.appendChild(deleteLink);
			
			
			var editLink = document.createElement('a');
	        editLink.href =  '#';
			editLink.onclick = function(){
				var tabName = $(this.parentNode).prev('td').prev('td').prev('td').text();
				
				var index;			
				var result = $.grep(tabsDefs.tabs, function(e,i){
					if(e.tabName ==  tabName){
						index = i;
					} 
				});
				
				editTabWidgets(tabsDefs.tabs[index], index);
	        };
	        
	        var editImg = document.createElement("img");
	        editImg.src = javaVariables.imgDir + "/icones/Ico_config1.png";
	        editImg.width = 15;
	        editImg.height = 15;
	        editImg.title = "Editar";
	        editImg.alt = "Editar";
	        
	        editLink.appendChild(editImg);
			
			var cell3=row.insertCell(3);
			cell3.align="center";
			cell3.appendChild(editLink);
		}
	}
}

function editTabWidgets(tab, index){
	var editTabFS = document.getElementById("editTabFS");
	editTabFS.style.display = "block";

	$("#editTabUL li").remove();

	var input = document.getElementById("editTabName");
	input.value = tab.tabName;
	input.name = index;	
	
	var widgets = tab.widgets;
	
	for(var i=0;i<widgets.length;i++){
		var li = document.createElement("li");
		li.title = "Drag and Drop to reorder widgets.";
		li.style.cursor = "move";
		li.style.listStyleType = "none";
		
		$.map(widgetsDefs.widgets, function(obj, index) {
		    if(obj.name == widgets[i].name) {
		    	li.value = index;
		    }
		});
		
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
        nameElm.innerHTML = widgets[i].name;
        nameElm.style.paddingLeft = "10px";
        
        deleteLink.appendChild(deleteImg);
        li.appendChild(deleteLink);
        li.appendChild(nameElm);		
		
		$("#editTabUL").append(li);
	}
}

function saveTabEdits(elem){
	var input = document.getElementById("editTabName");
	var tabName = input.value;
	var tabIndex = input.name;
	
	tabsDefs.tabs[tabIndex].tabName = tabName;
	tabsDefs.tabs[tabIndex].widgets = [];
	
	var lis = $("#editTabUL li");		
	for(var i=0;i<lis.length;i++){
		var li = lis.get(i);
		var index = li.value;
		var widget = widgetsDefs.widgets[index];
		tabsDefs.tabs[tabIndex].widgets.push(widget);
	}
	
	var tabsDefsJson = JSON.stringify(tabsDefs);
	createCookie('tabs', tabsDefsJson, 6);
	
	elem.parentNode.style.display = "none";
	
	createTabsList(tabsDefs);
	
	alert("Changes successfully saved.")
}

function createWidgetsList(widgetsDefs){
	var widgetsFieldSet = document.getElementById('widgetsGroup');
	
	var groupsArray = new Array();
	for(var i=0;i<widgetsDefs.widgets.length;i++){
		var group = widgetsDefs.widgets[i].group;
		
		if(jQuery.inArray(group, groupsArray) == -1){
			groupsArray.push(group);
		}
	}
	
	for(var i=0;i<groupsArray.length;i++){
		var fieldset = document.createElement("fieldset");
		fieldset.className = "widgetsGroupFieldset";
		
		var legend = document.createElement("legend");
		legend.className = "widgetsGroupLegend";
		legend.innerHTML = groupsArray[i];
		
		fieldset.appendChild(legend);
		
		var ul = document.createElement("ul");
		ul.id = groupsArray[i];
		
		fieldset.appendChild(ul);
		
		widgetsFieldSet.appendChild(fieldset);
	}
	
	for(var i=0;i<widgetsDefs.widgets.length;i++){
		var ul = document.getElementById(widgetsDefs.widgets[i].group);		
		var li = document.createElement("li");
		li.innerHTML = widgetsDefs.widgets[i].name;
		li.value = i;
		li.title = "Drag and Drop to the New TAB configuration.";
		li.style.cursor = "move";
		li.className = widgetsDefs.widgets[i].group;
		
		ul.appendChild(li);
	}
	
    $(widgetsFieldSet).find('li').draggable({
    	helper: "clone"
    });
    
    $("#newTabUL").droppable({
        hoverClass: "ui-state-hover",
        accept: function(d) {
        	if((!d.hasClass("com.sinfic.agora.widget.activity")) && (!d.hasClass("com.sinfic.agora.widget.document")) && (!d.hasClass("ui-sortable-helper"))){
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
};

function populateAwareTabsWidgets(tabsDefs, widgetsDefs){
	for(var i=0;i<tabsDefs.tabs.length;i++){
		if(tabsDefs.tabs[i].awareness == 'com.sinfic.agora.widget.activity'){
			var widgets = tabsDefs.tabs[i].widgets;
			appendAwareTabsWidgetsLi(widgets, 'processNotificationWidgets', widgetsDefs);
		}
		else if(tabsDefs.tabs[i].awareness == 'com.sinfic.agora.widget.document'){
			var widgets = tabsDefs.tabs[i].widgets;
			appendAwareTabsWidgetsLi(widgets, 'documentNotificationWidgets', widgetsDefs);
		}
	}
}

function appendAwareTabsWidgetsLi(widgets, div, widgetsDefs){
	for(var i=0;i<widgets.length;i++){				
		$("#" + div).find(".placeholder").remove();
    	
    	var li = document.createElement("li");
		li.innerHTML = widgets[i].name;
		li.title = "Drag and Drop to reorder widgets.";
		li.style.cursor = "move";
		
		$.map(widgetsDefs.widgets, function(obj, index) {
		    if(obj.name == widgets[i].name) {
		    	li.value = index;
		    }
		});
		
		$("#" + div).append(li);
	}	
}

function clearTabForm(inputId, ulId){
	$("#" + inputId).val('');
	clearWidgetsList(ulId);
}

function saveTabs(){
	var tabsDefsJson = JSON.stringify(tabsDefs);		
	createCookie('tabs', tabsDefsJson, 6);

	location.reload(true);
};

function saveAwareWidgets(awareness, div){	
	for(var i=0;i<tabsDefs.tabs.length;i++){
		if(tabsDefs.tabs[i].awareness == awareness){
			tabsDefs.tabs.splice(i, 1);
		}
	}
	
	var lis = $("#" + div + " li:not('.placeholder')");
	if(lis.length > 0){
		var tabDefs = {
			tabName: '',
			visible: true,
			awareness: awareness,
			widgets: []		
		};
		
		for(var i=0;i<lis.length;i++){
			var li = lis.get(i);
			var index = li.value;
			var widget = widgetsDefs.widgets[index];
			tabDefs.widgets.push(widget);
		}
		
		tabsDefs.tabs.push(tabDefs);
	}
	
	var tabsDefsJson = JSON.stringify(tabsDefs);
	createCookie('tabs', tabsDefsJson, 6);
	
	alert("Widgets successfully saved.")
};

function clearWidgetsList(div){
	$("#" + div + " li").remove();
	var li = document.createElement("li");
	li.innerHTML = "Drop your Widgets here!";
	li.className = "placeholder";
	$(li).appendTo("#" + div);
}