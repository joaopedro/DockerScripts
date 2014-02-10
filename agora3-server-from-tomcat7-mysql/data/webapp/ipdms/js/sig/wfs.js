/*
 * utils
 */

var log = function(msg,color){
	return;
	if(!color){color = "blue"}
	var div = document.createElement('DIV');
	div.style.borderLeft="thick solid " + color;
	div.style.fontSize= 'small';
	var now = new Date();
	var timeStamp = now.getHours() + ":" + now.getMinutes() + ":" + now.getSeconds();
	div.innerHTML = '<b>' + timeStamp + '</b>' + "\t\t" + msg;
	document.body.appendChild(div);
	var logContainer = $('logContainer');
	var firstLogEntry = logContainer.firstChild;
	logContainer.insertBefore(div,firstLogEntry);
}

var info = function(msg){
	Ext.MessageBox.show({
		title: 'Informação', 
		msg: msg,
		buttons: Ext.MessageBox.OK,
		icon: Ext.MessageBox.INFO,
		width:600,
		height:400
	});
}

	/*
	 * INFO
	 * most features searched are at the end of the "wfs.features" array
	 * so we'll search it backwards
	 */
var getFeatureById = function(featureId){
	for(i = wfs.features.size() - 1; i >= 0; i--)
		if(wfs.features[i].fid==featureId)
			return wfs.features[i];
	return null;
}

var drawCurrentFeature = function(feature){
	if(feature){
		feature.renderIntent = "current";
		wfs.drawFeature(feature);
	}
}

var deleteFeature = function(feature){
	if(feature == null)
		return;
	if(isNewFeatureTempId(feature.fid)){
		removeIntent = true;
		wfs.removeFeatures([feature]);
		removeIntent = false;
	}
	else {
		feature.state = OpenLayers.State.DELETE;
		wfs.strategies[0].triggerRead();
 	}
	var updatedCurrentFeatures = new Array();
	for(var i=0; i<currentFeatures.length;i++){
		if(currentFeatures[i].fid != feature.fid){
			updatedCurrentFeatures.push(currentFeatures[i]);
		}
	}
	currentFeatures = updatedCurrentFeatures;
}
var cancel = function(){}

var deleteSelectedFeature = function(){
	deleteFeature(selectedFeature);
	selectFeatureCtrl.unselectAll();
	selectedFeature = null;
}

var NEW_FEATURE_TEMP_ID = 'NEW_FEATURE_TEMP_ID';
var  NEW_FEATURE_COUNTER = 0;

var generateNewFeatureTempId = function(){
	return NEW_FEATURE_TEMP_ID + NEW_FEATURE_COUNTER++;
}

var stringBeginsWith = function(string, start){
	if(string && start && string.substring(0,start.length) == start){
		return true;
	} else{
		return false;
	}
}

var isNewFeatureTempId = function(id){
	if(stringBeginsWith(id, NEW_FEATURE_TEMP_ID)){
		return true;
	} else {
		return false;
	}
}

var isCurrentFeatureId = function(id){
	for(var i=0; i<currentFeatures.length; i++){
		if(id==currentFeatures[i].fid){
			return true;
		}
	}
	return false;
}

var equalAttributes = function(f1, f2){
	/*
	 * TODO
	 * se necessario, implementar este comparador, atencao aos attributos readOnly sobretudo em arcgisServer
	 * podem ter sido calculados no servidor (shape_id, area, lenght,...) e nao devem
	 * ser usados na comparacao entre a feature vinda do sig e uma sua cópia por gravar
	 */
	return true;
}

/**
 * precision used when comparing features
 * 1000 means 3 decimal places will be used, that is,
 * 3.1236 equals 3.1234
 * 3.1236 does not equal 3.1240
 * this is used to recover the id of inserted features on geoserver. arcgis server can't use this
 * as returned coordinates are just close enough to the original value, but the error margin changes
 * with the feature dimensions, so it can't be used.  
 */
var precision = 10000;

var normalizeFloat = function(f){
	return Math.floor(f * precision) / precision;
}

pointComparator = function(p1, p2){
	var returnValue;
	if(normalizeFloat(p1.x) < normalizeFloat(p2.x)){
		returnValue = -1;
	} else if(normalizeFloat(p1.x) > normalizeFloat(p2.x)){
		returnValue = 1;
	} else /* p1.x == p2.x */ {
		if(normalizeFloat(p1.y) < normalizeFloat(p2.y)){
			returnValue = -1;
		} else if(normalizeFloat(p1.y) > normalizeFloat(p2.y)){
			returnValue = 1;
		} else /* p1.y == p2.y */ {
			returnValue = 0;
		}
	}
	log(p1,"purple");
	log(p2,"purple");
	log(returnValue,(returnValue == 0 ? "green" : "red"));
	return returnValue;
}

