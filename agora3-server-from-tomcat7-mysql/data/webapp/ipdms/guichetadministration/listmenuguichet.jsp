<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/ipdms/themes" />
<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
 

<!-- EXT CODE -->
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/column-tree.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/ColumnNodeUI.css" />
<!-- alterar botoes das toolbars -->
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/CustomToolbar.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/CustomStatusBar.css" />
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ColumnNodeUI.js"></script>
<script src="${JS_DIR}/ext/ExtContentIPDMS/CustomStatusBar.js"></script> 

<c:set var="actionName" value="MenuGuichet" />
<c:set var="bundleName" value="Menus Guichet" />

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.forms.expandir" var="expandir" />
<fmt:message key="ipdms.forms.colapsar" var="colapsar" />
<fmt:message key="ipdms.guichetadmin.menu.criarNovo" var="criarNovo" />
<fmt:message key="ipdms.forms.eliminar" var="eliminar" />
<fmt:message key="ipdms.guichetadmin.menu.eliminar.aviso" var="aviso" />
<fmt:message key="ipdms.guichetadmin.menu.eliminar.aviso.msg" var="avisoMsg" />
<fmt:message key="ipdms.forms.expandiu" var="expandiu" />
<fmt:message key="ipdms.forms.colapsou" var="colapsou" />
<fmt:message key="ipdms.guichetadmin.noticia.list.titulo" var="titulo" />
<fmt:message key="ipdms.guichetadmin.menu.statusBar.msg" var="statusBarMsg" />

