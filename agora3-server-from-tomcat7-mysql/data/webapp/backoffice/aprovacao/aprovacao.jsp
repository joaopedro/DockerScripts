<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<script type="text/javascript">
	reloadme = function( )
	{
		startLinkGeneric( 'aprovacoes.do2', '', 'mainbody');
	}
</script>
<div id="tabela">
	<div class="widget_tableDiv">
		<table id="myTable" >
			<thead >
			<tr>
				<td nowrap>Titulo Conteúdo</td>
				<td>Analisar</td>
				<td>Aprovar</td>
				<td>Reprovar</td>
				<td>Autor</td>
				<td>Data Criação</td>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="conteudo" items="${ conteudos }">
				<tr>
					<td>${conteudo.titulo}</td>
					<td><a href="../displayconteudo.do2?numero=${conteudo.numeroConteudo}&versao=${conteudo.versaoConteudo}" target="_blank">Visualizar</a></td>
					<td><a href="javascript: startLinkGeneric( 'aprovar.do2', 'aprova=S&numero=${conteudo.numeroConteudo}&versao=${conteudo.versaoConteudo}', 'nenhumdiv', reloadme)">Aprovar</a></td>
					<td><a href="javascript: startLinkGeneric( 'aprovar.do2', 'aprova=N&numero=${conteudo.numeroConteudo}&versao=${conteudo.versaoConteudo}', 'nenhumdiv', reloadme)">Reprovar</a></td>
					<td>${conteudo.creator.titulo}</td>
					<td>${conteudo.dataEmissao}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>