getOrderedPointsFromGeometry = function(g){
	var points = new Array();
	if(g){
		if(g.CLASS_NAME == "OpenLayers.Geometry.Point"){
			points.push(g);
		} else if(g.components) {
			for(var i=0; i<g.components.length; i++){
				points.push(getOrderedPointsFromGeometry(g.components[i]));
			}
		}
	}
	return points.flatten().sort(pointComparator);
}
var equalGeometry = function(f1, f2){
	var pa1 = getOrderedPointsFromGeometry(f1.geometry);
	var pa2 = getOrderedPointsFromGeometry(f2.geometry);

	/*
	log(pa1.length,"yellow");
	for(var i=0; i<pa1.length - 1; i++){
		log(i,"yellow");
		log(precision,"cyan");
		precision = Math.min(precision, Math.abs(pa1[i+1].x - pa1[i].x));
		log(precision,"cyan");
		precision = Math.min(precision, Math.abs(pa1[i+1].y - pa1[i].y));
	}

	log(pa2.length,"yellow");
	for(var i=0; i<pa2.length - 1; i++){
		log(i,"yellow");
		log(precision,"cyan");
		precision = Math.min(precision, Math.abs(pa2[i+1].x - pa2[i].x));
		log(precision,"cyan");
		precision = Math.min(precision, Math.abs(pa2[i+1].y - pa2[i].y));
	}
	log(precision,"cyan");
	*/
	
	log(pa1,"magenta");
	log(pa2,"magenta");
	var pa1LastIndex = pa1.length -1;
	var pa2LastIndex = pa2.length -1;
	
	var i=0;
	var j=0;
	
	var matches = 0;
	//all the points from the smaller array must have a match in the larger array
	var minMatches = Math.min(pa1.length,pa2.length);
	
	while(matches < minMatches){
		//if there are no more points
		if( i > pa1LastIndex || j > pa2LastIndex){
			return (matches >= minMatches);
		} else {
			var comp = pointComparator(pa1[i],pa2[j]);
			if(comp == 0){
				matches++;
				if(i < pa1LastIndex && j < pa2LastIndex){
					i++;
					j++;
				}
				else return (matches >= minMatches);
			} else if(comp < 0) {
				if(i < pa1LastIndex)
					i++;
				else
					return (matches >= minMatches);
			} else {
				if(j < pa2LastIndex)
					j++;
				else
					return (matches >= minMatches);
			}
			
		}
	}
	return (matches >= minMatches);
	
	/*
	if(pa1.length != pa2.length){
		return false;
	} else {
		for(var i=0; i<pa1.length; i++) {
			if(0 != pointComparator(pa1[i],pa2[i])) {
				return false;
			}
		}
		return true;
	}
	*/
}

var cloneInsertedFeatures = function(){
	
	insertedFeatures = new Array();
	removedFeatureIds = new Array();
	updatedFeatureIds = new Array();
	
	for(i = 0, j = wfs.features.size(); i < j; i++){
		if(wfs.features[i].state == OpenLayers.State.INSERT){
			insertedFeatures.push(wfs.features[i]);
		} else if(wfs.features[i].state == OpenLayers.State.DELETE){
			removedFeatureIds.push(wfs.features[i].fid);
		} else if(wfs.features[i].state == OpenLayers.State.UPDATE){
			updatedFeatureIds.push(wfs.features[i].fid);
		}
	}
	log("+++ Inserting " + insertedFeatures.length + " features","yellow");
	log("--- Removing  " + removedFeatureIds.length + " features","orange");
}

var recoverInsertedFeatureIds = function(){
	if(wfs.lastInsertIds){
		//drawCurrentFeature(matchedFeature);
		insertedFeatureIds = wfs.lastInsertIds;
		var validatedFeatures = new Array();
		for(var k=0; k<currentFeatures.size(); k++){
			if(!isNewFeatureTempId(currentFeatures[k].fid)){
				validatedFeatures.push(currentFeatures[k]);
			}
		}
		for(var k=0; k<insertedFeatureIds.size(); k++){
			var feature = getFeatureById(insertedFeatureIds[k]);
			validatedFeatures.push({fid:feature.fid, bounds:feature.geometry.bounds});
		}
		currentFeatures = validatedFeatures;
		delete wfs.lastInsertIds;
	} else {
		log("Recovering" + insertedFeatures.length + " features from " + wfs.features.length + " total features","yellow");
		insertedFeatureIds = new Array();
		for(var i=0; i<insertedFeatures.size(); i++){
			var insertedFeature = insertedFeatures[i];
			var matchedFeature=null;
			for(var j = wfs.features.size() - 1; j >= 0; j--){
				var feature = wfs.features[j];
				if(!feature.matched && equalGeometry(feature, insertedFeature) && equalAttributes(feature, insertedFeature)){
					matchedFeature = feature;
					feature.matched = true;
					break;
				}
			}
			if(matchedFeature){
				drawCurrentFeature(matchedFeature);
				old_fid = insertedFeature.fid;
				new_fid = matchedFeature.fid;
				for(var k=0; k<currentFeatures.size(); k++){
					if(currentFeatures[k].fid == old_fid){
						currentFeatures[k].fid = new_fid;
						insertedFeatureIds.push(new_fid);
						break;
					}
				}
			}
		}
		log("Recovered" + insertedFeatureIds.length + " features","yellow");
	}
}

