<%@page errorPage="/backoffice/errors/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table border="0">
	<c:forEach items="${ menu }" var="it">
		<tr><td>${ it.titulo }</td><td><img style="cursor: hand" src="${pageContext.request.contextPath}/backoffice/images/accept.gif"
			 onclick="saveNewEntry(${ it.numeroConteudo }, '${it.titulo}'); cleardivs('choosebox');"></td></tr>
	</c:forEach>
</table>
