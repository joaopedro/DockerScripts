<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:message key="ipdms.conteudos.titulo" var="titulo" />
<fmt:message key="ipdms.forms.criar" var="criar" />
<fmt:message key="ipdms.forms.eliminar" var="eliminar" />
<fmt:message key="ipdms.dimensoes.valor.valores" var="valoresDimensionais" />
<fmt:message key="ipdms.dimensoes.criar.novoValor" var="novoValor" />
<fmt:message key="ipdms.organica.eliminar.aviso" var="aviso" />
<fmt:message key="ipdms.dimensoes.eliminar.valores.msg" var="eliminarValoresMsg" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />
<fmt:message key="ipdms.dimensoes.eliminar.valores.errorTitle" var="errorTitle" />
<fmt:message key="ipdms.dimensoes.eliminar.valores.errorMsg" var="errorMsg" />

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />

<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/column-tree.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/CustomToolbar.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/ColumnNodeUI.css" />
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ColumnNodeUI.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/Window_Iframe.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ext-all.js"></script>

<script type="text/javascript">

var tree;

Ext.onReady(function(){

	var rootNodes= new Ext.tree.AsyncTreeNode({

			title    :'inicio',
			id       :'0',
	       	children: [
			<c:forEach items="${elements}" varStatus="i" var="elemento">
				{
					text       : "${elemento.descricao}",
					id         : "${elemento.id.numeroConteudo}",
					levelMax   : "${numNiveisMax}",
					height	   : 23,
					expanded   : false,
					img		   : {
                       				xtype   :'img',                                                                       
                       				name    : "val",
                       				src		: "${pageContext.request.contextPath}/images/icon/icon-criarNovo.png",
                       				href	: "${pageContext.request.contextPath}/ajaxEditValorDimensional.do2?method=prepare"
                 				},
    				checkbox   : {
         	           				xtype  	:'checkbox',         	  	  						          		  
                       				checked	: false,
                       				name   	: "val",
                       				value  	: "${elemento.id.numeroConteudo}",
                       				id     	: "${elemento.id.numeroConteudo}"
                 				},
					uiProvider :'col'
				}
 				<c:if test="${!i.last}">,</c:if>
			</c:forEach>
	      ]
	    });

	
	var treeLoader =new Ext.tree.TreeLoader({	    
		dataUrl: '${pageContext.request.contextPath}/ajaxListValorDimensionalNode.do2',
		uiProviders :{
        			'col': Ext.ux.tree.ColumnParamNodeUI}
		    });
	
	tree = new Ext.tree.ColumnTree({
		header      : true,
        useArrows:true,
        autoScroll:true,
        animate:true,
        enableDD:true,
        containerScroll: true,
        rootVisible: false,
        loader: treeLoader,
        root: rootNodes,
        columns	: [{
  		  		header    :'${titulo}',
        		width     :441,
        		height	  :30
        		},{
        		header    :'${criar}',
        		width     :70,
        		height	  :30					                                 
        		},{
            	header    :'${eliminar}',
            	width     :70,
            	height	  :30					                                 
            	}]
       	<c:if test="${!IPDMSInteropReceiver}">
				,bbar    : [
   		      	'->',
   		      	'<div style="padding-right:25px"><img src="${pageContext.request.contextPath}/images/icon/icon-lixo.png" class="cursorMao" onclick="eliminarValores();" alt="${eliminar}" title="${eliminar}" /></div>'
   		      	]
       	</c:if>
    });


//////////PANEL QUE RECEBE O TREEPANEL////////////

	fpanel = new Ext.Panel({
        
        title       : '${valoresDimensionais}', 
        border      :true,
        width       : 600,
        height      : 400,
    	renderTo    : 'tree-div', 
		id    : 'fpan',
		layout:'fit',
		tbar:['<div class="alignLeft" style="width:90%"><div class="left" style="width:30px;"><img src="${pageContext.request.contextPath}/images/icon/icon-criarNovo.png" onclick="createNode(0,0);" class="cursorMao" alt="${novoValor}" title="${novoValor}" /></div><div class="right" style="width:100px;"><div class="texto"><a href="#" onclick="createNode(0,0);">${novoValor}</a></div></div></div>']});
	 
  	fpanel.add(tree);

/////////END OF PANEL QUE RECEBE O TREEPANEL////////
	
    //tree.getRootNode().expand(true);
          
});

function eliminarValores() {
	Ext.MessageBox.show({

		title:'${aviso}', 
		msg:'${eliminarValoresMsg}',
		buttons:{yes:'${sim}', no:'${nao}'},
		fn:function(btn){
	    if (btn=='yes'){		    	        
			var valores = document.getElementsByName("val");
			var length = valores.length;
			var parametros = "valores=";
			var hasValores = false;
			
    		for(var i = 0; i < length; i++) {
				if(valores[i].checked) {
					if(!hasValores)
						parametros+=valores[i].value;
					else
						parametros+=","+valores[i].value;
					hasValores = true;
    				//alert(parametros);
				}
    		}
    		if(hasValores) {
    			
    			var myAjax = new Ajax.Request(
    					"deleteValoresDimensionais.do2",
    					{method: 'post', parameters: parametros, onSuccess: function(transport) {
    						//Criamos um novo Root Node sem filhos
    						var root = new Ext.tree.TreeNode({
    						    			title    :'inicio',
    						    			id       :'0',
    						    	       	children: []
    						            });
							if(transport.responseText != '' && transport.responseText.indexOf('errorMessage') != -1) {
								Ext.MessageBox.alert('${errorTitle}', 
													'${errorMsg}'); 
							}
    						//Colocando o render a false, obrigamos a que a arvore seja carregada novamente ao fazer o setRootNode
    						root.render = false;
    				    	tree.setRootNode(root);
    				    	tree.expandAll();
        					}}
    				);
    		}
    	}
	}});
}



function editNode(id, depth){
	var action = "${pageContext.request.contextPath}/ajaxEditValorDimensional.do2";
	action += "?method=prepare";
	action += "&nodeId="+id;
	action += "&nivel="+depth;
	action += "&window=winchoose";

	winValorDim = ExtWindowSizeParam('${valoresDimensionais}',
			action,
			'',
			'html',
			380, //width
			250	 //height
			);

	winValorDim.on('close', function( p ) { 

		//Criamos um novo Root Node sem filhos
		var root = new Ext.tree.TreeNode({
		    			title    :'inicio',
		    			id       :'0',
		    	       	children: []
		            });

		//Colocando o render a false, obrigamos a que a arvore seja carregada novamente ao fazer o setRootNode
		root.render = false;
    	tree.setRootNode(root);

		tree.expandAll();
	       });
       
	winValorDim.show();
}

function createNode(id, depth) {

	var action = "${pageContext.request.contextPath}/ajaxEditValorDimensional.do2";
	action += "?method=prepare";
	action += "&nodeId="+id;
	action += "&nivel="+depth;
	action += "&create=true";
	action += "&window=winchoose";

	winValorDim = ExtWindowSizeParam('${valoresDimensionais}',
			action,
			'',
			'html',
			380, //width
			250	 //height
			);

	winValorDim.on('close', function( p ) { 

		//Criamos um novo Root Node sem filhos
		var root = new Ext.tree.TreeNode({
			title    :'inicio',
			id       :'0',
	       	children: []
        });

		//Colocando o render a false, obrigamos a que a arvore seja carregada novamente ao fazer o setRootNode
		root.render = false;
		tree.setRootNode(root);			

		tree.expandAll();
	});
       
	winValorDim.show();

} 

</script>
<br/>
<div id="tree-div"></div>
