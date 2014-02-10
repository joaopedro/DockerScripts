var minimizedWidgets = 0;

function rearrangeMinWidgets(elemLeft){	
	if(minimizedWidgets > 0){
		$(".widgetDiv").each(function() {					
			if($(this).parent().draggable("option", "disabled")){
				if($(this).parent().position().left > elemLeft){
					$(this).parent().animate({left:'-=210px'}, 200);
				}
			}
		});
	}
}

function minimizeWidget(elem, tabIndex, toolbarDiv, content, dialog, minWidgetDiv, toolbarHeight){
	$(elem).attr("originalWidth", $(dialog).width());
	$(elem).attr("originalHeight", $(dialog).outerHeight());
	$(elem).attr("originalTop", $(dialog).position().top);
	$(elem).attr("originalLeft", $(dialog).position().left);	
	
	if(minWidgetDiv.style.display == "none"){
		minWidgetDiv.style.display = "block";
		
		$(elem).attr("originalTop", $(dialog).position().top + 29);
		
		$(".widgetDiv").each(function() {
			var thisDialog = this.parentNode;
			$(thisDialog).animate({top: '+=29px'});
		});
	}
	
	$(dialog).children().first().animate({width: 200}, 200);
	
	$(dialog).animate({width: 200, height: toolbarHeight, top: minWidgetDiv.offsetTop, left: minWidgetDiv.offsetLeft + (210 * minimizedWidgets)}, 200, function() {
		content.style.display = "none";
		toolbarDiv.style.width = "160px";
	});
	
	$(dialog).resizable('disable');
	$(dialog).draggable('disable');
	toolbarDiv.style.cursor = "default";
	
	$(elem).attr("src", javaVariables.imgDir + "/icones/Ico_max1.png");
	$(elem).attr("state", "max");
	
	minimizedWidgets ++;
	
	var widgetIndex = $(dialog).children(".widgetDiv:first").attr("id");
	
	var position = {
		x: $(dialog).position().left,
		y: $(dialog).position().top,
		width: $(dialog).width(),
		height: $(dialog).outerHeight(),
		minimized: true
	};
	
	tabsDefs.tabs[tabIndex].widgets[widgetIndex].position = position;	
	
	var tabsDefsJson = JSON.stringify(tabsDefs);		
	createCookie('tabs', tabsDefsJson, 6);
}

function createToolbar(tabIndex, title, i){
	var toolbarDiv = document.createElement('div');
	toolbarDiv.id = "toolbar_" + i;
	toolbarDiv.style.position = "relative";
	toolbarDiv.style.height = "20px";
	toolbarDiv.style.lineHeight = "20px";
	toolbarDiv.style.cursor = "move";
	
	var titleDiv = document.createElement('div');
	titleDiv.style.cssFloat = "left";
	titleDiv.style.fontSize = "0.625em";
	titleDiv.style.verticalAlign = "middle";
	
	var title = document.createTextNode(title);
	titleDiv.appendChild(title);
	
	var buttonsDiv = document.createElement('div');
	buttonsDiv.style.cssFloat = "right";
	
	var resizeImg = document.createElement("img");
	resizeImg.className = "resizeImg";
	resizeImg.src= javaVariables.imgDir + "/icones/Ico_min1.png";
	resizeImg.alt= "Minimize";
	resizeImg.title= "Minimize";
	resizeImg.style.height = '12px';
	resizeImg.style.width = '12px';
	resizeImg.style.cursor = "pointer";	
	$(resizeImg).attr("state", "min");
	
	resizeImg.onclick = function() {
		var content = this.parentNode.parentNode.nextSibling;
		var dialog = this.parentNode.parentNode.parentNode.parentNode;
		var minWidgetDiv = document.getElementById('minWidget-div');
		var toolbarHeight = toolbarDiv.offsetHeight;
		
		var state = $(this).attr("state");
		
		if(state == 'min'){
			minimizeWidget(this, tabIndex, toolbarDiv, content, dialog, minWidgetDiv, toolbarHeight);
		}
		else if(state == 'max'){
			var originalWidth = $(this).attr("originalWidth");
			var originalHeight = $(this).attr("originalHeight");
			var originalTop = $(this).attr("originalTop");
			var originalLeft = $(this).attr("originalLeft");			
			
			$(dialog).animate({width: originalWidth, height:originalHeight, top: originalTop, left: originalLeft}, 200, function() {
				content.style.display = "block";
				toolbarDiv.style.width = "100%";
			});
			
			$(dialog).resizable('enable');
			$(dialog).draggable('enable');
			toolbarDiv.style.cursor = "move";

			$(this).attr("src", javaVariables.imgDir + "/icones/Ico_min1.png");
			$(this).attr("state", "min");
			
			minimizedWidgets --;
			
			if(minimizedWidgets == 0){
				minWidgetDiv.style.display = "none";
				$(".widgetDiv").each(function() {
					var thisDialog = this.parentNode;
					$(thisDialog).animate({top: '-=29px'});
				});
			}
			
			rearrangeMinWidgets($(dialog).position().left);
			
			var widgetIndex = $(dialog).children(".widgetDiv:first").attr("id");
			
			tabsDefs.tabs[tabIndex].widgets[widgetIndex].position.minimized = false;
			
			var tabsDefsJson = JSON.stringify(tabsDefs);		
			createCookie('tabs', tabsDefsJson, 6);
		}
	}
	
	buttonsDiv.appendChild(resizeImg);
	
	var blank = document.createTextNode('\u00A0');
	buttonsDiv.appendChild(blank);
	
	var closeImg = document.createElement("img");
	closeImg.src= javaVariables.imgDir + "/icones/Ico_sair1.png";
	closeImg.alt= "Close";
	closeImg.title= "Close";
	closeImg.style.height = '12px';
	closeImg.style.width = '12px';
	closeImg.style.cursor = "pointer";
	closeImg.onclick = function() {		
		var content = this.parentNode.parentNode.parentNode;
		content.innerHTML = "";
		$(".ui-dialog-content", $(content.parentNode)).dialog("destroy");
	};
	
	buttonsDiv.appendChild(closeImg);
	
	toolbarDiv.appendChild(titleDiv);
	toolbarDiv.appendChild(buttonsDiv);
	
	return toolbarDiv;
};

