<%@ page contentType="text/html; charset=iso-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



(function(){


///////////////////NOMES  DAS COLUNAS E GRID ///////////////

		//Barra de status com mensagem inicial
		var mainStatus= "Escolha o(s) grupo(s).";

		//Titulo do gridPanel 
		var titledisp='Gestão de Grupos';

		//Titulos das colunas(1)
		var headerCol1='Grupo';
		var headerCol2='Descrição';
		
///////////////FIM DOS NOMES DAS COLUNAS E GRID////////////


//////////////////  BOTOES   //////////////////////

		
	  //fechar janela
       var fechar   = newButton('Fechar',function(){fecharWin(${param.window});});

      //limpar campo de organica parent
      var limpar   = newButton('Limpar',function(){alteraParent('','',winchoose,'${param.valuePlaceOlder}','${param.descPlaceOlder}');});	

      var submeter = newButton('Submeter',function(){alteraParentMultipleGrid(Grid,winchoose,'${param.valuePlaceOlder}','${param.descPlaceOlder}');});

	  var remover  =  newButton('Remover todos',function(){gridCheckBoxState(Grid,false);});

	  var seleccionar  =  newButton('Seleccionar todos',function(){gridCheckBoxState(Grid,true);});
			

/////////////////END OF BOTOES//////////////////////


////////////////DADOS DINAMICOS DA GRID//////////////////////

		 var reader = new Ext.data.ArrayReader({}, [
                                                   {name: 'name'},
                                                   {name: 'descricao'},
                                                   {name: 'id'}
                                                ]);

		//Dados
		  var elemDisp =  [
							<c:forEach items="${elements}" varStatus="i" var="elemento">
								[ 
								'${elemento.titulo}',
 								'${elemento.descricao}',
								${elemento.id}
								]
								     <c:if test="${!i.last}">,</c:if>
								</c:forEach>
						  ]

////////////////FIM DE DADOS DINAMICOS DA GRID//////////////////////


			//Generic fields array to use in  defs.
			  fields = ['name', 'descricao','id'];
			

			  // create the data store
			  GridStore = new Ext.data.GroupingStore({
			    sortInfo:{field:'name', direction:"DESC"},
		   	    fields : fields,
				data   : elemDisp,
				reader : reader
			});


		//selection model based on the checkbox system
		  CheckboxSM = new Ext.grid.CheckboxSelectionModel({header: 'Seleccionar', id: 'check', width: 25, dataIndex:'checkb'});

			
				
		// Column Model shortcut array
		  cols =  new Ext.grid.ColumnModel({ 
				columns: [		         	
					{
		    		 id       : 'name',
		    		 header   : headerCol1,
		    		 width    : 220,
		    		 sortable : true, 
		    		 dataIndex: 'name'},
					{
		    		 id       : 'desc',
		    		 header   : headerCol2, 
		    		 width    : 280, 				
		    		 sortable : true, 
		    		 dataIndex: 'descricao'},
		    		 {
		    		 id       : 'desc2',
		    		 header   : headerCol2, 
		    		 width    : 90, 				
		    		 sortable : true, 
		    		 dataIndex: 'id'},
		    		 CheckboxSM
				],
				defaultSortable: true
				
				});

		// used to add records to the destination stores
		 blankRecord =  Ext.data.Record.create(fields);

		  Grid = new Ext.grid.GridPanel({
			
			id               : 'panelGrupos',
		    store            : GridStore,
		    colModel         : cols,
		    disableSelection : true,  // workaround for bug with grouped headers and fireFn
		    viewConfig       : {
				forceFit: true
			},
		    width            : 600,
		    height           : 350,
			layout           : 'anchor',
 			region           : 'center',
 			 view: new Ext.grid.GroupingView({
                forceFit:true,
                groupTextTpl: '{text} ({[values.rs.length]} {[values.rs.length > 1 ? "Items" : "Item"]})',
                hideGroupedColumn: true,
                startCollapsed: true
            }),
		    sm				 : CheckboxSM,
		    tbar             : [ 		      		      
		                        '->',
		                        '-',		                  
		                        seleccionar,
		                        remover		                  
		    	                ],
		    bbar             : ['->',submeter,fechar,limpar],
		    plugins: [new Ext.ux.plugins.GroupHeaderGrid({
				rows: [
					[//linha 1
						{colspan:1},
						 {header: 'Teste', colspan: 2, align: 'center'},{}
					],
					[//linha 2
						{},
						{},
						{header: 'Antes', colspan: 1, align: 'center'},
						{}//Coluna da Checkbox não deverá pertencer a nenhum subgrupo caso contrário não será possive esconder pelo super grupo.
						
					]
				],
				hierarchicalColMenu: true
			})]
		});

return Grid;


})();

