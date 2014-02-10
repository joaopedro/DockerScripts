<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.forms.expandir" var="expandir" />
<fmt:message key="ipdms.forms.colapsar" var="colapsar" />
<fmt:message key="ipdms.forms.fechar" var="fechar" />
<fmt:message key="ipdms.forms.reset" var="reset" />
<fmt:message key="ipdms.forms.submit" var="submit" />
<fmt:message key="ipdms.forms.removeAll" var="removeAll" />
<fmt:message key="ipdms.forms.selectAll" var="selectAll" />
<fmt:message key="ipdms.guichetadmin.noticia.list.titulo" var="titulo" />
<fmt:message key="ipdms.forms.select" var="select" />

(function(){ 
///////////////  BOTOES   ///////////////////

	var expandir = newButton('${expandir}',function(){expandeTodos(tree);});
			
	var colapsar = newButton('${colapsar}',function(){colapseTodos(tree);});

	var fechar   = newButton('${fechar}',function(){fecharWin(${param.window});});      

	var limpar   = newButton('${reset}',function(){alteraParent('','',winchoose,'${param.valuePlaceOlder}','${param.descPlaceOlder}');});

	var submeter = newButton('${submit}',function(){alteraParentMultiple(winchoose,'${param.valuePlaceOlder}','${param.descPlaceOlder}');});

	var remover  = newButton('${removeAll}',function(){CheckBoxState(false)}); 

	var seleccionar = newButton('${selectAll}',function(){CheckBoxState(true)}); 
	
/////////////////END OF BOTOES//////////////////////


///////////NÓS INICIAIS//////////

	  var rootNodes= new Ext.tree.AsyncTreeNode({

       children: [
      <c:forEach items="${menus}" var="menuguichet" varStatus="i">
       {  text    :"<span onmouseover=this.style.textDecoration='underline'; onmouseout=this.style.textDecoration='none'; >${menuguichet.titulo}</span>",
          id      : ${menuguichet.id},
		 // icon    : "${pageContext.request.contextPath}/images/tree/dhtmlgoodies_folder.gif" ,
          expanded: false 
		//se for para escolher multiplos 
       <c:if test="${not empty multiple}">
              
          , checkbox : {
                       xtype    :'checkbox',                                                                       
                       checked  : false,
                       name     : "menu",
                       value    : "${menuguichet.titulo}",
                       id       : "check_" + ${menuguichet.id}
                       },
          uiProvider :'col'//escolher novo user interface
        </c:if>
  
       }
       <c:if test="${!i.last}">,</c:if>
      </c:forEach>
             ]
    });

/////////END OF NÓS INICIAIS////


//////////////LOADER DA TREE//////////////////////

	    treeLoader= new Ext.tree.TreeLoader({url: '${pageContext.request.contextPath}/ajaxListMenuGuichetNode.do2'
		      <c:if test="${not empty multiple}">
      				//associar conteudo ao interface alternativo
                  , uiProviders :{
            	'col'           : Ext.tree.ColumnNodeUI},
            	baseParams      :{'multiple':true}
       		  </c:if>       
			});

/////////////END OF LOADER DA TREE////////////////


///////////////TREE PANEL///////////////

      <c:if test="${empty multiple}">
      var	  tree =  new Ext.tree.TreePanel({
      </c:if>
      <c:if test="${not empty multiple}">
      var	  tree  =  new Ext.tree.ColumnTree({
      </c:if>
			  id          : 'treeP',
			  header      : true,
			  width       : 510,
			  height      : 350,
              autoScroll  : true,
              animate     : true, 
              loader      : treeLoader,
              rootVisible : false,
              border      : false,
              layout      : 'fit',
		     <c:if test="${not empty multiple}"> 
              columns      : [{
                              header    : '${titulo}',
                              width     : 485
                              },{
                              header    :'${select}',
                              width     :65     ,
							  resizable : false                      
                            }],
             </c:if>   
		      bbar        : [
		      				'->'
		      				<c:if test="${not empty multiple}">
		      				,submeter
		      				</c:if>,
		      				fechar,
		      				limpar
		      				],
			  root        : rootNodes  
		});

/////////////END OF TREE PANEL/////////////
			

////////////EVENTOS DA TREEPANEL////////////////
			
			//se for para escolher apenas um node
            <c:if test="${empty multiple}">
              tree.on('click', function(node,el){
	    	   affectParent(node.id,node.text,winchoose,'${param.valuePlaceOlder}','${param.descPlaceOlder}');
	    		});				                                             		             
            </c:if>
			//se for para escolher multiplos nodes
			<c:if test="${not empty multiple}">
			tree.on('click',function(node,el){
				if($("check_"+node.id).checked)
					$("check_"+node.id).checked=false;
				else
					$("check_"+node.id).checked=true;
			});				
			</c:if>

//////////END OF EVENTOS DA TREEPANEL/////////////		


//////////PANEL QUE RECEBE O TREEPANEL////////////

	fpanel = new Ext.Panel({
						border:false,
						id    : 'fpan',
					 	layout:'fit',
						tbar  :[expandir,
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
	resizeTreePanelHeader(tree);
 </c:if>
///////////END OF AUMENTAR COLUNA TITULO///////////////////////////////
 
return fpanel;

})();