<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.forms.fechar" var="fechar" />
<fmt:message key="ipdms.forms.fechar.title" var="fecharTitle" />

<html>
<header>
<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/ipdms/themes" />
<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<LINK href='${THEMES_DIR}/estilos.css' type=text/css rel=stylesheet />
<LINK href='${THEMES_DIR}/forms.css' type=text/css rel=stylesheet />
<script src='${JS_DIR}/prototype.js' type="text/javascript"></script>
</header>
<body>
<c:if test="${empty userCertificate}">
	<c:set var="userCertificate" value="${sessionScope['com.sinfic.ipdms.security.x509certificate']}" scope="request" />
</c:if>
<jsp:include page="certificateInfo.jsp" />
<div class="buttonRow">
	<input type="button" value="${fechar}" title="${fecharTitle}" class="btForm" onclick="javascript:window.close()" />
</div>
</body>
</html>