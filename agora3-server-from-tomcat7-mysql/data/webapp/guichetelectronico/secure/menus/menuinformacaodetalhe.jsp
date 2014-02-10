<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="barraTitulo">
	<div class="textoTitulo">${menuItem.descricaoCurta}</div>
</div>
			
<div id="areaCentral">

<!-- form action="/registar" method="post"-->

	<div class="noticia">
		<div class="simbolo">»</div>
		<div class="blocoNoticia">
			<div class="titulos">${menuItem.descricao}</div>
			<div style="margin-bottom: 10px;">${menuItem.conteudo}</div>
			<c:forEach items="${menuItem.anexos}" var="anexo" varStatus="index">
				<div class="pagelinks_grey"><a href="downloadanexomenu.do2?idanexo=${anexo.id}&idmenu=${menuItem.id}&tipo=menuitem">${anexo.descricao}</a></div>
			</c:forEach> 
		</div>
	</div>
	
	<div style="clear:both"></div>
</div>