function setWidgetsContainerHeight(widgets){
	$('#main-body').height(0 + "px");
	
	var height = 0;	
	var widgetOffSet;
	var lastWidgetBottom = 0;
	var lastWidgetHalf;
	
	for(var i=0;i<widgets.length;i++){
		var absolutPosition = widgets[i].position != null;
		
		if(absolutPosition){
			if(i==0){
				widgetOffSet = widgets[i].position.y - $('#main-body').offset().top;
			}
			else{
				widgetOffSet = widgets[i].position.y - lastWidgetBottom;
			}

			var widgetBottom = widgets[i].position.y + widgets[i].position.height;
			
			if(widgetBottom > lastWidgetBottom){
				height += widgetOffSet + widgets[i].position.height;
			}
			
			lastWidgetBottom = widgetBottom;
		}
		else{
			height += 500;
			
			if(widgets[i].layout == "half" && lastWidgetHalf){
				height -= 500;
			}
			
			if(lastWidgetBottom == 0){
				lastWidgetBottom += $('#main-body').offset().top + 500;
			}
			else{
				lastWidgetBottom += 500;
			}
		}
		
		lastWidgetHalf = widgets[i].layout == "half";
		
		$('#main-body').height(height + "px");
	}
}

function renderWidgets(tabIndex, widgets, data){
	$(".ui-dialog-content").dialog("destroy");
	var widgetsContainer = document.getElementById('main-body');
	
	var mainBodyElems = $("#main-body *").not(".ui-resizable-handle");
	mainBodyElems.remove();
	
	minimizedWidgets = 0;
	
	setWidgetsContainerHeight(widgets);
	
	var widgetsContainerWidth = widgetsContainer.offsetWidth; // - 10;
	
	var lastWidgetFull = false;
	
	for(var i=0;i<widgets.length;i++){		
		var widgetDiv = document.createElement("div");
		widgetDiv.className = "widgetDiv";
		widgetDiv.id = i;
		
		var toolbar = createToolbar(tabIndex, widgets[i].name, i);			
		$(widgetDiv).append($(toolbar));
		
		var ajaxDiv = document.createElement("div");
		ajaxDiv.id = "ajaxDiv_" + i;
		var widgetAction = widgets[i].action;
		$(ajaxDiv).load(javaVariables.contextPath + widgetAction, data, function(responseText){
			// Warning Duplicate IDs
			var duplicateIds = new Array();
			
			$('[id]').each(function(){
				var ids = $('[id="'+this.id+'"]');
				if(ids.length>1 && ids[0]==this){
					console.warn('Multiple IDs #'+this.id);
					duplicateIds.push(this.id);
				}
			});
			
			if(duplicateIds.length > 0){
				alert("Widget has duplicate IDs: " + duplicateIds + " " + responseText);
			}
		});
		widgetDiv.appendChild(ajaxDiv);
		
		var widgetWidth;
		var widgetHeight;
		var position;
		var absolutPosition = widgets[i].position != null;
		if(absolutPosition){
			widgetX = widgets[i].position.x;
			widgetY = widgets[i].position.y;
			widgetWidth = widgets[i].position.width;
			widgetHeight = widgets[i].position.height;
			
			position = {my: "left top", at: "left+" + widgetX + "px top+" + widgetY + "px", of: window, collision: 'none'};
		}
		else{
			var widgetFull = false;
			
			if(widgets[i].layout == "full"){
				widgetFull = true;
				widgetWidth = widgetsContainerWidth - 8;
				widgetHeight = 500;
			}
			else if(widgets[i].layout == "half"){
				widgetWidth = Math.floor(widgetsContainerWidth / 2) - 8;
				widgetHeight = 500;
			}
			
			
			if(i == 0){
				position = {my: "left top", at: "left top+10px", of: "#main-body", collision: 'none'};
			}
			else{
 				var lastWidget = $(".ui-dialog:last");
 				var lastWidgetLeft = lastWidget.offset().left;
 				var lastWidgetRigth = lastWidget.offset().left + lastWidget.width();
 				
 				var containerLeft = $("#main-body").offset().left;
 				var containerRigth = $("#main-body").offset().left + $("#main-body").width(); // - 20;

				if(lastWidgetFull){
					position = {my: "left top", at: "left bottom", of: lastWidget, collision: 'none'};
				}
				else if(widgetFull){
					var offset = lastWidgetLeft - containerLeft;
					
					position = {my: "left top", at: "left-" + offset + "px bottom", of: lastWidget, collision: 'none'};
				}
				else{				
					var offset = containerRigth - widgetWidth;

					if(parseInt(lastWidgetRigth + widgetWidth) > containerRigth){
						var offset = lastWidgetLeft - containerLeft;
						
						position = {my: "left top", at: "left-" + offset + "px bottom", of: lastWidget, collision: 'none'};	
					}
					else{
						position = {my: "left top", at: "left+" + lastWidget.outerWidth() + "px top", of: lastWidget, collision: 'none'};
					}
				}
			}
			
			lastWidgetFull = widgetFull;
		}
		
      	var dialog = $(widgetDiv).dialog({
      		dialogClass: 'noTitle',
      		closeOnEscape: false,
      		width: widgetWidth,
            height: widgetHeight,
            position: position,
            draggable: false
      	})
      	.parent()
		.draggable({
    		containment: "#main-body",
    		snap: true,
    		snapMode: "outer",
    		snapTolerance: 10,
    		handle: $(toolbar),
    		start: function(){
				$(this).data("startingScrollTop", $(window).scrollTop());
			},
			drag: function(event,ui){
				$.browser.chrome = /chrom(e|ium)/.test(navigator.userAgent.toLowerCase()); 

				if(!$.browser.chrome){
					var startingScrollTop = parseInt($(this).data("startingScrollTop"));
					ui.position.top = ui.position.top - startingScrollTop;
				}
			},
			stop: function(event, ui) {
				var widgetIndex = $(this).children(".widgetDiv:first").attr("id");

				var position = {
					x: ui.position.left,
					y: ui.position.top,
					width: $(this).width(),
					height: $(this).outerHeight(),
					minimized: false
				};
				
				tabsDefs.tabs[tabIndex].widgets[widgetIndex].position = position;
				
				var tabsDefsJson = JSON.stringify(tabsDefs);		
				createCookie('tabs', tabsDefsJson, 6);
			}
		})
		.resizable({
			start: function(event, ui){
				$(this).attr('data-prevheight', ui.size.height);
			},
			resize: function(event, ui){
				var widgetTop = $(this).position().top;
				var widgetBottom = $(this).position().top + $(this).outerHeight(true);
				var widgetLeft = $(this).position().left;
				var widgetRigth = $(this).position().left + $(this).outerWidth(true);
				
				var containerTop = $("#main-body").offset().top;
				var containerBottom = $("#main-body").offset().top + $("#main-body").outerHeight(true);
				var containerLeft = $("#main-body").offset().left;
				var containerRigth = $("#main-body").offset().left + $("#main-body").outerWidth(true);
				
				var axis = ui.helper.data('ui-resizable').axis;
				
				if(axis.indexOf("s") !== -1 && widgetBottom > containerBottom - 10) {
					$(this).resizable('widget').trigger('mouseup');
				}
				
				else if(axis.indexOf("n") !== -1 && widgetTop < containerTop + 10) {
					$(this).resizable('widget').trigger('mouseup');
				}
				
				else if(axis.indexOf("w") !== -1 && widgetLeft < containerLeft) {
					$(this).resizable('widget').trigger('mouseup');
				}
				
				else if(axis.indexOf("e") !== -1 && widgetRigth > containerRigth) {
					$(this).resizable('widget').trigger('mouseup');
				}
			},
			stop: function(event, ui){    				
				var widgetIndex = $(this).children(".widgetDiv:first").attr("id");
				
				var position = {
					x: ui.position.left,
					y: ui.position.top,
					width: ui.size.width,
					height: $(this).outerHeight(),
					minimized: false
				};
				
				tabsDefs.tabs[tabIndex].widgets[widgetIndex].position = position;
				
				var tabsDefsJson = JSON.stringify(tabsDefs);		
				createCookie('tabs', tabsDefsJson, 6);
			}
		});  	
	}
	
	var minWidgetDiv = document.getElementById('minWidget-div');
	
	for(var i=0;i<widgets.length;i++){		
		var absolutPosition = widgets[i].position != null;
		if(absolutPosition){
		  	var minimized = widgets[i].position.minimized;
			if(minimized){			
				$(".widgetDiv").each(function() {
					if(this.id == i){
						var toolbar = $("#toolbar_" + i);
						var elem = toolbar.find('.resizeImg:first');
						var toolbarDiv = toolbar.get(0);
						var ajaxDiv = $("#ajaxDiv_" + i).get(0);					
						var dialog = this.parentNode;
						var toolbarHeight = toolbar.height();
						
						minimizeWidget(elem, tabIndex, toolbarDiv, ajaxDiv, dialog, minWidgetDiv, toolbarHeight);
					}
				});			
			}
		}
	}
}