/**
 * build snapshot for single feature
 * @param feature
 * @return featureSnapshot
 */
var buildFeatureSnapshot = function(feature){
	var featureSnapshot = feature.fid + ";";
	featureSnapshot += wfs.projection + ";";
	var vertices = feature.geometry.getVertices();

	for(var i=0; i<vertices.length; i++){
		featureSnapshot += vertices[i].x + " " + vertices[i].y + ";";
	}
	return featureSnapshot;
}

/**
 * build array of snapshots for inserted/updated features
 * @return globalSnapshot
 */
var buildGlobalSnapshot = function(){
	var globalSnapshot = new Array();
	for(var i=0; i<wfs.features.length; i++){
		var feature = wfs.features[i];
		if(insertedFeatureIds.indexOf(feature.fid) >=0 || updatedFeatureIds.indexOf(feature.fid) >=0)
			globalSnapshot.push(buildFeatureSnapshot(feature));
	}
	return globalSnapshot;
}

/*
 * geometry normalization utils, to be used by the
 */

var isClockWise = function(linearRing){
	if(linearRing && linearRing.components){
		var sum = 0;
		var p0, p1;
		for(var i=0; i<linearRing.components.length - 1; ++i) {
			p0 = linearRing.components[i];
			p1 = linearRing.components[i+1];
			sum += (p0.x * p1.y) - (p0.y * p1.x);
		}
		return (sum < 0);
	} else {
		return false;
	}
}

var constrainFeature = function(o){
	var constrained = false;
	if(o){
		if(o.CLASS_NAME == "OpenLayers.Feature.Vector"){
			constrained = constrained || constrainFeature(o.geometry);
		}
		else if(o.CLASS_NAME == "OpenLayers.Geometry.Point"){
			if(o.x < bounds.left) {
				o.x = bounds.left;
				constrained = true;
			} else if(o.x > bounds.right) {
				o.x = bounds.right;
				constrained = true;
			}
			
			if(o.y < bounds.bottom) {
				constrained = true;
				o.y = bounds.bottom;
			} else if(o.y > bounds.top) {
				o.y = bounds.top;
				constrained = true;
			}
		}
		else if(o.components && (o.components.length > 0)){
			for(var i=0; i<o.components.length; i++){
				constrained = constrained + constrainFeature(o.components[i]);
			}
		}
	}
	return constrained;
}

var normalizeGeometry = function(g){
	if(g){
		if(g.CLASS_NAME == "OpenLayers.Geometry.LinearRing"){
			//reorder each lineraring's vertices clockwise
			if(!isClockWise(g)){
				g.components.reverse();
			}
		} else {
			if(g.components && g.components.size() >0){
				for(i=0; i < g.components.size(); i++){
					normalizeGeometry(g.components[i]);
				}
			}
		}
	}
}

/**
 * TODO
 * validate an attribute's value against its type 
 * as defined in the given attributeDefinition
 * @param value
 * @param definition
 * @return true if the attribute validates against given attribute definition
 */
var validateAttribute = function(value, definition){
	return true;
}

var setDefaultAttributeValues = function(feature){
	if(defaultAttributeValues && feature){
		/*
		for(key in defaultAttributeValues){
			feature.attributes[key] = defaultAttributeValues[key];
		}
		 */
		
		//for(key in feature.attributes){
		for(key in featureType.attributeDefinitions){
			var attributeDefinition = featureType.attributeDefinitions[key];
			var attributeDefaultValue = defaultAttributeValues[key];
			if(attributeDefaultValue && !attributeDefinition.isReadOnly && validateAttribute(attributeDefaultValue,attributeDefinition))
				feature.attributes[key] = defaultAttributeValues[key];
		}
	}
}

var restoreZoom = function(){
	var extent;
	if(xmin && ymin && xmax && ymax){
		extent = new OpenLayers.Bounds(xmin,ymin,xmax,ymax);
	} else {
		extent = bounds;
	}
	
	map.zoomToExtent(extent);
}

var promptDeleteLostFeatures = function(){
	removedFeatureIds = new Array();
	validatedFeatures = new Array();
	for(var i = 0; i < currentFeatures.length; i++){
		var found = false;
		for(var j=0; j< wfs.features.length; j++){
			if(currentFeatures[i].fid == wfs.features[j].fid){
				currentFeatures[i].bounds = wfs.features[j].geometry.bounds;
				found = true;
				break;
			}
		}
		if(!found){
			removedFeatureIds.push(currentFeatures[i].fid);
		} else {
			validatedFeatures.push(currentFeatures[i]);
		}
	}
	currentFeatures = validatedFeatures;
	
	integrityCheck = false;
	if(task != "overview"){
		restoreZoom();
	}
	
	if(removedFeatureIds.length > 0){
		var title = "Sincronização de Dados Geográficos";
		var msg = "As seguintes features não foram encontradas na base de dados Geográfica:<br /><br /><ul>";
		for(var i=0; i < removedFeatureIds.length; i++){
			msg += "<li>" + removedFeatureIds[i] + "</li>";
		}
		msg += "</ul><br /><br />Deseja elimina-las do Sistema?";
		
		Ext.MessageBox.show({
			title:title,
			msg: msg,
			buttons: {yes:'Sim', no:'Não'},
			modal : true,
			fn:	function(btn,emptryString,msgBox){
					if(btn == "yes"){
						wfs.ipdmsSaveCallback();
					}
				},
			icon: Ext.MessageBox.QUESTION
		});
	}
}

