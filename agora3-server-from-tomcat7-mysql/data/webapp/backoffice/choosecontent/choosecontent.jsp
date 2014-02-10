<%@page errorPage="/backoffice/errors/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form name="formchoose" method="post" action="choosecontentreg.do2">
<table border="0">
	<tr><td colspan="2" align="right"><img style="cursor: hand" src="${pageContext.request.contextPath}/backoffice/images/cross.png" onclick="cleardivs('choosebox')"></td></tr>
	<tr><td>Título</td><td><input name="titulo" type="text" size="50" maxlength="255"></td></tr>
	<tr><td>Típologia</td><td><select name="codtipo" size="1">
	<c:forEach items="${ menu }" var="it">
		<option value="${ it.numeroConteudo }">${ it.titulo }</option>
	</c:forEach></td></tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr><td colspan="2"><input type="button" value="Listar" onclick="ajaxSubmitGeneric( document.formchoose, 'chooseresults' );"></td></tr>
	<tr><td colspan="2">&nbsp;</td></tr>
</table>
</form>
<div id="chooseresults" align="center"></div>
