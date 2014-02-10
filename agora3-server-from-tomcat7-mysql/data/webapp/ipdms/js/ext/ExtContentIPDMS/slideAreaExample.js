
///////////////////////////////////
//get current time year and month//
///////////////////////////////////
var currentTime = new Date();
var month = currentTime.getMonth() + 1;
var year = currentTime.getFullYear();

///////////////////
//month names -PT//
///////////////////
var m_names = new Array("Janeiro", "Fevereiro", "Março", 
		"Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", 
		"Outubro", "Novembro", "Dezembro");


menuItemsYearsForward = [];
menuItemsYearsRewind = [];

//forward anim
function slideFwd(){
	var el=arguments;
	var selcEl=Ext.select(".x-slide-zone-area");//get element by class name
	selcEl.slideOut('l', {
  	duration: .2,
  	easing  : 'easeOut',
  	callback: function(){
  		if(typeof el[0]=='number')
  			slideZone.forwardX(el[0],el[1])
  		else
  			slideZone.forwardX()
  		},
		remove  : false}).slideIn('r',{duration: .2, easing: 'easeIn',afterStyle:'width:240px',useDisplay: true});
	Ext.select('.label-x').highlight('E8E8E9',{endColor:'ffffff',duration: .7});	
};

//rewind anim
function slideBack(){
	var el=arguments;
	var selcEl=Ext.select(".x-slide-zone-area");//get element by class name
	selcEl.slideOut('r', {
  	duration: .2,
  	easing  : 'easeOut',
  	callback:function(){
			if(typeof el[0]=='number')
				slideZone.rewindX(el[0],el[1]);
			else 
				slideZone.rewindX();},
		remove  : false}).slideIn('l',{duration: .2/*, easing: 'easeIn'*/});
	Ext.select('.label-x').highlight('E8E8E9',{ endColor:'ffffff',duration: .7});
};








////////////////////////////////////////////////////////////////////
//load menu items with date values according with current interval//
////////////////////////////////////////////////////////////////////
function yearButtonValues(){
	
	initF=arguments[0]+12;
	lastF=arguments[1]+12;
	initR=arguments[0]-12;
	lastR=lastR=arguments[1]-12;

	//clear array with years first before creating new//
	menuItemsYearsForward.clear();
	menuItemsYearsRewind.clear();
	
	for(i=0; i <12; i++){			
	
		itemForward = {
				text    : (initF+1)+'-'+lastF,//add 1 to initF value since the first value shouldnt appear//
				values  : [initF,lastF],
				handler : function(){
							slideFwd(this.values[0],this.values[1]);}
							
			   };
		itemRewind = {
				text    : (initR+1)+'-'+lastR,
				values  : [initR,lastR],
				handler : function(){
							slideBack(this.values[0],this.values[1]);}
			   };

		//configure the item icon class so that in case there's any area it will be marked with the icon.
		Ext.each(slideZone.sliders.items,function(item,index,allItems){
			if (item.value[0][0]>=itemForward.values[0] && item.value[0][1] <=itemForward.values[1])
			   itemForward.iconCls="x-menu-item-arrow";
			   else if(item.value[0][0]>=itemRewind.values[0] && item.value[0][1] <=itemRewind.values[1])
			   itemRewind.iconCls="x-menu-item-arrow";
			;},this);
		initF=initF+12;//initial Forward Date
		lastF=lastF+12;//final  Forward Date
		initR=initR-12;//initial rewind date
		lastR=lastR-12;//final rewind date
		menuItemsYearsForward.push(itemForward);
		menuItemsYearsRewind.push(itemRewind);

		}
}
	
