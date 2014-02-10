<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${not empty listaEtapas}">
	<select name="params(etapa)" id="etapas" style="width: 100%;">
		<option value=""></option>
		<c:forEach items="${listaEtapas}" var="etap" begin="0">
			<c:if test="${etapaId == etap.numeroConteudo}">
				<option value="${etap.numeroConteudo}" selected="selected">${etap.titulo}</option>
			</c:if>
			<c:if test="${etapaId != etap.numeroConteudo}">
				<option value="${etap.numeroConteudo}">${etap.titulo}</option>
			</c:if>
		</c:forEach>
	</select>
</c:if>