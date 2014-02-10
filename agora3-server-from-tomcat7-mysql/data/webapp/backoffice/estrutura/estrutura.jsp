<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<script type="text/javascript">

	desvincula = function(numeroElemento, element)
		{
		startLinkGeneric('desvincular.do2', 'numeroElemento=' + numeroElemento, 'listades', reloadme );
		}
	
	vincula = function(elementoPai, element)
		{
		startLinkGeneric('listardesvinculados.do2', 'elementoPai=' + elementoPai, 'listades');
		showbox( 'listades', element );
		}
	
	cleardivs = function(divc)
	{
		var _popup = $(divc);
		_popup.style.display = 'none';
		_popup.style.visibility = 'hidden';
	}

	showbox = function( divname, element )
	{
		var _popup = $( divname );
		if ( _popup.style.visibility == 'visible')
			{
			cleardivs(divname);
			return;
			}
		var _element = $(element);
		var coords = findPos( _element );
		var coords2 = findPos( $('mainbody') );
		_popup.style.top = (coords[1]-coords2[1]+25) + 'px';
		_popup.style.left = (coords[0]-coords2[0]+80) + 'px';
		_popup.style.display = 'block';
		_popup.style.visibility = 'visible';
	}

	reloadme = function(  )
	{
		startLinkGeneric('estrutura.do2', '', 'mainbody' );
	}

</script>
<ul id="DHTMLSuite_tree3" class="DHTMLSuite_tree">
	<li id="rootexplorer3"><a href="#">Estrutura</a>
		<bean:write name="hierarquia" filter="false" />
	</li>
</ul>
<script type="text/javascript">
		treeObj = new DHTMLSuite.JSDragDropTree();
		treeObj.setTreeId('DHTMLSuite_tree3');
		treeObj.init();
		treeObj.showHideNode( true, 'rootexplorer3' );
</script>
<div id="listades" class="dragableElement" style="visibility: hidden; display: none; position: absolute; background-color: #fff4bc; z-index: 20; border: solid; border-width: 1px"></div>
