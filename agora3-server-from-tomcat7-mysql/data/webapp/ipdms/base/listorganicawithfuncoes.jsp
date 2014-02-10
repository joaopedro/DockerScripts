<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:message key='ipdms.forms.expandir' var='expandir'/>
<fmt:message key='ipdms.forms.colapsar' var='colapsar'/>
<fmt:message key='ipdms.forms.fechar' var='fechar'/>
<fmt:message key='ipdms.forms.submit' var='submit'/>
<fmt:message key='ipdms.forms.removeAll' var='removeAll'/>
<fmt:message key='ipdms.forms.selectAll' var='selectAll'/>
<fmt:message key='ipdms.conteudos.titulo' var='titulo'/>
<fmt:message key='ipdms.forms.select' var='select'/>
<fmt:message key='ipdms.forms.expandSelectNodes' var='expandSelectNodes'/>

(function(){

	expandToggleCheck=function(node,checked){
	 
	 //expand child nodes and change checkbox state
	 node.expand(true,true,function(node){                           
                     node.eachChild(function(child){
                      if(typeof(child.attributes.checkbox)!="undefined"){
                     	child.attributes.checkbox.checked=checked;
                     	Ext.getDom('check_sel'+child.attributes.id).checked=checked;
     					}
     					if (!child.getUI().checkbox) {
                            child.getUI().fireEvent('checkchange', child, checked);
                           }
                        if(child.hasChildNodes()){
                            expandToggleCheck(child,checked);
                           }
                               })
                      });
	 
	 }
 	 expandChildren= function(id){
 	
 		n = tree.getNodeById(id);
 		//check true or false the parent node and check all children
 		if(!n.isExpanded())	
 			expandToggleCheck(n,true);
 		else{
 			expandToggleCheck(n,false);
 			n.collapse(true,true);
 		}
     	}     	
    
	   
///////////////  BOTOES   ///////////////////

	var expandir = newButton('${expandir}',function(){expandeTodos(tree);});
			
	var colapsar = newButton('${colapsar}',function(){colapseTodos(tree);});

	//var fechar   = newButton('Fechar',function(){fecharWin(${param.window});});
	var fechar   = newButton('${fechar}',function(){alteraParent('','',winchoose,'${param.valuePlaceOlder}','${param.descPlaceOlder}');});

	//var limpar   = newButton('Limpar',function(){alteraParent('','',winchoose,'${param.valuePlaceOlder}','${param.descPlaceOlder}');});

	var submeter = newButton('${submit}',function(){
		//alteraParentMultiple(winchoose,'${param.valuePlaceOlder}','${param.descPlaceOlder}'); 
		//parseElement('${param.descPlaceOlder}','');
		
		<c:if test="${darConhecimento}">
			affectParentMultipleDarConhecimento('check_sel', '${param.valuePlaceOlder}','${param.descPlaceOlder}');
			affectParentMultipleDarConhecimento('check_darconhec', '${param.valuePlaceOlderDConhec}','${param.descPlaceOlderDConhec}');
			parseElement('${param.descPlaceOlder}','');
			parseElement('${param.descPlaceOlderDConhec}','');
			winchoose.close();
		</c:if>
		
		<c:if test="${!darConhecimento}">
			alteraParentMultiple(winchoose,'${param.valuePlaceOlder}','${param.descPlaceOlder}');
			parseElement('${param.descPlaceOlder}','');
		</c:if>	
	
	});

	var remover  = newButton('${removeAll}',function(){CheckBoxState(false)}); 

	var seleccionar = newButton('${selectAll}',function(){CheckBoxState(true)}); 

/////////////////END OF BOTOES//////////////////////


/////////////////NOS INICIAIS//////////////////////


		var rootNodes= new Ext.tree.AsyncTreeNode({

	        children: [
	    	<c:forEach items="${elements}" var="elemento" varStatus="i">
	    	 {text:"${elemento.designacao}",
	          id: ${elemento.id},
	    	 expanded: false    	
			<c:if test="${not empty multiple}">
			 ,uiProvider :'col'//escolher novo user interface    	
			</c:if>	 
	    	 }
	    	 <c:if test="${!i.last}">,</c:if>
	    	</c:forEach>
	   		 ]
	    });

//////////////END OF NOS INICIAIS/////////////////


//////////////LOADER DA TREE//////////////////////

	    //carregar novos nos
	    treeLoader= new Ext.tree.TreeLoader({url: '${pageContext.request.contextPath}/ajaxListOrganicaWithFuncoesNode.do2'
	    	<c:if test="${not empty multiple}">
	    	//associar conteudo ao interface alternativo
	      		, uiProviders :{
	        	'col'       : Ext.tree.ColumnNodeUI},
	        	baseParams      :{'multiple':true, 'selectedids':'${selectedids}', 'darConhecimento':'${darConhecimento}'}
	        </c:if>   
	        });

/////////////END OF LOADER DA TREE////////////////


/////////////TREEPANEL///////////////////////////
	    <c:if test="${empty multiple}">
		  tree =  new Ext.tree.TreePanel({
		</c:if>

		<c:if test="${not empty multiple}">
		  tree  =  new Ext.tree.ColumnTree({
		</c:if>
				id          : 'treeP',
				header      : true,
		        width       : 580,
		        height      : 380,
		        autoScroll  : true,
		        loader      : treeLoader,
		        rootVisible : false,
		        border      : false,
		        layout      : 'fit',
		        <c:if test="${not empty multiple}"> 
		        columns     : [{
			        		   	header    : '${titulo}',
		                       	width     : 395		                       
		                       },{
		                        id: "col_sel",
		                       	header    : '${select}',
		                       	width     : 65,
		                       	renderer  : function (value, metadata, record){
		                       		return String.format ('<div class="col-move-top" title="${expandSelectNodes}" style="z-index:10000;width:16px; height:16px;top:auto;visibility:visible;" id="{1}" ' +
		                       		' onclick="expandChildren({1})" alt="description"></div>', record, record.id);
		                       	}                              
		                       }
		                      	<c:if test="${darConhecimento}">
                            	  ,{
                              		id		: "col_darconhec",	
                              		header  : 'Dar Conhecimento',
                              		width   : 98
                              	 	}
                              	</c:if>		                      
		                      ],
		        </c:if>
			    bbar       : [	
			      		      '->',
			      		    <c:if test="${not empty multiple}">
			      		      submeter,
			      		    </c:if>
							  fechar					
					    	 ],					    	 
		        root 	   : rootNodes
		      
		    });     

////////////////////END OF TREEPANEL/////////////////


////////////EVENTOS DA TREEPANEL////////////////

		    // Instantiate the tree panel, then attach an event listener..
			<c:if test="${empty multiple}">	
			   	 tree.on('click', function(node,el){
				 if(node.isLeaf()){
				 	affectParent(node.id,node.text,winchoose,'${param.valuePlaceOlder}','${param.descPlaceOlder}');
				 	affectParent(node.id,node.text,winchoose,'${param.valuePlaceOlderDConhec}','${param.descPlaceOlderDConhec}');
				 }
		    	  
		    });

		   	</c:if>
		   <c:if test="${not empty multiple}">
			tree.on('click',function(node,el){
				chckbox=$("check_sel"+node.id);
				if(chckbox!=null){
				 	if(chckbox.checked)
						chckbox.checked=false;
					else
						chckbox.checked=true;
					}
			});				
			</c:if>

//////////END OF EVENTOS DA TREEPANEL/////////////


//////////PANEL QUE RECEBE O TREEPANEL////////////
	  fpanel = new Ext.Panel({
						border:false,
						id    : 'fpan',
						layout:'fit',
						tbar:[expandir,
			  				 colapsar,
			  				 '->'
			  				 <c:if test="${not empty multiple}">
			  				 ,seleccionar,
			  				 remover
			  				 </c:if>]});
  	  fpanel.add(tree);
	
/////////END OF PANEL QUE RECEBE O TREEPANEL////////


////////EVENTO PANEL-AUMENTAR COLUNA TITULO QDO WINDOW É REDIMENSIONADA////////

 <c:if test="${not empty multiple}">
	//garantir que colunas sejam redimensionaveis ao aumentar e diminuir tamanho da window
	<c:if test="${darConhecimento}">
 	 	resizeTreePanelHeaderWithDarConhec(tree);
 	 </c:if>
	 <c:if test="${!darConhecimento}">
 	 	resizeTreePanelHeader(tree);
 	 </c:if>
 </c:if>

///////////////END OF AUMENTAR COLUNA TITULO////////////	
	
return fpanel;


})();

