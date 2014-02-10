<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<div class="row" style="padding-top:0px; text-align:left">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="tituloHomepage"><fmt:message key="ipdms.login.tituloHomepage"/></td>
		  </tr>
		</tbody>
	</table>					
</div>

<div class="Container">
	<c:if test="${not empty apresentacao}">
		<div class="padding10Left">
			<c:if test="${not empty apresentacaoImgLink}">
				<img src="${pageContext.request.contextPath}/${apresentacaoImgLink}" 
						alt="${apresentacao.filename}" title="${apresentacao.filename}"/>
			</c:if>
			<span class="texto">${apresentacao.text}</span>
		</div>
	</c:if>
</div>
<br />
<div class="Container">
	<div class="row" style="padding-top:0px; text-align:left"">
		<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
			<tbody>
			  <tr>
			    <td class="titulo2Homepage"><fmt:message key="ipdms.login.titulo2Homepage"/></td>
			  </tr>
			</tbody>
		</table>					
	</div>	
	<c:if test="${not empty infos}">
		<c:forEach items="${infos}" var="info">
			<c:if test="${info.paginaInicial}">
				<div class="row formlabel_sf">
					<div class="tituloNoticias" style="width: 98%; " title="Titulo">
				  		${info.titulo}:
				  	</div>
				</div>
				<div class="row formlabel_sf" >
					<div class="leftTab label" style="width: 2%; " title="Simbolo">
				  		> 
				  	</div>
				  	
				  	<div class="label" style="width: 96%;" title="subtitulo e descrição">
				  		${info.subTitulo}<br />${info.descricao}
				  	</div>
				</div>
				<div class="row formlabel_sf">
					<div class="leftTab label" style="width: 98%; " title="Linha horizontal">
						<hr />
				  	</div>
				</div>
				
			</c:if>
		</c:forEach>	
	</c:if>
</div>