<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/kcms.tld" prefix="kcms"%>

<style>
th a {
	font-family: Tahoma, Verdana;
	text-decoration: none;
	font-size: 11px;
	font-weight: bold;
	text-align : center;
	color: #fff;
}
</style>

<table border="1" cellpadding="1" cellspacing="1">
	<tr>
<c:set var="display" value="listConteudos.do2?codTipo=${tipoConteudo.numeroConteudo}"/>
		<c:choose>
			<c:when test="${empty param.ascending or param.ascending == true}">
				<c:set var="orderDisplay" value="${display}&ascending=false"/>
				<c:set var="imgOrderDisplay" value="arrowDown.gif"/>
			</c:when>
			<c:otherwise>
				<c:set var="orderDisplay" value="${display}&ascending=true"/>
				<c:set var="imgOrderDisplay" value="arrowUp.gif"/>
			</c:otherwise>
		</c:choose>
		
		<th>&nbsp;</th>
		<th>
			<a href="${orderDisplay}&order=titulo">
				Nome Tipificação
				<c:if test="${empty param.order or param.order == 'titulo'}">
					<img border="0" src="${pageContext.request.contextPath}/backoffice/images/${imgOrderDisplay}" />
				</c:if>				
			</a>
		</th>
		<th>Editar</th>
		<th>
			<a href="${orderDisplay}&order=creator">
				Autor
				<c:if test="${param.order == 'creator'}">
					<img border="0" src="${pageContext.request.contextPath}/backoffice/images/${imgOrderDisplay}" />
				</c:if>				
			</a>
		</th>
		<th>
			<a href="${orderDisplay}&order=dataEmissao">
				Data Criação
				<c:if test="${param.order == 'dataEmissao'}">
					<img border="0" src="${pageContext.request.contextPath}/backoffice/images/${imgOrderDisplay}" />
				</c:if>				
			</a>
		</th>
		<th>
			<a href="${orderDisplay}&order=dataInicioConteudo">
				Início Validade
				<c:if test="${param.order == 'dataInicioConteudo'}">
					<img border="0" src="${pageContext.request.contextPath}/backoffice/images/${imgOrderDisplay}" />
				</c:if>				
			</a>
		</th>
		<th>
			<a href="${orderDisplay}&order=dataFimConteudo">
				Fim Validade
				<c:if test="${param.order == 'dataFimConteudo'}">
					<img border="0" src="${pageContext.request.contextPath}/backoffice/images/${imgOrderDisplay}" />
				</c:if>				
			</a>
		</th>
 		<th>Tipo Aprovação</th>
		<th>Número Registos</th>
		
	</tr>
	
<bean:define id="siteurl">
	<kcms:configuracao configEntry="SITEURL"/>/<kcms:configuracao configEntry="SITEREGEXP"/>
</bean:define>
<logic:iterate name="conteudos" property="itens" id="c" indexId="idx">
	<bean:define id="conteudoId" name="c" property="numero" />
	<bean:define id="linkEditar">
		<html:link action="/editarConteudo" paramId="numeroConteudo" paramName="conteudoId">Editar</html:link> 
	</bean:define>
	<tr>
		<logic:equal name="listConteudos" property="showInactivos" value="false">
			<td><html:checkbox property='inactivar[${idx}]' value="${conteudoId}" /></td>
		</logic:equal>
		<logic:notEqual name="listConteudos" property="showInactivos" value="false">
			<td>&nbsp;</td>
		</logic:notEqual>
		<td><a href="javascript: startLinkGeneric('listConteudos.do2', 'codTipo=${ c.numero }', 'mainbody')">${c.titulo}</a></td>
		<td align="center">${linkEditar}</td>
		<td align="center">${c.autor}</td>
		<td align="center">${c.datacriacao}</td>
		<td align="center">${c.datainicio}</td>
		<td align="center">${c.datafim}</td>
		<td align="center">${c.aprovacao}</td>
		<td align="center">${c.registosActivos}/${c.registosInactivos}</td>
	</tr>
</logic:iterate>
</table>
Página ${conteudos.actpage} de ${conteudos.numpags}. 
<logic:notEqual name="conteudos" property="actpage" value="1">&nbsp;&nbsp;<a href="javascript:sendInfo('p', 1, '${param.order}', '${param.ascending}')">Primeira Página</a></logic:notEqual>
<logic:notEqual name="conteudos" property="prevpage" value="0">&nbsp;&nbsp;<a href="javascript: sendInfo('p', ${conteudos.prevpage}, '${param.order}', '${param.ascending}')">Página Anterior</a></logic:notEqual>
<logic:notEqual name="conteudos" property="nextpage" value="0">&nbsp;&nbsp;<a href="javascript: sendInfo('p', ${conteudos.nextpage}, '${param.order}', '${param.ascending}')">Página Seguinte</a></logic:notEqual>
<logic:notEqual name="conteudos" property="lastpage" value="0">&nbsp;&nbsp;<a href="javascript: sendInfo('p', ${conteudos.lastpage}, '${param.order}', '${param.ascending}')">Última Página</a></logic:notEqual>
