function showTab(id, tabs){
	var i = 0;
	if (tabs && tabs.length) {
		for (i=0; i < tabs.length; i++){
			var tabId = tabs[i];
			divObject = document.getElementById(tabId);
			if (divObject != null){
				tabLabel = document.getElementById(tabId + "-label");		
				if (tabId == id){
					divObject.style.display = 'block';
					tabLabel.className='current';			
				} else{
					divObject.style.display = 'none';
					tabLabel.className='';
				}
			}
		}
	}
}

function showDiv(id, divs){
	var i = 0;
	for (i=0; i < divs.length; i++){
		var divId = divs[i];
		divObject = document.getElementById(divId);
		if (divObject != null){
			if (divId == id){
				divObject.style.display = 'block';
			} else{
				divObject.style.display = 'none';
			}
		}
	}
}

startlinkgeneric = function( url, pars, div, completefn )
	{
	if(completefn==undefined)
		var myAjax = new Ajax.Updater( div,
			url,
			{
				method: 'get',
				parameters: pars,
				evalScripts: true
			});
	else
		var myAjax = new Ajax.Updater( div,
			url,
			{
				method: 'get',
				parameters: pars,
				evalScripts: true,
				onComplete: completefn
			});
	}
startLinkGeneric = StartLinkGeneric = startlinkgeneric;
