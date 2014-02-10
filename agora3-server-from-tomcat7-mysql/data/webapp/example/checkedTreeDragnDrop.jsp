<%@ taglib prefix="html" uri="/tags/html"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"%>
<%@ taglib prefix="nested" uri="http://struts.apache.org/tags-nested"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<LINK href="${JS_DIR}/ext/resources/css/ext-all.css" rel="stylesheet" type="text/css" />
<script src="${JS_DIR}/ext/ext-base.js" type="text/javascript" ></script>
<script src='${JS_DIR}/ext/ext-all-debug.js' type="text/javascript"></script>



<script type="text/javascript">

//function to check/uncheck all the child nodes.
/*function toggleCheck(node,isCheck)
{
 if(node)
 {
 var args=[isCheck];
 node.cascade(function(){
 c=args[0];
 this.ui.toggleCheck(c);
 this.attributes.checked=c;
 },null,args);
 }
}*/

/*
function checkAllSiblings(node){
	var parent=node.parentNode;
	if(!parent) return; //parent doesnt exists.
	toggleCheck(parent,true)
	}
*/

///////////////
//dummy data///
///////////////
//add specific attributes like size and date for each type//
var rootNodes={
		expanded: true,
		children: [{
		    text: 'Classificação 1', 
		    cls     : 'cls',
		    children: [{
		        text    : 'Ficheiro1',
		        //leaf: true,
		        cls     :'file',
		        checked : false,
		        children:[{
					text     :'volume1',
					checked  : false,
					cls      :'vol',
					children :[{
						text     :'documento1',
						leaf     : true,
						checked  : false,
						size     :'45',
						date     :'12-12-98',
						cls      :'doc'},
						{
						text     :'documento2',
						leaf     : true,
						checked  : false,
						cls      :'doc'}]
			        },{
			        text     :'volume2',
					checked  : false,
					cls      :'vol',
					children :[]
				        }]
		    },{
		        text     : 'Ficheiro2',
		        cls      :'file',
		        checked  : false,
		        children :[{
					text     :'volume1',
					checked  : false,
					cls      :'vol',
					children :[{
						text     :'documento1',
						leaf     : true,
						checked  : false,
						cls      :'doc'},
						{
						text     :'documento2',
						leaf     : true,
						checked  : false,
						cls      :'doc'}]
			        },{
			        text     :'volume2',
					checked  : false,
					cls      :'vol',
					children :[]
				        }]
		    },{
		        text: 'Ficheiro3',
		        cls:'file',
		        leaf: false,
		        children: [],
		        checked: false
		    }]
		},{
		    text: 'Classificação 2',
		    cls: 'cls',
		    children: [{
		        text    : 'Ficheiro4',
		        //leaf: true,
		        cls     :'file',
		        checked : false,
		        children:[{
					text     :'volume1',
					checked  : false,
					cls      :'vol',
					children :[{
						text     :'documento1',
						leaf     : true,
						checked  : false,
						cls      :'doc'},
						{
						text     :'documento2',
						leaf     : true,
						checked  : false,
						cls      :'doc'}]
			        },{
			        text     :'volume2',
					checked  : false,
					cls      :'vol',
					children :[]
				        }]
		    },{
		        text     : 'Ficheiro5',
		        cls      :'file',
		        checked  : false,
		        children :[{
					text     :'volume1',
					checked  : false,
					cls      :'vol',
					children :[{
						text     :'documento1',
						leaf     : true,
						checked  : false,
						cls      :'doc'},
						{
						text     :'documento2',
						leaf     : true,
						checked  : false,
						cls      :'doc'}]
			        },{
			        text     :'volume2',
					checked  : false,
					cls      :'vol',
					children :[]
				        }]
		    },{
		        text: 'Ficheiro6',
		        cls:'file',
		        leaf: false,
		        children: [],
		        checked: false
		    }]
		},{
		    text: 'Classificação 3', 
		    cls: 'cls',
		    children: [{
		        text    : 'Ficheiro7',
		        //leaf: true,
		        cls     :'file',
		        checked : false,
		        children:[{
					text     :'volume1',
					checked  : false,
					cls      :'vol',
					children :[{
						text     :'documento1',
						leaf     : true,
						checked  : false,
						cls      :'doc'},
						{
						text     :'documento2',
						leaf     : true,
						checked  : false,
						cls      :'doc'}]
			        },{
			        text     :'volume2',
					checked  : false,
					cls      :'vol',
					children :[]
				        }]
		    },{
		        text     : 'Ficheiro8',
		        cls      :'file',
		        checked  : false,
		        children :[{
					text     :'volume1',
					checked  : false,
					cls      :'vol',
					children :[{
						text     :'documento1',
						leaf     : true,
						checked  : false,
						cls      :'doc'},
						{
						text     :'documento2',
						leaf     : true,
						checked  : false,
						cls      :'doc'}]
			        },{
			        text     :'volume2',
					checked  : false,
					cls      :'vol',
					children :[]//all nodes must have this property even with not children. otherwise dd wont work
								
				        }]
		    },{
		        text: 'Ficheiro9',
		        cls:'file',
		        leaf: false,
		        children: [],
		        checked: false
		    }]
		}]
			};


