<%@page errorPage="/backoffice/errors/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
Exportar os Conteúdos Excolhidos
<script>
	
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
	<tr><td width="50%">Modos de Exportação</td><td width="50%">Conteudos Escolhidos</td></tr>
	<tr>
		<td><select id="tipo" name="tipo" size="1">
			<c:forEach items="${ modosexport }" var="cont">
				<option value="${ cont.numeroConteudo }">${ cont.titulo }</option>
			</c:forEach>
		</select><br/>
		<div id="alldone"></div></td>
		<td valign="top"><div id="conteudosescolhidos"></div></td>
	</tr>
</table>
<input type="button" value="Export" onclick="startLinkGeneric( 'exportall.do2', 'numero=' + $('tipo').value, 'alldone' )">
<script>
	startLinkGeneric( 'exportdatashow.do2', '', 'conteudosescolhidos' );
</script>
<br/>
<br/>
