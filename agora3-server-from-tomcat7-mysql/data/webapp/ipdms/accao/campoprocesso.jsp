<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${not empty listTiposProcesso}">
	<select name="params(tipoProcesso)" onchange="carregarEtapas(this, 'listaetapas');" style="width: 100%;">
		<option value=""></option>
		<c:forEach items="${listTiposProcesso}" var="proc" begin="0">
			<c:if test="${processoId == proc.numeroConteudo}">
				<option value="${proc.numeroConteudo}" selected="selected">${proc.titulo}</option>
			</c:if>
			<c:if test="${processoId != proc.numeroConteudo}">
				<option value="${proc.numeroConteudo}">${proc.titulo}</option>
			</c:if>
		</c:forEach>
	</select>
</c:if>