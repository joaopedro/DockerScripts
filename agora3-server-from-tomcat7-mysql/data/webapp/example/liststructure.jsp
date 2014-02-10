<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<table border="1"> 
	<tr>
		<th >Nome do Objecto</th>
		<th>Editar</th>
		<th>Popular</th>
	</tr>		
	<c:forEach items="${estruturas}" var="estrutura">
		<tr>
			<td>${estrutura.titulo}</td> 
			<td><a href="editstructure.do2?id=${estrutura.numeroConteudo}">Editar</a></td>
			<td><a href="addstructuredcontent.do2?id=${estrutura.numeroConteudo}">Criar Conteudo</a></td>
		</tr>
	</c:forEach>
	<tr style="text-align:right;">
		<td colspan="2"><a href="editstructure.do2">Criar Nova</a></td>
	</tr>
</table>
