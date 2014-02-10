/**
 * Class Ext.ux.SlideZone

 * @author Jared Gisin - Improvements by J.Rossa and J.T.Riley
 * @version $Id: Ext.ux.SlideZone.js 93 2007-12-12 04:41:40Z jaredgisin $
 * @license http://www.opensource.org/licenses/mit-license.php
 * 
 * TODO: make sure slider limits work when snap = 1 or snap < slider width/height
 * TODO: API to dynamically modify the snap 
 * TODO: zone with slider zone responds to click and keypress
 * TODO: API to programatically set slider value with animation
 *
 */

//Ext.QuickTips.init();

var numberAreas=0;

function menus(e,target){
	
	e.stopPropagation();//stop the zone area right click event to be initialized//
	e.preventDefault();	//avoid the browser default right-click event//
	this.menu.show(this.areaEl);
	
}
//get mouse position for showing menu accordingly//
function getPosition(e) {
    e = e.browserEvent || window.event;
      var cursor = {x:0, y:0};
    if(e)
    if (e.pageX || e.pageY) {
        cursor.x = e.pageX;
        cursor.y = e.pageY;
    }
    else {
        cursor.x = e.clientX +
            (document.documentElement.scrollLeft ||
            document.body.scrollLeft) -
            document.documentElement.clientLeft;
        cursor.y = e.clientY +
            (document.documentElement.scrollTop ||
            document.body.scrollTop) -
            document.documentElement.clientTop;
    }
    return cursor;
}

Ext.ux.SlideZone = function(config) {
	this.addEvents({"move" : true});
    Ext.apply(this, config);
    Ext.ux.SlideZone.superclass.constructor.call(this);
};