/**
 * event listeners
 * 
 */

beforeFeaturesAddedEventListener = function(event){
	log("beforeFeaturesAdded","blue");
	restoreTransientFeatures(event.features);
	constrainedFeatureIds = new Array();
}

beforeFeatureAddedEventListener = function(event){
	//log("beforeFeatureAdded","blue");
	if(event.feature.fid == null){
		/*
		if(currentFeatureIds.size() >= maxFeatures){
			info("Não pode adicionar mais do que " + maxFeatures + "geometrias!");
		} else {
		}
		*/
		event.feature.fid = generateNewFeatureTempId();
		setDefaultAttributeValues(event.feature);
		normalizeGeometry(event.feature.geometry);
		if(constrainFeature(event.feature)){
			constrainedFeatureIds.push(event.feature.fid);
		}
		currentFeatures.push({
			fid:	event.feature.fid,
			bounds:	event.feature.geometry.bounds
		});
	}
}

featureAddedEventListener = function(event){
	//log("featureAdded","blue");
	//info('featureAddedEventListener');
	if(isCurrentFeatureId(event.feature.fid)){
		drawCurrentFeature(event.feature);
	}
	if(isNewFeatureTempId(event.feature.fid)){
		if(event.feature.previousRenderIntent == null){
			event.feature.previousRenderIntent = event.feature.renderIntent;
		}
		selectFeatureCtrl.unselectAll();
		selectFeatureCtrl.select(event.feature);
	}
}
featuresAddedEventListener = function(event){
	log("featuresAdded","blue");
	if(constrainedFeatureIds.length>0){
		var msg = "As seguintes features foram ajustadas à zona editável do mapa:<br /><ul>";
		for(var i=0; i<constrainedFeatureIds.length; i++){
			msg += "<li>" + constrainedFeatureIds[i] + "</li>";
		}
		msg += "</ul>";
		info(msg);
	}
}

loadStartEventListener = function(event){
	log("loadStart","blue");
}

loadEndEventListener = function(event){
	log("loadEnd","blue");
	if(integrityCheck){
		if(srcService && srcLayer){
			initGeographicSourceLayer();
		}
		promptDeleteLostFeatures();
	}
	else if(isDirty){
		isDirty = false;
		var before = new Date().getTime();
		recoverInsertedFeatureIds();
		var after = new Date().getTime();
		log("parsing took about " + (after - before) + "ms.","green");
		wfs.ipdmsSaveCallback();
	}
/*
*/
/*
	if(isFeatureDirty){
		if(currentFeatureId == NEW_FEATURE_TEMP_ID){
			/*
			 * FIXME
			 *
			 * Arcgis server returns the id of the inserted features, in geoServer we
			 * have to refresh the wfs to get the new id of the newly inserted features
			 *
			 * num ambiente multi utilizador a ultima feature pode nao ser a que eu inseri
			 * mas outra posteriormente inserida por outro utilizador em "quase simultâneo"
			 * Possivel solucao:
			 * guardar a geometria e os atributos e utilizar essa informacao
			 * para validar qual das ultimas features é a q foi inserida
			 * /
			var currentFeature = wfs.features[wfs.features.size() -1]
			currentFeatureId = currentFeature.fid;
			drawCurrentFeature(currentFeature);
			isFeatureDirty = false;
			lastSavedFeatureId = currentFeatureId;
		}
		wfs.ipdmsSaveCallback();
	} else {
		currentFeatureId = lastSavedFeatureId;
	}
	/*
	if(lastSavedFeatureId != '' && getFeatureById(lastSavedFeatureId) == null){
		lastSavedFeatureId= '';
		Ext.MessageBox.show({
			title: 'Erro', 
			msg: 'Não foi encontrado o objecto guardado',
			buttons: Ext.MessageBox.OK,
			icon: Ext.MessageBox.ERROR,
			width:600,
			height:400
		});
	}
	if(currentFeatureId != '' && getFeatureById(currentFeatureId) == null){
		currentFeatureId= '';
		Ext.MessageBox.show({
			title: 'Erro', 
			msg: 'Não foi encontrado o objecto actual',
			buttons: Ext.MessageBox.OK,
			icon: Ext.MessageBox.ERROR,
			width:600,
			height:400
		});
	}
 * /
*/
}

/*
 *	WFS custom creation logic
 */


