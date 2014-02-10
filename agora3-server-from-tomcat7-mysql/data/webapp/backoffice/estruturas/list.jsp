<%@page errorPage="/backoffice/errors/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="workarea">
	Lista de Estruturas de Dados<p>
<table border="0">
	<tr>
		<th width="300">Nome</th>
		<th width="30">&nbsp;</th>
		<th width="100" colspan="2">Acção</th>
	</tr>
	<tr>
		<td colspan="4">&nbsp;</td>
	</tr>
	<c:forEach var="item" items="${tiposcont}">
		<tr>
			<td>${ item.titulo }</td>
			<td width="30">&nbsp;</td>
			<td align="center"><a href="javascript: startLinkGeneric('changeestrutura.do2', 'id=${item.numeroConteudo }', 'workarea')">Editar</a></td>
			<td align="center"><a href="javascript: startLinkGeneric('changeestrutura.do2', 'id=0&oldid=${item.numeroConteudo }', 'workarea')">Duplicar</a></td>
		</tr>
	</c:forEach>
	<tr>
		<td>Nova Estrutura</td>
		<td width="30">&nbsp;</td>
		<td align="center"><a href="javascript: startLinkGeneric('changeestrutura.do2', 'id=0', 'workarea')">Editar</a></td>
	</tr>
</table>
</div>
