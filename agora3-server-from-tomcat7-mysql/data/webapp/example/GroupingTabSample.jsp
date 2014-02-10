<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<LINK href="${JS_DIR}/ext/resources/css/ext-all.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/GroupTab.css" />

<script src="${JS_DIR}/ext/ext-base.js" type="text/javascript" ></script>
<script src='${JS_DIR}/ext/ext-all.js' type="text/javascript"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/GroupTab.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/GroupTabPanel.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ConfirmCancel.js"></script>


<script type="text/javascript">
Testes = '<p>Testes para HTML.</p>';

//criar IFrame para carregar paginas completas//


var grid;

var action = "${pageContext.request.contextPath}/listEntidadeSimplePopup.do2?method=showPopup";
	action += "&idEntidade=ecra1.entidadeId";
	action += "&nomeEntidade=entidade_nome";
	action += "&nifEntidade=entidade_nif";
	action += "&window=parent.winchoose";

Ext.onReady(function() {

	Ext.Ajax.request({
		url       : "ajaxListGrupos.do2",
		method    : 'post',
		scripts   : true,
		params    : "valuePlaceOlder=idGrupos&descPlaceOlder=grupos",		 			 	
		success   : function(response) {

		//adicionar componentes EXT- treepanel, panels...etc....
		 grid=response.responseText;      	
	}
	});
	
	//iframe para inserir paginas dinamicas
	Ext.ux.IFrameComponent = Ext.extend(Ext.BoxComponent, {
		onRender : function(ct, position){
		this.el = ct.createChild({tag: 'iframe', id: 'iframe-'+ this.id, frameBorder: 0, src: this.url});
		}
		});
	
	Ext.QuickTips.init();
    
    // create some portlet tools using built in Ext tool ids
    var tools = [{
        id:'gear',
        handler: function(){
            Ext.Msg.alert('Message', 'The Settings tool was clicked.');
        }
    },{
        id:'close',
        handler: function(e, target, panel){
            panel.ownerCt.remove(panel, true);
        }
    }];

	

    var viewport = new Ext.Viewport({
    	  layout: 'border',
    	  renderTo: Ext.getBody(),
    	  items: [
    	    	  
    	 {
    	   region: "north",
    	   height:40,
  		   xtype : 'toolbar',
  		   items: [{
    	   	xtype: 'tbspacer'
  			},{
    		xtype  : 'splitbutton',
    		text   : 'Menu',
    		menu   : new Ext.menu.Menu({
    	        items: [
    	        	// these items will render as dropdown menu items when the arrow is clicked:

    		        {text: 'Item 1',menu   : new Ext.menu.Menu({items: [{text:'subitem 1'},{text:'subitem 2'}]}), handler: function(btn){alert(btn.text);}},
    		        {text: 'Item 2', handler: function(btn){alert(btn.text);}}
    	        ]
    	   	})
    		//handler: function(btn){btn.disable();}*/
  			},{
    	    xtype: 'tbfill'}
    	    ]},
  		// more toolbar items here //]
    	  /*{
    	    region: 'west',
    	    xtype: 'panel',
    	    split: true,
    	    width: 200,
    	    html: 'West'
    	  },*/
    	  {
        	region     : 'center',
            xtype      : 'grouptabpanel',
      		tabWidth   : 136,
      		activeGroup: 0,  		
      		items: [{
      			//mainItem: 0,
      			items: [
                  {
                      autoScroll:true,
                     // xtype: 'portal',
                      title     : 'Orgânicas',
                      tabTip    : 'Orgânicas disponiveis',
                      items:[{
                          columnWidth:.33,
                          style      :'padding:10px 0 10px 10px',
                          items    :[{
                              title : 'Grid in a Portlet',
                              layout:'fit',
                              tools : tools,
                             // items: new SampleGrid([0, 2, 3])
                              html: Testes
                          },{
                              title: 'Painel 1',
                              tools: tools,
                              html : Testes
                          }]
                      },{
                          columnWidth:.33,
                          style:'padding:10px 0 10px 10px',
                          items:[{
                              title: 'Painel 2',
                              tools: tools,
                              html: Testes
                          },{
                              title: 'Painel 3',
                              tools: tools,
                              html : "Nome: <input type='text'/>"
                          }]
                      },{
                          columnWidth:.33,
                          style:'padding:10px',
                          items:[{
                              title: 'Painel 4',
                              tools: tools,
                              html : Testes
                          },{
                              title: 'Painel 5',
                              tools: tools,
                              html : Testes
                          }]
                      }]                    
                  }]
              }, {
                  mainItem:1,
                  expanded: true,
                  items: [{
                      title  : 'Configuração',
                      iconCls: 'x-icon-configuration',
                      tabTip : 'Configuration tabtip',
                      style  : 'padding: 10px;',
                      html   : "<div>hello</div>" 
                  }, {
                      title  : 'Processos',
                      iconCls: 'x-icon-templates',
                      tabTip : 'Templates tabtip',
                      style  : 'padding: 10px;',
                      html: Testes
                  }]
              }, {
                 // mainItem:0,
                  expanded: true,
                  items: [{
                      title  : 'Entidades',
                      iconCls: 'x-icon-configuration',
                      tabTip : 'Configuration tabtip',
                      style  : 'padding: 10px;',
                      layout:'fit',
                      items  : [{
  							xtype: 'tabpanel',
  							activeTab: 0,
  							items: [{
  								 title: 'Grupos',
  								 html: "<div>1-Colaborador</div>"
  									},{
  								 title: 'Entidades',
  								 layout:'fit', 
  								 items :[new Ext.ux.IFrameComponent({ id: 'teste', url: action})]}]	
  							}]	
                      
                  }]
              },{
                  mainItem:1,//super
                  expanded: true,
                  items: [{
                      title  : 'Grupos',
                      iconCls: 'x-icon-configuration',
                      tabTip : 'Configuration tabtip',
                      style  : 'padding: 10px;',
                      html   : "<div>hello2</div>" 
                  },{
                  	title  : 'Super',
                      iconCls: 'x-icon-configuration',
                      tabTip : 'Configuration tabtip',
                      style  : 'padding: 10px;',
                      html   : "<div>hello</div>" 

                      }]
              }]
    	  },/*{
    	    region: 'east',
    	    xtype: 'panel',
    	    split: true,
    	    width: 200,
    	    html: 'East'
    	  },*/{
    	    region: 'south',
    	    xtype: 'panel',
    	    height: 40,
    	    bbar: ['->',new Ext.Button({
        	    text:'Fechar',
        	    handler: function(){parent.winchoose.close();}
            	    }),'-']
    	  }]
    	});
    
	
});

</script>
<body>


</body>
</html>