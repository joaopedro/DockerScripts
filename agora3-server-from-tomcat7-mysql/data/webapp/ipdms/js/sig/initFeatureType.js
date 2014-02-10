/**
 *	utils to initialize feature properties
 */

/**
 *	SVG CSS styling syntax...
 */

var defaultStyleMap = {
	strokeColor: "#00f",
	strokeOpacity: 0.5,
	strokeWidth: 1,
	fillColor: "#00f",
	fillOpacity: defaultGraphic ? 1 : 0.1,
	pointRadius: 3,
	externalGraphic: defaultGraphic,
	graphicZIndex:1000
};

var temporaryStyleMap = {
	strokeColor: "#fb0",
	strokeOpacity: 0.5,
	strokeWidth: 1,
	fillColor: "#fb0",
	fillOpacity: temporaryGraphic ? 1 : 0.3,
	pointRadius: 4,
	externalGraphic: temporaryGraphic,
	graphicZIndex:1000
};

var deleteStyleMap = {
	strokeColor: "#f00",
	strokeOpacity: 1,
	strokeWidth: 1,
	fillColor: "#f00",
	fillOpacity: deleteGraphic ? 1 : 0.5,
	pointRadius: 4,
	externalGraphic: deleteGraphic,
	graphicZIndex:1000
};

var currentStyleMap = {
	strokeColor: "#00f",
	strokeOpacity: 0.8,
	strokeWidth: 2,
	fillColor: "#00f",
	fillOpacity: currentGraphic ? 1 : 0.5,
	pointRadius: 4,
	externalGraphic: currentGraphic,
	graphicZIndex:1000
};

var highlightedStyleMap = {
	strokeColor: "#c3c",
	strokeOpacity: 0.8,
	strokeWidth: 2,
	fillColor: "#c3c",
	fillOpacity: highlightedGraphic ? 1 : 0.2,
	pointRadius: 5,
	externalGraphic: highlightedGraphic,
	graphicZIndex:1000
};

var selectedStyleMap = {
	strokeColor: "#0ff",
	strokeOpacity: 0.8,
	strokeWidth: 2,
	fillColor: "#0ff",
	fillOpacity: selectedGraphic ? 1 : 0.2,
	pointRadius: 5,
	externalGraphic: selectedGraphic,
	graphicZIndex:1000
};

var mainStyleMap;

var initDrawFeature = function(featureType){
	OpenLayers.ProxyHost = proxy;
	mainStyleMap = new OpenLayers.StyleMap({
		"default": 		defaultStyleMap,
		"selected":		selectedStyleMap,
		"delete":		deleteStyleMap,
		"temporary":	temporaryStyleMap,
		"highlighted":	highlightedStyleMap,
		"current":		currentStyleMap
	});
	if(featureType.geometryType.indexOf("Point") >= 0){
		featureType.handler = OpenLayers.Handler.Point;
		//featureType.controlDrawDisplayClass = "olControlDrawFeaturePoint";
	}
	else if(featureType.geometryType.indexOf("Line") >= 0 || featureType.geometryType.indexOf("Curve") >= 0){
		featureType.handler = OpenLayers.Handler.Path;
		//featureType.controlDrawDisplayClass = "olControlDrawFeaturePath";
	}
	else if(featureType.geometryType.indexOf("Polygon") >= 0 || featureType.geometryType.indexOf("Surface") >= 0){
		featureType.handler = OpenLayers.Handler.Polygon;
		//featureType.controlDrawDisplayClass = "olControlDrawFeaturePolygon";
	}
	featureType.controlDrawDisplayClass = "drawFeature";
}