Ext.extend(Ext.ux.SlideZone, Ext.BoxComponent, {
	size               : 100,
	sliderSnap         : [0],
	type               : 'horizontal',
	sliderWidth        : 20,
	sliderHeight       : 20,
	cls                : null,
	minValue           : 0,
	maxValue           : 100,
	allowSliderCrossing: false,
	value              : null,
	labels             : false,
	labelxValue        : 65,//div el width size in px
	labelyValue        : 65,//div el width size in px
	maxNumberAreas     : 2,
	divLogArea         : 'Pesquisar',
	sliders            : [],
	onRender           : function(ct,position) {
		//size and min/max Values
		Ext.ux.SlideZone.superclass.onRender.call(this,ct,position);
		this.size       = this.size instanceof Array ? this.size : [this.size];
		this.minValue   = this.minValue instanceof Array ? this.minValue : [this.minValue];
		this.maxValue   = this.maxValue instanceof Array ? this.maxValue : [this.maxValue];
		this.sliderSnap = this.sliderSnap instanceof Array ? this.sliderSnap : [this.sliderSnap];
		
		if(this.labels)
			this.el.dom.style.cssText='left:'+this.labelyValue+'px;position: relative;';
		else{
			this.labelxValue=0;
			this.labelyValue=0;
			
		}
		this.el.addClass('x-slide-zone-'+this.type);
		this.el.addClass(this.cls);		
		
		switch(this.type) {
			case 'horizontal':
				this.sliderSize = [this.sliderWidth];
				this.el.applyStyles({width:this.size[0] + 'px'});
				this.el.lowLimit = [this.el.getX()];
				this.el.highLimit = [this.el.getRight()];
				break;
							
			case 'vertical':
				this.sliderSize = [this.sliderHeight];
				this.el.applyStyles({height:this.size[0] + 'px'});
				this.el.lowLimit = [this.el.getY()];
				this.el.highLimit = [this.el.getBottom()];
				break;
							
			case 'area':
				var divZone=this;
				
				 menuZone=new Ext.menu.Menu({
			            itemId: 'menuZone',floating:true
			                , items: [
			        		        //{text: 'Expand Area',menu   : new Ext.menu.Menu({items: [{text:'Full '},{text:'subitem 2'}]}), handler: function(btn){alert(btn.text);}},
			        		        {text: 'Remover Areas', handler: function(btn){
			        		        	divZone.removeAll();
			        		        	}},
			        		        {text: 'Nova Area', handler: function(btn){
			        		        	divZone.create();
				        		        }}
			        	        ]
							});
				 
					//right-click menu//
					this.el.on({
						'contextmenu': function(event) {
							//menuZone.hide();
							var variables=getPosition(event);
							var coor=new Array();
							coor[0]=variables.x;
							coor[1]=variables.y;
							menuZone.showAt(coor);
						},
						scope:this,
						preventDefault:true
						});
				//if labels are true, then labels will be shown with the associated values
				if(this.labels){
					//number of fields by subtracting the maxvalue to minvalue
					var numberFieldsx=this.maxValue[0]-this.minValue[0];
					var numberFieldsy=this.maxValue[1]-this.minValue[1];
				
					//initial values
					var initalFieldx=this.minValue[0]+1;
					var initalFieldy=this.minValue[1]+1;
				
					//orientations size
					var sizeX=this.size[0]-1;//240px		
					var sizeY=this.size[1]-1;//240px
							
			
					//label Y orientation//		
					this.labely=Ext.DomHelper.insertBefore(this.el/*scrollingArea*/,{tag: 'div',
						id: Ext.id(), 
						style: 'height: '+(sizeY+this.labelxValue)+'px;width:'+this.labelyValue+'px;z-index:10000'
					 	}, true);
					this.labely.addClass('label-y');		
					
					//label X orientation//
					
					//top value property
					var top=Ext.isIE?-3:sizeX-(sizeX/2+(this.labelxValue/2))+2;		
					//left value property
					
					if(this.labelyValue=='auto')
						alert(this.labely.dom.clientWidth);
					
					var left=/*65*/Ext.isIE?this.labelyValue:this.labely.dom.clientWidth+(sizeX/2)-(this.labelxValue/2);
					this.labelx=Ext.DomHelper.append(this.el.dom.parentNode/*scrollingArea*/,{tag: 'div',
						id: Ext.id(), 
						style: 'left:'+left+'px;top:-'+top+'px;width:'+this.labelxValue+'px;height:'+sizeX +'px; '
						 }, true);		
					this.labelx.addClass('label-x');

					
					//size of div label containers
					this.sliderValuex=this.sliderSnap[0]-1;			
					this.sliderValuey=this.sliderSnap[1]-1;
					
					///////////////////////////
					//Adding label values div//
					///////////////////////////
					//values X orientation//
					for (var i=0; i<numberFieldsx; i++) {
						$(this.labelx.id).innerHTML+='<div class="labelXDiv" style="height:'+(Ext.isIE?this.sliderValuex+1:this.sliderValuex)+'px;border-bottom: 1px solid white"><p align="center">'+initalFieldx+'</p></div>';
						initalFieldx++;
						}
						
					////////////////////////////////////////////////////////////
					//adding label Y the string values instead of numeric ones//
					////////////////////////////////////////////////////////////
					this.labelY(m_names);
				}
				this.sliderSize = [this.sliderWidth, this.sliderHeight];
				this.el.applyStyles({width:this.size[0] + 'px'});
				this.el.applyStyles({height:this.size[1] + 'px'});
				this.el.lowLimit = this.el.getXY();
				this.el.highLimit = [this.el.getRight(), this.el.getBottom()];
				
				this.on('move',function(){
					this.el.lowLimit = this.el.getXY();
					this.el.highLimit = [this.el.getRight(), this.el.getBottom()];
					this.updateConstraints();});
				
				break;
		}

		//normalize width/height for slider centering calculations
		var l = this.sliderSize.length;
		for(var i = 0; i < l; i++) {
			this.sliderSize[i] = this.sliderSize[i] % 2 ? this.sliderSize[i] + 1: this.sliderSize[i];
		}


		var s = this.sliders;
	    this.sliders = new Ext.util.MixedCollection();
	    if(s){
	        this.add.apply(this, s);
	    }

	},
	
	///////////////////////////////////////
	//search areas and respective values //
	///////////////////////////////////////
	searchAreas: function(){
		var procura="Pesquisa nos intervalos de tempo: <br>";
		for(i=0;i<this.sliders.items.length;i++){
			
			firstYear= this.sliders.items[i].value[0][0]+1;
			secondYear=this.sliders.items[i].value[0][1];
			
			firstMonth=m_names[this.sliders.items[i].value[1][0]];
			secondMonth=m_names[this.sliders.items[i].value[1][1]-1];
			
			procura+=" Anos :"+ firstYear + " -> " + secondYear+ " nos meses: "+firstMonth+ " -> " + secondMonth + "<br>";
			
				}
		return procura;	
	},
	
	
	labelX: function(){
		var x = arguments, l = x.length;
		if(this.labels){	
			$(this.labelx.id).innerHTML='';
			for(var i=0;i<l;i++)
				$(this.labelx.id).innerHTML+='<div class="labelXDiv" style="height:'+(Ext.isIE?(this.sliderValuex+1):this.sliderValuex)+'px;border-bottom: 1px solid #999999">'+ x[0][i]+'</div>';;
		}
		},
	
	labelY: function(){
		var y= arguments, l=y[0].length;
		if(this.labels){	
			$(this.labely.id).innerHTML='';
			for(var i=0;i<l;i++)
				$(this.labely.id).innerHTML+='<div class="labelYDiv" style="height:'+(Ext.isIE?this.sliderValuey+1:this.sliderValuey)+'px;">'+ y[0][i]+'</div>';
		}
		},
		
	showHideArea:function(){

			//removeAreas();	
			var items=this.sliders.items;
			
			for(var i=0;i<this.sliders.length;){		

				var area =this.getSlider(items[i].name.toString());
				//se area estiver dentro dos intervalos de tempo anual mostrar
				if(area.value[0][0]>=this.minValue[0] && area.value[0][1]<=this.maxValue[0]){
					//area.setVisible(true);
					area.el.hide();
					this.updateValue(area);
					//areal.el.setOpacity(#453854);
					area.el.setOpacity(.5,true).show({duration: .04});//set argumen value to true  for animation
				}else{//senao esconder
					//area.setVisible(false);
					area.el.hide({duration : .02});
					}
					i++;
				}
			},
	////////////////////////////////////////////////
	//refresh x label while forwarding/rewinding////
	////////////////////////////////////////////////
	refreshX:	function(){
				element=Ext.select(".label-x").elements;
				element[0].innerHTML='';
				//criar label com meses e anos
				var years=year+1;
				for (var i=0; i<12; i++) {
					element[0].innerHTML+='<div class="labelXDiv" style="height:'+ (Ext.isIE?(this.sliderValuex+1):this.sliderValuex)+'px;">'+years+'</div>';
					  years++;
					}
				},
				
	/////////////////////////////////
	//forward x label interval values//
	/////////////////////////////////	
	forwardX: function(){
			
			var x =arguments;//get arguments
			
			var intervalVal=this.maxValue[0]-this.minValue[0];//interval between maxvalue and minvalue(years)
			//if there arguments get this means it will be a specific forward
			if(x.length>1){
				var initVal=x[0];
				var lastVal=x[1];
				this.maxValue=[lastVal,12];
				this.minValue=[initVal,0];
			}else{//otherwise its just a standard forward in x values interval
				this.maxValue=[this.maxValue[0]+intervalVal,12];
				this.minValue=[this.minValue[0]+intervalVal,0];
				//var lastVal=this.maxValue[0];
				var initVal=this.minValue[0];
			}		
			yearButtonValues(this.minValue[0],this.maxValue[0]);
			//Ext.get('ext-gen21').scroll('left',400,true);//attempt to scroll area
			Ext.getDom(this.divLogArea).innerHTML=this.searchAreas();
			
			this.showHideArea();
						
			//refresh x label values
			year=initVal;
			this.refreshX(year);
			},

	///////////////////////////////
	//rewind x label interval values//
	///////////////////////////////
	rewindX :function(){
			
			var x =arguments;//get arguments
			
			var intervalVal=this.maxValue[0]-this.minValue[0];//x interval
						
			if(x.length>1){
				var initVal=x[0];
				var lastVal=x[1];
				this.maxValue=[lastVal,12];
				this.minValue=[initVal,0];
			}else{				
				this.maxValue=[this.maxValue[0]-intervalVal,12];
				this.minValue=[this.minValue[0]-intervalVal,0];
				//var lastVal=this.maxValue[0];
				var initVal=this.minValue[0];
			}	
			yearButtonValues(this.minValue[0],this.maxValue[0]);
			//Ext.get('ext-gen21').scroll('right',400,true);//atempt to scroll area
			Ext.getDom(this.divLogArea).innerHTML=this.searchAreas();

			this.showHideArea();
			//refresh x label values
			year=initVal;
			this.refreshX(year);
			},
			
	 addSlider: function(slider) {
        this.sliders.push(slider);
    },
	
	add: function(){
		var a = arguments, l = a.length;
		for(var i = 0; i < l; i++){
			var el = a[i];
			if (el instanceof Ext.ux.Slider) {
				this.initSlider(el);
				this.sliders.add(el);
			} else if (typeof el == 'object') {
				//initalize new slider and add to the items list
				var s = new Ext.ux.ThumbSlider(el);
				this.initSlider(s);
				this.sliders.add(s);
			}
		}
		if(this.type!='area')
		this.updateValues();
		this.updateConstraints();
 	},
 	//AREA SLIDER FUNCTIONS//
 	///////////////
	//create area//
	///////////////
 	create: function(){
		
 		 if(numberAreas>this.maxNumberAreas-1)
 			 Ext.MessageBox.alert('Aviso', 'Excedeu o nº de Areas!');
 		 else{	
 				rs = new Ext.ux.RangeSlider({
 					value   : [[this.maxValue[0]-4,this.maxValue[0]-2], [month-1,month+3]],
 					name    : numberAreas.toString(),
 					//plugins : new Ext.ux.SliderTip(this),
 					cls     : 'custom_slider_class'});
 				
 				new Ext.ux.SliderTip().init(rs);
 				this.add(rs);
				Ext.getDom(this.divLogArea).innerHTML=this.searchAreas();
 				yearButtonValues(this.minValue[0],this.maxValue[0]);			
 				
				var ssEvts = $A(['mouseover', 'mouseout', 'dragstart', 'drag', 'dragend']);	
				var slideAreaZone=this;
				Ext.each(this.sliders.items,function(item,index,allItems){
					ssEvts.each(				
						function(evt) {			
								item.on(evt, function() {
									Ext.getDom(slideAreaZone.divLogArea).innerHTML=slideAreaZone.searchAreas();
								});
						});	
					},this);
				
				numberAreas++;
 		 	  }
 	},
	////////////////////////
 	//remove specific area//
	////////////////////////
 	remove: function(){
		var a = arguments, l = a.length;
		for(var i = 0; i < l; i++){
			var el = a[i];		
			Ext.getDom(el).getEl().removeAllListeners();
			Ext.getDom(el).getEl().remove();
			this.sliders.remove(el);
			el.destroy();
		}
		numberAreas--;
		//this.updateValues();
		Ext.getDom(this.divLogArea).innerHTML=this.searchAreas();
		this.updateConstraints();
 	},
	////////////////////
 	//remove all areas//
	////////////////////
 	removeAll:function(){
 		
 		var allSliders=this.sliders;
		if(this.sliders)
		for(var i=0;i<this.sliders.length;){		
			var ra =this.getSlider(allSliders.items[i].name.toString());	
			if(ra)
				this.remove(ra);	
			}
		yearButtonValues(this.minValue[0],this.maxValue[0]);
		numberAreas=0;
		Ext.getDom(this.divLogArea).innerHTML='';
		Ext.getDom(this.divLogArea).innerHTML=this.searchAreas();
 		
 		
 	},
	
 	refresh:function(){
 		this.updateValues();
		this.updateConstraints();
 	},
 	
	enableCrossing: function() {
		this.allowSliderCrossing = true;
		this.updateConstraints();
	},
	
	disableCrossing: function() {
		this.allowSliderCrossing = false;
		this.updateConstraints();		
	},
	
	getSlider: function(selector) {
		/* Given a slider index or name, returns a slider object
		 * @selector   slider index|name
		 */
		switch (typeof selector)  {
			case 'number':
				return this.sliders.items[selector];
				break;
				
			case 'string':
				var l = this.sliders.length;
				for(var i = 0; i < l; i++){
					if(this.sliders.items[i].name ==  selector) return this.sliders.items[i];
				}
				break;
		}
	},


	updateConstraints: function() {
		if(!this.allowSliderCrossing && this.sliders.length > 1 && this.type != 'area') {
			// multiple sliders exists and sliders can't cross,
			// so we have to take into account the
			// positions of all sliders
			sortFN = function(a,b){
				var v1 = a.value instanceof Array ? a.value[0] : a.value;
				var v2 = b.value instanceof Array ? b.value[0] : b.value;
	            return v1 > v2 ? 1 : (v1 < v2 ? -1 : 0);
			};
			this.sliders.sort('asc',sortFN);//put in order by their value
			
			var l = this.sliders.length; 
			for (var i=0; i< l; i++) { //forloop required, as we have to get -1 and +1 slider positions
				var leftTravel = 0, rightTravel = 0;
				var sliderL = this.sliders.get(i-1);
				var slider = this.sliders.get(i);
				var sliderR = this.sliders.get(i+1);

				
				if (sliderL && sliderR) {
					if (sliderL instanceof Ext.ux.ThumbSlider) {
						var leftTravel = slider.getTL()[0] - sliderL.getTL()[0] - this.sliderSnap[0];
					}
					if (sliderL instanceof Ext.ux.RangeSlider) {
						var leftTravel = slider.getTL()[0] - sliderL.getBR()[0] - this.sliderSnap[0];					
					}
					if (sliderR instanceof Ext.ux.ThumbSlider) {
						var rightTravel = sliderR.getTL()[0] - slider.getTL()[0] - this.sliderSnap[0];	
					}
					if (sliderR instanceof Ext.ux.RangeSlider) {
						var rightTravel = sliderR.getTL()[0] - slider.getBR()[0] - this.sliderSnap[0] ;							
					}
				} else if(sliderL) {
					if (sliderL instanceof Ext.ux.ThumbSlider) {
						var rightTravel = this.el.highLimit[0] - slider.getTL()[0] - ( 0.5 * this.sliderSize[0]) ;	
						var leftTravel = slider.getTL()[0] - sliderL.getTL()[0] - this.sliderSnap[0];
					}
					if (sliderL instanceof Ext.ux.RangeSlider) {
						var rightTravel = this.el.highLimit[0] - slider.getBR()[0];	
						var leftTravel = slider.getTL()[0] - sliderL.getBR()[0] - this.sliderSnap[0];
					}
				} else if(sliderR) {
					if (sliderR instanceof Ext.ux.ThumbSlider) {
						var leftTravel = slider.getTL()[0] - this.el.lowLimit[0] + ( 0.5 * this.sliderSize[0]);
						var rightTravel = sliderR.getTL()[0] - slider.getTL()[0] - this.sliderSnap[0] ;
					}
					if (sliderR instanceof Ext.ux.RangeSlider) {
						var leftTravel = slider.getTL()[0] - this.el.lowLimit[0];
						var rightTravel = sliderR.getTL()[0] - slider.getBR()[0] - this.sliderSnap[0] ;					
					}
				}
				if(slider instanceof Ext.ux.RangeSlider) {
					slider.resizable.leftTravel = [leftTravel];
					slider.resizable.rightTravel = [rightTravel];
				}
				slider.setConstraint([leftTravel], [rightTravel], this.sliderSnap);
			}
		} else {
			var l = this.sliders.length;
			for (var i=0; i< l; i++) {
				var slider = this.sliders.get(i);
				if (slider instanceof Ext.ux.ThumbSlider ) {
					slider.setConstraint([slider.getTL()[0]-this.el.lowLimit[0]  + ( 1/2 * this.sliderSize[0]),
										  slider.getTL()[1]-this.el.lowLimit[1]  + ( 1/2 * this.sliderSize[1])], 
								[this.el.highLimit[0]- (slider.getTL()[0] + this.sliderSize[0]) + ( 1/2 * this.sliderSize[0]),
								 this.el.highLimit[1]- (slider.getTL()[1] + this.sliderSize[1]) + ( 1/2 * this.sliderSize[1]) ],
								this.sliderSnap);
				}
				if (slider instanceof Ext.ux.RangeSlider) {
					slider.setConstraint([slider.getTL()[0] - this.el.lowLimit[0],
										  slider.getTL()[1] - this.el.lowLimit[1]], 
								[this.el.highLimit[0] - slider.getBR()[0],
								 this.el.highLimit[1] - slider.getBR()[1] ],
								this.sliderSnap);			
				}
			}
		}
	},
	
	updateValues: function() {
		var that = this;
		var vals = {};
		this.sliders.each(function(i) {

			if(this.type == 'area') {
				if (i instanceof Ext.ux.ThumbSlider) {
					i.value = [(i.getTL()[0] + 1/2 * that.sliderSize[0] - that.el.lowLimit[0]) / (that.size[0]) * (that.maxValue[0] - that.minValue[0]) + that.minValue[0],
							   (i.getTL()[1] + 1/2 * that.sliderSize[1] - that.el.lowLimit[1]) / (that.size[1]) * (that.maxValue[1] - that.minValue[1]) + that.minValue[1]];
					i.percent = [parseFloat((i.getTL()[0]  + 1/2 * that.sliderSize[0] - that.el.lowLimit[0]) / (that.size[0]) * 100),
								 parseFloat((i.getTL()[1]  + 1/2 * that.sliderSize[1] - that.el.lowLimit[1]) / (that.size[1]) * 100)];
				} 
				if (i instanceof Ext.ux.RangeSlider) {
					i.value = [[
								(i.getTL()[0] - that.el.lowLimit[0]) / (that.size[0]) * (that.maxValue[0] - that.minValue[0]) + that.minValue[0],
							    (i.getBR()[0] - that.el.lowLimit[0]) / (that.size[0]) * (that.maxValue[0] - that.minValue[0]) + that.minValue[0]


							   ],[
								(i.getTL()[1]  - that.el.lowLimit[1]) / (that.size[1]) * (that.maxValue[1] - that.minValue[1]) + that.minValue[1],
							    (i.getBR()[1]  - that.el.lowLimit[1]) / (that.size[1]) * (that.maxValue[1] - that.minValue[1]) + that.minValue[1]
							   ]];
					i.percent = [[
								  parseFloat((i.getTL()[0] - that.el.lowLimit[0]) / (that.size[0]) * 100).toFixed(2),
								  parseFloat((i.getBR()[0] - that.el.lowLimit[0]) / (that.size[0]) * 100).toFixed(2)
								],[
								  parseFloat((i.getTL()[1] - that.el.lowLimit[1]) / (that.size[1]) * 100).toFixed(2),
								  parseFloat((i.getBR()[1] - that.el.lowLimit[1]) / (that.size[1]) * 100).toFixed(2)
								 ]];
				}
			} else {
				if (i instanceof Ext.ux.ThumbSlider) {
					i.value = (i.getTL()[0] + 1/2 * that.sliderSize[0] - that.el.lowLimit[0]) / (that.size[0]) * (that.maxValue[0] - that.minValue[0]) + that.minValue[0];
					i.percent = parseFloat((i.getTL()[0]  + 1/2 * that.sliderSize[0] - that.el.lowLimit[0]) / (that.size[0]) * 100);
				} 
				if (i instanceof Ext.ux.RangeSlider) {
					i.value =  [(i.getTL()[0]  - that.el.lowLimit[0]) / (that.size[0]) * (that.maxValue[0] - that.minValue[0]) + that.minValue[0],
							   (i.getBR()[0] - that.el.lowLimit[0]) / (that.size[0]) * (that.maxValue[0] - that.minValue[0]) + that.minValue[0]];
					i.percent = [  parseFloat((i.getTL()[0]  - that.el.lowLimit[0]) / (that.size[0]) * 100),
								   parseFloat((i.getBR()[0] - that.el.lowLimit[0]) / (that.size[0]) * 100)];	
				}
			}
			vals[this.name] = this.value;
		});

		this.value = vals;
	},
	
	
	updateValue: function() {
		var i=arguments[0];
		var that = this;
		var vals = {};
		//this.sliders.each(function(i) {

			if(this.type == 'area') {
				if (i instanceof Ext.ux.ThumbSlider) {
					i.value = [(i.getTL()[0] + 1/2 * that.sliderSize[0] - that.el.lowLimit[0]) / (that.size[0]) * (that.maxValue[0] - that.minValue[0]) + that.minValue[0],
							   (i.getTL()[1] + 1/2 * that.sliderSize[1] - that.el.lowLimit[1]) / (that.size[1]) * (that.maxValue[1] - that.minValue[1]) + that.minValue[1]];
					i.percent = [parseFloat((i.getTL()[0]  + 1/2 * that.sliderSize[0] - that.el.lowLimit[0]) / (that.size[0]) * 100),
								 parseFloat((i.getTL()[1]  + 1/2 * that.sliderSize[1] - that.el.lowLimit[1]) / (that.size[1]) * 100)];
				} 
				if (i instanceof Ext.ux.RangeSlider) {
					i.value = [[
								(i.getTL()[0] - that.el.lowLimit[0]) / (that.size[0]) * (that.maxValue[0] - that.minValue[0]) + that.minValue[0],
							    (i.getBR()[0] - that.el.lowLimit[0]) / (that.size[0]) * (that.maxValue[0] - that.minValue[0]) + that.minValue[0]


							   ],[
								(i.getTL()[1]  - that.el.lowLimit[1]) / (that.size[1]) * (that.maxValue[1] - that.minValue[1]) + that.minValue[1],
							    (i.getBR()[1]  - that.el.lowLimit[1]) / (that.size[1]) * (that.maxValue[1] - that.minValue[1]) + that.minValue[1]
							   ]];
					i.percent = [[
								  parseFloat((i.getTL()[0] - that.el.lowLimit[0]) / (that.size[0]) * 100).toFixed(2),
								  parseFloat((i.getBR()[0] - that.el.lowLimit[0]) / (that.size[0]) * 100).toFixed(2)
								],[
								  parseFloat((i.getTL()[1] - that.el.lowLimit[1]) / (that.size[1]) * 100).toFixed(2),
								  parseFloat((i.getBR()[1] - that.el.lowLimit[1]) / (that.size[1]) * 100).toFixed(2)
								 ]];
				}
			} else {
				if (i instanceof Ext.ux.ThumbSlider) {
					i.value = (i.getTL()[0] + 1/2 * that.sliderSize[0] - that.el.lowLimit[0]) / (that.size[0]) * (that.maxValue[0] - that.minValue[0]) + that.minValue[0];
					i.percent = parseFloat((i.getTL()[0]  + 1/2 * that.sliderSize[0] - that.el.lowLimit[0]) / (that.size[0]) * 100);
				} 
				if (i instanceof Ext.ux.RangeSlider) {
					i.value =  [(i.getTL()[0]  - that.el.lowLimit[0]) / (that.size[0]) * (that.maxValue[0] - that.minValue[0]) + that.minValue[0],
							   (i.getBR()[0] - that.el.lowLimit[0]) / (that.size[0]) * (that.maxValue[0] - that.minValue[0]) + that.minValue[0]];
					i.percent = [  parseFloat((i.getTL()[0]  - that.el.lowLimit[0]) / (that.size[0]) * 100),
								   parseFloat((i.getBR()[0] - that.el.lowLimit[0]) / (that.size[0]) * 100)];	
				}
			}
			vals[this.name] = this.value;
		//});

		this.value = vals;
	},
	
	
	initSliderPosition: function(slider) {
		/* Sets a sliders's initial position within the slide zone.
		 * If slideZone has a sliderSnap set, the slider 
		 * is positioned at a multiple of the sliderSnap value that is
		 * closest where the slider's value would otherwise position it.
		 * After positioning, the slider's actual value will be modified
		 * in Ext.ux.SlideZone.updateValues()
		 * to jibe with the actual position in the slide zone given the 
		 * sliderSnap constraint.
		 */
		var initialPosition = [0,0];
		slider.repositionDelta = [0,0];
		var l = this.type == 'area' ? 2 : 1;
		for(var i=0; i < l; i++ ) {
			/* Make sure initial value is in slider bar range, 
			   if it's outside, set to closest limit.
			   The slider value is modified if it's out of range. */
			if(slider.value instanceof Array) {
				if (slider instanceof Ext.ux.ThumbSlider) {

					slider.value[i] = Number(slider.value[i]).constrain(this.minValue[i], this.maxValue[i]);
					initialPosition[i] = parseInt((slider.value[i] - this.minValue[i]) / (this.maxValue[i] - this.minValue[i]) * this.size[i] + this.el.lowLimit[i]);
				}
				if (slider instanceof Ext.ux.RangeSlider) {
					switch (this.type) {
						case 'horizontal':
						case 'vertical':
							slider.value[i] = Number(slider.value[i]).constrain(this.minValue[i], this.maxValue[i]);
							initialPosition[i] = parseInt((slider.value[i] - this.minValue[i]) / (this.maxValue[i] - this.minValue[i]) * this.size[i] + this.el.lowLimit[i]);
							break;
						
						case 'area':
							slider.value[i][0] = Number(slider.value[i][0]).constrain(this.minValue[i], this.maxValue[i]);
							slider.value[i][1] = Number(slider.value[i][1]).constrain(this.minValue[i], this.maxValue[i]);
							
							initialPosition[i] = parseInt((slider.value[i][0] - this.minValue[i]) / (this.maxValue[i] - this.minValue[i]) * this.size[i] + this.el.lowLimit[i]);

							break;
					}
				}
			} else {
				slider.value = Number(slider.value).constrain(this.minValue[i], this.maxValue[i]);
				initialPosition[i] = parseInt((slider.value - this.minValue[i]) / (this.maxValue[i] - this.minValue[i]) * this.size[i] + this.el.lowLimit[i]);
			}
			
			/* Calculate slider value versus closest snap-to location,
			   and calculate an offset value to apply when positioning it. */
			if (this.sliderSnap[i] > 1) {
				var positionToSnapDiff = [0,0];
				positionToSnapDiff[i] = (initialPosition[i] - this.el.lowLimit[i]) % this.sliderSnap[i];
				if (positionToSnapDiff[i]) {
					if(positionToSnapDiff[i] < 1/2 * this.sliderSnap[i]) {
						slider.repositionDelta[i] = -positionToSnapDiff[i];
					} else {
						slider.repositionDelta[i] = this.sliderSnap[i] - positionToSnapDiff[i];
					} 
				}
			} 
		}

		if (slider instanceof Ext.ux.ThumbSlider) {
			slider.setPosition([initialPosition[0] + slider.repositionDelta[0] - (0.5 * this.sliderSize[0]),
								initialPosition[1] + slider.repositionDelta[1] - (0.5 * this.sliderSize[1])]);
		}
		if (slider instanceof Ext.ux.RangeSlider) {

			slider.setPosition([initialPosition[0] + slider.repositionDelta[0],
								initialPosition[1] + slider.repositionDelta[1]]);
		}
	},
	
	initSlider: function(slider) {		
		slider.init(this);
		this.initSliderPosition(slider);
	} 

});  