//abre nova tab com os widgets aware
function openNotification(notificationId,idProcessoEntidade, data){
	//remove o bold do preocesso
	var row = $('#'+notificationId);
	row.removeClass('no_read');
	//TODO: comunica ao servidor

	//cria um novo tab do processo			
	var menuTab = document.getElementById('ProcessesTab');
	
	var testExists = $(menuTab).find('#li_' + notificationId);
	if(!testExists.length > 0){
		var leftDivWidth = document.getElementById ("process-nav-leftDiv").clientWidth;
		leftDivWidth += 10;
		$("#process-nav-padder").css('padding-left', leftDivWidth+"px");
		
		
		var li = document.createElement("li");
		li.id = "li_" + notificationId;
		li.className = "process";
        var a = document.createElement('a');
        a.href =  '#';
		a.innerHTML = idProcessoEntidade;
		a.title = idProcessoEntidade;
		a.onclick = function(){
			$("#tableDiv").hide();
			$("#etapaDiv").show();
			$("#MenuTab .here").removeClass('here');
			
			renderAwareWidgets(data);
        }
		
		li.appendChild(a);
		
		var input = document.createElement("input");
		input.type = "button";
		input.value = "x ";
		input.title = "Fechar";
		input.className = "close";				
		input.onclick = function(){
			$(this).parent().remove();

			if(!isContainerScrolled() && $("#ProcessesTabsScroller").is(":visible")){
				toggleProcessesTabsScroller();
			}
			
			$('#ProcessesTabsScroller-list').find("#p_" + notificationId).remove();
		};				
		li.appendChild(input);
		
		var p = document.createElement("p");
		p.id = "p_" + notificationId;
		var a = document.createElement('a');
        a.href =  '#';
		a.innerHTML = idProcessoEntidade;
		a.onclick = function(){
			$("#tableDiv").hide();
			$("#etapaDiv").show();
			$("#MenuTab .here").removeClass('here');
			
        	renderAwareWidgets(data);
        };
		p.appendChild(a);
		processesList.appendChild(p);
		
		menuTab.appendChild(li);
		
		if(isContainerScrolled() && !($("#ProcessesTabsScroller").is(":visible"))){
			toggleProcessesTabsScroller();
		}
		
		scrollProcessesTab('rigth');
	}
	
	$("#tableDiv").hide();
	$("#etapaDiv").show();
	$("#MenuTab .here").removeClass('here');
	
	renderAwareWidgets(data);
};		

function renderAwareWidgets(data){
	var tabsCookie = readCookie('tabs');
	if(tabsCookie != null){
		tabsDefs = JSON.parse(tabsCookie);
		
		for(var i=0;i<tabsDefs.tabs.length;i++){
			if(data.nid != undefined && tabsDefs.tabs[i].awareness == 'com.sinfic.agora.widget.activity'){
				renderWidgets(i, tabsDefs.tabs[i].widgets, data);
			}
			else if(data.documentId != undefined && tabsDefs.tabs[i].awareness == 'com.sinfic.agora.widget.document'){
				renderWidgets(i, tabsDefs.tabs[i].widgets, data);
			}
		}
	}
};