<%@page errorPage="/backoffice/errors/error.jsp" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<h1>Gestão de Menus</h1>
<table>
<logic:iterate id="menu" name="menus">
	<tr>
		<td>${menu.titulo}</td>
		<td> 
			<a href="javascript: startLinkGeneric( 'showMenu.do2', 'menuId=${ menu.numeroConteudo }', 'mainbody' )">Editar</a>
		</td>	
	</tr>
</logic:iterate>
</table>