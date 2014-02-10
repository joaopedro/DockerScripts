<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/ipdms/themes" />
<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" scope="request" />

<!-- EXT CODE -->
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/column-tree.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/ColumnNodeUI.css" />
<!-- alterar botoes das toolbars -->
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/CustomToolbar.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/CustomStatusBar.css" />
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ColumnNodeUI.js"></script>
<script src="${JS_DIR}/ext/ExtContentIPDMS/CustomStatusBar.js"></script> 

<c:set var="bundleName" scope="request"><tiles:getAsString name="bundlename" /></c:set>
<c:set var="actionName" scope="request"><tiles:getAsString name="actionname" /></c:set>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.forms.expandir" var="expandir"/>
<fmt:message key="ipdms.forms.expandiu" var="expandiu"/>
<fmt:message key="ipdms.forms.colapsar" var="colapsar"/>
<fmt:message key="ipdms.forms.colapsou" var="colapsou"/>
<fmt:message key="ipdms.forms.eliminar" var="eliminar"/>
<fmt:message key="ipdms.organica.eliminar.aviso" var="eliminarAviso"/>
<fmt:message key="ipdms.organica.eliminar.aviso.msg" var="eliminarMsg"/>
<fmt:message key='ipdms.forms.inactivo' var="inactivo"/>
<fmt:message key='ipdms.conteudos.titulo' var="titulo"/>
<fmt:message key='ipdms.organica.statusBar.msg' var="statusBarMsg"/>
<fmt:message key='ipdms.forms.ajuda' var="ajuda"/>
<fmt:message key='ipdms.forms.ocultarAjuda' var="ocultarAjuda"/>

<script type="text/javascript">

/*botoes*/
	
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
	
	//remover escolhas
	var remover= new Ext.Button({
	
			id        : "remover",
			text      :'${eliminar}',
			listeners :{
	    			click:{fn:function(btn){
	        			Ext.MessageBox.confirm('${eliminarAviso}', '${eliminarMsg}',function(btn){
		    	    	    if (btn=='yes'){		    	        
	    	        		$('listFormBean').action='deleteMulti${actionName}.do2'; 
	    	    			$('listFormBean').submit();}
	    	        	})}
					}
			}
	});

	//arvore de nós inicial//	
	var root= new Ext.tree.AsyncTreeNode({
		
		title    :'inicio',
		id       :'0',
		
		
		//filhos//
    	children : [
                	<c:forEach items="${listFormBean.elementos}" var="elemento" varStatus="i">
                	 {
                	  //singleClickExpand:false,
                	  //eventos para expandir e colapsar nós
                	  listeners  :{
        				 			expand  :{fn:function(node){
				 					
				 					var sb=Ext.getCmp('infoarea');
				 					sb.setStatus({
				 					    text   : '${expandiu} ${elemento.titulo}',
				 					    iconCls: 'ok-icon',
				 					    clear  : true // auto-clear after a set interval
				 					});
				 					}
        						 },
					 				collapse:{fn:function(node){
					 					
					 					var sb=Ext.getCmp('infoarea');
					 					sb.setStatus({
					 					    text   : '${colapsou} ${elemento.titulo}',
					 					    iconCls: 'ok-icon',
					 					    clear  : true // auto-clear after a set interval
					 					});
					 					}
	        						 }},     				
	                  title     :"${elemento.titulo}<c:if test='${!elemento.active}'> <i>(${inactivo})</i></c:if>",
	                  id        : ${elemento.id},
		              checkbox  : {
	                	  			 xtype     :'checkbox',
	                	  			 listeners :{
	                	  		 
				 				  			check:{fn:function(node){
		 				  							alert("ihia")}
		  											}
						         				},		  						          		  
		                          	 checked   : false,
		                         	 name      : "org",
		                         	 value     : ${elemento.id},
		                         	 id        :${elemento.id}
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
        dataUrl     : '${pageContext.request.contextPath}/show${actionName}Node.do2',         
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
                      
        }], 
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
	        items         : [" "<c:if test="${!IPDMSInteropReceiver}">,remover</c:if>]
	    }),
		//root node(s)    		    	  
       root        : root
    });
	
    tree.on('click', function(node,el){
    	$('listFormBean').action= 'edit${actionName}.do2?id='+node.id; $('listFormBean').submit();
    }, this); 


