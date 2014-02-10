<%@ taglib uri="http://java.sun.com/jsp/jstl/core"	prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"	prefix="fmt" %>

	<head>
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<META HTTP-EQUIV="Expires" CONTENT="-1">
		<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
	</head>
	
<fmt:setBundle var="sig" basename="resources.sig"/>

<c:set var="IMG_DIR" value="${pageContext.request.contextPath}/images" />
<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />

<c:set var="geographicObject" value="${geographicObjectHandler.geographicObject}" />
<c:set var="defaultMapService" value="${geographicObjectHandler.defaultMapService}" />
<c:set var="defaultSrcService" value="${geographicObjectHandler.defaultSrcService}" />
<c:set var="defaultEditableService" value="${geographicObjectHandler.defaultEditableService}" />
<c:set var="defaultAttributeValues" value="${geographicObjectHandler.defaultAttributeValues}" />
<c:set var="maxFeatures" value="${geographicObjectHandler.maxFeatures}" />
<c:set var="baseLayers" value="${empty geographicObject ? defaultMapService.layers : geographicObject.mapService.layers}"></c:set>
<c:set var="forceEditTools" value="${param.forceEditTools}"></c:set>

<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/Window_Iframe.js"></script>

<style>

<%--
#DHTMLSuite_pane_north, #DHTMLSuite_pane_south, #DHTMLSuite_pane_west, .titulo1, #center br{display:none !important;}
--%>

#pointsContainer{}
#map{
	height:600px;
	border:2px solid #ddd; 
}
.olControlOverviewMapElement {
	background-color:#eee !important;
	border:1px solid #00008B !important;
	padding: 0 !important;
	-moz-border-radius: 0 !important;
}
.olControlOverviewMapMinimizeButton {
	background-color: #00008B;
	bottom: 74px !important;
	right: 164px !important;
}    
.olControlOverviewMapMaximizeButton {
    right: 0px;
	bottom: 73px !important;
}
.olControlOverviewMapMinimizeButton {
	background-color:#333;
}
.olControlOverviewMapElement, .olControlOverviewMapExtentRectangle {
	border-color:#333 !important;
}
.olControlPermalink a, .olControlMousePosition.olControlNoSelect{
	color:#333;
	font-size:xx-small;
	font-family: arial;
}
#pointEditor input{
	border:1px solid #eee;
}		
.olControlEditingToolbar{
	border:2px solid #ddd; 
	background-color:#f0f0f0;
	height:33px !important;
	bottom:5px !important;
	opacity:0.4;
	filter:alpha(opacity=40);
	left: 50% !important;
	cursor:pointer;
}
.navigationBtnItemActive {
    background-image: url(${IMG_DIR}/sig/pan.png) !important;
	background-color:#C0C0C0 !important;
}
.navigationBtnItemInactive {
    background-image: url(${IMG_DIR}/sig/pan.png) !important;
}
.zoomBtnItemActive {
    background-image: url(${IMG_DIR}/sig/zoomIn.png) !important;
	background-color:#C0C0C0 !important;
}
.zoomBtnItemInactive {
    background-image: url(${IMG_DIR}/sig/zoomIn.png) !important;
}
.identifyBtnItemActive {
	background-image: url(${IMG_DIR}/sig/identify.png) !important;
	background-color:#C0C0C0 !important;
}
.identifyBtnItemInactive {
	background-image: url(${IMG_DIR}/sig/identify.png) !important;
}
.attributesEditorBtnItemActive, .attributesEditorBtnItemInactive {
    background-image: url(${IMG_DIR}/sig/attributes.png) !important;
}
.attributesEditorBtnItemActive, .attributesEditorBtnItemInactive {
    background-image: url(${IMG_DIR}/sig/attributes.png) !important;
}
.olControlSaveFeaturesItemActive, .olControlSaveFeaturesItemInactive { 
    background-image: url(${IMG_DIR}/sig/save.png) !important;
}
.deleteBtnItemActive, .deleteBtnItemInactive { 
    background-image: url(${IMG_DIR}/sig/delete.png) !important;
}
.featureListBtnItemActive, .featureListBtnItemInactive {
    background-image: url(${IMG_DIR}/sig/features.png) !important;
}
.selectBtnItemActive { 
    background-image: url(${IMG_DIR}/sig/select.png) !important;
	background-color:#C0C0C0 !important;
}
.selectBtnItemInactive { 
    background-image: url(${IMG_DIR}/sig/select.png) !important;
}
.initialExtentBtnItemInactive, .initialExtentBtnItemActive{
	background-image: url(${IMG_DIR}/sig/initialZoom.png) !important;
}
.activateCopyBtnItemInactive, .activateCopyBtnItemActive{
	background-image: url(${IMG_DIR}/sig/import.png) !important;
}
.pointEditorBtnItemActive, .pointEditorBtnItemInactive { 
    background-image: url(${IMG_DIR}/sig/verticeEditor.png) !important;
}
.drawFeatureItemActive { 
    background-image: url(${IMG_DIR}/sig/draw.png) !important;
	background-color:#C0C0C0 !important;
}
.drawFeatureItemInactive { 
    background-image: url(${IMG_DIR}/sig/draw.png) !important;
}
.copyFeaturesPanel{
	width: 68px !important;
	margin-left: -34px;
}
.confirmCopyFeaturesBtnItemActive, .confirmCopyFeaturesBtnItemInactive{
	background-image: url(${IMG_DIR}/sig/paste.png) !important;
}
.cancelCopyFeaturesBtnItemActive, .cancelCopyFeaturesBtnItemInactive{
	background-image: url(${IMG_DIR}/sig/undo.png) !important;
}

