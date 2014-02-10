<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/ipdms/themes" />
<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<c:set var="JS_DIR_GUICHET" value="${pageContext.request.contextPath}/guichetelectronico/js" />
<c:set var="IMG_DIR" value="${pageContext.request.contextPath}/images" />
<c:set var="ipdmsLocale" value="${sessionScope['javax.servlet.jsp.jstl.fmt.locale.session']}" />

<LINK href='${THEMES_DIR}/estilosGuichet.css' type=text/css rel=stylesheet />
<LINK href='${THEMES_DIR}/forms.css' type=text/css rel=stylesheet />
<LINK href='${THEMES_DIR}/dynarch/calendar-blue.css' type=text/css rel=stylesheet />


<script src='${JS_DIR_GUICHET}/functionsGuichet.js' type="text/javascript"></script>
<script src='${JS_DIR}/behaviour.js' type="text/javascript"></script>
<script src='${JS_DIR}/cookie.js' type="text/javascript"></script>
<script src='${JS_DIR}/formFunctions.js' type="text/javascript"></script>
<script src='${JS_DIR}/menus.js' type="text/javascript"></script>
<script src='${JS_DIR}/multifile.js' type="text/javascript"></script>
<script src='${JS_DIR}/overlibmws/overlibmws.js' type="text/javascript"></script>
<script src='${JS_DIR}/utils.js' type="text/javascript"></script>
<script src='${JS_DIR}/prototype.js' type="text/javascript"></script>
<script src='${JS_DIR}/scriptaculous.js' type="text/javascript"></script>
<script src='${JS_DIR}/controls.js' type="text/javascript"></script>
<script src='${JS_DIR}/documentos.js' type="text/javascript"></script>
<script src='${JS_DIR}/date.js' type="text/javascript"></script>

<!-- EXT -->
<LINK href="${JS_DIR}/ext/resources/css/ext-all.css" rel="stylesheet" type="text/css" />
<script src="${JS_DIR}/ext/ext-base.js" type="text/javascript" ></script>
<script src='${JS_DIR}/ext/ext-all.js' type="text/javascript"></script>

<!--  dynarch calendar -->
<!--script src='${JS_DIR}/dynarch/calendar.js' type="text/javascript"></script-->
<script src='${JS_DIR}/dynarch/calendar_stripped.js' type="text/javascript"></script>

<!-- include do calendário na linguagem indicada em ipdms.language -->
<script src='${JS_DIR}/dynarch/calendar-${ipdmsLocale}.js' type="text/javascript"></script>

<!--script src='${JS_DIR}/dynarch/calendar-setup.js' type="text/javascript"></script-->
<script src='${JS_DIR}/dynarch/calendar-setup_stripped.js' type="text/javascript"></script>


<!-- Ajax tags -->
<script src='${JS_DIR}/ajax/ajaxtags.js' type="text/javascript"></script>
<script src='${JS_DIR}/ajax/ajaxtags_parser.js' type="text/javascript"></script>
<script src='${JS_DIR}/ajax/ajaxtags_controls.js' type="text/javascript"></script>


<!-- SLIDER FILES -->
<script src='${JS_DIR}/ajax.js'type="text/javascript"></script>
<script type="text/javascript">	
	var DHTML_SUITE_THEME = 'blue';	// Specifying blue theme
	var DHTML_SUITE_THEME_FOLDER = '${pageContext.request.contextPath}/ipdms/themes/';
	var DHTML_SUITE_JS_FOLDER = '${pageContext.request.contextPath}/ipdms/js/dhtml-suite/';
</script>	
<script src='${pageContext.request.contextPath}/ipdms/js/dhtml-suite-for-applications.js'	type="text/javascript"></script>
<!-- END OF SLIDER FILES -->

<!-- DHTML TAB FILES -->
<LINK href='${pageContext.request.contextPath}/ipdms/js/separateFiles/tab-view.css' type=text/css rel=stylesheet />
<script src='${pageContext.request.contextPath}/ipdms/js/separateFiles/tab-view.js' type="text/javascript"></script>
<script src='${pageContext.request.contextPath}/ipdms/js/separateFiles/ajax-dynamic-content.js' type="text/javascript"></script>
<!-- END OF DHTML TAB FILES -->
