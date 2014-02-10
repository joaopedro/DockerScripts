<%@page errorPage="/backoffice/errors/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${ listaexport }" var="cont">
	<img style="border: none" id="img${ cont.conteudo.numeroConteudo }" src="${pageContext.request.contextPath}/backoffice/images/fold.gif" border="0"
		onclick="toggle('tipo${ cont.conteudo.numeroConteudo }', 'img${ cont.conteudo.numeroConteudo }')"> ${ cont.conteudo.titulo }<br/>
	<div id="tipo${ cont.conteudo.numeroConteudo }" style="display: none">
		<c:forEach items="${cont.conteudos}" var="item">
			<div style="margin-left:1.2em">
				<c:if test="${ empty nocheck }"><input type="checkbox" id="elimina" value="${ item.numeroConteudo }"></c:if> ${ item.titulo }
			</div>
		</c:forEach>
	</div>
</c:forEach>
<br/>
<div style="visibility: hidden">
<form id="frmdata2" action="exportdataelimina.do2">
<input type="text" name="dados2" id="dados2">
</form>
</div>
<c:if test="${ empty nocheck }"><input type="button" value="Eliminar" onclick="executeDelete()"></c:if>