Ext.ux.Slider = function(config) {

	Ext.apply(this, config);
	
	this.addEvents( {
		"dragstart" : true,
		"dragend"   : true,
		"drag"      : true,
		"mouseover" : true, 
		"mouseout"  : true
	});	
};

Ext.extend(Ext.ux.Slider, Ext.BoxComponent, {
	value : 0,
	ddEl  : null,
	name  : null,
	cls   : null,
	
	init  : function() {
		//Do nothing
	},

	getTL : function() {
		switch(this.type) {
			case 'horizontal':
				return [this.el.getX()];
				break;
				
			case 'vertical':
				return [this.el.getY()];
				break;
				
			case 'area':
				return this.el.getXY();
				break;
		}
	},
	
	getBR : function() {
		switch(this.type) {
			case 'horizontal':
				return [this.el.getRight()];
				break;
				
			case 'vertical':
				return [this.el.getBottom()];
				break;
				
			case 'area':
				return [this.el.getRight(), this.el.getBottom()];
				break;
		}
		
	},
	
	setPosition: function(position) {
		var l = position.length;
		for (i=0; i<l; i++) {
			position[i] = parseInt(position[i]);
		}

		switch(this.type) {
			case 'horizontal':
				this.el.setX(position[0]);
				break;
				
			case 'vertical':
				this.el.setY(position[0]);
				break;
				
			case 'area':
				this.el.setX(position[0]);
				this.el.setY(position[1]);
				break;
		}		
	},
	
	setConstraint: function(low, high, snap) {
		var l = low.length;
		for (i=0; i<l; i++) {
			low[i] = parseInt(low[i] = low[i] < 0 ? 0 : low[i]);
			high[i] = parseInt(high[i] = high[i] < 0 ? 0 : high[i]);				
		}


		switch(this.type) {
			case 'horizontal':
				this.ddEl.setXConstraint(low[0], high[0], snap[0]);
				this.ddEl.setYConstraint(0, 0);
				break;
				
			case 'vertical':
				this.ddEl.clearConstraints();
				this.ddEl.setXConstraint(0, 0);
				this.ddEl.setYConstraint(low[0], high[0], snap[0]);
				break;
				
			case 'area':
				this.ddEl.setXConstraint(low[0], high[0], snap[0]);
				this.ddEl.setYConstraint(low[1], high[1], snap[1]);
				break;
		}		
		this.ddEl.resetConstraints(true);
	}
	

});