var setBounds = function(featureType,callback) {
	var wmsParser = new OpenLayers.Format.WMSCapabilities();
	wmsCapabilities = wmsParser.read(baseServiceDescription);
	
	var firstLayer = baseLayers.split(",")[0];
	
	for(var i=0; i<wmsCapabilities.capability.layers.length; ++i) {
		if(wmsCapabilities.capability.layers[i].name == firstLayer) {
			var strBegin = featureType.acceptedSRS.lastIndexOf(":");
			var strEnd = featureType.acceptedSRS.length;
			epsgCode = "EPSG" + featureType.acceptedSRS.slice(strBegin,strEnd);
			var projSource = new OpenLayers.Projection('EPSG:4326');
			projDest = new OpenLayers.Projection(epsgCode);
			
						for(var srs in wmsCapabilities.capability.layers[i].srs) {
							alert(srs);
						}

			if(wmsCapabilities.capability.layers[i].bbox && wmsCapabilities.capability.layers[i].bbox[epsgCode]) {
				bounds = new OpenLayers.Bounds(
					wmsCapabilities.capability.layers[i].bbox[epsgCode].bbox[0], wmsCapabilities.capability.layers[i].bbox[epsgCode].bbox[1],
					wmsCapabilities.capability.layers[i].bbox[epsgCode].bbox[2], wmsCapabilities.capability.layers[i].bbox[epsgCode].bbox[3]
				);
			}
			else {
				bounds = new OpenLayers.Bounds(
					wmsCapabilities.capability.layers[i].llbbox[0], wmsCapabilities.capability.layers[i].llbbox[1],
					wmsCapabilities.capability.layers[i].llbbox[2], wmsCapabilities.capability.layers[i].llbbox[3]
				);
				bounds.transform(projSource,projDest);
			}
		}
	}
	callback();
}

//normalize referencing systems when using different syntaxes
var normalizeRS = function(rs){
	return rs.replace(/urn:x-ogc:def:crs:/g,'').replace(/:6.9:/g,':');
}

var parseFeatureType = function(capabilities, description, featureType, callback){
	var Q; //Quotes used in the response xml (ie.: ", ')
	var NAMESPACE_SEPARATOR = ":";
	var start, tail, end; 
	var nameSpaceSeparatorPosition = featureType.editableLayer.indexOf(NAMESPACE_SEPARATOR);
	featureType.editableLayerNoNamespace = nameSpaceSeparatorPosition > 0 
		? featureType.editableLayer.substring(nameSpaceSeparatorPosition + 1) 
		: featureType.editableLayer;
	featureType.featurePrefix = nameSpaceSeparatorPosition > 0 
		? featureType.editableLayer.substring(0,nameSpaceSeparatorPosition)
		: "";
	
	//parse capabilities
	Q = capabilities.indexOf("version='") > 0  ? "'" : "\"";
	start = capabilities.indexOf("Name>"+featureType.editableLayer);
	tail = capabilities.substring(start);
	
	start = tail.indexOf("DefaultSRS>") + 11;
	tail = tail.substring(start);
	end = tail.indexOf("</");
	featureType.defaultSRS=tail.substring(0,end);

	/*
	 *	FIXME
	 *	make the whole script namespace aware,
	 *	use DOM
	 */

	 //if the WFS's defaultSRS is compatible with the WMS
	for(i=0;i<featureType.baseRS.size();i++){
		if(normalizeRS(featureType.defaultSRS) == normalizeRS(featureType.baseRS[i]))
			//accept it to be used
			featureType.acceptedSRS = featureType.defaultSRS;
	}
	//else look for another
	if(featureType.acceptedSRS != featureType.defaultSRS){
		start = capabilities.indexOf("Name>"+featureType.editableLayer);
		tail = capabilities.substring(start);
		end = tail.indexOf("FeatureType>");
		tail = tail.substring(0,end);
		while((start = tail.indexOf("OtherSRS>")) > 0){
			tail = tail.substring(start + 9);
			end = tail.indexOf("</")
			var otherSRS = tail.substring(0,end);
			for(i=0;i<featureType.baseRS.size();i++){
				if(normalizeRS(otherSRS) == normalizeRS(featureType.baseRS[i])){
					//accept it to be used
					featureType.acceptedSRS = otherSRS;
					//stop searching
					tail = "";
				}
			}
		}
		//else give up, use default
		if(tail != "")
			featureType.acceptedSRS = featureType.defaultSRS;
	}
	
	//parse description
	featureType.attributeDefinitions = parseAttributeDefinitions(description);
	Q = description.indexOf("targetNamespace='") > 0  ? "'" : "\"";
	start = description.indexOf("targetNamespace="+Q) + 17;
	tail = description.substring(start);
	end = tail.indexOf(Q);
	featureType.targetNamespace = tail.substring(0,end);
	
	while( tail.indexOf("<") < tail.indexOf("type="+Q+"gml:") ){
		var tail = tail.substring(tail.indexOf("<") + 1);
	}
	
	start = tail.indexOf("type="+Q+"gml:") + 10;
	end = start + tail.substring(start).indexOf(Q);
	featureType.geometryType=tail.substring(start,end);
	featureType.multi = (featureType.geometryType.toLowerCase().indexOf("multi") >= 0);
	
	start = tail.indexOf("name="+Q)+6;
	end = start + tail.substring(start).indexOf(Q);
	featureType.geometryColumn=tail.substring(start,end);
	
	var onScriptLoadCallback = function(){
		initDrawFeature(featureType);
		setBounds(featureType,callback);
	};
	
	var includeLoadingPanel = function() {
		include_css(loadingPanelCSS);
		include_js(
			loadingPanelJS,
			onScriptLoadCallback
		);	
	};
	
	if(featureType.geometryColumn.toLowerCase() == "shape"){
		include_js(
			arcGisServerJS,
			includeLoadingPanel
		);
	} else if(featureType.geometryColumn.toLowerCase() == "the_geom"){
		include_js(
			geoServerJS,
			includeLoadingPanel
		);
	}	
}

