<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
<c:if test="${not empty savedId}">
	$('id').value = '${savedId}';
</c:if>
</script>