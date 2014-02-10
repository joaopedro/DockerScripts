<%@page errorPage="/backoffice/errors/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	Estrutura: ${ estrutura.conteudo.titulo }<p>
	<a href="javascript: startLinkGeneric('listEstruturas.do2', '', 'workarea')"><img src="images/seta_esq.gif" border="0" width="30" height="12"></a>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="javascript: startLinkGeneric('listEstruturas.do2', '', 'workarea')">Voltar</a>
<script>
	editarestrutura = function ( ordem )
	{
		startLinkGeneric( 'changeestruturadata.do2', 'ordem=' + ordem, 'estruturacampos' );
		showbox( 'estruturacampos', 'ancora' );
	}
	
	cleardivs = function(divc)
	{
		var _popup = $(divc);
		_popup.style.display = 'none';
		_popup.style.visibility = 'hidden';
		if ( divc == 'properties' )
			cleardivs( 'choosebox' );
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
		var coords2 = findPos( $('ancora') );
		coords[0] -= 140;
		coords[1] -= 80;
		_popup.style.top = coords[1] + 'px';
		_popup.style.left = coords[0] + 'px';
		_popup.style.display = 'block';
		_popup.style.visibility = 'visible';
	}

	submeterbox = function( divname )
	{
		cleardivs( divname );
	}
	
	reload = function( )
	{
		startLinkGeneric( 'changeestrutura.do2', 'id=-2', 'workarea' );
	}

	
	submitstruct = function ()
	{
		ajaxSubmitGeneric( document.dadosestrutura, 'workarea' );
	}

</script>
<form name="dadosestrutura" action="changeestrutura.do2" method="post">
<input type="hidden" name="metodo" value="save"><input type="hidden" name="oldid" value="${oldid}">
<div id="ancora"></div>
<table border="1">
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr>
		<td width="90">Nome *</td>
		<td width="100"><input type="text" name="nome" value="${ estrutura.conteudo.titulo }" size="60" maxlength="255"></td>
		<td rowspan="4">&nbsp;&nbsp;&nbsp;<a href="javascript: editarestrutura( -1 )">Editar</a></td>
	</tr>
	<tr>
		<td width="90">Publicada?</td>
		<td width="100"><c:if test="${ estrutura.publicated =='S'}">Publicado</c:if><c:if test="${ estrutura.publicated !='S'}"><button onclick="startLinkGeneric( 'changeestrutura.do2', 'id=-2&metodo=publicar', 'workarea' )">Publicar</button></c:if></td>
	</tr>
	<tr>
		<td width="90">Nome Fisíco</td>
		<td width="100"><input type="text" name="nomefisico" value="${ estrutura.estrutura.tabelaFisica }"></td>
	</tr>
	<tr>
		<td width="90">Validador</td>
		<td width="100"><input type="text" name="validator" value="${ estrutura.estrutura.validator }"></td>
	</tr>
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr>
		<th colspan="3">Sub-Estruturas</th>
	</tr>
	<c:forEach var="est" items="${ estrutura.linhas }">
		<tr>
			<td colspan="2">${ est.estrutura.nome }</td>
			<td>&nbsp;&nbsp;&nbsp;<a href="javascript: editarestrutura( ${est.ordem } )">Editar</a></td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2">Nova Sub-Estrutura</td>
		<td>&nbsp;&nbsp;&nbsp;<a href="javascript: editarestrutura( -2 )">Editar</a></td>
	</tr>
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="3"><input type="button" value="Submeter" onclick="submitstruct()"></td>
	</tr>
</table>
</form>
<div id="estruturacampos" class="dragableElement" style="visibility: hidden; display: none; position: absolute; background-color: #fff4bc; z-index: 20; border: solid; border-width: 1px"></div>
