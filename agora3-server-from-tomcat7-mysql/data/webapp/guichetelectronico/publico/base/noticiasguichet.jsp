<%@ page contentType="text/html; charset=iso-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<c:forEach items="${noticias}" var="noticia" varStatus="index">
		<div class="noticia">
			<div class="simbolo">»</div>
			<div class="blocoNoticia">
				<div class="titulos">${noticia.titulo}</div>
				<div class="subTitulos">${noticia.subtitulo}</div>
				${noticia.descricao}
			</div>
		</div>
	</c:forEach>
