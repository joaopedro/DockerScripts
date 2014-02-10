<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/kcms.tld" prefix="kcms"%>
<h1>Histórico</h1>
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
		<th>Versão</th>
		<th>Título</th>
		<th>Autor</th>
		<th>Aprovado?</th>
		<th>Activo?</th>
		<th>Data Criação</th>
		<th>Visualizar</th>
		<th>Recuperar</th>
		<th>Editar</th>
	</tr>
	<c:forEach items="${ versoesConteudo }" var="conteudo">
		<tr>
			<td>${conteudo.versaoConteudo}</td>
			<td>${conteudo.titulo}</td>
			<td>${conteudo.creator.titulo}</td>
			<td><logic:equal name="conteudo" property="aprovado" value="S">Sim</logic:equal><logic:equal name="conteudo" property="aprovado" value="N">Não</logic:equal></td>
			<td><logic:equal name="conteudo" property="activado" value="S">Sim</logic:equal><logic:equal name="conteudo" property="activado" value="N">Não</logic:equal></td>
			<td>${conteudo.dataEmissao}</td>
			<td align="center"><html:link action="/displayconteudo.do2?numero=${conteudo.numeroConteudo}" paramId="versao" paramName="conteudo" paramProperty="versaoConteudo" target="_blank">Ver</html:link></td>
			<td align="center"><html:link action="/recoverversion?numero=${conteudo.numeroConteudo}" paramId="versao" paramName="conteudo" paramProperty="versaoConteudo">Recuperar</html:link></td>
			<td align="center"><html:link action="/editarConteudo?numeroConteudo=${conteudo.numeroConteudo}&versaoConteudo=${conteudo.versaoConteudo}">Editar</html:link></td>
		</tr>
	</c:forEach>
</table>