</style>

<!-- Scripts IPDMS -->
<script src='${JS_DIR}/behaviour.js' type="text/javascript"></script>
<script src='${JS_DIR}/cookie.js' type="text/javascript"></script>
<script src='${JS_DIR}/formFunctions.js' type="text/javascript"></script>
<script src='${JS_DIR}/menus.js' type="text/javascript"></script>
<script src='${JS_DIR}/multifile.js' type="text/javascript"></script>
<script src='${JS_DIR}/overlibmws/overlibmws.js' type="text/javascript"></script>
<script src='${JS_DIR}/utils.js' type="text/javascript"></script>
<script src='${JS_DIR}/prototype.js' type="text/javascript"></script>
<script src='${JS_DIR}/scriptaculous.js' type="text/javascript"></script>
<script src='${JS_DIR}/controls.js' type="text/javascript"></script>
<script src='${JS_DIR}/documentos.js' type="text/javascript"></script>
<script src='${JS_DIR}/date.js' type="text/javascript"></script>

<!-- EXT -->
<LINK href="${JS_DIR}/ext/resources/css/ext-all.css" rel="stylesheet" type="text/css" />
<script src="${JS_DIR}/ext/ext-base.js" type="text/javascript" ></script>
<script src='${JS_DIR}/ext/ext-all.js' type="text/javascript"></script>
<!-- /Scripts IPDMS -->

<script src="${JS_DIR}/sig/include.js" type="text/javascript"></script>
<script>
	var defaultGraphic = "${defaultEditableService.defaultGraphic}";
	var temporaryGraphic = "${defaultEditableService.temporaryGraphic}";
	var deleteGraphic = "${defaultEditableService.deleteGraphic}";
	var currentGraphic = "${defaultEditableService.currentGraphic}";
	var highlightedGraphic = "${defaultEditableService.highlightedGraphic}";
	var selectedGraphic = "${defaultEditableService.selectedGraphic}";
</script>

