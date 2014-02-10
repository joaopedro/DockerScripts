/**
 * 	GLOBALS
 * 	
 *	PREFIX: the xml document prefix
 *	Q the quotes being used in the document
 */
 var PREFIX, Q;

var parseAttributeStringPart = function(attributeString, startString, endString){
	var start =  attributeString.indexOf(startString);
	if(start < 0) 
		return null;
	else
		start = start + startString.length;
	var end = start + attributeString.substring(start).indexOf(endString);
	return attributeString.substring(start,end);
}

var parseAttributeStringType = function(attributeString){
	var type = parseAttributeStringPart(attributeString,'type='+ Q + PREFIX + ':', Q);
	if(type == null)
		type = parseAttributeStringPart(attributeString,'restriction base=' + Q + PREFIX + ':', Q);
	return type;
}

var makeItFancy = function(name){
	name = name.charAt(0).toUpperCase() + name.substring(1).toLowerCase();
	var delimiters = new Array("-","_",".");
	for(var key=0; key < delimiters.length; key++){
		var delimiter = delimiters[key];
		while((index = name.indexOf(delimiter)) > 0){
			name = name.substring(0,index) + " " + name.charAt(index+1).toUpperCase() + name.substring(index+2);
		}
	}
	return name;
}

var parseAttributeString = function(attributeString){
	//ignore the geometry attribute
	if(attributeString.indexOf('type=' + Q + 'gml:') > 0)
		return null;
		
	var attribute = new Object();
	attribute.type 		= parseAttributeStringType(attributeString);
	attribute.name 		= parseAttributeStringPart(attributeString,'name='+Q,Q);
	attribute.fancyName	= makeItFancy(attribute.name);
	attribute.minOccurs = parseAttributeStringPart(attributeString,'minOccurs='+Q,Q);
	attribute.maxOccurs = parseAttributeStringPart(attributeString,'maxOccurs='+Q,Q);
	attribute.maxLength = parseAttributeStringPart(attributeString,'maxLength value='+Q,Q);
	if(attribute.minOccurs == null)
		attribute.isReadOnly = true;
	else
		attribute.isReadOnly = false;
	return attribute;
}

var parseAttributeDefinitions = function(description) {
	var start, end, startString, endString, tail = description;
	var attributeDefinitions = new Object();
	
	//Q = quotes
	Q = tail.indexOf('targetNamespace="') > 0 ? '"' : "'";
				
	//discard the '<?xml ?>' prelude
	if(tail.indexOf('?>') > 0)
		tail=tail.substring(tail.indexOf('?>') + 2);
		
	//the PREFIX
	start = 1 + tail.indexOf('<');
	end = tail.indexOf(':schema');
	PREFIX = tail.substring(start,end);
	
	//the elements
	startString = '<'+PREFIX+':sequence>';
	endString = '</'+PREFIX+':sequence>';
	start = tail.indexOf(startString) + startString.length;
	end = tail.indexOf(endString);
	tail = tail.substring(start,end);
	startString = '<'+PREFIX+':element';
	start = tail.indexOf(startString);
	tail = tail.substring(start);
	while(tail.indexOf(startString) >=0){
		var attributeString;
		if(tail.substring(1).indexOf(startString) >=0){
			end = tail.substring(1).indexOf(startString) + 1;
			attributeString = tail.substring(0,end);
			tail = tail.substring(end);
		} else{
			attributeString = tail;
			tail='';
		}
		var attributeDefinition = parseAttributeString(attributeString);
		if(attributeDefinition)
			attributeDefinitions[attributeDefinition.name] = attributeDefinition;
	}
	
	return attributeDefinitions;
}

/***********************************/

var closeAttributesEditor = function(){
	Ext.getCmp('attributeEditor').close();
}