Ext.ux.ThumbSlider = function(config) { 
	Ext.ux.ThumbSlider.superclass.constructor.call(this, config);	
};


Ext.ux.RangeSlider = function(config) {
	Ext.ux.RangeSlider.superclass.constructor.call(this, config);	
};

Ext.extend(Ext.ux.ThumbSlider, Ext.ux.Slider, {
	//init must be passed an instance of a SliderZon e
	init: function(parentSlideZone) {
		this.type = parentSlideZone.type;

		this.pointer = this.type == 'horizontal' ? 'w-resize' : this.type == 'vertical' ? 'n-resize' : 'move';
		
		this.el = Ext.DomHelper.append(parentSlideZone.el,  { 
						tag: 'div', 
						id: Ext.id(),
						style: 'position:absolute;'+
								'overflow: hidden;'
								}, true);
		this.el.addClass('x-thumb-slider-' + this.type);
		this.el.addClass(parentSlideZone.cls);

		this.ddEl = new Ext.dd.DD(this.el); 

		var sliderInstance = this;
		var slideZoneInstance = parentSlideZone;

		this.el.on('mouseover', function() {
			sliderInstance.fireEvent('mouseover', sliderInstance);
			sliderInstance.el.setStyle('cursor', sliderInstance.pointer); 
		}); 
		this.el.on('mouseout', function() { 
			sliderInstance.fireEvent('mouseout', sliderInstance);
			sliderInstance.el.setStyle('cursor', 'default'); 
		}); 
		this.ddEl.onMouseDown = function(x, y) { 
			sliderInstance.fireEvent('dragstart', sliderInstance);
		}; 
		this.ddEl.onMouseUp = function(x, y) { 
			slideZoneInstance.updateConstraints();
			slideZoneInstance.updateValues();
			sliderInstance.fireEvent('dragend', sliderInstance);
		}; 
		this.ddEl.onDrag = function(e) { 
			slideZoneInstance.updateValues();
			sliderInstance.fireEvent('drag', sliderInstance);
		}; 

		Ext.ux.ThumbSlider.superclass.init.call(parentSlideZone);
	}
});


