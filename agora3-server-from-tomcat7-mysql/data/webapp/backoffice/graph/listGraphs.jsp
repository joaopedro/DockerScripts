<%@page errorPage="/backoffice/errors/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<h1>Gestão de Grafos</h1>
<table>
<c:forEach items="${graphs}" var="graph">
	<tr>
		<td>${graph.titulo}</td>
		<td>
			<a href="javascript: startLinkGeneric( 'prepareNode.do2', 'graphId=${graph.numeroConteudo}&nodeId=${graph.root.id}', 'mainbody' )">Editar</a>
		</td>
	</tr>
</c:forEach>
</table>