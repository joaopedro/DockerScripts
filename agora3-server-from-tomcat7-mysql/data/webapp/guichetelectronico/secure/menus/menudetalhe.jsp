<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="guichetelectronico.mais" bundle="${guichetBundle}" var="mais"/>

<div class="barraTitulo">
	<div class="textoTitulo"><fmt:message key="guichetelectronico.menu.detalhe.titulo" bundle="${guichetBundle}"/></div>
</div>
			
<div id="areaCentral">

<!-- form action="/registar" method="post"-->

	<div class="noticia" style="margin-bottom: 10px;">
		<div class="simbolo">»</div>
		<div class="blocoNoticia">
			<div class="titulos">${menu.titulo}</div>
			<div style="margin-bottom: 10px;">${menu.descricao}</div>
			<c:forEach items="${menu.anexos}" var="anexo" varStatus="index">
				<div class="pagelinks_grey">
					<a href="downloadanexomenu.do2?idanexo=${anexo.id}&idmenu=${menu.id}&tipo=menu">${anexo.descricao}</a>
				</div>
			</c:forEach> 
		</div>
	</div>
	
	<div style="clear:both"></div>
	
	<script>
		var par = true;
	</script>
	
	<c:forEach items="${menu.childs}" var="filho" varStatus="index">
		<c:if test="${log != null ? (filho.permLogin == true) : (filho.permLogin == false)}">
		<script>
		if(par) {
			document.write("<TABLE style=\"width:98%; margin-top:1%; border:none; margin-bottom: 10px;\" id=\"menudark\">");
			par = false;
		} else{
			document.write("<TABLE style=\"width:98%; margin-top:1%; border:none; margin-bottom: 10px;\" id=\"menuplain\">");
			par = true;
		}
		</script>
		 		
			<TR>
				<td colspan="2" class="tituloMenuItem">${filho.titulo}</td>
			</TR>
			<TR>
				<TD style="width:90%; height:1%;" class="texto">${filho.descricao}</TD>
				<TD style="width:10%; height:1%;" class="texto">» <a href="detalhemenu.do2?id=${filho.id}" class="texto">${mais}</a></TD>
			</TR>
			<tr>
				<TD style="width:90%; height:1%;" class="texto">
					<c:forEach items="${filho.anexos}" var="anexo" varStatus="index">
						<div class="pagelinks_grey"><a href="downloadmenu.do2?id=${anexo.id}">${anexo.descricao}</a></div>
					</c:forEach>
				</td>
				<TD style="width:10%; height:1%;" class="texto"></td>
			</tr>
			<TR><TD colspan="2" style="height:0.7%;">&nbsp;</TD></TR>						
		 </TABLE> 
		<div style="clear:both"></div>
		</c:if>
	</c:forEach>
	
	<c:choose>
		<c:when test="${log == null}">
			<c:set var="acesso" value="publico" scope="request"/>
		</c:when>
		<c:otherwise>
			<c:set var="acesso" value="secure" scope="request"/>
		</c:otherwise>
	</c:choose>
	
	<c:forEach items="${menuItems}" var="item" varStatus="index">
		<script>
		if(par) {
			document.write("<TABLE style=\"width:98%; margin-top:1%; border:none;\" id=\"menudark\">");
			par = false;
		} else{
			document.write("<TABLE style=\"width:98%; margin-top:1%; border:none;\" id=\"menuplain\">");
			par = true;
		}
		</script>
			 		
			<TR>
				<td colspan="2" class="tituloMenuItem">${item.descricaoCurta}</td>
			</TR>
			<TR>
				<TD style="width:90%; height:1%;" class="texto">${filho.descricao}</TD>
				<TD style="width:10%; height:1%;" class="texto">
				</TD>
			</TR>
			<tr>
				<TD style="width:90%; height:1%;" class="texto">
					${item.descricao}
				</td>
				<TD style="width:10%; height:1%;" class="texto"></td>
			</tr>
			<tr>
				<TD style="width:90%; height:1%;" class="texto">
					<c:forEach items="${item.anexos}" var="anexo" varStatus="index">
						<div class="pagelinks_grey">		
							<%--Pedido PEHLP00008422 - Documentos para download no Guichet Electronico --%>
							<a href="downloadanexomenu.do2?idanexo=${anexo.id}&idmenu=${item.id}&tipo=menuitem">${anexo.descricao}</a>							
						</div>
					</c:forEach> 
				</td>
				<TD style="width:10%; height:1%;" class="texto">» 
					<c:if test="${item.tipo == 'informacao'}">
						<a href="detalheinformacao.do2?id=${item.id}">${mais} </a>
					</c:if>
					<c:if test="${item.tipo == 'instrucao'}">
						<a href="../${acesso}/servicos.do2?tipo=${item.variante.numeroConteudo}">${mais} </a>
					</c:if>
					<c:if test="${item.tipo == 'link'}">
						<c:if test="${item.linkVisualizacao == '0'}">
							<c:set var="target" value="_blank"/>
						</c:if>
						<c:if test="${item.linkVisualizacao == '1'}">
							<c:set var="target" value="_blank"/>
						</c:if>
						<c:if test="${item.linkVisualizacao == '2'}">
							<c:set var="target" value="_parent"/>
						</c:if>
						
						<c:choose>
							<c:when test="${item.linkExterno == false}">
								<a href="..${item.linkUrl}" target="${target}">${mais} </a>
							</c:when>
							<c:otherwise>
								<a href="${item.linkUrl}" target="${target}">${mais} </a>
							</c:otherwise>
						</c:choose>
					</c:if>			
				</td>
			</tr>
			<TR><TD colspan="2" style="height:0.7%;">&nbsp;</TD></TR>						
		 </TABLE> 
		<div style="clear:both"></div>
	</c:forEach>
	
</div>