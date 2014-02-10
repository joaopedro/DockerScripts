<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<br/>
<c:forEach var="resultString" items="${result}">
	<p style="text-align:center;">${resultString}</p><br/>
</c:forEach>