<!-- INCLUDE PROJ4JS -->
<script src="${JS_DIR}/sig/proj4js/lib/proj4js.js" type="text/javascript"></script>
<!-- INCLUDE PROJ4JS projections definitions -->
<script src="${JS_DIR}/sig/proj4js/lib/defs/EPSG3763.js" type="text/javascript"></script> <!--ETRS89/Portugal TM06-->
<script src="${JS_DIR}/sig/proj4js/lib/defs/EPSG20790.js" type="text/javascript"></script> <!--Hayford-Gauss, Datum Lisboa, Militar-->
<script src="${JS_DIR}/sig/proj4js/lib/defs/EPSG23030.js" type="text/javascript"></script> <!--ED50/UTM zone 30N-->
<script src="${JS_DIR}/sig/proj4js/lib/defs/EPSG27492.js" type="text/javascript"></script> <!--Hayford-Gauss, Datum 73, IGP-->
<script src="${JS_DIR}/sig/proj4js/lib/defs/EPSG32733.js" type="text/javascript"></script> <!--WGS 84 / UTM zone 33S (AO)-->
<script src="${JS_DIR}/sig/proj4js/lib/defs/EPSG102160.js" type="text/javascript"></script> <!--Datum 73 Hayford Gauss IGeoE (ESRI)-->
<script src="${JS_DIR}/sig/proj4js/lib/defs/EPSG102161.js" type="text/javascript"></script> <!--Datum 73 Hayford Gauss IPCC (ESRI)-->
<script src="${JS_DIR}/sig/proj4js/lib/defs/EPSG102164.js" type="text/javascript"></script> <!--Lisboa Hayford Gauss IGeoE (ESRI)-->
<script src="${JS_DIR}/sig/proj4js/lib/defs/EPSG102165.js" type="text/javascript"></script> <!--Lisboa Hayford Gauss IPCC (ESRI)-->

<script src="${JS_DIR}/sig/initFeatureType.js" type="text/javascript"></script>
<script src="${JS_DIR}/sig/wfs.js" type="text/javascript"></script>
<script src="${JS_DIR}/sig/attributes.js" type="text/javascript"></script>
<script src="${JS_DIR}/sig/copy.js" type="text/javascript"></script>

<script>

var loadingPanelJS = "${JS_DIR}/sig/loadingPanel/loadingPanel.js";
var loadingPanelCSS = "${JS_DIR}/sig/loadingPanel/loadingPanel.css";

var geoServerJS = "${JS_DIR}/sig/OpenLayers/OpenLayers.js";
var arcGisServerJS = "${JS_DIR}/sig/OpenLayersArcGis/OpenLayers.js";

var hostName = window.location.protocol + "//" + window.location.host;
var proxy = hostName + "${pageContext.request.contextPath}/openLayersProxy?";

var geographicObjectId = "${geographicObject.id}";
var task = '${task}';
var forceEditTools = '${forceEditTools}';

var xmin='${geographicObject.xmin}', ymin='${geographicObject.ymin}', xmax='${geographicObject.xmax}', ymax='${geographicObject.ymax}';
var currentFeatures = new Array();
//<c:forEach var="feature" items="${geographicObject.geographicFeatures}">
	currentFeatures.push({
		fid:"${feature.sigId}"
	});
//</c:forEach>

var defaultAttributeValues = new Object();
//<c:forEach var="mapEntry" items="${defaultAttributeValues}">
	defaultAttributeValues['${mapEntry.key}'] = '${mapEntry.value}';
//</c:forEach>
					
var selectedFeature = null;
var insertedFeatures = new Array();
var insertedFeatureIds = new Array();
var removedFeatureIds = new Array();
var updatedFeatureIds = new Array();
var constrainedFeatureIds = new Array();
var removeIntent = false;
var transientFeatures = new Array();

/* REMOVE THIS */
var updatedFeatures;

var isDirty;

var integrityCheck = true;

var baseService = proxy + escape("${empty geographicObject ? defaultMapService.url : geographicObject.mapService.url}");
var baseLayers = "";
//<c:forEach var="baseLayer" items="${baseLayers}" varStatus="status">
	baseLayers += "${baseLayer.name}";
//	<c:if test="${not status.last}">
		baseLayers += ",";
//	</c:if>
//</c:forEach>

var srcService = "${empty geographicObject ? defaultSrcService.url : geographicObject.srcService.url}";
var srcLayer = "${empty geographicObject ? defaultSrcService.layer.name : geographicObject.srcService.layer.name}";

var editableService = "${empty geographicObject ? defaultEditableService.url : geographicObject.editableService.url}";
var editableLayer = "${empty geographicObject ? defaultEditableService.layer.name : geographicObject.editableService.layer.name}";

var maxFeatures = "${maxFeatures}";

var featureType = new Object();
featureType.editableService = editableService;
featureType.editableLayer = editableLayer;

var map, wms, wfs, geographicSourceLayer;

var defaultPanel;

var selectFeatureCtrl;
var highlightFeatureCtrl;