<script type="text/javascript">
	Ext.onReady(function(){


	///////////BOTOES///////////
		
		//expandir nos
		var expandir= new Ext.Button({

			text    :'${expandir}',
			handler : function(){tree.expandAll();}
		});
		//colapsar nos
		var colapsar= new Ext.Button({

			text    :'${colapsar}',
			handler : function(){tree.collapseAll();}
		});

		var criar = new Ext.Button({

			text    :'${criarNovo}',
			//icon    :'${pageContext.request.contextPath}/images/icon/icon-criarNovo.png',
			handler: function(){window.location='editMenuGuichet.do2';}

			});
		
		//remover menus
		var remover= new Ext.Button({

				id        : "remover",
				text      :'${eliminar}',
				//icon      :'${pageContext.request.contextPath}/images/icon/icon-lixo.png',
				listeners :{
		    			click:{fn:function(btn){
		        			Ext.MessageBox.confirm('${aviso}', '${avisoMsg}',function(btn){
			    	    	    if (btn=='yes'){		    	        
		    	        		$('menuGuichetForm').action='deleteMulti${actionName}.do2'; 
		    	    			$('menuGuichetForm').submit();}
		    	        	});
		    	        	}
		    			}
			    			}
			});

		
		//arvore de nós inicial//	
		var root= new Ext.tree.AsyncTreeNode({
			
			title    :'inicio',
			id       :'0',
			
			
			//filhos//
	    	children : [
						<c:forEach items="${menus}" var="menuguichet" varStatus="i">
	                	 {
	                	  //singleClickExpand:false,
	                	  //eventos para expandir e colapsar nós
	                	  listeners  :{
	        				 			expand  :{fn:function(node){
					 					
					 					var sb=Ext.getCmp('infoarea');
					 					sb.setStatus({
					 					    text   : ' ${expandiu} ${menuguichet.titulo}',
					 					    iconCls: 'ok-icon',
					 					    clear  : true // auto-clear after a set interval
					 					});
					 					}
	        						 },
						 				collapse:{fn:function(node){
						 					
						 					var sb=Ext.getCmp('infoarea');
						 					sb.setStatus({
						 					    text   : ' ${colapsou} ${menuguichet.titulo}',
						 					    iconCls: 'ok-icon',
						 					    clear  : true // auto-clear after a set interval
						 					});
						 					}
		        						 }},     				
		                  title     :"${menuguichet.titulo}",
		                  id        : ${menuguichet.id},
			              checkbox  : {
		                	  			 xtype     :'checkbox',
		                	  			 listeners :{
		                	  		 
					 				  			check:{fn:function(node){
			 				  							alert("ihia")}
			  											}
							         				},		  						          		  
			                          	 checked   : false,
			                         	 name      : "menu",
			                         	 value     : ${menuguichet.id},
			                         	 id        :${menuguichet.id}
			                          },
	                	  expanded   : false,
	                	  uiProvider :'col'
	                	 // cls        :'master-task',
	                	    	                	  }
	                	 <c:if test="${!i.last}">,</c:if>
	                	 
	                	</c:forEach>
	               		 ]
			});
		
		var loadtree=new Ext.tree.TreeLoader({
	    
	        //este parametro é responsavel por ir buscar os child nodes de cada parent node quando este é expandido
	        //é enviado um parametro para o request com o nome node="id do node"
	        dataUrl     : '${pageContext.request.contextPath}/ajaxListMenuGuichet.do2',         
	        uiProviders :{
	        'col'       : Ext.tree.ColumnNodeUI
	    }
	    }
	    );
		
		//Tree Panel
	    var tree = new Ext.tree.ColumnTree({
			border      : false,
	        rootVisible : false,//n mostrar root node
	        autoScroll  : true,
	   		header      : true,//necessário para o resize
	        columns     : [    //colunas
	              {header    :'${titulo}',
	               width     :520,
	               dataIndex :'title'
	          },{
	               header    :'${eliminar}',
	               width     :60                      
	        			 }
 			 			 ], 
	       //carregar ui da arvore e introduzir novos nos       
	       loader      : loadtree,
			//bottom bar
	       bbar        : new Ext.ux.StatusBar({
		        id            : 'infoarea',
		        //valores por defeito a usar quando os status é limpo/apagado
		        defaultText   : '${statusBarMsg}',
		        defaultIconCls: 'default-icon',
		        //valores de inicio
		        text          : '${statusBarMsg}',
		        iconCls       : 'ready-icon',
		        items         : [" ",remover ]
		    }),
			//root node(s)    		    	  
	       root        : root
	    });
		
	    tree.on('click', function(node,el){
	    	$('menuGuichetForm').action= 'edit${actionName}.do2?menuId='+node.id; 
	    	$('menuGuichetForm').submit();
	    }, this); 


		//panel para mostrar tool bar(top)//
	    fpanel = new Ext.Panel({	        
	        title       : '${bundleName}', 
	        border      :true,
	    	width       : 600,
	        height      : 300,
	        renderTo    : 'tree-div', 
			id          : 'fpan',
			layout      :'fit',
			tbar        :[expandir,
					      colapsar,
					      '->',criar
					      <c:if test="${not empty multiple}">
					       ,seleccionar,
					       remover
					  	  </c:if>]
					    });
	    
		//adcionar componente treepanel 
		fpanel.add(tree);

		
	});


	
</script>
<script type="text/javascript">	
	document.title = '${productName} - <fmt:message key='ipdms.guichetadmin.menu.titulo' />';	 
</script>
<div class="row" style="padding-top:0px; text-align:left;">
	<table border="0" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1"><fmt:message key='ipdms.guichetadmin.menu.titulo' /></td>
		  </tr>
		</tbody>
	</table>					
</div>
<br />

<c:if test="${mensagem != null}">
<div class="center">
<script>
Ext.onReady(function(){
	var sbmessage=Ext.getCmp('infoarea');
					 sbmessage.setStatus({
					 		    text   : '${mensagem}',
					 		    iconCls: 'ok-icon',
					 		    clear  : true // auto-clear after a set interval
					 					});
});
</script>
</div>
</c:if>

<form action="/editMenuGuichet" method="post" class="form" name="menuform" id="menuGuichetForm">
 	<div id="tree-div"></div>			
</form>