var updateCurrentFeatures = function(){
	var ul = $('currentFeatureIdsUL');
	if(ul){
		validatedFeatures = new Array();
		for(var i=0; i< ul.children.length; i++){
			var li = ul.children[i];
			var featureId = li.innerHTML;
			
			for(var j=0; j<currentFeatures.length; j++){
				if(currentFeatures[j].fid == featureId){
					validatedFeatures.push(currentFeatures[j]);
					break;
				}
			}
			drawCurrentFeature(getFeatureById(featureId));
		}
		currentFeatures = validatedFeatures;
	}
}

var createWfs = function(featureType,styleMap){
	
	var wfs;
	
	if(featureType.geometryColumn.toLowerCase() == "shape"){
		wfs =  createWfsArcGis(featureType,styleMap);
	} else if(featureType.geometryColumn.toLowerCase() == "the_geom"){
		wfs = createWfsGeoserver(featureType,styleMap);
	} else{
		//Warning: selecting the default
		wfs = createWfsGeoserver(featureType,styleMap);
	}
	
	/*
	wfs.moveToAfterConfirmation = wfs.moveTo;
	wfs.moveTo = function(bounds, zoomChanged, dragging){
		Ext.MessageBox.show({
			title:"Confirme a acção",
			msg: "Se continuar sem gravar, perderá as alterações.<br />Deseja mesmo continuar ?",
			buttons: {yes:'Sim', no:'Não'},
			modal : true,
			fn:	function(btn,emptryString,msgBox){
					if(btn == "yes"){
						wfs.moveToAfterConfirmation(bounds, zoomChanged, dragging);
					}
				},
			icon: Ext.MessageBox.QUESTION
		});
	}
	*/
	return wfs;
}

var beforeFeatureRemovedEventListener = function(event){
	if(!removeIntent){
		if(event.feature.state != null){
			log("saving transient feature " + event.feature.fid ,"blue");
			transientFeatures.push(event.feature);
		}
	}
	
	var color = (removeIntent || event.feature.state == null ? "green" : "red");
	log("WFS beforefeatureremoved " + event.feature.fid + "@" + event.feature.state, color);
}

var restoreTransientFeatures = function(features){
	log("restoring " + transientFeatures.length + " transient features","blue");
	for(var i=0;i<transientFeatures.length; i++){
		if(isNewFeatureTempId(transientFeatures[i].fid)){
			features.push(transientFeatures[i]);
		} else{
			for(var j=0;j<features.length; j++){
				if(transientFeatures[i].fid == features[j].fid){
					features[j] = transientFeatures[i];
					break;
				}
			}
		}
	}
	transientFeatures = new Array();
}

var eventListeners = {
	"beforefeaturesadded": beforeFeaturesAddedEventListener,
	"beforefeatureadded": beforeFeatureAddedEventListener,
	"featureadded": featureAddedEventListener,
	"featuresadded": featuresAddedEventListener,
	"loadstart": loadStartEventListener,
	"loadend": loadEndEventListener,
	//"moveend": moveEndEventListener, // function(event){log("WFS moveend","green")},
	
	"beforefeatureremoved": beforeFeatureRemovedEventListener,
	//"featureremoved": function(event){var color = (removeIntent ? "green" : "red"); log("WFS featureremoved " + event.feature.fid,color)},
	"featuresremoved": function(event){log("WFS featuresremoved #" + event.features.length,"red")},

	"zoomend": function(event){log("WFS zoomend #" + event,"#f0f0f0")},
	//"vertexmodified": function(event){log("WFS vertexmodified #" + event,"#f0f0f0")},
	//"sketchstarted": function(event){log("WFS sketchstarted #" + event,"#f0f0f0")},
	//"sketchmodified": function(event){log("WFS sketchmodified #" + event,"#f0f0f0")},
	//"sketchcomplete": function(event){log("WFS sketchcomplete #" + event,"#f0f0f0")},
/*
*/
	"refresh": function(event){log("WFS refresh","green")},
	"void": function(event){log("WFS void","green")}
}

var createWfsGeoserver = function(featureType,styleMap){
	var bbox_strategy = new OpenLayers.Strategy.BBOX();
    var save_strategy = new OpenLayers.Strategy.Save({
		onCommit: function(response){
			if(response.success()) {
				bbox_strategy.triggerRead();
			}
			else {
				var str = response.priv.responseText;
				info('Erro ao guardar nova feature:<br />'+str);
				OpenLayers.Console.log(str);
			}
		}
	});
	
    var wfs = new OpenLayers.Layer.Vector("Layer Editável", 
		{
			strategies: [
				bbox_strategy,
				save_strategy
			],
			protocol: new OpenLayers.Protocol.WFS({
				srsName: featureType.acceptedSRS,
				url: featureType.editableService,
				featureNS: featureType.targetNamespace,
				featureType: featureType.editableLayerNoNamespace,
				geometryName: featureType.geometryColumn
			}),
			extractAttributes: true,
			styleMap: styleMap,
			eventListeners: eventListeners
		}
	);
	
	wfs.commit = function(){
		save_strategy.save();
	}
	
	return wfs;
}

