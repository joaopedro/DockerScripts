<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/kcms.tld" prefix="kcms"%>

Estatisticas de Question�rio
<table>
	<tr><td>Conte�do</td><td>N�mero de Respostas</td></tr>
	<c:forEach items="${currentcontent.contentInterface.estatisticas}" var="stat">
		<kcms:set numeroConteudo="${stat.key}" var="conteudo" />
		<tr><td>${conteudo.titulo}</td><td>${stat.value}</td></tr>
	</c:forEach>
</table>