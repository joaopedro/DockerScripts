<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="PT">
<head>
<META http-equiv="X-UA-Compatible" content="IE=EmulateIE7" >
<%@ page contentType="text/html; charset=iso-8859-15" %>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-15" />

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="log" value="${pageContext.request.userPrincipal}" scope="request"></c:set>
<c:set var="formBeanName" value="${requestScope['org.apache.struts.action.mapping.instance'].name}" scope="request"></c:set>

<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/ipdms/themes" />
<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<c:set var="IMG_DIR" value="${pageContext.request.contextPath}/images" />

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.product.description" var="productDescription"/>

<title>${productName} - ${productDescription}</title>

<tiles:insert attribute="ipdmsScriptsThemes" />

</head>

<body>
<tiles:importAttribute />
<logic:present role="CIDADAO,EMPRESA">
	<%-- 
		This div loading is used in the ajax request of spring webflow.
		See swfajax.js for more information
	 --%>
	<div id="loading" style="padding: 100px; display: none;"></div>
	<tiles:insert attribute="main-body" />
</logic:present>

<logic:notPresent role="CIDADAO,EMPRESA">

<div id="container">
<%-- HEADER --%>
	<div id="northContent" style="padding:0; margin:0;">
		<tiles:insert attribute="header" flush="true"/>
	</div>
<%-- END OF HEADER --%>
	<%-- 
		This div loading is used in the ajax request of spring webflow.
		See swfajax.js for more information
	 --%>
	<div id="loading" style="padding: 100px; display: none;"></div>
	
	<div id="center">
		<a href="#conteudo" name="conteudo" accesskey="c"></a>
		<tiles:insert attribute="main-body" />		
	</div>
	
<%-- AREA DO MENU ESQUERDO --%>
	<div id="westContent">
		<c:choose>
			<c:when test="${pageContext.request.remoteUser == null}">
				<tiles:insert attribute="login" flush="true"/>
			</c:when>
			<c:otherwise>
				<tiles:insert attribute="menu" flush="true"/>
			</c:otherwise>
		</c:choose>
		<h1></h1>
	</div>
<%-- AREA DO FOOTER --%>
	<div id="southContent">
		<tiles:insert attribute="footer" flush="true"/>
	</div>
</div>
</logic:notPresent>

<script type="text/javascript">
/* STEP 1 */
/* Create the data model for the panes */
var paneModel = new DHTMLSuite.paneSplitterModel();
DHTMLSuite.commonObj.setCssCacheStatus(false)

var paneNorth = new DHTMLSuite.paneSplitterPaneModel( { position : "north", id:"northPane",size:108,scrollbars:false,resizable:false,collapsable:false } );
paneNorth.addContent( new DHTMLSuite.paneSplitterContentModel( { id:"northContent",htmlElementId:'northContent',title:'' } ) );

var paneWest = new DHTMLSuite.paneSplitterPaneModel( { position : "west", id:"westPane",size:210,minSize:100,maxSize:300,scrollbars:true,callbackOnCollapse:'callbackFunction',callbackOnExpand:'callbackFunction',callbackOnShow:'callbackFunction',callbackOnHide:'callbackFunction',callbackOnSlideIn:'callbackFunction',callbackOnSlideOut:'callbackFunction',callbackOnResize:'callBackFunctionResizePane' } );
paneWest.addContent( new DHTMLSuite.paneSplitterContentModel( { id:"westContent",htmlElementId:'westContent',tabTitle:'West pane' } ) );

var paneCenter = new DHTMLSuite.paneSplitterPaneModel( { position : "center", id:"centerPane",size:155,minSize:100,maxSize:200,callbackOnCloseContent:'callbackFunction',callbackOnTabSwitch:'callbackFunction' } );
paneCenter.addContent( new DHTMLSuite.paneSplitterContentModel( { id: 'center',htmlElementId:'center',tabTitle: 'Welcome',closable:false } ) );

var paneSouth = new DHTMLSuite.paneSplitterPaneModel( { position : "south", id:"southPane",size:60,minSize:50,maxSize:130,resizable:false,collapsable:false,scrollbars:false } );
paneSouth.addContent( new DHTMLSuite.paneSplitterContentModel( { id:"southContent",htmlElementId:'southContent',title:'' } ) );

paneModel.addPane(paneSouth);
paneModel.addPane(paneNorth);
paneModel.addPane(paneWest);
paneModel.addPane(paneCenter);

/* STEP 2 */
/* Create the pane object */
var paneSplitter = new DHTMLSuite.paneSplitter();
paneSplitter.addModel(paneModel);	// Add the data model to the pane splitter
paneSplitter.init();	// Add the data model to the pane splitter

/* This is a demo for a call back function for the panes */
function callbackFunction(modelObj,action,contentObj)
{
	self.status = 'Event "' + action + '" triggered for pane with id "' + modelObj.id + (contentObj?'" - content id: ' + contentObj.id:'');
}

function callBackFunctionResizePane(modelObj,action,contentObj)
{
	var size = paneSplitter.getSizeOfPaneInPixels(modelObj.getPosition());
	self.status = 'Pane ' + modelObj.getPosition() + ' has been resized to ' + size.width + ' x ' + size.height + ' pixels';
}
</script>
</body>
</html>

	
	
