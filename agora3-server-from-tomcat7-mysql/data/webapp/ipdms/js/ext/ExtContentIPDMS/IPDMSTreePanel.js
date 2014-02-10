	//METODOS USADOS PARA COLOCAR VALORES NO JSP CORRESPONDENTES � SELECCAO DOS N�S/LINHAS NAS TREEPANELS/GRIDPANELS//
	

	function affectParent(value, description,win,valueplace,descplace){
		//se tiver dentro de um span- configuracao para aparecer como link com sublinhado//
		if(description.indexOf("<span")>=0){
			var doc=document.createElement('div');
			doc.innerHTML=description;
			description=doc.firstChild.innerHTML;
		}
		
		document.getElementById(valueplace).value=value;
		if(document.getElementById(descplace).type=="text" ||
				document.getElementById(descplace).type=="hidden") {
			document.getElementById(descplace).value=description;
			//Try to update Div, if exists
			var divdesc = document.getElementById(descplace+'Div');
			if(divdesc) {
				divdesc.innerHTML = description;
			}
		}
		else
			document.getElementById(descplace).innerHTML=description;
		 win.close();
	}
	
	function affectParentMultiple(win,valueplace,descplace){
		var preIdsSelected = '';
		var idsSelected = '';
		var descSelected = '';
		var elements1 = $$('input[type="checkbox"]').each(function filter(item) {
			if(item.id.indexOf('check_') != -1 && item.checked) {
				preIdsSelected = item.id.sub("check_", "") + ';';
				
				// hack ecr� distribui��o din�mica devido ao ecr� de dar conhecimeno
				if(preIdsSelected.indexOf('sel') != -1) {
					idsSelected += preIdsSelected.sub("sel", "");
				} else {
					idsSelected += preIdsSelected;
				}
				
				descSelected += $F(item) + ';';
			}
		});
							
		affectParent(idsSelected, descSelected,win,valueplace,descplace);
	}

	// used when column "dar conhecimento" is visible in Ext popup
	function affectParentDarConhecimento(value, description, valueplace, descplace){
		//se tiver dentro de um span- configuracao para aparecer como link com sublinhado//
		if(description.indexOf("<span")>=0){
			var doc=document.createElement('div');
			doc.innerHTML=description;
			description=doc.firstChild.innerHTML;
		}
		
		document.getElementById(valueplace).value=value;
		if(document.getElementById(descplace).type=="text" ||
				document.getElementById(descplace).type=="hidden") {
			document.getElementById(descplace).value=description;
			//Try to update Div, if exists
			var divdesc = document.getElementById(descplace+'Div');
			if(divdesc) {
				divdesc.innerHTML = description;
			}
		}
		else
			document.getElementById(descplace).innerHTML=description;		
	}
	
	function affectParentMultipleDarConhecimento(id, valueplace,descplace){
		var idsSelected = '';
		var descSelected = '';				
		$$('input[type="checkbox"]').each(function filter(item) {
			if(item.id.indexOf(id) != -1 && item.checked) {
				idsSelected += item.id.sub(id, "") + ';';
				descSelected += $F(item) + ';';
			}
		
		});
		affectParentDarConhecimento(idsSelected, descSelected, valueplace, descplace);
	}
	
	function affectParentMultipleGrid(grid,win,valueplace,descplace){
		var idsSelected = '';
		var descSelected = '';
		var selected =grid.getSelectionModel().getSelections();
		
		for(i=0;i<selected.length;i++){
		
			idsSelected += selected[i].data.id + ';';
		    descSelected += selected[i].data.name + ';';
		}
	

		affectParent(idsSelected, descSelected,win,valueplace,descplace);
	}
	
	
	function Checkboxes(state) {
            $$('input[type="checkbox"][id^="check_"]').each(function filter(item) {
                        {
                        item.checked=state;
                        }
            });
            
      }   
	
	function GridCheckBoxes(grid,state) {
		if(state)
			grid.getSelectionModel().selectAll();	
		else
			grid.getSelectionModel().clearSelections();	
	}   
	
	///////////CRIACAO DOS HANDLERS DOS BOTOES USADOS NO PANEL E TREEPANEL///////////////////
 
		function newButton(title,func){
			return new Ext.Button({
				text:title,
				handler:func
			});
		}
		
		expandeTodos= function(tree){tree.expandAll();};
		
		colapseTodos= function(tree){tree.collapseAll(); Checkboxes(false);};
		
		fecharWin   = function(window){
					      window.close();};
		
		alteraParent= function(value,description,win,valuePlace,descPlace){
					      affectParent(value,description,win,valuePlace,descPlace);};
			
		alteraParentMultiple= function(win,valuePlace,descPlace){
			affectParentMultiple(win,valuePlace,descPlace);};
		
		alteraParentMultipleGrid= function(grid,win,valuePlace,descPlace){
			affectParentMultipleGrid(grid,win,valuePlace,descPlace);};
		
		CheckBoxState= function(state){Checkboxes(state);};
		
		gridCheckBoxState= function(grid,state){GridCheckBoxes(grid,state);};
		
		
		parseElement = function(element, type) {
			//set and format element description
			var elementDescription = parent.document.getElementById(element);
			if(elementDescription.type=="text" || elementDescription.type=="hidden") {
								
				//Tentar Procurar a Div
				var elementDiv = parent.document.getElementById(element + 'Div');
				if(elementDiv) {
					elementDiv.innerHTML = elementDescription.value;
					elementDiv.innerHTML = '>' + elementDiv.innerHTML.gsub(';', '<br /> >');
					elementDiv.innerHTML = elementDiv.innerHTML.substring(0, elementDiv.innerHTML.lastIndexOf("&gt;") - 1);
				} else {
					var value = elementDescription.value;
					elementDescription.value = value.substring(0,value.lastIndexOf(';'));					
				}
			} else {
				if(elementDescription.innerHTML.indexOf(";") != -1){
					elementDescription.innerHTML = '>' + elementDescription.innerHTML.gsub(';', '<br /> >');
					elementDescription.innerHTML = elementDescription.innerHTML.substring(0, elementDescription.innerHTML.lastIndexOf("&gt;") - 1);
				}
			}
			
		};
		
		
	