///////////////////////////////////////////////////////////////////
///////extending Ext.ux.Slider- create the slider in the Zone//////
///////////////////////////////////////////////////////////////////
Ext.extend(Ext.ux.RangeSlider, Ext.ux.Slider, {
	init: function(parentSlideZone) {
		this.type = parentSlideZone.type;
		var menu=null;
		var div=this;//get div parentelement containing the close image
		
		var el = Ext.DomHelper.append(parentSlideZone.el,  { 
						tag: 'div', 
						id: Ext.id(),
						 style: 'position:absolute;'+
                                'overflow: hidden;'
								}, true);
				
		
		//this.el.addClass(parentSlideZone.cls);
		switch(this.type) { case 'horizontal':
				var w = Math.abs(this.value[0] - this.value[1]) / (parentSlideZone.maxValue - parentSlideZone.minValue) * parentSlideZone.size;
				var h = parentSlideZone.sliderHeight;
				var handles = 'e,w';
				this.pointer = 'w-resize';
				break;
				
			case 'vertical':
				var w = parentSlideZone.sliderWidth;
				var h = Math.abs(this.value[0] - this.value[1]) / (parentSlideZone.maxValue - parentSlideZone.minValue) * parentSlideZone.size;
				var handles = 'n,s';
				this.pointer = 'n-resize';
				break;
				
			case 'area':
				
				Ext.getDom(el).title='Area'+div.name; 
				
				//menu for closing and creating new areas//
				menuArea=new Ext.menu.Menu({
					itemId: 'menuArea',floating:true
		                , items: [
		        		        //{text: 'Expand Area',menu   : new Ext.menu.Menu({items: [{text:'Full '},{text:'subitem 2'}]}), handler: function(btn){alert(btn.text);}},
		        		        {text: 'Remover Area', handler: function(btn){	        		     
		        		        	this.destroy();		        		        	
		        		        	parentSlideZone.remove(div);
		        		        	}},
		        		        {text: 'Expandir Area', handler: function(btn){

									div.value=[[parentSlideZone.minValue[0],parentSlideZone.maxValue[0]],[parentSlideZone.minValue[1],parentSlideZone.maxValue[1]]];
									parentSlideZone.initSliderPosition(div);
									div.resizable.resizeTo(parentSlideZone.size[0],parentSlideZone.size[1]);
			        		        }}
		        	        ]
						});
					
				var scope={
					areaEl:el,
					menu:menuArea
				};
				
				//event for calling menu using right-click mouse//
				el.on(
					'contextmenu',
					 menus,
					 scope
					);

				
				var w = Math.abs(this.value[0][0] - this.value[0][1]) / (parentSlideZone.maxValue[0] - parentSlideZone.minValue[0]) * parentSlideZone.size[0];
				var h = Math.abs(this.value[1][0] - this.value[1][1]) / (parentSlideZone.maxValue[1] - parentSlideZone.minValue[1]) * parentSlideZone.size[1];
				var handles = 'all';
				this.pointer = 'move';
				break;
		}

		this.resizable = new Ext.Resizable(el, {
		
			wrap:false,
			pinned:true, 
			width: w,
			height: h,
			minWidth: 20,
			widthIncrement: parentSlideZone.sliderSnap[0],
			heightIncrement: parentSlideZone.sliderSnap[1],
			minHeight: 20,
			dynamic: true,
			handles: handles,
			draggable: true,
			transparent: false,
			constrainTo: parentSlideZone.el,
			leftTravel: null,
			rightTravel: null
		});
		var sliderInstance = this;
		var slideZoneInstance = parentSlideZone;
		
		this.el = this.resizable.el;
		this.el.addClass('x-range-slider-' + this.type);
		this.el.addClass(this.cls);		
		this.ddEl = this.resizable.dd;
		//change opacity of resizable components without affecting other windows.
		Ext.each(this.el.dom.children,
				function(item,index,allItems){
					item.style.opacity=1;
		});
		

		this.resizable.on('beforeresize', function() {
			sliderInstance.fireEvent('dragstart', sliderInstance);	
		});
		
		/* Parts of this.resizable.onMouseMove handler taken from:
		 * http://extjs.com/forum/showthread.php?p=23122&highlight=resizable+constrainto#post23122
		 */
		this.resizable.onMouseMove = function( e ) {
				var box = this.constrainTo.getRegion(), tgt = e.getXY();
				//redefine the constraining box if slider crossing resrictions
				if(!parentSlideZone.allowSliderCrossing) {
					if( parentSlideZone.type == 'vertical') {
							box = {left:   box.left,  right:  box.right,
								   top:    this.startBox.y - this.leftTravel[0],
								   bottom: this.startBox.y + this.startBox.height + this.rightTravel[0] };
					}
					if( parentSlideZone.type == 'horizontal') {
							box = {left:   this.startBox.x - this.leftTravel[0],
								   right:  this.startBox.x + this.startBox.width + this.rightTravel[0],
								   top:    box.top, bottom: box.bottom };
					}
				}

				e.xy = [
					tgt[0] - box.left < 0 ? box.left - this.startBox.x + this.startPoint[0] : tgt[0] - box.right > 0 ? box.right - this.startBox.right + this.startPoint[0] : tgt[0],
					tgt[1] - box.top < 0 ? box.top - this.startBox.y + this.startPoint[1] : tgt[1] - box.bottom > 0 ? box.bottom - this.startBox.bottom + this.startPoint[1] : tgt[1]
				];

				Ext.Resizable.prototype.onMouseMove.call(this, e);
				slideZoneInstance.updateValue(sliderInstance);
				sliderInstance.fireEvent('drag', sliderInstance);
			};
			
		this.resizable.on('resize', function(width, height) {
			slideZoneInstance.updateConstraints();
			slideZoneInstance.updateValue(sliderInstance);
			sliderInstance.fireEvent('dragend', sliderInstance);
		});
		
		this.el.on('mouseover', function() {
			sliderInstance.fireEvent('mouseover', sliderInstance);
			sliderInstance.el.setStyle('cursor', sliderInstance.pointer); 
		}); 
		this.el.on('mouseout', function() { 
			sliderInstance.fireEvent('mouseout', sliderInstance);
			sliderInstance.el.setStyle('cursor', 'default'); 
		}); 
		this.ddEl.onMouseDown = function(x, y) { 
			sliderInstance.fireEvent('dragstart', sliderInstance);
		}; 
		this.ddEl.onMouseUp = function(x, y) { 
			slideZoneInstance.updateConstraints();
			slideZoneInstance.updateValue(sliderInstance);
			sliderInstance.fireEvent('dragend', sliderInstance);
		}; 
		this.ddEl.onDrag = function(e) {
			slideZoneInstance.updateValue(sliderInstance);
			sliderInstance.fireEvent('drag', sliderInstance);
		}; 

		Ext.ux.ThumbSlider.superclass.init.call(parentSlideZone);

	}
});