var selectFeatureCtrl, drawBtn;

var initMap = function() {
	var maxResolution = (bounds.left - bounds.right) / 265;
	
	var options = {
		controls: [],
		maxExtent: bounds,
		maxResolution: Math.abs(maxResolution),
		projection: epsgCode,
		units: projDest.getUnits(),
		fractionalZoom: true,
		eventListeners: {
			"moveend": function(){log("MAP moveend","green")}
		}
	};
	map = new OpenLayers.Map('map', options);
				
	wms = new OpenLayers.Layer.WMS(
		"Layer de Base",
		baseService,
		{
			layers: baseLayers,
			srs: epsgCode,
			format: 'image/png'
		}
	);
	
	map.addLayers([wms]);
	
	wfs = createWfs(featureType,mainStyleMap);

	map.addLayers([wfs]);

	wfs.ipdmsSaveCallback = function(){
		removeIntent = false;
		Ext.MessageBox.wait('A gravar dados no IPDMS');
		
		var url = "${pageContext.request.contextPath}/sig/updateGeographicObject.do2";
		
		xmin = wfs.getExtent().left;
		xmax = wfs.getExtent().right;
		ymin = wfs.getExtent().top;
		ymax = wfs.getExtent().bottom;
		
		new Ajax.Request(url, {
			method: 'post',
			parameters:{
//				<c:forEach var="mapElement" items="${geographicObjectHandlerId}">
					'geographicObjectHandlerIdElement(${mapElement.key})':	'${mapElement.value}',
//				</c:forEach>
				geographicObjectHandlerClass: '${geographicObjectHandlerClass}',
				numeroConteudoEstrutura: '${numeroConteudoEstrutura}',
				insertedSigIds:insertedFeatureIds,
				removedSigIds:removedFeatureIds,
				xmin: xmin,
				xmax: xmax,
				ymin: ymin,
				ymax: ymax,
				snapshot:buildGlobalSnapshot()
			},
			onSuccess: function(transport) {
				Ext.MessageBox.show({
					title: 'Informação',
					msg: transport.responseText,
					buttons: Ext.MessageBox.OK,
					icon: Ext.MessageBox.INFO,
					width:400,
					height:300,
					fn: updateCurrentFeatures
				});
			},
			onFailure: function(transport){
				Ext.MessageBox.show({
					title: 'Erro', 
					msg: transport.responseText,
					buttons: Ext.MessageBox.OK,
					icon: Ext.MessageBox.ERROR,
					width:600,
					height:400
				});
			}
		});
	}
	
	navigationBtn = new OpenLayers.Control.Navigation({
		displayClass: 'navigationBtn',
		title: "Mover",
		eventListeners: {
			"activate":	function(){
				$('map').style.cursor='move';
			},
			"deactivate":	function(){
				$('map').style.cursor='';
			}
		}
	});
	
	zoomBtn = new OpenLayers.Control.ZoomBox({
		displayClass: 'zoomBtn',
		title: "Aproximar",
		eventListeners: {
			"activate":	function(){
				$('map').style.cursor='crosshair';
			},
			"deactivate": function(){
				$('map').style.cursor='';
			}
		}
	});
	
	initialExtentBtn = new OpenLayers.Control.Button({
		title: "Extensão Inicial",
		trigger: function(){
			if(xmin && ymin && xmax && ymax)
				map.zoomToExtent(new OpenLayers.Bounds(xmin, ymin, xmax, ymax));
			else
				map.zoomToMaxExtent();
		},
		displayClass: "initialExtentBtn"
	});
	
	var identifyCtrl = new OpenLayers.Control.SelectFeature(wfs, {
		title: "Identificar",
		selectStyle: selectedStyleMap,
		displayClass: "identifyBtn",
		clickout: true,
		multiple: false,
		onSelect: function(feature) {
			if(isCurrentFeatureId(feature.fid)){
				alert(feature.fid);
			}
			else {
				identifyCtrl.unselectAll();
			}
		},
		onUnselect: function(feature) {
			if(isCurrentFeatureId(feature.fid)){
				feature.renderIntent = "current";
				wfs.drawFeature(feature);
			}
		},
		callbacks: {
			'over': function(feature) {
				if(isCurrentFeatureId(feature.fid)){
					feature.renderIntent = "highlighted";
					wfs.drawFeature(feature);
				}
			},
			'out': function(feature) {
				if(isCurrentFeatureId(feature.fid)) {
					feature.renderIntent = "current";
					wfs.drawFeature(feature);				
				}
				identifyCtrl.unselectAll();
			}
		},
		eventListeners: {
			"activate":	function(){
				$('map').style.cursor='help';
			},
			"deactivate": function(){
				$('map').style.cursor='';
			}
		}
	});
	
	selectFeatureCtrl = new OpenLayers.Control.SelectFeature(wfs, {
		title: "Seleccionar",
		selectStyle: selectedStyleMap,
		displayClass: "selectBtn",
		clickout: true,
		toggle: true,
		multiple: false,
		onSelect: function(feature) {
			if(isCurrentFeatureId(feature.fid)){
				selectedFeature = feature;
				feature.renderIntent = "selected";
			} else {
				selectFeatureCtrl.unselectAll();
				selectedFeature = null;
				if(feature.state == "Delete") {
					wfs.strategies[0].triggerRead();
				}
			}		
		},
		onUnselect: function(feature) {
			selectedFeature = null;
			selectFeatureCtrl.unselectAll();
			if(isCurrentFeatureId(feature.fid)){
				feature.renderIntent = "current";
				wfs.drawFeature(feature);
			}
		},
		callbacks: {
			'over': function(feature) {
				if(isCurrentFeatureId(feature.fid)){
					feature.renderIntent = "highlighted";
					wfs.drawFeature(feature);
				}
			},
			'out': function(feature) {
				if(selectedFeature == null && isCurrentFeatureId(feature.fid)) {
					feature.renderIntent = "current";
					wfs.drawFeature(feature);
				}
				else if(selectedFeature != null && isCurrentFeatureId(feature.fid)) {
					feature.renderIntent = "selected";
					wfs.drawFeature(feature);				
				}
			}
		},
		eventListeners: {
			"activate":	function(){
				$('map').style.cursor='pointer';
			},
			"deactivate": function(){
				$('map').style.cursor='';
			}
		}
	});
	
	var attributesEditorBtn = new OpenLayers.Control.Button({
		title: "Editor de Atributos",
		trigger: function(){
			if(selectedFeature == null){
				info("Por favor seleccione primeiro um objecto.");
				return;
			}
			var winchoose = null;
			var win = null;
			if(winchoose != null && winchoose.isVisible())
				return;
			winchoose = new Ext.Window({
				id			: 'attributeEditor',
				title		: 'Editor de Atributos: ' + selectedFeature.fid,
				modal		: true,
				maximizable	: false,
				resizable	: true, 
				closable	: true,
				width		: 300,
				autoHeight	: true
			});
			winchoose.on('beforerender', function(p){
				winchoose.add({html: popupAttributesEditor()});
				win = Ext.WindowMgr;
				win.zseed='12000';          
				winchoose= win.get(winchoose);
			});            
			winchoose.on(
			'beforeclose', 
				function(p) {
					winchoose = null;
					win=null;
				}
			);
			winchoose.show();      
		},
		displayClass: "attributesEditorBtn"
	});
	
	var featureListBtn = new OpenLayers.Control.Button({
		title: "Lista de Geometrias",
		displayClass: "featureListBtn",
		trigger: function(){
			var winchoose = null;
			var win = null;
			if(winchoose != null && winchoose.isVisible())
				return;
			winchoose = new Ext.Window({
				id			: 'featureList',
				title		: 'Lista de Geometrias',
				modal		: true,
				maximizable	: false,
				resizable	: false,
				closable	: true,
				width		: 200,
				autoHeight	: true
			});
			winchoose.on('beforerender', function(p){
				for(var i=0; i<currentFeatures.length; i++){
					var feature = currentFeatures[i];
					log(feature.bounds, "orange"); 
					winchoose.add(
						new Ext.Button({
							text: feature.fid,
							handler: function(){
								var feature = getFeatureById(this.text);
								map.zoomToExtent(
									feature.geometry.getBounds()
								);
								feature.previousRenderIntent = feature.renderIntent;
								selectFeatureCtrl.unselectAll();
								selectFeatureCtrl.select(feature);
							}
						})
					);
					
				}
				win = Ext.WindowMgr;
				win.zseed='12000';          
				winchoose= win.get(winchoose);
			});
			winchoose.on(
			'beforeclose', 
				function(p) {
					winchoose = null;
					win=null;
				}
			);
			winchoose.show();
		}
	});
	
	drawBtn = new OpenLayers.Control.DrawFeature(
		wfs, featureType.handler,
		{
			title: "Marcação de Objecto",
			handlerOptions: {freehand: false, multi: featureType.multi},
			displayClass: featureType.controlDrawDisplayClass,
			eventListeners: {
				"activate":	function(){
					$('map').style.cursor='crosshair';
				},
				"deactivate": function(){
					$('map').style.cursor='';
				}
			}
		}
	);
	
	modifyControl = new OpenLayers.Control.ModifyFeature(
		wfs,
		{
			standalone: true
		}
	);
	modifyControl.virtualStyle.strokeColor = "#FF0000";
	modifyControl.virtualStyle.fillColor = "#FF0000";
	
	wfs.events.register('featuremodified', this, function(evt) {
		winchoose.close();
		pointEditorBtn.trigger();
	});	
	map.addControl(modifyControl);
	modifyControl.activate();
	
	var winchoose = null;	
	
	var pointEditorBtn = new OpenLayers.Control.Button({
		title: "Editor de Vértices",
		trigger: function(){
			var win = null;
			if(winchoose != null && winchoose.isVisible())
				return;
			winchoose = new Ext.Window({
				id			: 'pointEditor',
				title		: 'Editor de Vértices: '  + (selectedFeature ? selectedFeature.fid : "Nova Geometria"),
				maximizable	: false,
				resizable	: false, 
				closable	: true,
				width		: 340,
				autoHeight	: true
			});
			winchoose.on('beforerender', function(p){
				winchoose.add({html: popupPointsEditor()});
				win = Ext.WindowMgr;
				win.zseed='12000';          
				winchoose= win.get(winchoose);
				modifyControl.selectFeature(selectedFeature);
			});            
			winchoose.on(
			'beforeclose', 
				function(p) {
					winchoose = null;
					win=null;
					modifyControl.unselectFeature(selectedFeature);
				}
			);
			winchoose.show();
		},
		displayClass: "pointEditorBtn"
	});
	
	var activateCopyBtn = new OpenLayers.Control.Button({
		title:'Importar Geometrias',
		displayClass: 'activateCopyBtn',
		trigger: activateCopy
	});
	
	var deleteBtn = new OpenLayers.Control.Button({
		title: "Apagar",
		trigger: function(){
			if(selectedFeature == null){
				info("Por favor seleccione primeiro um objecto.");
				return;
			}
			deleteSelectedFeature();
		}, 
		displayClass: "deleteBtn"
	});

	var saveBtn = new OpenLayers.Control.Button({
		title: "Gravar",
		trigger: function(){
			Ext.MessageBox.wait(
				'A gravar dados no SIG ',
				'Informação'
			);
			isDirty = true;
			removeIntent = true;
			cloneInsertedFeatures();
			wfs.commit();
		},
		displayClass: "olControlSaveFeatures"
	});
	
	defaultPanel = new OpenLayers.Control.Panel({
		displayClass: "olControlEditingToolbar",
		id:"toolbar",
		name:"toolbar"
	});
	
	if(task == "edit" && srcLayer && (forceEditTools == "false" || !forceEditTools)) {
		defaultPanel.addControls([saveBtn, deleteBtn, activateCopyBtn]);
	}
	else if(task == "edit" && !srcLayer) {
		defaultPanel.addControls([saveBtn, deleteBtn, pointEditorBtn, drawBtn]);
	}
	else if(task == "edit" && srcLayer && forceEditTools == "true") {
		defaultPanel.addControls([saveBtn, deleteBtn, activateCopyBtn, pointEditorBtn, drawBtn]);
	}
	
	defaultPanel.addControls([featureListBtn, attributesEditorBtn, selectFeatureCtrl, identifyCtrl, initialExtentBtn, zoomBtn, navigationBtn]);	
	defaultPanel.defaultControl = navigationBtn;
	map.addControl(defaultPanel);	
 	var defaultPanelWidth = defaultPanel.controls.length * 34;
	$('toolbar').style.width = defaultPanelWidth + 'px';
	$('toolbar').style.marginLeft = '-' + defaultPanelWidth / 2 + 'px';
	$('toolbar').observe('mouseover', function() {
		$('toolbar').style.opacity='1';
		$('toolbar').style.filter='alpha(opacity=100)';
	});
	$('toolbar').observe('mouseout', function() {
		$('toolbar').style.opacity='0.4';
		$('toolbar').style.filter='alpha(opacity=40)';
	});

	var panZoomBarCtrl = new OpenLayers.Control.PanZoomBar({zoomWorldIcon: true});
	map.addControl(panZoomBarCtrl);

	for(var i=0; i<panZoomBarCtrl.buttons.length; i++){
		if(panZoomBarCtrl.buttons[i].id.match('panup')) {
			panZoomBarCtrl.buttons[i].title = "Mover para Norte"
		}
		else if(panZoomBarCtrl.buttons[i].id.match('panleft')) {
			panZoomBarCtrl.buttons[i].title = "Mover para Oeste"
		}
		else if(panZoomBarCtrl.buttons[i].id.match('zoomworld')) {
			panZoomBarCtrl.buttons[i].title = "Extensão Máxima"
		}
		else if(panZoomBarCtrl.buttons[i].id.match('panright')) {
			panZoomBarCtrl.buttons[i].title = "Mover para Este"
		}
		else if(panZoomBarCtrl.buttons[i].id.match('pandown')) {
			panZoomBarCtrl.buttons[i].title = "Mover para Sul"
		}
		else if(panZoomBarCtrl.buttons[i].id.match('zoomin')) {
			panZoomBarCtrl.buttons[i].title = "Aproximar"
		}
		else if(panZoomBarCtrl.buttons[i].id.match('zoomout')) {
			panZoomBarCtrl.buttons[i].title = "Afastar"
		}
	}
	
	panZoomBarCtrl.zoombarDiv.parentNode.style.cursor = 'pointer';

	var scaleLineCtrl = new OpenLayers.Control.ScaleLine();
	map.addControl(scaleLineCtrl);
	
	function addCommas( sValue ) {
		var sRegExp = new RegExp('(-?[0-9]+)([0-9]{3})');
		while(sRegExp.test(sValue)) {
			sValue = sValue.replace(sRegExp, '$1,$2');
		}
		return sValue;
	};

	map.events.register('zoomend', this, function(){
		scaleLineCtrl.div.title = '1:' + addCommas(Math.round(map.getScale())+'');
	});
	
	map.addControl(new OpenLayers.Control.Navigation());
	map.addControl(new OpenLayers.Control.MousePosition({title: projDest.getCode(), suffix: ' ' + map.getUnits()}));
	map.addControl(new OpenLayers.Control.OverviewMap({mapOptions: {maxExtent: bounds}}));
	
	$('olControlOverviewMapMaximizeButton').title = 'Maximizar Mapa de Referência';
	$('OpenLayers_Control_minimizeDiv').title = 'Minimizar Mapa de Referência';
	
	$('olControlOverviewMapMaximizeButton').observe('mouseover', function() {
		$('olControlOverviewMapMaximizeButton').style.cursor='pointer';
	});	
	$('OpenLayers_Control_minimizeDiv').observe('mouseover', function() {
		$('OpenLayers_Control_minimizeDiv').style.cursor='pointer';
	});
	
	map.addControl(new OpenLayers.Control.LoadingPanel());
	
	map.zoomToMaxExtent();
}

var init = function(){
	initFeatureType(featureType,initMap);
}

Event.observe(window, 'load', init);
</script>

<div class="titulo1">SIG - ${task eq 'edit'  ? 'Marcação' : 'Consulta'}</div><br />

<div id="map"></div>

<br />
<input type="button" onclick="window.location.href=unescape('${pageContext.request.contextPath}${urlAnterior}');" class="btFormEscuro" value='<fmt:message key="ipdms.forms.anterior" title="Retroceder ao ecrã anterior" />'><br />