function showAreaSlider(){
	
	////////////////////////////////////////
	//butoes Ext para criar e apagar areas//
	////////////////////////////////////////
	var newArea = new Ext.Button({text:'Nova Area',handler: function(){slideZone.create();}});

	var cleanAreas = new Ext.Button({text:'Remover Areas',handler: function(){slideZone.removeAll();}});


	//////////////////////////////////////////////////////////////
	//butoes para avancar/retroceder nos valores da labelX(anos)//
	//////////////////////////////////////////////////////////////
	var forward=new Ext.Button({iconCls:'x-tbar-page-next',
								handler:slideFwd});
							
	var plusForward=new Ext.Button({
		iconCls: 'x-tbar-page-last',
		handler: function(){
			return new Ext.menu.Menu({
	     		 itemId : 'forwardYears',floating:true,
	     		 items  : menuItemsYearsForward
						}).show(this.el);	
			}	
		});

	var rewind=new Ext.Button({iconCls:'x-tbar-page-prev',
							   handler: slideBack});
	var plusRewind=new Ext.Button({
		iconCls: 'x-tbar-page-first',
		handler: function(){
			return new Ext.menu.Menu({
	      	itemId : 'rewindYears',floating:true,
	      	items  :menuItemsYearsRewind
						}).show(this.el);	
			}	
		
		});
			///////////////////////
			////Slide Zone Area////
			///////////////////////
			slideZone = new Ext.ux.SlideZone({  
				type               : 'area',
				size               : [240,240],//divide these area px values by the number of values for each orientation (240/12=20 for the snap)
				sliderWidth        : 240,
				sliderHeight       : 240,
				///////////////////////////////////////////////////
				//Configure size with max and min values in mind///
				///////////////////////////////////////////////////
				maxValue           : [year,m_names.length],
				minValue           : [year-12,0],
				sliderSnap         : [20,20],//incremental jump while dragging
				allowSliderCrossing: true,
				labels             : true,
				maxNumberAreas     : 10,
				buttons            : true
				 });

		  //////////////////
		  ///// Panel //////
		  //////////////////
		 var myPanel = new Ext.Panel({
			header   : true,
			layout   :'absolute',
			tbar     : [newArea],
			bbar     : [cleanAreas,'->',plusRewind,rewind,'Anos',forward,plusForward],
			//title    : "Area Sliders",
			items:[slideZone]
			//renderTo : 'zone3'
			
		});		
			yearButtonValues(slideZone.minValue[0],slideZone.maxValue[0]);

			/////////////////////
			//set size of panel//
			/////////////////////
			myPanel.setWidth((slideZone.size[0])+1+((slideZone.labels)?slideZone.labelyValue:0));
			myPanel.setHeight(slideZone.size[1]+1+slideZone.labelxValue+80);

			
			

///////////////////////////
//information Area Panel//
///////////////////////////
var myPanel2= new Ext.Panel({
	title:'Areas criadas:',
	layout: 'fit',
	autoHeight:true,
	html:'<div id="Pesquisar" style="padding:2px"></div>'
	});


var win = new Ext.Window({
	//animateTarget:document.body,
	title: "Area Sliders",
	draggable:true,
	width    : slideZone.size[0]+slideZone.labelxValue+15,
	resizable:false,
	shadow   :true,
//	modal    :true,
	border   :true,
	collapsible:true,
	//floating :true,
	items    :[myPanel,myPanel2]
});


	win.show();
	win.doLayout();
	
	////////////////////////////////////////////////////////////////////////////////////
	//eventos da window caso seja movida ou expandida, actualizar posicao da slideZone//
	////////////////////////////////////////////////////////////////////////////////////
	win.on('expand',function(win,x,y){
		 slideZone.el.lowLimit = slideZone.el.getXY();
     	 slideZone.el.highLimit = [slideZone.el.getRight(), slideZone.el.getBottom()];
		 slideZone.updateConstraints();
		});	
	win.on('move',function(win,x,y){
		 slideZone.el.lowLimit = slideZone.el.getXY();
      	 slideZone.el.highLimit = [slideZone.el.getRight(), slideZone.el.getBottom()];
		 slideZone.updateConstraints();
		});	
	/////////////////
	//limpar window//
	/////////////////
	win.on('beforeclose', function( p ) { 
		slideZone.destroy();
		win = null;
	});
	win.setPosition(600,200);
	
	

}