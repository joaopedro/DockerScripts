<%@page errorPage="/backoffice/errors/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" language="JavaScript1.2">	
	lastDel = null;
	lastDots = null;

	setEntry = function( entry, fullpath )
	{
		if ( fullpath == '' )
			return;
		if ( lastDots != null && $(lastDots) != null  )
			setLayer( lastDots, false );
		lastDots = 'dots' + entry;
		if ( lastDel != null && $(lastDel) != null  )
			setLayer( lastDel, false );
		lastDel = 'dels' + entry;

		setLayer( 'dots' + entry, true );
		if ( $('dels' + entry) != null )
			setLayer( 'dels' + entry, true );
	}
	
	getProperties = function( fullpath, nodeid )
	{
		if ( fullpath == '' )
			return;
		startLinkGeneric( 'configproperties.do2', 'fullpath=' + fullpath, 'properties' );
		showbox( 'properties', nodeid, 0 );
	}
	
	checkCodigo = function( oldpath, newpath, nodeid )
	{
		if ( oldpath == newpath )
			{
			$(nodeid).innerHTML = '';
			return;
			}
		startLinkGeneric( 'configexists.do2', 'newpath=' + newpath, nodeid );
	}
	
	checkandsubmit = function( frm, cprop )
	{
		cprop = $(cprop);
		if ( cprop.innerHTML != null && cprop.innerHTML != '' && cprop.innerHTML != '\n' )
			{
			alert('O código já existe' );
			return;
			}
		if ( isBlank( frm.codigo.value ) )
			{
			alert('Deve preencher o código da configuração' );
			return;
			}
		if ( isBlank( frm.descricao.value ) )
			{
			alert('Deve preencher a descrição da configuração' );
			return;
			}
		if ( isBlank( frm.valor.value ) )
			{
			alert('Deve preencher o valor da configuração' );
			return;
			}
		var cval = $('cval');
		if ( cval.innerHTML == '<br>Número inválido' || cval.innerHTML == '<br>Conteúdo não definido' )
			{
			alert('Não pode registar um conteúdo inválido' );
			return;
			}
		if ( frm.tipo.value == 'D' && ( isNaN(toDate( frm.valor.value )) || toDate( frm.valor.value ) == null ) )
			{
			alert('Não especificou uma data válida' );
			return;
			}
		if ( frm.tipo.value == 'N' && isNaN(  parseInt( frm.valor.value ) ) )
			{
			alert('Não especificou um número válido' );
			return;
			}
		var codigo = frm.codigo.value;
		var oldcodigo = frm.fullpath.value;
		ajaxSubmitGeneric( document.properties, '' );
		if ( codigo != oldcodigo || oldcodigo == '' )
			setTimeout( 'submitcomplete()', 20);
		cleardivs('properties');
	}
	
	submitcomplete = function( )
	{
		startLinkGeneric( 'configlevel1.do2', '', 'fullconfig' );
	}
	
	getDescription = function( tipo, val, box )
	{
		if ( tipo != 'C' )
			{
			$(box).innerHTML = '';
			return;
			}
		startLinkGeneric( 'configfindrecord.do2', 'numero=' + val.value, box );
	}
	
	deleteConfig = function( fullpath )
	{
		if ( !confirm('Tem a certeza de que quer apagar a entrada de configuração' ) )
			return;
		startLinkGeneric( 'configdelete.do2', 'fullpath=' + fullpath, 'fullconfig' );
	}
	
	showchoose = function( val, button )
	{
		$(button).style.visibility = val == 'C' ? 'visible' : 'hidden';
		if ( val != 'C' )
			$('cval').innerHTML = '';
	}
	
	var savedbtn = null;
	var savedvalue = null;
	choosevalue = function( valuef, btn )
	{
		savedbtn = btn;
		savedvalue = valuef;
		startLinkGeneric( 'choosecontent.do2', '', 'choosebox' );
		showbox( 'choosebox', btn.id, 1 );
	}

	saveNewEntry = function( numero, titulo )
	{
		savedvalue.value = numero;
		$('cval').innerHTML = '<br/>' + titulo;
	}
	
	cleardivs = function(divc)
	{
		var _popup = $(divc);
		_popup.style.display = 'none';
		_popup.style.visibility = 'hidden';
		if ( divc == 'properties' )
			cleardivs( 'choosebox' );
	}

	showbox = function( divname, element, wn )
	{
		var _popup = $( divname );
		if ( _popup.style.visibility == 'visible')
			{
			cleardivs(divname);
			return;
			}
		var _element = $(element);
		var coords = findPos( _element );
		var coords2 = findPos( $('center') );
		coords[0] = coords[0] - coords2[0];
		coords[1] = coords[1] - coords2[1];
		coords[1] += 20;
		coords[0] += wn == 0 ? 120 : 20;
		_popup.style.top = coords[1] + 'px';
		_popup.style.left = coords[0] + 'px';
		_popup.style.display = 'block';
		_popup.style.visibility = 'visible';
	}

	submeterbox = function( divname )
	{
		cleardivs( divname );
	}

</script>

<div id="fullconfig"></div>
<script type="text/javascript" language="JavaScript1.2">	
	startLinkGeneric( 'configlevel1.do2', '', 'fullconfig' );
</script>
<div id="workarea"></div>
<div id="properties" class="dragableElement" style="visibility: hidden; display: none; position: absolute; background-color: #fff4bc; z-index: 20; border: solid; border-width: 1px"></div>
<div id="choosebox" class="dragableElement" style="visibility: hidden; display: none; position: absolute; background-color: #fff4bc; z-index: 20; border: solid; border-width: 1px"></div>
