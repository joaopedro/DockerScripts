<%@ taglib uri="http://java.sun.com/jsp/jstl/core"	prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<c:set var="IMG_DIR" value="${pageContext.request.contextPath}/images" />

<link rel="stylesheet" href="${JS_DIR}/sig/loadingPanel/loadingPanel.css" type="text/css" />
<link rel="stylesheet" href="${JS_DIR}/ext/resources/css/xtheme-gray.css" type="text/css" />

<style type="text/css">
	#map{
		width:100%;
		height:100%;
	}
</style>

<script src="${JS_DIR}/sig/OpenLayersArcGis/OpenLayers.js"></script>
<script src="${JS_DIR}/sig/loadingPanel/loadingPanel.js"></script>

<script>
	Array.prototype.has=function(v){
		for (i=0; i<this.length; i++){
			if (this[i]==v) return true;
		}
		return false;
	}

	var allLayers = new Array();
	var map;
	
	var proxy = "${pageContext.request.contextPath}/openLayersProxy?";
	OpenLayers.ProxyHost = proxy;
	
	var getMapParams = function() {
		var wfsArray = [];
		var srsArray = [];
		var wmsServicesArray = [];
		var wmsLayersArray = [];
		var bounds = new OpenLayers.Bounds();
		
//		<c:forEach items="${wfsList}" var="wfs" varStatus="i">
			wfsArray.push("${wfs.url}" + "," + "${wfs.layer.name}");
//		</c:forEach>

		if(wfsArray.length == 0 && "${wmsList}" == "[]") {
			Ext.MessageBox.show({
				title: 'Informação', 
				msg: 'Não existem layers definidas no Mapa Global',
				buttons: Ext.MessageBox.OK,
				icon: Ext.MessageBox.WARNING,
				width:600,
				height:400
			});		
		}
		else if(wfsArray.length > 0 && "${wmsList}" == "[]") {
			Ext.MessageBox.show({
				title: 'Informação', 
				msg: 'O Mapa Global deve conter pelo menos uma layer do tipo WMS',
				buttons: Ext.MessageBox.OK,
				icon: Ext.MessageBox.WARNING,
				width:600,
				height:400
			});
			dataStore.removeAll();
		}
		else if(wfsArray.length > 0 && "${wmsList}" != "[]") {
			var wfsCapabilitiesRequest = OpenLayers.Request.GET({
				url: wfsArray[0].split(",")[0] + "?SERVICE=WFS&REQUEST=GetCapabilities",
				success: function(response) {
					var wfsParser = new OpenLayers.Format.WFSCapabilities();
					wfsCapabilities = wfsParser.read(response.responseText);
					for(var i=0; i<wfsCapabilities.featureTypeList.featureTypes.length; ++i) {
						if(wfsCapabilities.featureTypeList.featureTypes[i].name == wfsArray[0].split(",")[1]) {
							for(var srs in wfsCapabilities.featureTypeList.featureTypes[i].srs) {
								srsArray.push(wfsCapabilities.featureTypeList.featureTypes[i].srs[srs]);
							}
						}
					}
					
					var strBegin = srsArray[0].lastIndexOf(":");
					var strEnd = srsArray[0].length;
					var epsgCode = "EPSG" + srsArray[0].slice(strBegin,strEnd);

//					<c:forEach items="${wmsList}" var="wms">
//						<c:forEach items="${wms.layers}" var="layer" varStatus="i">
							!wmsServicesArray.has("${wms.url}") ? wmsServicesArray.push("${wms.url}") : '';
							wmsLayersArray.push("${layer.name}");
//						</c:forEach>
//					</c:forEach>

					var layerCount = 0;

					for(var y=0; y<wmsServicesArray.length; ++y) {
						var wmsCapabilitiesRequest = OpenLayers.Request.GET({
							url: wmsServicesArray[y] + "?SERVICE=WMS&REQUEST=GetCapabilities&VERSION=1.1.0",
							success: function(response) {
								var wmsParser = new OpenLayers.Format.WMSCapabilities();
								wmsCapabilities = wmsParser.read(response.responseText);
								for(var x=0; x<wmsCapabilities.capability.layers.length; ++x) {
									if(wmsLayersArray.has(wmsCapabilities.capability.layers[x].name)) {
										var minX = wmsCapabilities.capability.layers[x].bbox[epsgCode].bbox[0];
										var minY = wmsCapabilities.capability.layers[x].bbox[epsgCode].bbox[1];
										var maxX = wmsCapabilities.capability.layers[x].bbox[epsgCode].bbox[2];
										var maxY = wmsCapabilities.capability.layers[x].bbox[epsgCode].bbox[3];
										bounds.extend(new OpenLayers.Bounds(minX,minY,maxX,maxY));
										layerCount++;
										if(layerCount == wmsLayersArray.length){
											initMap(bounds,epsgCode);
										}
									}
								}								
							},
							failure: function(response) {alert(response.responseText);}
						});
					}
				},
				failure: function(response) {alert(response.responseText);}
			});			
		}
		else {
//			<c:forEach items="${wmsList}" var="wms">
//				<c:forEach items="${wms.layers}" var="layer" varStatus="i">
					!wmsServicesArray.has("${wms.url}") ? wmsServicesArray.push("${wms.url}") : '';
					wmsLayersArray.push("${layer.name}");
//				</c:forEach>
//			</c:forEach>

			var layerCount = 0;

			for(var y=0; y<wmsServicesArray.length; ++y) {
				var wmsCapabilitiesRequest = OpenLayers.Request.GET({
					url: wmsServicesArray[y] + "?SERVICE=WMS&REQUEST=GetCapabilities&VERSION=1.1.0",
					success: function(response) {
						var wmsParser = new OpenLayers.Format.WMSCapabilities();
						wmsCapabilities = wmsParser.read(response.responseText);
						for(var x=0; x<wmsCapabilities.capability.layers.length; ++x) {
							if(wmsLayersArray.has(wmsCapabilities.capability.layers[x].name)) {
								var minX = wmsCapabilities.capability.layers[x].llbbox[0];
								var minY = wmsCapabilities.capability.layers[x].llbbox[1];
								var maxX = wmsCapabilities.capability.layers[x].llbbox[2];
								var maxY = wmsCapabilities.capability.layers[x].llbbox[3];
								bounds.extend(new OpenLayers.Bounds(minX,minY,maxX,maxY));
								layerCount++;
								if(layerCount == wmsLayersArray.length){
									initMap(bounds,"EPSG:4326");
								}
							}
						}								
					},
					failure: function(response) {alert(response.responseText);}
				});
			}		
		}
	}
	
	var initMap = function(bounds,epsgCode) {
		var maxResolution = (bounds.left - bounds.right) / 265;
		
		map = new OpenLayers.Map({
			controls: [],
			div:'map',
			allOverlays: true,
			projection: epsgCode,
			units: epsgCode == "EPSG:4326" ? 'dd' : 'm',
			maxExtent: bounds,
			maxResolution: Math.abs(maxResolution),
			fractionalZoom: true
		});

		var layer;
		var layerNames;
		var wfsLayers = new Array();

//		<c:forEach items="${wmsList}" var="wms">
			layerNames = '';
//			<c:forEach items="${wms.layers}" var="layer" varStatus="i">
				layerNames += "${layer.name}${i.last ? '' : ','}";
//			</c:forEach>
			layer = new OpenLayers.Layer.WMS("${wms.title}",proxy + escape("${wms.url}"),{layers: layerNames, transparent:true},{isBaseLayer:true});
			map.addLayer(layer);
			allLayers["${wms.id}"] = layer;
//		</c:forEach>

		var defaultStyle = {
			strokeColor: "#00f",
			strokeOpacity: 0.5,
			strokeWidth: 1,
			fillColor: "#00f",
			fillOpacity: 0.1,
			pointRadius: 3,
			graphicZIndex:1000
		};

		var highlightedStyle = {
			strokeColor: "#c3c",
			strokeOpacity: 0.8,
			strokeWidth: 2,
			fillColor: "#c3c",
			fillOpacity: 0.1,
			pointRadius: 5,
			graphicZIndex:1000
		};

		var selectedStyle = {
			strokeColor: "#0ff",
			strokeOpacity: 0.8,
			strokeWidth: 2,
			fillColor: "#0ff",
			fillOpacity: 0.1,
			pointRadius: 5,
			graphicZIndex:1000
		};
		
		var globalStyleMap = new OpenLayers.StyleMap({
			"default": defaultStyle,
			"selected": selectedStyle,
			"highlighted": highlightedStyle
		});

//		<c:forEach items="${wfsList}" var="wfs" varStatus="i">
			layer = new OpenLayers.Layer.WFS( 
				"${wfs.layer.name}",
				"${wfs.url}",
				{
					typename: "${fn:substringAfter(wfs.layer.name,':')}",
					maxfeatures: 1000
				},
				{ 
					geometry_column: "${fn:contains(wfs.url,'arcgis') ? 'SHAPE' : 'the_geom'}",
					format: OpenLayers.Format.GML.v2,
					formatOptions: {
						featureType: "${fn:substringAfter(wfs.layer.name,':')}",
						featureNS: "${fn:contains(wfs.url,'arcgis') ? 'http://www.esri.com' : 'http://www.openplans.org/topp'}",
						geometryName: "${fn:contains(wfs.url,'arcgis') ? 'SHAPE' : 'the_geom'}",
						extractAttributes: true,
						srsName: epsgCode,
						xy: true
					},
					isBaseLayer: false,
					styleMap: globalStyleMap
				}
			);
			
			map.addLayer(layer);
			allLayers["${wfs.id}"] = layer;
//		</c:forEach>
		
		for(var i=0; i<allLayers.size(); i++){
			var layer = allLayers[i];
			if(layer && layer.CLASS_NAME == "OpenLayers.Layer.WFS"){
				layer.setVisibility(false);
				layer.display(false);
				wfsLayers.push(layer);
			}
		}
		
		var navigationBtn = new OpenLayers.Control.Navigation({
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
		
		var zoomBtn = new OpenLayers.Control.ZoomBox({
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
		
		var zoomFullBtn = new OpenLayers.Control.ZoomToMaxExtent({
			displayClass: 'zoomFullBtn',
			title: "Extensão Inicial"
		});
		
		var identifyCtrl = new OpenLayers.Control.SelectFeature(wfsLayers, {
			title: "Identificar",
			selectStyle: selectedStyle,
			displayClass: "identifyBtn",
			clickout: true,
			multiple: false,
			onSelect: function(feature) {
				alert(feature.fid);
			},
			callbacks: {
				'over': function(feature) {
					feature.renderIntent = "highlighted";
					feature.layer.drawFeature(feature);
				},
				'out': function(feature) {
					feature.renderIntent = "default";
					feature.layer.drawFeature(feature);
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

		var featureDetails = function(feature){
			var msg = '';
			if(feature.attributes){
				for(key in feature.attributes){
					var value = feature.attributes[key];
					msg += '<tr><th>' + key + '</th><td>' + value + '</td></tr>';
				}
				msg = '<table id="attributesTable"><thead><tr><th>Attribute</th><td>Value</td></tr></thead><tbody>' + msg + '</tbody></table>';
			} else{
				msg = 'A geometria seleccionada não possui atributos';
			}
			return msg;
		}
		
		var geometryCtrl = new OpenLayers.Control.SelectFeature(wfsLayers, {
			title: "Detalhe da Geometria",
			displayClass: "attributesEditorBtn",
			selectStyle: selectedStyle,
			clickout: true,
			multiple: false,
			onSelect: function(feature) {
				Ext.MessageBox.show({
					title: 'Geometria: ' + feature.fid, 
					msg: featureDetails(feature),
					buttons: Ext.MessageBox.OK,
					width: 300
				});		
			},
			callbacks: {
				'over': function(feature) {
					feature.renderIntent = "highlighted";
					feature.layer.drawFeature(feature);
				},
				'out': function(feature) {
					feature.renderIntent = "default";
					feature.layer.drawFeature(feature);
					geometryCtrl.unselectAll();
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

		var panel = new OpenLayers.Control.Panel({
			defaultControl: navigationBtn,
			displayClass: "olControlEditingToolbar",
			id:"toolbar",
			name:"toolbar"
		});

		panel.addControls([
			geometryCtrl,
			identifyCtrl,
			zoomFullBtn,
			zoomBtn,
			navigationBtn
		]);
		
		map.addControl(panel);
		
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
		map.addControl(new OpenLayers.Control.MousePosition({title: epsgCode, suffix: ' ' + map.getUnits()}));		
		map.addControl(new OpenLayers.Control.LoadingPanel());
		
		var overviewLayers = [];
		for(var i=0; i<map.layers.length; i++){
			overviewLayers.push(map.layers[i].clone());
		};
		
		var overviewCtrl = new OpenLayers.Control.OverviewMap({
			mapOptions: {
				maxExtent: bounds,
				allOverlays: true
			},
			layers: overviewLayers
		});
		map.addControl(overviewCtrl);
		
		$('olControlOverviewMapMaximizeButton').title = 'Maximizar Mapa de Referência';
		$('OpenLayers_Control_minimizeDiv').title = 'Minimizar Mapa de Referência';
		
		$('olControlOverviewMapMaximizeButton').observe('mouseover', function() {
			$('olControlOverviewMapMaximizeButton').style.cursor='pointer';
		});	
		$('OpenLayers_Control_minimizeDiv').observe('mouseover', function() {
			$('OpenLayers_Control_minimizeDiv').style.cursor='pointer';
		});
		
		map.zoomToMaxExtent();		
		resizeMap();		
	}	
</script>

<style>
	#attributesTable{width:100%;}
	#attributesTable thead * {font-weight: bold; color:white; background-color:#999;}
	#attributesTable th, #attributesTable td {margin:4px; padding:5px; border:thick solid #f0f0f0;}
	#attributesTable th{text-align:right;}
	#attributesTable td{text-align:left;}	
	.olControlEditingToolbar{
		border:2px solid #ddd; 
		background-color:#f0f0f0;
		height:33px !important;
		bottom:5px !important;
		opacity:0.4;
		filter:alpha(opacity=40);
		left:50% !important;
		cursor:pointer;
		width:170px !important;
		margin-left:-85px;
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
	.zoomFullBtnItemInactive, .zoomFullBtnItemActive{
		background-image: url(${IMG_DIR}/sig/initialZoom.png) !important;
	}
	.identifyBtnItemActive {
		background-image: url(${IMG_DIR}/sig/identify.png) !important;
		background-color:#C0C0C0 !important;
	}
	.identifyBtnItemInactive {
		background-image: url(${IMG_DIR}/sig/identify.png) !important;
	}
	.attributesEditorBtnItemActive {
		background-image: url(${IMG_DIR}/sig/attributes.png) !important;
		background-color:#C0C0C0 !important;
	}
	.attributesEditorBtnItemInactive {
		background-image: url(${IMG_DIR}/sig/attributes.png) !important;
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
</style>

<div id="panelContainer"></div>

<style>
	#panel .x-grid3-hd-btn{display:none !important;}
</style>

<script>
var resizeMap;
var layerGrid;

Ext.onReady(function(){
	
	Ext.grid.CheckColumn = function(config){
		Ext.apply(this, config);
		if(!this.id){
			this.id = Ext.id();
		}
		this.renderer = this.renderer.createDelegate(this);
	};
	
	Ext.grid.CheckColumn.prototype = {
		init : function(grid){
			this.grid = grid;
			this.grid.on('render', function(){
				var view = this.grid.getView();
				view.mainBody.on('mousedown', this.onMouseDown, this);
			}, this);
		},
		
		onMouseDown : function(e, t){
			if(t.className && t.className.indexOf('x-grid3-cc-'+this.id) != -1){
				e.stopEvent();
				var index = this.grid.getView().findRowIndex(t);
				var record = this.grid.store.getAt(index);
				record.set(this.dataIndex, !record.data[this.dataIndex]);
				var selected = record.data.selected;
				var layerId = record.data.id;
				var layer = allLayers[layerId];
				layer.setVisibility(selected);
			}
		},

		renderer : function(v, p, record){
			p.css += ' x-grid3-check-col-td';
			return '<div class="x-grid3-check-col'+(v?'-on':'')+' x-grid3-cc-'+this.id+'">&#160;</div>';
		}
	};
	
	var reader = new Ext.data.ArrayReader(
		{},
		[
			{name: 'id'},
			{name: 'selected'},
			{name: 'name'},
			{name: 'type'}
		]
	);
	
	var layerData = [
		<c:forEach items="${wmsList}" var="wms"  varStatus="i">
			['${wms.id}',true, '${wms.title}', 'Web Map Service']${i.last && empty wfsList ? '' : ','}
		</c:forEach>
		<c:forEach items="${wfsList}" var="wfs"  varStatus="i">
			['${wfs.id}',false, '${wfs.title}', 'Web Feature Service']${i.last ? '' : ','}
		</c:forEach>
	];

	dataStore = new Ext.data.GroupingStore({
		sortInfo:{field: 'selected', direction: "ASC"},
		groupField:'type',
		fields: ['id','selected','name','type'],
		autoLoad: true,
		data: layerData,
		reader: reader
	});
	
	var checkColumn = new Ext.grid.CheckColumn({
		header: "",
		dataIndex: 'selected',
		width: 40
	});
	
	layerGrid = new Ext.grid.EditorGridPanel({
		region:'west',
		split:true,
		collapsible: true,
		collapseMode: 'mini',
		border: false,
		store: dataStore,
		cm: new Ext.grid.ColumnModel([
			{id: 'id', sortable: false, dataIndex: 'id', hidden:true},
			checkColumn,
			{header: "Nome", width: 300, sortable: false, dataIndex: 'name'},
			{header: "Tipo", width: 0, sortable: false, dataIndex: 'type'}
		]),
		view: new Ext.grid.GroupingView({
			forceFit:true,
			groupTextTpl: '{text} ({[values.rs.length]} {[values.rs.length > 1 ? "Items" : "Item"]})',
			hideGroupedColumn: true,
			startCollapsed: true,
			markDirty: false
		}),
		plugins: checkColumn,
		clicksToEdit:1,
		autoExpandColumn:'name',
		frame:true,
		height: 600,
		iconCls: 'icon-grid'
	});
	
	var mapPanel = new Ext.Panel({
		region:'center',
		html:"<div id='map'></div>",
		id:'mapContainer'
	});
	
	var panel = new Ext.Panel({
		renderTo:"panelContainer",
		layout:'border',
		border: false,
		items:[layerGrid, mapPanel],
		id:'panel',
		height: 600
	});
	
	resizeMap = function(){
		panel.doLayout();
		map ? map.updateSize() : '';
	}
	
	Event.observe(window, 'resize', resizeMap);
	Event.observe("DHTMLSuite_paneContentcenter", 'scroll', resizeMap);
	layerGrid.on("resize",resizeMap);
	paneWest.callbackOnResize = "resizeMap";
	paneWest.callbackOnExpand = "resizeMap";
	paneWest.callbackOnCollapse = "resizeMap";
	
	getMapParams();	
});
</script>

