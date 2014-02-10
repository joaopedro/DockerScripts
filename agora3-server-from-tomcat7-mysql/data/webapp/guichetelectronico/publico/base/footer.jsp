<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	<div id="footer">
		<div class="left"><img src="${pageContext.request.contextPath}/images/guichet/logo.png" alt="Logo Sinfic" title="Logo Sinfic" /></div>
		<div class="right"><fmt:message key="guichetelectronico.footer.msg" bundle="${guichetBundle}"/></div>
	</div>