Ext.onReady(function(){

	///////////////////////////////////
	//template for details panel body//
	///////////////////////////////////
	 var pnlBody='Drop node here for Details';
	    var tpl=new Ext.Template('<p class="">{0}</p>');
	    tpl.compile();

	//////////////////////////////////////
	//button to remove all checked nodes//
	//////////////////////////////////////
	var buttonRemoveCheckedNodes=new Ext.Button({
		text   :'Remove Checked Nodes',
		handler:function(){
			var chkNodes=tree.getChecked();
		    for(var i=0;i<chkNodes.length;i++){
				chkNodes[i].remove();
			    }
		}});
	//////////////////////////////
	//button to expand all nodes//
	//////////////////////////////
	var buttonExpandAll=new Ext.Button({
		text   :'Expand All Nodes',
		handler:function(){
			tree.expandAll();
		   			    
		}});
	/////////////////
	//new TreePanel//
	/////////////////
	var tree = new Ext.tree.TreePanel({
        	  id          : 'treeCheck',
        	  region      : 'center',
			  //header      : true,
			  //title       : 'Arvore',
			  width       : 240,
              autoScroll  : true,
              animate     : true,
              enableDD    : true,
              ddScroll    : true,
              ddGroup     : 'classic',
              useArrows   : true,
              ddAppendOnly: true,
              rootVisible : false,
              containerScroll: true,
              border      : false,
        	  root        : rootNodes,
        	  contextMenu : new Ext.menu.Menu({
   	    	   items         	: [{
     						 		itemId : 'delete-node',
     						 		text   : 'Delete Node'
 					  				},{
 					  		 		itemId : 'info',
 					  		 		text   : 'Dados Ficheiro'
 					  				}],
  		  	   listeners   		: {
      					  			itemclick: function(item) {
           							switch (item.itemId) {
             					 			 case 'delete-node':
             				     					var n = item.parentMenu.contextNode;
             				      					if (n.parentNode) {n.remove();}
                  		 							break;
             					 			 case 'info':
													var n= item.parentMenu.contextNode;
													new Ext.Window({
														title:'Informação/Detalhes',
														closable:true,
														bodyStyle  : 'padding: 10px',
														html:'<div>Tamanho:'+n.attributes.size+'</div></br><div>Data:'+n.attributes.date+'</div>'}
													).show();

              					 			 		break;
                 									  }		
      					  }
   					}
			}),
		 /////////////////////
		 //listenener events//
		 /////////////////////
   		 listeners: {
      			 contextmenu: function(node, e) {
			//Register the context node with the menu so that a Menu Item's handler function can access
			//it via its parentMenu property.
           					node.select();
          					var c = node.getOwnerTree().contextMenu;
         					c.contextNode = node;
           					c.showAt(e.getXY());
           		   ///////////////////////////////////////////////////
      			 },//check/uncheck childnodes when checking one node//
      			   ///////////////////////////////////////////////////
      			 checkchange: function(n, checked){
          			 		if(n.attributes.checked!=false) 
                  				n.expand();
     	                //	n.expandChildNodes(true);
     	                	n.eachChild(function(child){
     	                		child.ui.toggleCheck(checked);
     	                    		child.fireEvent('checkchange', child, checked);
     	                	})
     	           ///////////////////////////
   				 },//node drag'n drop config//
   				   ///////////////////////////
   				 nodedragover: function(nodeConf){
   	   				 var a=0;
   	   				 //cancel node drop according to these rules
   	   				 switch(nodeConf.dropNode.attributes.cls){
   	   				 	case 'doc'  :	
   	   	   				 			if(nodeConf.target.attributes.cls!='vol')
   	   	   	   				 			nodeConf.cancel=true;
	   	   	   				 			//a=1;
										break;
   	   				 	case 'vol'  :
   	   				 				if(nodeConf.target.attributes.cls!='file')
	   	   				 				nodeConf.cancel=true;
   	   				 					break;
   	   				 	case 'file' :
   	   				 				if(nodeConf.target.attributes.cls!='cls')
	   	   				 				nodeConf.cancel=true;
   	   				 					break;
   	   				 	case 'cls'  :	
   	   	   				 			nodeConf.cancel=true;
   	   				 					break;

   	   				 		}
   				 		if(a==1)nodeConf.cancel=true;
   	   				 },
					//////////////////////////////////////////////
   	   				//tree event for server side updates EXAMPLE//
   	   				//////////////////////////////////////////////
   	   				 beforenodedrop: function(dropEvent){
   	   					var req= Ext.Ajax.request({
   	   	                 method : 'POST',
   	   	                 params : {
   	   	                      		Dragged  :dropEvent.dropNode.id,
   	   	                      		NewParent:dropEvent.target                            
   	   	                      	},
   	   	                 scope  : this,
   	   	                 url    : 'http://localhost:8080/IPDMSWeb',//testing url
   	   	                 success: function(response, opts){                      		
	    	   	                	dropEvent.target.expand();
   	    	   	            		dropEvent.target.appendChild(dropEvent.dropNode);
   	    	   	            		Ext.MessageBox.alert('Status','O nó '+dropEvent.dropNode.text+' foi adicionado ao nó '+dropEvent.target.text+' com sucesso!');           		
   	    	   	            		dropEvent.dropStatus=true; 
   	   	                         	},
   	   	                 failure: function(response,opts){   	   	                         
  	    	   	                 	Ext.MessageBox.alert('Status','Ocorreu um problema ao mover o nó!');
  	    	   	               		dropEvent.dropStatus=false;
  	    	   	                 }
   	   	             }); 
      	   	        dropEvent.cancel=true;     //cancelar sempre, uma vez que ajax é assincrono o controlo é feito no sucess/failure.
      	   	   		dropEvent.dropStatus=true; //controla animacao do fail drop 
      	   	   		return false;
   	   				//return false;//like this?
   					},
   					beforeremove: function(tree,parent, node){   
   	   								//alert("for some reason this gets reached in dragn drop");
   	   								return false;
   	   								}
    },
    tbar:[buttonRemoveCheckedNodes,buttonExpandAll]//toolbar buttons//

    });

	
	new Ext.Panel({
		title   : 'Dragn Drop check tree nodes',
		renderTo: 'test',
		layout  : 'border',
		width   : 500,
		height  : 500,
		items   : [tree, new Ext.Panel({
					region     : 'east',
					id         : 'details-panel',
					autoScroll : true,
					split      : true,
					width      : 240,
					border     : false,
					html       : pnlBody,
					baseCls    : 'x-box-mc',
					bodyStyle  : 'padding: 10px; background-color: #FFFFFF'
		
			})]
				

		});

	var detailsPanel= Ext.getCmp('details-panel');
	var pnlDropTargetEl= detailsPanel.body;
	///////////////////////////////////////////////////
	//create drop Target for displaying info on nodes//
	///////////////////////////////////////////////////
	var pnlDropTarget = new Ext.dd.DropTarget(pnlDropTargetEl,
			{
				ddGroup   :'classic',
				copy      : false,
				////////////////////////////////////////////////
				//while dragging in the drop zone change color//
				////////////////////////////////////////////////
				notifyEnter : function(ddSource, e, data) {
					//Add some flare to invite drop.
					detailsPanel.body.stopFx();
					detailsPanel.body.highlight("E7E8E9");
				},
				////////////////////////////////////////////////////////////////////////////
				//when dropping in the target zone refresh node content data to panel body//
				////////////////////////////////////////////////////////////////////////////
				notifyDrop: function(ddSource, e, data){
						
							var el= detailsPanel.body;
							//write node attributes by
							tpl.overwrite(el,['Tipo   :' +data.node.attributes.cls  + '</br>'+
											  'Nome   :' +data.node.attributes.text + '</br>'+
											  'Parent :' +data.node.parentNode.attributes.text + '</br>'+
											  'Data   :' +data.node.attributes.date + '</br>'+
											  'Tamanho:' +data.node.attributes.size
											  ]);
							return true;
		
				}
		});
	
   //tree.getRootNode().expand(true);

}); 	

</script>

<div id='test'></div>