var popupAttributesEditor = function(){
	/*
	var feature;
	if(selectedFeature==''){
		feature = generateFeature();
		feature.fid = NEW_FEATURE_TEMP_ID;
		feature.state = OpenLayers.State.INSERT;
		wfs.addFeatures([feature]);
		selectFeature(feature);
		currentFeatureId = NEW_FEATURE_TEMP_ID;
	} else {
		feature = getFeatureById(currentFeatureId);
	}
	
	var feature;
	if(selectedFeature==''){
		info("Por favor seleccione primeiro um");
	}
	*/
	return buildAttributesEditorHTMLFromFeature(selectedFeature);
	/*
	var div = document.createElement("div");
	div.setAttribute("id","attributesEditor");
	div.innerHTML = buildAttributesEditorHTMLFromFeature(feature);
	document.body.appendChild(div);
	*/
}

var removeReadOnlyAttributes = function(){
	var feature = selectedFeature; //getFeatureById(currentFeatureId);
	for(key in featureType.attributeDefinitions){
		var attributeDefinition = featureType.attributeDefinitions[key];
		if(attributeDefinition.isReadOnly)
			delete feature.attributes[attributeDefinition.name];
	}
}

var setAttributes = function(){
	var attributesContainer = $('attributesContainer');
	var tbody = attributesContainer.childElements()[0];
	for(i=0;i<tbody.childElements().size() - 2;i++){
		var tr = tbody.childElements()[i];
		var attributeName = tr.childElements()[1].childElements()[0].name;
		var attributeValue = tr.childElements()[1].childElements()[0].value;
		if( attributeValue == "" || attributeValue == undefined)
			attributeValue = null;
		var attributeDefinition = featureType.attributeDefinitions[attributeName];
		if(!attributeDefinition.isReadOnly){
			if(selectedFeature.attributes[attributeName] != attributeValue){
				selectedFeature.attributes[attributeName] = attributeValue;
				if(selectedFeature.state == null)
					selectedFeature.state = OpenLayers.State.UPDATE;
			}
		}
	}
	closeAttributesEditor();
}

var buildAttributesEditorHTMLFromFeature = function(feature){
	var editorHTML = '<table id="attributesContainer">';
	editorHTML += buildAttributesListHTMLFromFeature(feature);
	if(task == 'edit')
		editorHTML += '<tr class="attribute_tr"><td class="attribute_empty_td">&nbsp;</td><td><input type="button" class="editBtn" style="width:99%" value="Aplicar" 		title="Aplicar" 	onclick="setAttributes()" /></td><td class="attribute_empty_td">&nbsp;</td>';
	editorHTML += '<tr class="attribute_tr"><td class="attribute_empty_td">&nbsp;</td><td><input type="button" class="editBtn" style="width:99%" value="Cancelar" 	title="Cancelar" 	onclick="closeAttributesEditor()" /></td><td class="attribute_empty_td">&nbsp;</td>';
	editorHTML += '</table>';
	return editorHTML;
}

var buildAttributesListHTMLFromFeature = function(feature){
	var attributesListHTML = '';
	for(key in featureType.attributeDefinitions){
		var attributeDefinition = featureType.attributeDefinitions[key];
		attributesListHTML += '<tr class="attribute_tr">';
		attributesListHTML += 	'<td class="attribute_label_td">';
		attributesListHTML += 	'<label for="' + attributeDefinition.name + '">' + attributeDefinition.fancyName + '</label>';
		attributesListHTML += 	'</td>';
		attributesListHTML += 	'<td class="attribute_value_td">';
		attributesListHTML += 	'<input type="text"';
		attributesListHTML += 	' name="' + attributeDefinition.name + '"'
		attributesListHTML += 	' value="' + (feature.attributes[attributeDefinition.name] ? feature.attributes[attributeDefinition.name] : '') + '"'
		attributesListHTML += 	(attributeDefinition.isReadOnly || task != 'edit' ? ' disabled="disabled"' : '')
		attributesListHTML += 	(attributeDefinition.maxLength ? ' maxlength="' + attributeDefinition.maxLength + '"' : '')
		attributesListHTML += 	' />';
		attributesListHTML += 	(attributeDefinition.minOccurs > 0 ? '*' : '');
		attributesListHTML += 	'</td>';
		attributesListHTML += 	'<td class="attribute_description_td">';
		attributesListHTML += 	(attributeDefinition.type ? makeItFancy(attributeDefinition.type) : '?');
		attributesListHTML += 	'</td>';
		attributesListHTML += '</tr>';
		
	}
	return attributesListHTML;
}