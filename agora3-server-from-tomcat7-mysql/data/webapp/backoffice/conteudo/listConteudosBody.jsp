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
		<c:set var="display" value="javascript:startLinkGeneric('listConteudos.do2','codTipo=${tipoConteudo.numeroConteudo}"/>
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
			<a href="${orderDisplay}&order=titulo', 'mainbody')">
				Título Conteúdo
				<c:if test="${empty param.order or param.order == 'titulo'}">
					<img border="0" src="${pageContext.request.contextPath}/backoffice/images/${imgOrderDisplay}" />
				</c:if>
			</a>
		</th>
		<th>Analisar</th>
		<th>Verificar</th>
		<th>Mudar Tipo</th>
		<th>Histórico</th>
		<th>
			<a href="${orderDisplay}&order=aprovado', 'mainbody')">
				Aprovado?
				<c:if test="${param.order == 'aprovado'}">
					<img border="0" src="${pageContext.request.contextPath}/backoffice/images/${imgOrderDisplay}" />
				</c:if>
			</a>
		</th>
		<th>
			<a href="${orderDisplay}&order=creator', 'mainbody')">
				Autor
				<c:if test="${param.order == 'creator'}">
					<img border="0" src="${pageContext.request.contextPath}/backoffice/images/${imgOrderDisplay}" />
				</c:if>
			</a>
		</th>
		<th>
			<a href="${orderDisplay}&order=dataEmissao', 'mainbody')">
				Data Criação
				<c:if test="${param.order == 'dataEmissao'}">
					<img border="0" src="${pageContext.request.contextPath}/backoffice/images/${imgOrderDisplay}" />
				</c:if>
			</a>
		</th>
		<th>
			<a href="${orderDisplay}&order=dataInicioConteudo', 'mainbody')">
				Início Validade
				<c:if test="${param.order == 'dataInicioConteudo'}">
					<img border="0" src="${pageContext.request.contextPath}/backoffice/images/${imgOrderDisplay}" />
				</c:if>
			</a>
		</th>
		<th>
			<a href="${orderDisplay}&order=dataFimConteudo', 'mainbody')">
				Fim Validade
				<c:if test="${param.order == 'dataFimConteudo'}">
					<img border="0" src="${pageContext.request.contextPath}/backoffice/images/${imgOrderDisplay}" />
				</c:if>
			</a>
		</th>
		<th>
			<a href="${orderDisplay}&order=dataInicioExecucao', 'mainbody')">
				Início Execução
				<c:if test="${param.order == 'dataInicioExecucao'}">
					<img border="0" src="${pageContext.request.contextPath}/backoffice/images/${imgOrderDisplay}" />
				</c:if>
			</a>
		</th>
		<th>
			<a href="${orderDisplay}&order=dataFimExecucao', 'mainbody')">
				Fim Execução
				<c:if test="${param.order == 'dataFimExecucao'}">
					<img border="0" src="${pageContext.request.contextPath}/backoffice/images/${imgOrderDisplay}" />
				</c:if>
			</a>
		</th>
	</tr>

<bean:define id="siteurl">
	<kcms:configuracao configEntry="SITEURL"/>/<kcms:configuracao configEntry="SITEREGEXP"/>
</bean:define>
<logic:iterate name="conteudos" property="itens" id="c" indexId="idx">
	<bean:define id="conteudoId" name="c" property="numero" />
	<bean:define id="linkEditar">
		<html:link action="/editarConteudo" paramId="numeroConteudo" paramName="conteudoId">${c.titulo}</html:link>
	</bean:define>
	<c:url var="url" value="${siteurl}/displayconteudo.do2?numero=${conteudoId}" />
	<bean:define id="linkWatchfire">
		<a href="http://www.tawdis.net/taw3/online?url=${url}&nivel=2" target="_blank">TawDis</a>
	</bean:define>
	<bean:define id="linkDisplay">
		<a href="${siteurl}${prefixmostrar}/displayconteudo.do2?numero=${conteudoId}" target="_blank">Mostrar</a>
	</bean:define>
	<bean:define id="linkChange"><a href="changeconteudo.do2?numero=${conteudoId}">Mudar</a></bean:define>
	<tr>
		<logic:equal name="listConteudos" property="showInactivos" value="false">
			<td><html:checkbox property='inactivar[${idx}]' value="${conteudoId}" /></td>
		</logic:equal>
		<logic:notEqual name="listConteudos" property="showInactivos" value="false">
			<td>&nbsp;</td>
		</logic:notEqual>
		<td>${linkEditar}</td>
		<td align="center">${linkWatchfire}</td>
		<td align="center">${linkDisplay}</td>
		<c:if test="${ empty tipoconteudo.classeSuporte }">
			<td align="center">${linkChange}</td>
		</c:if>
		<c:if test="${ not empty tipoconteudo.classeSuporte }">
			<td>&nbsp;</td>
		</c:if>
		<td align="center"><html:link action="/historicoConteudo" paramId="numeroConteudo" paramName="c" paramProperty="numero">Ver</html:link></td>
		<td align="center">${c.aprovado}</td>
		<td align="center">${c.autor}</td>
		<td align="center">${c.datacriacao}</td>
		<td align="center">${c.datainicio}</td>
		<td align="center">${c.datafim}</td>
		<td align="center">${c.datainicioexe}</td>
		<td align="center">${c.datafimexe}</td>
	</tr>
</logic:iterate>
</table>
Página ${conteudos.actpage} de ${conteudos.numpags}.
<logic:notEqual name="conteudos" property="actpage" value="1">&nbsp;&nbsp;<a href="javascript:sendInfo('p', 1, '${param.order}', '${param.ascending}')">Primeira Página</a></logic:notEqual>
<logic:notEqual name="conteudos" property="prevpage" value="0">&nbsp;&nbsp;<a href="javascript:sendInfo('p', ${conteudos.prevpage}, '${param.order}', '${param.ascending}')">Página Anterior</a></logic:notEqual>
<logic:notEqual name="conteudos" property="nextpage" value="0">&nbsp;&nbsp;<a href="javascript:sendInfo('p', ${conteudos.nextpage}, '${param.order}', '${param.ascending}')">Página Seguinte</a></logic:notEqual>
<logic:notEqual name="conteudos" property="lastpage" value="0">&nbsp;&nbsp;<a href="javascript:sendInfo('p', ${conteudos.lastpage}, '${param.order}', '${param.ascending}')">Última Página</a></logic:notEqual>