var createWfsArcGis = function(featureType,styleMap){
	var bbox_strategy = new OpenLayers.Strategy.BBOX();
	var lock_strategy = new OpenLayers.Strategy.Lock();
	var save_strategy = new OpenLayers.Strategy.Save2({
		onSaveWithLock: function(event){
			wfs.lastInsertIds = event.insertIds;
			wfs.refresh();
		}
	});
	
	var wfs = new OpenLayers.Layer.Vector(
		"Layer Editável",
		{
			strategies: [
					bbox_strategy,
					lock_strategy,
					save_strategy
			],
			protocol: new OpenLayers.Protocol.WFS2({
				url: featureType.editableService,
				format: new OpenLayers.Format.WFST2({
					srsName: featureType.acceptedSRS,
					featureType: featureType.editableLayerNoNamespace,
					geometryName: featureType.geometryColumn,
					featureNS: featureType.targetNamespace,
					featurePrefix: featureType.featurePrefix,
					extractAttributes: true,
					lockExpiry: "1",
					releaseAction: "ALL",
					xy: true
				})
			}),
			extractAttributes: true,
			styleMap: styleMap,
			eventListeners: eventListeners
		}
	);
	
	wfs.refresh = function(){
		bbox_strategy.triggerRead();
	}
	
	wfs.commit = function(){
		var toBeLocked = new Array();
		var count = 0;
		for(i=0; i < wfs.features.length; i++){
			if(wfs.features[i].state == OpenLayers.State.DELETE || wfs.features[i].state == OpenLayers.State.UPDATE){
				toBeLocked.push(wfs.features[i].fid);
			}
			if(wfs.features[i].state){
				count++;
			}
		}
		if(count== 0){
			wfs.refresh();
		}
		else if(toBeLocked.size() == 0){
			save_strategy.activate();
			save_strategy.saveWithLock();
		}else {
			wfs.protocol.readWithLock({
				filter:new OpenLayers.Filter.FeatureId({fids: toBeLocked}),
				callback: function(event){
					if(event.features[0]){
						var lockId = event.features[0].lockId;
						for(i in wfs.features){
							if(wfs.features[i].state != null){
								wfs.features[i].lockId = lockId;
								if(wfs.features[i].state == OpenLayers.State.UPDATE){
									for(key in wfs.features[i].attributes){
										if(featureType.attributeDefinitions[key].isReadOnly){
											delete wfs.features[i].attributes[key];
										}
									}
								}
							}
						}	
					}
					save_strategy.activate();
					save_strategy.saveWithLock();
				}
			});
		}
	}
	
	return wfs;
}

var featureList = function(){
	var html = '';
	for(var i=0; i<wfs.features.length; i++){
		var feature = wfs.features[i];
		var fid = feature.fid;
		var bounds = "";
		bounds += "new OpenLayers.Bounds(";
		bounds += feature.geometry.bounds.left + ", ";
		bounds += feature.geometry.bounds.bottom + ", ";
		bounds += feature.geometry.bounds.right + ", ";
		bounds += feature.geometry.bounds.top + ")";
		log("fid: " + fid + "\t\t bounds: " + bounds, "orange");
		html += "<div><a href='javascript: map.zoomToExtent(" + bounds + ");winchoose.close();'>" + fid + "</a></div>";
	}
	return html;
}

			
/*
 *	métodos da popup de edição de pontos
 */
 
function highlightVertice() {
	var pointsContainer = $('pointsContainer');
	for(var i=0;i<pointsContainer.childElements().size();++i){
		var pointDiv = pointsContainer.childElements()[i];
		var checkbox = pointDiv.childElements()[2];
		if(checkbox.checked && modifyControl.vertices[i]){
			modifyControl.vertices[i].renderIntent = "delete";
			modifyControl.vertices[i].layer.drawFeature(modifyControl.vertices[i]);
		}
		else if(checkbox.checked && !modifyControl.vertices[i]){
			if (modifyControl.vertices.length > 0) {
				modifyControl.vertices[0].renderIntent = "delete";
				modifyControl.vertices[0].layer.drawFeature(modifyControl.vertices[0]);
			}
		}
		else if(modifyControl.vertices[i]) {
			modifyControl.vertices[i].renderIntent = "default";
			modifyControl.vertices[i].layer.drawFeature(modifyControl.vertices[i]);
		}
	}
};

var buildPointsListHTMLFromGeometry = function(geometry){
	var pointsListHTML = '';
	if(geometry.CLASS_NAME == 'OpenLayers.Geometry.Point'){
		pointsListHTML += '<div class="point_div">';
		pointsListHTML += '<input class="point_x" value="'+geometry.x+'" />';
		pointsListHTML += '<input class="point_y" value="'+geometry.y+'" />';
		pointsListHTML += '<input class="point_checkbox" type="checkbox" onclick="highlightVertice()" />';
		pointsListHTML += '</div>';
	}
	else if(
		geometry.CLASS_NAME == 'OpenLayers.Geometry.MultiPoint' 		|| 
		geometry.CLASS_NAME == 'OpenLayers.Geometry.MultiLineString' 	|| 
		geometry.CLASS_NAME == 'OpenLayers.Geometry.LineString' 		|| 
		geometry.CLASS_NAME == 'OpenLayers.Geometry.MultiPolygon' 		|| 
		geometry.CLASS_NAME == 'OpenLayers.Geometry.Polygon' 			|| 
		geometry.CLASS_NAME == 'OpenLayers.Geometry.LinearRing'
	){
		for(var i=0,iMax=geometry.components.size();i<iMax;i++){
			pointsListHTML += buildPointsListHTMLFromGeometry(geometry.components[i])
		}
	}
	return pointsListHTML;
}

