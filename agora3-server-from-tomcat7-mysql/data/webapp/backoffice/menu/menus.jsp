<%@page errorPage="/backoffice/errors/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	.dotimg
	{
	display: none;
	cursor: hand;
	}
</style>
<script type="text/javascript" language="JavaScript1.2">	
	lastEntry = null;
	lastDel = null;

	setEntry = function( entry )
	{
		if ( lastEntry != null && $(lastEntry) != null )
			setLayer( lastEntry, false );
		if ( lastDel != null && $(lastDel) != null  )
			setLayer( lastDel, false );
		lastEntry = 'dots' + entry;
		lastDel = 'dels' + entry;
		setLayer( 'dots' + entry, true );
		setLayer( 'dels' + entry, true );
	}
	
	openMenu = function ( numero )
	{
		var node = $( 'node' + numero );
		if ( node.opened )
			return;
		startLinkGeneric( 'menuslevel2.do2', 'menu=' + numero, 'subnode' + numero );
		node.opened = true;
	}
	
	moveMenu = function( newparent, oldparent, nodeid, nodeorder )
	{
		startLinkGeneric( 'menusmove.do2', 'menu=' + nodeid + '&oldparent=' + oldparent + '&newparent=' + newparent + '&order=' + nodeorder, 'workarea' );
	}
	
	reorderMenu = function( newparent, nodeid, nodeorder )
	{
		startLinkGeneric( 'menusreorder.do2', 'newparent=' + newparent + '&order=' + nodeorder, 'workarea' );
	}
	
	getProperties = function( nodeid )
	{
		startLinkGeneric( 'menusproperties.do2', 'menu=' + nodeid, 'properties' );
		showbox( 'properties', 'node' + nodeid );
	}
	
	deleteNode = function( parentid, nodeid )
	{
		var obj = $('node' + nodeid );
		var menu = eval( 'treeObj' + obj.getAttribute( 'menutree' ));
		menu.dropNode( parentid, nodeid );
		startLinkGeneric( 'menusmove.do2', 'menu=' + nodeid + '&oldparent=' + parentid + '&newparent=0&order=', 'workarea' );
	}

	savedparent = 0;	
	savedmenu = 0;	
	newEntry = function( parentid, menu )
	{
		savedparent = parentid;
		savedmenu = menu;
		startLinkGeneric( 'choosecontent.do2', '', 'properties' );
		showbox( 'properties', 'node' + parentid + 'new' );
	}

	saveNewEntry = function( numero, titulo )
	{
		var menu = eval( 'treeObj' + savedmenu );
		var innertext = '<a href="javascript: "><span onmouseover="setEntry(' + numero + ', true )" >' + titulo +
				'</span></a>&nbsp;&nbsp;&nbsp;<img border=0 id=dots' + numero +
				' class="dotimg" src="${pageContext.request.contextPath}/backoffice/images/properties.gif" onclick=" getProperties( ' + numero + ' )"/>' +
				'&nbsp;&nbsp;<img border=0 id="dels' + numero + '" class="dotimg" src="${pageContext.request.contextPath}/backoffice/images/cross.png" onclick=" deleteNode( ' + savedparent + ', ' + numero + ' )"/>';		
		var nodeorder = menu.addNode( numero, savedparent, savedmenu, titulo, innertext );
		startLinkGeneric( 'menusmove.do2', 'menu=' + numero + '&oldparent=' + savedparent + '&add=true&newparent=&order=' + nodeorder, 'workarea' );
	}
	
	cleardivs = function()
	{
		var _popup = $('properties');
		_popup.style.display = 'none';
		_popup.style.visibility = 'hidden';
	}

	showbox = function( divname, element )
	{
		var _popup = $( divname );
		if ( _popup.style.visibility == 'visible')
			{
			cleardivs();
			return;
			}
		var _element = $(element);
		var coords = findPos( _element );
		var coords2 = findPos( $('fullmenus') );
		coords[1] += 20;
		_popup.style.top = coords[1] + 'px';
		_popup.style.left = coords[0] + 'px';
		_popup.style.display = 'block';
		_popup.style.visibility = 'visible';
	}

	submeterbox = function( divname )
	{
		cleardivs(  );
	}

</script>
<style type="text/css">
ul
{
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 15px;
	font-style: oblique;
	font-weight: bold;
	color: #FFCC33;
	text-decoration: none;
	text-indent: 15px;
	margin: 2px;
	padding: 6px;
}
</style>
<div id="fullmenus"></div>
<script type="text/javascript" language="JavaScript1.2">	
	startLinkGeneric( 'menuslevel1.do2', '', 'fullmenus' );
</script>
<div id="workarea"></div>
<div id="properties" class="dragableElement" style="visibility: hidden; display: none; position: absolute; background-color: #fff4bc; z-index: 20; border: solid; border-width: 1px"></div>
