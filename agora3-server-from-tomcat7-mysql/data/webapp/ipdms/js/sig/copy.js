var initGeographicSourceLayer = function(){
	var srcDisabledStyleMap = {
		stroke: false,
		fill: false,
		graphic: false
	};
	
 	var srcEnabledStyleMap = {
		strokeColor: "#000",
		strokeOpacity: 0.8,
		strokeWidth: 2,
		fillColor: "red",
		fillOpacity: 0.8,
		pointRadius: 4
	};

	geographicSourceStyleMap = new OpenLayers.StyleMap({
		"default": srcDisabledStyleMap
	});

	tempLayerStyleMap = new OpenLayers.StyleMap({
		"default": srcEnabledStyleMap
	});

	tempLayer = new OpenLayers.Layer.Vector(
		"tempLayer",
		{styleMap: tempLayerStyleMap}
	);

	featureType.editableService = srcService;
	featureType.editableLayer = srcLayer;
	
	var NAMESPACE_SEPARATOR = ":";
	var nameSpaceSeparatorPosition = featureType.editableLayer.indexOf(NAMESPACE_SEPARATOR);
	featureType.editableLayerNoNamespace = nameSpaceSeparatorPosition > 0 
		? featureType.editableLayer.substring(nameSpaceSeparatorPosition + 1) 
		: featureType.editableLayer;
	
	geographicSourceLayer = createWfs(featureType,geographicSourceStyleMap);
	
	map.addLayers([geographicSourceLayer,tempLayer]);	
}

var selectFeatureForCopyCtrl;
var highlightFeatureForCopyCtrl;
var copyFeaturesPanel;

var copySelectedFeatures = function(){
	for(var i=0; i<tempLayer.selectedFeatures.length; i++){
		var featureCopy = tempLayer.selectedFeatures[i].clone();
		delete featureCopy.style;
		featureCopy.state = OpenLayers.State.INSERT;
		wfs.addFeatures([featureCopy]);
	}
	selectFeatureForCopyCtrl.unselectAll();
	return;
}

var restoreMapControls = function() {
	tempLayer.destroyFeatures(tempLayer.features);
	defaultPanel.div.style.display = '';
	getCopyFeaturesPanel().div.style.display = 'none';
	
	selectFeatureForCopyCtrl.deactivate();
	highlightFeatureForCopyCtrl.deactivate();
	navigationBtn.activate();
}

var getCopyFeaturesPanel = function(){
	if(!copyFeaturesPanel){
		
		copyFeaturesPanel = new OpenLayers.Control.Panel({
			displayClass: "copyFeaturesPanel olControlEditingToolbar",
			id:"copyFeaturesPanel",
			name:"copyFeaturesPanel"
		});

		var confirmCopyFeaturesBtn = new OpenLayers.Control.Button({
			title: "Copiar as Geometrias Seleccionadas",
			trigger: function(){
				copySelectedFeatures();
				restoreMapControls();
			},
			displayClass: "confirmCopyFeaturesBtn"
		});

		var cancelCopyFeaturesBtn = new OpenLayers.Control.Button({
			title: "Cancelar",
			trigger: function(){
				restoreMapControls();
			},
			displayClass: "cancelCopyFeaturesBtn"
		});
		
		copyFeaturesPanel.addControls([confirmCopyFeaturesBtn, cancelCopyFeaturesBtn]);
		
	} else {
		copyFeaturesPanel.div.style.display = '';
	}
	return copyFeaturesPanel;
}

var activateCopy = function(){
 	var srcFeatures = geographicSourceLayer.features;
	
	for(var i=0; i<srcFeatures.length; ++i) {
		tempLayer.addFeatures(srcFeatures[i].clone());
	};
	
	var destFeatures = wfs.features;
	
	for(var i=0; i<tempLayer.features.length; ++i) {
		for(var x=0; x<destFeatures.length; ++x) {
			if(tempLayer.features[i] && tempLayer.features[i].geometry.equals(destFeatures[x].geometry)) {
				tempLayer.destroyFeatures([tempLayer.features[i]]);
			}
		}	
	}

	drawBtn.deactivate();
	selectFeatureCtrl.deactivate();
	zoomBtn.deactivate();
	$('map').style.cursor='';
	
	highlightFeatureForCopyCtrl = new OpenLayers.Control.SelectFeature(tempLayer, {
		hover:true,
		highlightOnly: true,
		selectStyle: highlightedStyleMap
	});

	map.addControl(highlightFeatureForCopyCtrl);
	highlightFeatureForCopyCtrl.activate();
	
	selectFeatureForCopyCtrl = new OpenLayers.Control.SelectFeature(tempLayer, {
		multiple: true,
		selectStyle: selectedStyleMap
	});
	map.addControl(selectFeatureForCopyCtrl);
	selectFeatureForCopyCtrl.activate();

	defaultPanel.div.style.display = 'none';
	
	map.addControl(getCopyFeaturesPanel());
	
	$('copyFeaturesPanel').observe('mouseover', function() {
		$('copyFeaturesPanel').style.opacity='1';
		$('copyFeaturesPanel').style.filter='alpha(opacity=100)';
	});
	$('copyFeaturesPanel').observe('mouseout', function() {
		$('copyFeaturesPanel').style.opacity='0.4';
		$('copyFeaturesPanel').style.filter='alpha(opacity=40)';
	});
}
