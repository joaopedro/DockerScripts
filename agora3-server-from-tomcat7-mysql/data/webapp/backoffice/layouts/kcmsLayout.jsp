<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="/WEB-INF/kcms.tld" prefix="kcms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//PT">
<tiles:useAttribute id="mainBody" name="main-body" ignore="true"/>
<html>
<head>
	<title><kcms:configuracao configEntry="SITETITLE" /></title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/backoffice/themes/master.css" media="screen" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/backoffice/themes/estilos.css" media="screen" type="text/css">
	<link href='${pageContext.request.contextPath}/backoffice/themes/pc-ie.css' rel="stylesheet" type="text/css" />
	<link href='${pageContext.request.contextPath}/backoffice/themes/CascadeMenu.css' rel="stylesheet" type="text/css" />
	<link href='${pageContext.request.contextPath}/backoffice/themes/sinfic.css' rel="stylesheet" type="text/css" />
	<link href='${pageContext.request.contextPath}/backoffice/themes/tabs.css' rel="stylesheet" type="text/css" />		
	<link href='${pageContext.request.contextPath}/backoffice/themes/estilosEditor.css' rel="stylesheet" type="text/css" />
	<link href='${pageContext.request.contextPath}/backoffice/themes/popcalendar.css' rel="stylesheet" type="text/css" />
	<link href='${pageContext.request.contextPath}/backoffice/themes/calendar-brown.css' rel="stylesheet" type="text/css" media="all" title="summer" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/backoffice/js/tree/css/drag-drop-folder-tree.css" type="text/css"></link>

	<script type="text/javascript" src="${pageContext.request.contextPath}/backoffice/js/ajax.js"></script>
  	<script type="text/javascript" src='${pageContext.request.contextPath}/backoffice/js/calendar.js'></script>
  	<script type="text/javascript" src='${pageContext.request.contextPath}/backoffice/js/calendar-en.js'></script>
	<script type="text/javascript" src='${pageContext.request.contextPath}/backoffice/js/calendar-setup.js'></script>
	<script language="JavaScript" src='${pageContext.request.contextPath}/backoffice/js/encoding.js'></script>
	<script language="JavaScript" src='${pageContext.request.contextPath}/backoffice/js/mm_menu.js'></script>
	<script language="JavaScript" src='${pageContext.request.contextPath}/backoffice/js/behaviors.js'></script>
	<script language="JavaScript" src='${pageContext.request.contextPath}/backoffice/js/Date.js'></script>
	<script language="JavaScript" src='${pageContext.request.contextPath}/backoffice/js/scripts.js'></script>
	<script language="JavaScript" src='${pageContext.request.contextPath}/backoffice/js/CascadeMenu.js'></script>
	<script language="JavaScript" src='${pageContext.request.contextPath}/backoffice/js/verify.js'></script>
	<script language="Javascript1.2" src='${pageContext.request.contextPath}/backoffice/js/divs.js'></script>
	<script language="Javascript" src='${pageContext.request.contextPath}/backoffice/js/kcms.js'></script>		
	<script language="Javascript" src='${pageContext.request.contextPath}/backoffice/js/ajaxform.js'></script>		
	<script language="Javascript" src='${pageContext.request.contextPath}/backoffice/js/prototype.js'></script>		
	<script language="Javascript" src='${pageContext.request.contextPath}/backoffice/js/table.js'></script>		

	<script type="text/javascript" src="${pageContext.request.contextPath}/backoffice/js/tree/js/context-menu.js"></script><!-- IMPORTANT! INCLUDE THE context-menu.js FILE BEFORE drag-drop-folder-tree.js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/backoffice/js/tree/js/drag-drop-folder-tree.js"></script>
	<script type="text/javascript">
		var DHTML_SUITE_THEME = 'gray';	// SPecifying gray theme
		var DHTML_SUITE_THEME_FOLDER = '${pageContext.request.contextPath}/backoffice/themes/';
		var DHTML_SUITE_JS_FOLDER = '${pageContext.request.contextPath}/backoffice/js/';

	</script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/backoffice/js/dhtml-suite-for-applications.js"></script>
	<!-- load the main HTMLArea file -->
	<script type="text/javascript">
	      _editor_url = "${pageContext.request.contextPath}/backoffice/js/htmlarea/";
	      _editor_lang = "pt";
	</script>
	<script language="Javascript1.2" src='${pageContext.request.contextPath}/backoffice/js/htmlarea/htmlarea.js'></script>
	<!-- end of loading -->
	<script>
		var imgDir = '';	
	</script>