///////////REDIMENSAO DE COLUNA TITULO DO HEADER DA TREEPANEL///////////////////	
		function resizeTreePanelHeader(treePanel){
			
			treePanel.on("resize", function(Ccontainer, Cwidth, Cheight) {
				
				var scrollOffset = 19;
				var secondColumn = 68;//segunda coluna(seleccionar) tem tamanho fixo
				Cwidth=Cwidth-scrollOffset-secondColumn;//primeira coluna
  				var bw = Ext.isBorderBox ? 0 : 2;
 					 var widths = [((Cwidth)*1), secondColumn];
  					 var totalWidth = 0;
 					 for (var i = 0; i < widths.length; i++) {
 					   totalWidth += widths[i];
  					   Ext.select("div.x-tree-hd:nth-child(" + (i+1) + ")", false, "*TreeID*").setWidth(widths[i]);
					   Ext.select("div.x-tree-col:nth-child(" + (i+1) + ")", false, "*TreeID*").setWidth(widths[i]);
					   treePanel.columns[i].width = widths[i];
  						}

 					treePanel.headers.setWidth(totalWidth+scrollOffset);
 					treePanel.innerCt.setWidth(totalWidth);
					});  
			
			
		}
		
		
		function resizeTreePanelHeaderWithDarConhec(treePanel){
			
			treePanel.on("resize", function(Ccontainer, Cwidth, Cheight) {						
				
				var scrollOffset = 19;		// offset for scroll bar, if needed
				var selectColumn = 68;		//segunda coluna(seleccionar) tem tamanho fixo
				var darConhecColumn = 98;	//terceira coluna(dar conhecimento) tem tamanho fixo
				var titleColumn = Cwidth - scrollOffset - (selectColumn + darConhecColumn);//primeira coluna 
								
				var widths = [titleColumn, selectColumn, darConhecColumn];
 				for (var i = 0; i < widths.length; i++) {
  					Ext.select("div.x-tree-hd:nth-child(" + (i+1) + ")", false, "*TreeID*").setWidth(widths[i]);
					Ext.select("div.x-tree-col:nth-child(" + (i+1) + ")", false, "*TreeID*").setWidth(widths[i]);
					treePanel.columns[i].width = widths[i];
  				}

 				treePanel.headers.setWidth(Cwidth);
 				treePanel.innerCt.setWidth(Cwidth);
 				
			});
			
		}