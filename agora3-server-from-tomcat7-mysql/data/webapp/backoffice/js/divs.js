function showLayer(layer)
{
	if( layer.style.display == 'none' )
		layer.style.display = 'inline';
	else
		layer.style.display = 'none';
}

function setLayer(layer, modo)
{
	layer = $(layer);
	if( modo )
		layer.style.display = 'inline';
	else
		layer.style.display = 'none';
}

	// {{{ getLeftPos()
    /**
     * This method will return the left coordinate(pixel) of an HTML element
     *
     * @param Object el = Reference to HTML element
     * @public
     */
	getLeftPos = function(el)
	{
		/*
		if(el.getBoundingClientRect){ // IE
			var box = el.getBoundingClientRect();
			return (box.left/1 + Math.max(document.body.scrollLeft,document.documentElement.scrollLeft));
		}
		*/
		if(document.getBoxObjectFor){
			if(el.tagName!='INPUT' && el.tagName!='SELECT' && el.tagName!='TEXTAREA')return document.getBoxObjectFor(el).x
		}
		var returnValue = el.offsetLeft;
		while((el = el.offsetParent) != null){
			if(el.tagName!='HTML'){
				returnValue += el.offsetLeft;
				if(document.all)returnValue+=el.clientLeft;
			}
		}
		return returnValue;
	}
	,
	// {{{ getTopPos()
    /**
     * This method will return the top coordinate(pixel) of an HTML element/tag
     *
     * @param Object el = Reference to HTML element
     * @public
     */
	getTopPos = function(el)
	{
		/*
		if(el.getBoundingClientRect){	// IE
			var box = el.getBoundingClientRect();
			return (box.top/1 + Math.max(document.body.scrollTop,document.documentElement.scrollTop));
		}
		*/
		if(document.getBoxObjectFor){
			if(el.tagName!='INPUT' && el.tagName!='SELECT' && el.tagName!='TEXTAREA')return document.getBoxObjectFor(el).y
		}

		var returnValue = el.offsetTop;
		while((el = el.offsetParent) != null){
			if(el.tagName!='HTML'){
				returnValue += (el.offsetTop - el.scrollTop);
				if(document.all)returnValue+=el.clientTop;
			}
		}
		return returnValue;
	}

findPos = function(obj) {
	var curleft = getLeftPos( obj );
	var curtop = getTopPos( obj );
	return [curleft,curtop];
}