var buildPointsEditorHTMLFromGeometry = function(geometry){
	var pointsEditorHTML = '<div id="pointsContainer">' + buildPointsListHTMLFromGeometry(geometry) + '</div>';
	pointsEditorHTML += '<div class="point_div">';
	pointsEditorHTML += '<input type="button" class="editBtn" value="Adicionar" 	title="Adicionar" 	onclick="addPoint()" />';
	pointsEditorHTML += '<input type="button" class="editBtn" value="Remover" 	title="Remover" 	onclick="removeSelectedPoints()" />';
	pointsEditorHTML += '<input type="button" class="editBtn" value="Aplicar" 	title="Aplicar" 	onclick="apply()" />';
	pointsEditorHTML += '</div>';
	return pointsEditorHTML;
}

var generateNewFeature = function(){
	var extent = wfs.getExtent();
	var generatedFeature = null;
	
	if(featureType.geometryType == "MultiPointPropertyType"){
		var x = (extent.left + extent.right) / 2;
		var y = (extent.top + extent.bottom) / 2;
		generatedFeature = new OpenLayers.Feature.Vector(
			new OpenLayers.Geometry.MultiPoint([
				new OpenLayers.Geometry.Point(x,y)
			])
			
		);
	}
	
	if(featureType.geometryType == "MultiLineStringPropertyType"){
		var x1 = (2 * extent.left + extent.right) / 3;
		var x2 = (extent.left + 2 * extent.right) / 3;
		var y = (extent.top + extent.bottom)/2;
		generatedFeature = new OpenLayers.Feature.Vector(
			new OpenLayers.Geometry.MultiLineString([
				new OpenLayers.Geometry.LineString([
					new OpenLayers.Geometry.Point(x1,y),
					new OpenLayers.Geometry.Point(x2,y)
				])
			])
		);
	}
	
	if(featureType.geometryType == "MultiSurfacePropertyType"){
		var xmin = (extent.right + (2 * extent.left)) / 3;
		var xmax = (extent.left + (2 * extent.right)) / 3;
		var ymin = (extent.top + (2 * extent.bottom)) / 3;
		var ymax = (extent.bottom + (2 * extent.top)) / 3;
		generatedFeature = new OpenLayers.Feature.Vector(
			new OpenLayers.Geometry.MultiPolygon([
				new OpenLayers.Geometry.Polygon([
					new OpenLayers.Geometry.LinearRing([
						new OpenLayers.Geometry.Point(xmin,ymin),
						new OpenLayers.Geometry.Point(xmin,ymax),
						new OpenLayers.Geometry.Point(xmax,ymax),
						new OpenLayers.Geometry.Point(xmax,ymin),
						new OpenLayers.Geometry.Point(xmin,ymin)
					])
				])
			])
		)
	}
	
	if(generatedFeature == null)
		throw("\nI don't know how to generate features of type \"" + featureType.geometryType + "\", \nplease teach me");
	else{
		generatedFeature.fid = generateNewFeatureTempId();
		return generatedFeature;
	}
	
}

var popupPointsEditor = function(){
	if(selectedFeature == null){
		selectedFeature = generateNewFeature();
		selectedFeature.state = OpenLayers.State.INSERT;
		//wfs.addFeatures([selectedFeature]);
		drawBtn.drawFeature(selectedFeature.geometry);
		currentFeatures.push({
			fid:selectedFeature.fid,
			bounds: selectedFeature.geometry.bounds
		});
		drawCurrentFeature(selectedFeature);
		//feature.renderIntent = "selected";
		selectFeatureCtrl.select(selectedFeature);
		//wfs.drawFeature(feature);	
	}
	
	return buildPointsEditorHTMLFromGeometry(selectedFeature.geometry);
	
	/*var div = document.createElement("div");
	div.setAttribute("style","border:1px solid black;width:250px;height:330px;position:absolute;top:0px;right:0px;overflow:scroll;");
	div.setAttribute("id","popupPointsEditor");
	div.innerHTML = buildPointsEditorHTMLFromGeometry(feature.geometry);
	document.body.appendChild(div);*/
	
}

