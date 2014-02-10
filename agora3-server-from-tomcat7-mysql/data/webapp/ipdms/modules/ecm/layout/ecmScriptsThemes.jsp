<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="IPDMS_JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<c:set var="JQUERYUI_DIR" value="${pageContext.request.contextPath}/ipdms/modules/ecm/js/jquery" />
<c:set var="ipdmsLocale" value="${sessionScope['javax.servlet.jsp.jstl.fmt.locale.session']}" />

<link rel="stylesheet" type="text/css" media="screen" href="${JQUERYUI_DIR}/css/jquery-ui.css" />
<link rel="stylesheet" type="text/css" media="screen" href="${JQUERYUI_DIR}/jqGrid-4.5.2/css/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" media="screen" href="${JQUERYUI_DIR}/jquery-loadmask/css/jquery.loadmask.css" />

<script type="text/javascript" src='${IPDMS_JS_DIR}/jquery/jquery-1.7.2.js'></script>
<script type="text/javascript" src='${JQUERYUI_DIR}/jquery-ui.min.js'></script>
<script type="text/javascript" src='${JQUERYUI_DIR}/jqGrid-4.5.2/i18n/grid.locale-${ipdmsLocale}.js'></script>
<script type="text/javascript" src='${JQUERYUI_DIR}/jqGrid-4.5.2/jquery.jqGrid.min.js'></script>
<script type="text/javascript" src='${JQUERYUI_DIR}/jquery-loadmask/jquery.loadmask.js'></script>