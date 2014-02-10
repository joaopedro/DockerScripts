<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/newlayout/themes" />
<c:set var="JS_DIR" value="${pageContext.request.contextPath}/newlayout/js" />

<link href="${THEMES_DIR}/estilos.css" rel="stylesheet" type="text/css" />
<link href="${THEMES_DIR}/forms.css" rel="stylesheet" type="text/css" />
<link href="${THEMES_DIR}/menu.css" rel="stylesheet" type="text/css" />
<link href="${THEMES_DIR}/table.css" rel="stylesheet" type="text/css" />
<link href="${THEMES_DIR}/table-class.css" rel="stylesheet" type="text/css" />
<link href="${THEMES_DIR}/media.css" rel="stylesheet" media="all and (max-width: 1024px)" />
<link href="${THEMES_DIR}/smoothness/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
<link href="${THEMES_DIR}/jquery-loadmask/css/jquery.loadmask.css" rel="stylesheet" type="text/css" />

<script src='${JS_DIR}/cookies.js' type="text/javascript"></script>
<script src='${JS_DIR}/jquery-ui-1.10.3.custom/js/jquery-1.9.1.js' type="text/javascript"></script>
<script src='${JS_DIR}/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.js' type="text/javascript"></script>
<script src='${JS_DIR}/jquery-loadmask/jquery.loadmask.js' type="text/javascript"></script>
<script src="${JS_DIR}/atmosphere/jquery.atmosphere.min.js"></script>