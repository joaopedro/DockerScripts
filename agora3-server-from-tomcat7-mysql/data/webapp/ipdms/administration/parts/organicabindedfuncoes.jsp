<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:forEach items="${bindedfuncoes }" var="funcao">
	<option value="${funcao.id }">${funcao.titulo }</option>
</c:forEach>