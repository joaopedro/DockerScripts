<%@page errorPage="/backoffice/errors/error.jsp" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html:errors />
<script type="text/javascript">
	pesquisar = function() {
		MM_openBrWindow('pesquisarForm.do2?modo=relat','','width=800,height=500,menubar=yes,toolbar=yes,scrollbars=yes');
	}
	
	var nItens = 0;
	var nItens2 = 0;
	var arrOld = new Array();
	var arrNew = new Array();

	<c:forEach var="menu" items="${menus}" varStatus="status">
		arrOld[${status.index}] = new Object();
		arrOld[${status.index}].Id = ${menu.numeroConteudo};
		arrOld[${status.index}].Titulo = '${menu.titulo}';
	</c:forEach>

	changeData = function ( ) {
		var s = '';
		var i=0;
		s += '<table  width="70%" class="table" cellspacing="0" cellpadding="3">';
		s += '  <tr><td class="tableHeader">Menus a adicionar</td>';
		s += '      <td class="tableHeader">Posição</td>';
		s += '      <td class="tableHeader"><br /></td>';
		s += '  </tr>';
		for( i = 0; i < nItens2; i++ )
		{
			if ( arrNew[ i ].Id > 0 )
			{
				s += '<tr>';
 	            s += '  <td colspan="3"><input type="hidden" name="value(' + arrNew[ i ].Id + ').type" value="A" /><input type="hidden" name="value(' + arrNew[ i ].Id + ').numeroConteudo" value="' + arrNew[ i ].Id + '" /></td>';
  	            s += '</tr>';
  	            
				s += '<tr>';
 	            s += '  <td class="line" align="left"><label for="ck' + i + '" style="cursor: hand">' + arrNew[ i ].Titulo + '</label></td>';
  	            s += '  <td class="line"><input type="text" name="value(' + arrNew[ i ].Id + ').idExterno" size="10" /></td>';
  	            s += '  <td class="line" width="15%"><input type="checkbox" name="value(' + arrNew[ i ].Id + ').checked" id="ck' + i + '" checked="checked" ></td>';
  	            s += '</tr>';
  	        }
		}
        s += '</table><br /><br />';
        s += '<input type="hidden" name="nitens" value="' + nItens2 + '">';
        document.getElementById("itens").innerHTML = s;
    }
	arrNew.concat( arrOld );
	nItens2 = nItens;

	usevalues = function (  ) {
		var numItens = window.numItens;
		var arr = window.relacionados;
		var i;
		var j=0;

		arrNew = new Array();
		for ( i = 0; i < nItens; i++ )
			arrNew[ j++ ] = arrOld[ i ];
		for ( i = 0; i < numItens; i++ )
			arrNew[ j++ ] = arr[ i ];
		nItens2 = nItens + numItens;
		changeData();
	}
</script>

<html:form action="/editMenu" onsubmit="return false;">
	<html:hidden property="menuId" />
	<span class="titulos">Gestão de Menus</span>
	<br /><br />
	<html:button property="click" onclick="pesquisar()" styleClass="styledButton">Pesquisar</html:button>
	<br /><br />

	<logic:present name="menu" scope="request">
		<span class="texto">A editar opções do menu: <strong class="textovermelho">${menu.titulo}</strong></span>
		<br /><br />
	</logic:present>
	<logic:notPresent name="conteudo" scope="request">
		<span class="texto">A configurar opções globais para menus</span>
		<br /><br />
	</logic:notPresent>
	<table width="70%" cellspacing="0" cellpadding="3" class="table">
		<c:choose>
			<c:when test="${empty menus}">
				<span class="texto"><strong>Sem opções definidas.</strong></span>
				<span class="texto">Para adicionar itens, clique em "Pesquisar" e seleccione os conteúdos que pretender associar.</span>
				<br /><br />
			</c:when>
			<c:otherwise>
				<tr>
					<td class="tableHeader" align="left">Nome do Menu</td>
					<td class="tableHeader">Posição</td>
					<logic:notPresent name="conteudo" scope="request">
					<td class="tableHeader" width="15%">Editar</td>
					</logic:notPresent>	
					<td class="tableHeader" width="15%">Eliminar</td>	
				</tr>
				<c:forEach items="${menus}" var="menu">
					<bean:define id="menuItem">value(${menu.numeroConteudo})</bean:define>
					<bean:define id="menuval">${menu.numeroConteudo}</bean:define>
					<tr>
						<td class="line" style="text-align:left">
							<html:hidden property='${menuItem}.type' value="E" />
							<html:hidden property='${menuItem}.numeroConteudo' value="${menuval}" />
							${menu.titulo}
						</td>
						<td class="line">
							<html:text property='${menuItem}.idExterno' size="10"></html:text>
						</td>
						<logic:notPresent name="conteudo" scope="request">
							<td class="line">
								<a href="javascript: startLinkGeneric( 'showMenu.do2', 'menuId=${ menu.numeroConteudo }', 'mainbody')" class="textolink">Editar</a>
							</td>
						</logic:notPresent>	
						<td class="line">
							<html:checkbox property='${menuItem}.checked' />
						</td>		
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<br />
	<br />
	<span id="itens">&nbsp;</span>
	<input type="submit" class="styledButton" value="Submeter" onclick="ajaxSubmitGeneric( document.menuForm, 'mainbody')"/>
	<logic:present name="conteudo" scope="request">
		<input type="button" class="styledButton" value="Início" onclick="javascript: window.location = 'listMenus.do2'" />
	</logic:present>
</html:form>