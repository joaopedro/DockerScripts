<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<option value=""></option>
<c:forEach items="${options}" var="option">
	<option value="${option.value}">${option.title}</option>
</c:forEach>