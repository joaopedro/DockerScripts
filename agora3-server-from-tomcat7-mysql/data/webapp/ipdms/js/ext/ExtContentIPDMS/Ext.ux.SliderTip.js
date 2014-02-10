/**
11	 * @class Ext.ux.SliderTip
12	 * @extends Ext.Tip
13	 * Simple plugin for using an Ext.Tip with a slider to show the slider value
14	*/

	Ext.ux.SliderTip = Ext.extend(Ext.Tip, {
	 minWidth: 10,
	 style:'color:#444',
     offsets : [0, -10],
	    init : function(slider){
 
	        slider.on('dragstart', this.onSlide, this);
	        slider.on('drag', this.onSlide, this);
	        slider.on('dragend', this.onSlide, this);
	        slider.on('destroy', this.destroy, this);
	        slider.on('mouseover',this.onSlide, this);
	        slider.on('mouseout',this.hiding,this);
	    },
	
	    onSlide : function(slider){	    	
	        this.show();
	        this.body.update(this.getText(slider));
	        this.doAutoWidth();
	        this.el.alignTo(slider.el, 'b-t?', this.offsets);
	    },
	
	    getText : function(slider){
	    	
	    	firstYear= slider.value[0][0]+1;
			secondYear=slider.value[0][1];
			
			firstMonth=m_names[slider.value[1][0]];
			secondMonth=m_names[slider.value[1][1]-1];
	    	
			var contentYear=(firstYear!=secondYear)?('<b style="color:#444;">Anos: '+firstYear+ ' -> '+secondYear+'</b>')
	        		:("<b>Ano : "+firstYear+"</b>");
			var contentMonth=(firstMonth!=secondMonth)?('<b>Meses: '+firstMonth+' -> '+secondMonth+'</b>')
	        		:("<b>Mês : "+firstMonth+"</b>");
	        return contentYear+'<br>'+contentMonth;
			//return slider.value;
	    },
	    
	    hiding: function(slider){
	    	this.hide();
	    	}
	    
}); 

