<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:if test="${not empty colaboradores_dep}">
	<select name="colaboradores" id="colaboradores">
		<c:forEach items="${colaboradores_dep}" var="col">
			<c:if test="${col.numeroConteudo == selected}">
				<option value="${col.numeroConteudo}" selected="selected">${col.titulo}</option>
			</c:if>
			<c:if test="${col.numeroConteudo != selected}">
				<option value="${col.numeroConteudo}">${col.titulo}</option>
			</c:if>					
		</c:forEach>
	</select>	
</c:if>