</script>
<tiles:get name="fpanelfragment" />
<script type="text/javascript">	
	document.title = '${productName} - <fmt:message key="ipdms.gestao.de" /> <fmt:message key="ipdms.${bundleName}.designacaoplural" />';	 
</script>

<div id="ver_ajuda" class="row"
	style="padding-top: 0px; text-align: left;">
<table style="border: none" cellpadding="0" cellspacing="0"
	class="headings">
	<tbody>
		<tr>
			<td class="titulo1"><fmt:message key="ipdms.gestao.de" />&nbsp;<fmt:message key="ipdms.${bundleName}.designacaoplural" /></td>
			<td style="width:1.75em; vertical-align: top; text-align: center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('s');" class="cursorMao" alt="${ajuda}" title="${ajuda}" /></td>
		</tr>
	</tbody>
</table>
</div>
<div id="ajuda" class="info"
	style="padding-top: 0px; display: none; text-align: left;">
<table style="border: none" cellpadding="0" cellspacing="0"
	class="headings">
	<tbody>
		<tr>
			<td class="titulo1"><fmt:message key="ipdms.gestao.de" />&nbsp;<fmt:message key="ipdms.${bundleName}.designacaoplural" /></td>
			<td style="width:1.75em; vertical-align: top; text-align: center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('n');" class="cursorMao" alt="${ocultarAjuda}" title="${ocultarAjuda}" /></td>
		</tr>
	</tbody>
</table>

<fmt:message key="ipdms.organica.gestao.help" />

<!-- ul>
	<li>Para <b>adicionar</b> um(a) <bean:message
		key="ipdms.${bundleName}.designacaosingular" locale="locale" />,
	carregue no botão <bean:message key="ipdms.forms.criar" locale="locale" />;
	</li>
	<li>Para <b>modificar</b> um(a) <bean:message
		key="ipdms.${bundleName}.designacaosingular" locale="locale" />,
	carregue no seu nome;</li>
	<li>Para <b>eliminar</b> <bean:message
		key="ipdms.${bundleName}.designacaoplural" locale="locale" />,
	seleccione a checkbox nas linhas de dados respectivas e carregue no
	botão <bean:message key="ipdms.forms.eliminar" locale="locale" />.</li>
</ul -->
</div>

<div id="MensagemErro"><html:errors /></div>

<form action="/delete${actionName}.do2"  method="post" class="form" id="listFormBean">
<div class="alignLeft">
	<div class="left">
		<img src="${pageContext.request.contextPath}/images/icon/icon-criarNovo.png" onclick="$('listFormBean').action='edit${actionName}.do2';$('listFormBean').submit();" class="cursorMao" alt="<fmt:message key="ipdms.forms.criar"/>" title="<fmt:message key="ipdms.forms.criar"/>" />
	</div>
	<div class="right">
		<div class="texto"><a href="#" onclick="$('listFormBean').action='edit${actionName}.do2';$('listFormBean').submit();" title="<fmt:message key="ipdms.forms.criar"/>"> <fmt:message key="ipdms.forms.criar"/></a></div>
	</div>
</div>
	<c:choose>
	  <c:when test="${not empty listFormBean.elementos}">
		
	   <div id="tree-div"></div>
	  </c:when>
	  <c:otherwise>
  		<p class="formlabel" style="padding-left: 20px"><fmt:message key="ipdms.organica.empty.msg" /></p>
	  </c:otherwise>
	</c:choose>
	
	<!-- br />
	<div class="buttonRow"><input type="submit" class="btForm"
		value="<bean:message key="ipdms.forms.criar" locale="locale"/>"
		onclick="this.form.action='edit${actionName}.do2'; this.form.submit();">
	</div-->
</form> 