var describeFeatureType = function(capabilities, featureType,callback){
	
	var url = escape(featureType.editableService+"?request=DescribeFeatureType&typeName="+featureType.editableLayer);
	new Ajax.Request(proxy + url, {
		method:"get",
		onComplete: function(transport) {
			var description = transport.responseText;
			parseFeatureType(capabilities, description, featureType, callback);
		}
	});
	
}

var getCapabilities = function(featureType,callback){
	
	var url = escape(featureType.editableService+"?request=GetCapabilities");
	new Ajax.Request(proxy + url, {
		method:"get",
		onComplete: function(transport) {
			var capabilities = transport.responseText;
			describeFeatureType(capabilities, featureType, callback);
		}
	});
	
}

/**
 * parse base layer
 */

var intersectArray = function(first, second){
	var intersection = new Array();
	for(i=0;i<first.size(); i++)
		for(j=0;j<second.size(); j++)
			if(first[i] == second[j])
				intersection.push(first[i]);
	return intersection;
}

//read referencing systems (CRS, SRS) from <layer>...</layer>
var getRSFromLayer = function(layer){
	var crsStart = "<CRS>", crsEnd = "</CRS>";
	var srsStart = "<SRS>", srsEnd = "</SRS>";
	var baseRS = new Array();
	//while there are more projections to read
	while(layer.indexOf(crsStart) > 0 || layer.indexOf(srsStart) > 0){
		//if is a tag CRS
		if(layer.indexOf(crsStart) > 0){
			layer = layer.substring(layer.indexOf(crsStart) + 5);
			baseRS.push(layer.substring(0,layer.indexOf(crsEnd)));
		} else
		//if is a tag SRS
		if(layer.indexOf(srsStart) > 0){
			layer = layer.substring(layer.indexOf(srsStart) + 5);
			baseRS.push(layer.substring(0,layer.indexOf(srsEnd)));
		}
	}
	return baseRS;
}

var isSelectedForDisplay = function(layerContent,layerNames){
	for(i=0;i<layerNames.size();i++)
		if(layerContent.indexOf("<Name>"+layerNames[i]+"</Name>") > 0)
			return true;
	return false;
}

var parseBaseServiceCapabilities = function(baseServiceDescription, featureType, callback){
	var baseRS = new Array();
	var layerNames = baseLayers.replace(/ */g,'').replace(/\t*/g,'').split(",");
	var start, end, tail=baseServiceDescription;
	//String Delimiter can be either " or '
	var Q = baseServiceDescription.indexOf("queryable=\"1\"") > 0 ? "\"" : "'";
	
	var layerStart = "queryable="+Q+"1"+Q+">", layerEnd = "</Layer>";
	//for each layer
	while(tail.indexOf(layerStart)>0){
		tail = tail.substring(tail.indexOf(layerStart) + 14);
		var layer = tail.substring(0,tail.indexOf(layerEnd));
		if(isSelectedForDisplay(layer,layerNames)){
			if(baseRS.size() == 0)
				baseRS = getRSFromLayer(layer);
			else
				baseRS = intersectArray(baseRS,getRSFromLayer(layer));
			
		}
	}	
	featureType.baseRS = baseRS;
	getCapabilities(featureType,callback);
}

var getBaseServiceCapabilities = function(featureType, callback){
	var url = escape(baseService + "?service=WMS&version=1.1.0&request=GetCapabilities");
	new Ajax.Request(
		proxy + url,
		{
			method:"get",
			onComplete: function(transport) {
				baseServiceDescription = transport.responseText;
				parseBaseServiceCapabilities(baseServiceDescription, featureType, callback);
			}
		}
	);
	
}

var initFeatureType = function(featureType,callback){
	getBaseServiceCapabilities(featureType,callback);
}