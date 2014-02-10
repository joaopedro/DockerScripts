<%@page errorPage="/backoffice/errors/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form name="properties" method="post" action="menuspropertiesreg.do2">
<table border="1">
	<tr><td colspan="2" align="right"><img style="cursor: hand" src="${pageContext.request.contextPath}/backoffice/images/cross.png" onclick="cleardivs('properties')"></td></tr>
	<tr><th>Propriedade</th><th>Valor</th></tr>
	<c:forEach items="${ items }" var="it">
		<tr><td>${ it.property }</td><td><input type="text" size="50" maxlength="255" value="${ it.value }"></td></tr>
	</c:forEach>
	<tr><td colspan="2"><input type="hidden" name="menu" value="${menu }"><input type="button" value="Gravar" onclick="ajaxSubmitGeneric( document.properties, '' ); cleardivs('properties');"></td></tr>
</table>
</form>