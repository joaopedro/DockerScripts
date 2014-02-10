<%@page errorPage="/backoffice/errors/error.jsp" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html:errors />
<script type="text/javascript">
	createNodes = function() {
		MM_openBrWindow('pesquisarForm.do2?modo=relat','','width=800,height=500,menubar=yes,toolbar=yes,scrollbars=yes');
	}
	searchNodes = function() {
		MM_openBrWindow('searchNodes.do2?graphId=${param.graphId}','','width=800,height=500,menubar=yes,toolbar=yes,scrollbars=yes');
	}
	
	var nItens = 0;
	var nItens2 = 0;
	var arrOld = new Array();
	var arrNew = new Array();

	<c:forEach items="${node.outputs}" var="output" varStatus="status">
		arrOld[${status.index}] = new Object();
		arrOld[${status.index}].Id = '${output.value.numeroConteudo}';
		arrOld[${status.index}].NodeId = '${output.id}';
		arrOld[${status.index}].Titulo = '${output.value.titulo}';
	</c:forEach>

	changeData = function () {
		var s = '';
		s += '<table  width="70%" class="table" cellspacing="0" cellpadding="3">';
		s += '  <tr>';
		s += '    <td class="tableHeader">Itens a adicionar</td>';
		s += '    <td class="tableHeader"><br /></td>';
		s += '  </tr>';
		
		var i=0;
		for (i = 0; i < nItens2; i++) {
			if (arrNew[i].Id > 0) {
				s += '<tr>';
 	            s += '  <td colspan="2">';
 	            s += '    <input type="hidden" name="value(' + arrNew[i].Id + ').type" value="A" />';
 	            s += '    <input type="hidden" name="value(' + arrNew[i].Id + ').numeroConteudo" value="' + arrNew[i].Id + '" />';
 	            s += '    <input type="hidden" name="value(' + arrNew[i].Id + ').nodeId" value="' + arrNew[i].NodeId + '" />'; 	            
 	            s += '  </td>';
  	            s += '</tr>';
  	            
				s += '<tr>';
 	            s += '  <td class="line" align="left">';
 	            s += '    <label for="ck' + i + '" style="cursor: hand">' + arrNew[i].Titulo + '</label>';
 	            s += '  </td>';
  	            s += '  <td class="line" width="15%">';
  	            s += '    <input type="checkbox" name="value(' + arrNew[i].Id + ').checked" id="ck' + i + '" checked="checked" >';
  	            s += '  </td>';
  	            s += '</tr>';
  	        }
		}
		
        s += '</table><br /><br />';
        s += '<input type="hidden" name="nitens" value="' + nItens2 + '">';
        
        Element.update($('itens'), s);
    }
	arrNew.concat(arrOld);
	nItens2 = nItens;

	usevalues = function() {
		var numItens = window.numItens;
		var arr = window.relacionados;
		var i;
		var j=0;

		arrNew = new Array();
		for (i = 0; i < nItens; i++) {
			arrNew[ j++ ] = arrOld[ i ];
		}
		for ( i = 0; i < numItens; i++) {
			arrNew[ j++ ] = arr[ i ];
		}
		nItens2 = nItens + numItens;
		changeData();
	}
</script>

<html:form action="/saveNode" method="get" onsubmit="return false">
	<html:hidden property="graphId" value="${param.graphId}" />
	<html:hidden property="nodeId" />
	<span class="titulos">Gestão de Grafos</span>
	<br /><br />
	<html:button property="click" onclick="createNodes()" styleClass="styledButton">Criar Nós</html:button>
	<html:button property="click" onclick="searchNodes()" styleClass="styledButton">Pesquisar Nós</html:button>
	<br /><br />

	<span class="texto">A editar opções do item: <strong class="textovermelho">${node.value.titulo}</strong></span>
	<br /><br />
	
	<table width="70%" cellspacing="0" cellpadding="3" class="table">
		<c:choose>
			<c:when test="${empty node.outputs}">
				<span class="texto"><strong>Sem opções definidas.</strong></span>
				<span class="texto">Para adicionar itens, clique em "Pesquisar" e seleccione os conteúdos que pretender associar.</span>
				<br /><br />
			</c:when>
			<c:otherwise>
				<tr>
					<td class="tableHeader" align="left">Nome</td>
					<td class="tableHeader" width="15%">Editar</td>
					<td class="tableHeader" width="15%">Eliminar</td>	
				</tr>
				<c:forEach items="${node.outputs}" var="output">
					<bean:define id="nodeItem">value(${output.value.numeroConteudo})</bean:define>
					<tr>
						<td class="line" style="text-align:left">
							<html:hidden property='${nodeItem}.nodeId' value="${output.id}" />						
							<html:hidden property='${nodeItem}.type' value="E" />
							<html:hidden property='${nodeItem}.numeroConteudo' value="${output.value.numeroConteudo}" />
							${output.value.titulo}
						</td>
						<td class="line">
							<a href="javascript: startLinkGeneric( 'prepareNode.do2', 'graphId=${param.graphId}&nodeId=${output.id}', 'mainbody' )" class="textolink">Editar</a>
						</td>
						<td class="line">
							<html:checkbox property='${nodeItem}.checked' />
						</td>		
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<br />
	<br />
	<span id="itens">&nbsp;</span>
	<input type="submit" class="styledButton" value="Submeter" onclick="ajaxSubmitGeneric( document.nodeForm, 'mainbody' )" />
</html:form>