<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<script type="text/javascript" src="${JS_DIR}/historico.js" ></script>

<tiles:importAttribute name="resultPane" scope="request" ignore="true"/>
<tiles:importAttribute name="body" scope="request" ignore="true"/>
<tiles:insert definition="ipdms.base">
	<tiles:put name="header" value="/ipdms/base/header.jsp" />
	<tiles:put name="menu" value="/ipdms/base/menu.jsp" />
	<tiles:put name="main-body" value="/ipdms/workflow/layout/multipleNotificationBody.jsp"/>
	<tiles:put name="footer" value="/ipdms/base/footer.jsp" />
</tiles:insert>