<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

(function(){
 
   var expandir = newButton('Expandir nós',function(){expandeTodos(tree);});
         
   var colapsar = newButton('Colapsar nós',function(){colapseTodos(tree);});
   
   var fechar   = newButton('Fechar',function(){fecharWin(${param.window});});      
   
   var limpar   = newButton('Limpar',function(){alteraParent('','',winchoose,'${param.valuePlaceOlder}','${param.descPlaceOlder}');});
   
   var remover  = newButton('Remover todos',function(){CheckBoxState(false)}); 
   
   var seleccionar = newButton('Seleccionar todos',function(){CheckBoxState(true)}); 
   
   var gravar = newButton('Gravar',function(){     
     alteraParentMultiple(winchoose,'${param.valuePlaceOlder}','${param.descPlaceOlder}');
	 parseElement('${param.descPlaceOlder}','');
   });
      
   
   var rootNodes;
   <c:if test="${param.tipo == '1'}">
   		rootNodes= new Ext.tree.AsyncTreeNode({
      		children: [
      			<c:forEach var="inst" items="${elements}" varStatus="i">
			         {text : '${inst.designacao}', 
			          id   : '${inst.id.numeroConteudo}'
			          <c:if test="${param.multiple == 'true'}">
			            ,checkbox : {
			               xtype    :'radio',                                                                      
			               checked  : false,
			               name     : 'val',
			               value    : '${inst.designacao}',
			               id       : 'check_${inst.id.numeroConteudo}'
			            },
			            uiProvider :'col'
			          </c:if>
			          
			         }<c:if test="${!i.last}">,</c:if>
      			</c:forEach>]
   		});
   </c:if>
   
   <c:if test="${param.tipo == '2'}">
   	rootNodes= new Ext.tree.AsyncTreeNode({
      children: [<c:forEach var="inst" items="${elements}" varStatus="i">
         {text : '${inst.descricao}', 
          id   : '${inst.id.numeroConteudo}'
          <c:if test="${param.multiple == 'true'}">
            ,checkbox : {
               xtype    :'radio',                                                                      
               checked  : false,
               name     : 'val',
               value    : '${inst.descricao}',
               id       : 'check_${inst.id.numeroConteudo}'
            },
            uiProvider :'col'
          </c:if>
         }<c:if test="${!i.last}">,</c:if>
      </c:forEach>]
   });
   </c:if>

   
   var actionTreeLoader = 'ajaxBuscarNodeNivel.do2?method=buscarNodeNivel';
   <c:if test="${param.tipo == '2'}">
      actionTreeLoader = 'ajaxBuscarNodesValores.do2?method=buscarNodesValores';
   </c:if>  
   <c:if test="${param.multiple == 'true'}">
      actionTreeLoader += '&multiple=true'
   </c:if>
   
   
   var treeLoader = new Ext.tree.TreeLoader({url: actionTreeLoader
      <c:if test="${param.multiple == 'true'}">
         , uiProviders :{
            'col'           : Ext.tree.ColumnNodeUI},
            baseParams      :{'multiple':true}
      </c:if>
   });


   var title = 'Descrição';
   var select = 'Seleccionar';
   var tree;
   <c:choose>
      <c:when test="${param.multiple == 'true'}">
         tree  =  new Ext.tree.ColumnTree({
      </c:when>
      <c:otherwise>
         tree =  new Ext.tree.TreePanel({
      </c:otherwise>
   </c:choose>
      id          : 'treeP',
      <c:if test="${empty param.multiple || param.multiple == 'false'}">
      	title	  : title,
      </c:if>
      header      : true,
      width       : 510,
      height      : 350,
      autoScroll  : true,
      animate     : true, 
      loader      : treeLoader,
      rootVisible : false,
      border      : false,
      layout      : 'fit',
      <c:if test="${param.multiple == 'true'}"> 
         columns      : [{
            header    : title,
            width     : 465
            },{
            header    : select,
            width     :65     ,
            resizable : false                      
         }],
       </c:if> 
      bbar        : [
                  '->',
                  fechar,
                  limpar
                  <c:if test="${param.multiple == 'true'}"> 
                  ,gravar
                  </c:if>
                  ],
      root        : rootNodes  
   });
   

   <c:if test="${empty param.multiple || param.multiple == 'false'}">
      tree.on('click', function(node,el){
         <c:choose>
            <c:when test="${param.parent == 'N'}">
               document.getElementById('${param.valuePlaceOlder}').value = node.id;
               document.getElementById('${param.descPlaceOlder}').value = node.text;
               ${param.window}.close();
            </c:when>
            <c:otherwise>
               parent.document.getElementById('${param.valuePlaceOlder}').value = node.id;
               var descEl = parent.document.getElementById('${param.descPlaceOlder}');
               if(descEl) {
					if(descEl.tagName == 'SPAN') {
						descEl.innerHTML = node.text;
					} else {
						descEl.value = node.text;
					}
			   }
               parent.${param.window}.close();
            </c:otherwise>
         </c:choose>
      });                                                                            
   </c:if>


   fpanel = new Ext.Panel({
      border:false,
      id    : 'fpan',
      layout:'fit',
      tbar  :[expandir, colapsar,
                        '->'
                        <c:if test="${param.multiple == 'true'}"> 
                         ,seleccionar,
                         remover
                        </c:if>
                        ]
   });
   
   fpanel.add(tree);
   
   <c:if test="${param.multiple == 'true'}">
   		resizeTreePanelHeader(tree);
   </c:if>
   
    
   return fpanel;

})();