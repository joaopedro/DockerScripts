<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<select name="${selectName}" id="${selectName}"
		onchange="renderSelect('${sessionScope['ipdms.entidade.locale']}', ${nextnivel}); ${nivel==nivelMorada ? '' : 'updateLabels();'}">
	<option value=""></option>			
	<c:forEach items="${options}" var="option">
		<option value="${option.value}">${option.title}</option>
	</c:forEach>
</select>