var addPoint = function(){
	
	var pointsContainer = $('pointsContainer');
	
	var div = document.createElement("div");
	div.setAttribute("class","point_div");
	div.innerHTML = '<input class="point_x" /><input class="point_y" /><input class="point_checkbox" type="checkbox" />';
	pointsContainer.appendChild(div);
	//when dealing with polygons, the shape must be closed so the first and last point must have exactly the same coordinates
	//to aid in the insertion, the new point entry is inserted before the last,
	//leaving the last point equal to the first so that the shape remains closed
	if(
		featureType.geometryType.indexOf("Polygon") >= 0
		||
		featureType.geometryType.indexOf("Surface") >= 0
	){
		var numPoints = pointsContainer.childElements().size();
		var lastIndex = numPoints - 1;
		
		pointsContainer.childElements()[lastIndex].childElements()[0].value = pointsContainer.childElements()[lastIndex - 1].childElements()[0].value;
		pointsContainer.childElements()[lastIndex].childElements()[1].value = pointsContainer.childElements()[lastIndex - 1].childElements()[1].value;
		
		pointsContainer.childElements()[lastIndex - 1].childElements()[0].value = '';
		pointsContainer.childElements()[lastIndex - 1].childElements()[1].value = '';
	}
}

var removeSelectedPoints = function(){
	var pointsContainer = $('pointsContainer');
	for(var i=0;i<pointsContainer.childElements().size();){
		var pointDiv = pointsContainer.childElements()[i];
		var checkbox = pointDiv.childElements()[2];
		if(checkbox.checked){
			pointsContainer.removeChild(pointDiv);
		} else {
			i++;
		}
	}
}

var apply = function(){
	var feature = selectedFeature; //getFeatureById(currentFeatureId);
	var pointsContainer = $('pointsContainer');
	
	for(i=0;i<pointsContainer.childElements().size();i++){
		var x = parseFloat(pointsContainer.childElements()[i].childElements()[0].value);
		var y = parseFloat(pointsContainer.childElements()[i].childElements()[1].value);
		if(isNaN(x) || isNaN(y)){
			alert('Erro: as coordenadas têm que ser números válidos');
			return;
		}
	}
	
	if(feature.geometry.CLASS_NAME == 'OpenLayers.Geometry.MultiPoint' || feature.geometry.CLASS_NAME == 'OpenLayers.Geometry.Point'){
		if(pointsContainer.childElements().size() != 1){
			alert('este tipo de layer só aceita geometrias com exactamente um ponto');
			return;
		}
		else{
			var point = (feature.geometry.x ? feature.geometry : feature.geometry.components[0]);
			point.x = parseFloat(pointsContainer.childElements()[0].childElements()[0].value);
			point.y = parseFloat(pointsContainer.childElements()[0].childElements()[1].value);
		}
	} else if (feature.geometry.CLASS_NAME == 'OpenLayers.Geometry.MultiLineString') {
		if(pointsContainer.childElements().size() < 2){
			alert('este tipo de layer só aceita geometrias com pelo menos dois pontos');
			return;
		}
		else{
			var lineComponent = feature.geometry.components[0];
			for(i=0;i<pointsContainer.childElements().size();i++){
				lineComponent.components[i] = new OpenLayers.Geometry.Point(
					parseFloat(pointsContainer.childElements()[i].childElements()[0].value),
					parseFloat(pointsContainer.childElements()[i].childElements()[1].value)
				);
			}
			while(lineComponent.components.size() > i){
				lineComponent.removeComponent(lineComponent.components[i]);
			}
		}
	} else if (feature.geometry.CLASS_NAME == 'OpenLayers.Geometry.MultiPolygon'){
		var numPoints = pointsContainer.childElements().size();
		var lastIndex = numPoints - 1;
		if(pointsContainer.childElements().size() < 3){
			alert('este tipo de layer só aceita geometrias com pelo menos quatro pontos pontos\n e o primeiro terá que ser igual ao último');
			return;
		} else if(
			(pointsContainer.childElements()[0].childElements()[0].value != pointsContainer.childElements()[lastIndex].childElements()[0].value)
			||
			(pointsContainer.childElements()[0].childElements()[1].value != pointsContainer.childElements()[lastIndex].childElements()[1].value)
		){
			alert('este tipo de geometria requer que o primeiro e o ultimo ponto sejam iguais');
			return;
		}
		else{
			var polygonComponent = feature.geometry.components[0];
			var linearRing = polygonComponent.components[0];
			for(i=0;i<pointsContainer.childElements().size();i++){
				linearRing.components[i] = new OpenLayers.Geometry.Point(
					parseFloat(pointsContainer.childElements()[i].childElements()[0].value),
					parseFloat(pointsContainer.childElements()[i].childElements()[1].value)
				);
			}
			while(linearRing.components.size() > i){
				linearRing.removeComponent(linearRing.components[i]);
			}
		}
	
	}
	if(!isNewFeatureTempId(feature.fid)){
		feature.state = OpenLayers.State.UPDATE;
		feature.attributes = {}
	}

	//selectedFeature
	
	selectFeatureCtrl.select(selectedFeature);
	
	feature.layer.drawFeature(feature, selectedStyleMap);
	
	for(var i=0; i<currentFeatures.length; i++){
		if(currentFeatures[i].fid == feature.fid){
			currentFeatures[i].bounds = feature.geometry.boounds;
		}
	}
}