</head>
<body>
<!-- START DATASOURCES FOR THE PANES -->
<div id="westContent"><tiles:insert attribute="leftArea" flush="true"/></div>
<div id="northContent">
	<div id="logo" style="width: 100%"><tiles:insert attribute="header" flush="true"/></div>
	<div id="linhaCinzenta" style="background-color:#eee; height:15px; text-align:right; padding-right:10px;"><tiles:insert attribute="menuTop" flush="true"/></div>
</div>
<div id="center">
<div id="mainbody">
	${ action }
	<c:if test="${ logged == 'true' || logar == 'true' }">
		<tiles:insert attribute="main-body" flush="true"/>
	</c:if>
</div>
</div>

<!-- END DATASOURCES -->
<script type="text/javascript">
	var paneModel = new DHTMLSuite.paneSplitterModel();
	DHTMLSuite.commonObj.setCssCacheStatus(false)
	var paneWest = new DHTMLSuite.paneSplitterPaneModel( { position : "west", id:"westPane",size:200,minSize:100,maxSize:300,scrollbars:true,callbackOnCollapse:'callbackFunction',
					callbackOnExpand:'callbackFunction',callbackOnShow:'callbackFunction',callbackOnHide:'callbackFunction',
					callbackOnSlideIn:'callbackFunction',callbackOnSlideOut:'callbackFunction',
					callbackOnResize:'callBackFunctionResizePane' } );
	paneWest.addContent( new DHTMLSuite.paneSplitterContentModel( { id:"westContent",htmlElementId:'westContent',title:'',tabTitle:'Navegação' } ) );
	
	var paneNorth = new DHTMLSuite.paneSplitterPaneModel( { position : "north", id:"northPane",size:89,scrollbars:false,resizable:true,collapsable:true} );
	paneNorth.addContent( new DHTMLSuite.paneSplitterContentModel( { id:"northContent",htmlElementId:'northContent',title:'' } ) );
	
	var paneCenter = new DHTMLSuite.paneSplitterPaneModel( { position : "center", id:"centerPane",size:150,minSize:100,maxSize:200,callbackOnCloseContent:'callbackFunction',callbackOnTabSwitch:'callbackFunction' } );
	paneCenter.addContent( new DHTMLSuite.paneSplitterContentModel( { id: 'center',htmlElementId:'center',title:'',tabTitle: '',closable:false } ) );
	
	paneModel.addPane(paneNorth);
	paneModel.addPane(paneWest);
	paneModel.addPane(paneCenter);
	
	var paneSplitter = new DHTMLSuite.paneSplitter();
	paneSplitter.addModel(paneModel);	// Add the data model to the pane splitter
	paneSplitter.init();	// Add the data model to the pane splitter
	
	function callbackFunction(modelObj,action,contentObj)
	{
	}
	
	
	function callBackFunctionResizePane(modelObj,action,contentObj)
	{
	}
	<c:if test="${ logged == 'true' }">
		treeObj = new DHTMLSuite.JSDragDropTree();
		treeObj.setTreeId('DHTMLSuite_tree2');
		treeObj.setMaximumDepth(7);
		treeObj.setMessageMaximumDepthReached('Maximum depth reached'); // If you want to show a message when maximum depth is reached, i.e. on drop.
		treeObj.init();
		treeObj.showHideNode( true, 'rootexplorer' );
		$('leftareabanner').style.display='block';
	</c:if>	
</script>
</body>
</html>
