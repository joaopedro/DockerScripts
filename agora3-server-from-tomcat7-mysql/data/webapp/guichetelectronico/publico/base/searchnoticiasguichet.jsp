<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- BARRA DO TITULO PRINCIAPL DA AREA CENTRAL -->
<div class="barraTitulo">
	<div class="textoTitulo"><fmt:message key="guichetelectronico.pesquisa.titulo" bundle="${guichetBundle}"/> </div>
</div>
			
<div id="areaCentral">
			
	<c:choose>
		<c:when test="${not empty noticias}">				
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
		</c:when>
		<c:otherwise>
			<div class="mensagenCaixa" >
				<fmt:message key="guichetelectronico.pesquisa.semresultados" bundle="${guichetBundle}"/>
			</div>
		</c:otherwise>
	</c:choose>
</div>
			