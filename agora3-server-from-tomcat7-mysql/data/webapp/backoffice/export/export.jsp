<%@page errorPage="/backoffice/errors/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
Escolher Conteúdos para Exportação
<script>
	showconteudos = function( codigo )
	{
		startLinkGeneric( 'exportconteudos.do2', 'tipo=' + codigo, 'conteudos' );
	}

	select = function( what )
	{
		var arr=document.getElementsByName("cont");
		for ( var i = 0; i < arr.length; i++ )
			arr[i].checked = (what == 'all');
	}
	
	execute = function( )
	{
		var arr=document.getElementsByName("cont");
		var s = $('tipo').value;
		for ( var i = 0; i < arr.length; i++ )
			if ( arr[i].checked )
				s = s + '.' + arr[i].value;
		$('dados').value = s;
		ajaxSubmitGeneric( $('frmdata'), 'conteudosescolhidos' );
	}
	
	executeDelete = function( )
	{
		var arr=document.getElementsByName("elimina");
		var s = null;
		for ( var i = 0; i < arr.length; i++ )
			if ( arr[i].checked )
				{
				if( s == null )
					s = arr[i].value;
				else
					s = s + '.' + arr[i].value;
				}
		$('dados2').value = s;
		ajaxSubmitGeneric( $('frmdata2'), 'conteudosescolhidos' );
	}
	
	toggle = function( id, img )
	{
		id = document.getElementById( id );
		img = document.getElementById( img );
		if ( id.style.display == 'none' )
			{
			img.src='${pageContext.request.contextPath}/backoffice/images/open.gif';
			id.style.display = 'block';
			}
		else
			{
			img.src='${pageContext.request.contextPath}/backoffice/images/fold.gif';
			id.style.display = 'none';
			}
	}
	
</script>
<table border=1 width="100%">
	<tr><td width="50%">Conteúdos</td><td width="50%">Conteudos Escolhidos</td></tr>
	<tr>
		<td><select id="tipo" name="tipo" size="1" onchange="showconteudos( this.value )">
			<c:forEach items="${ tiposcont }" var="cont">
				<option value="${ cont.numeroConteudo }">${ cont.titulo }</option>
			</c:forEach>
		</select><br><div id="conteudos"></div></td>
		<td valign="top"><div id="conteudosescolhidos"></div></td>
	</tr>
</table>
<script>
	if ( $("tipo").options.length > 0 )
		showconteudos( $("tipo").options[0].value );
</script>
<br/>
<br/>
<input type="button" value="Seguir" onclick="javascript: startLinkGeneric('exportdata.do2', '', 'mainbody')">
