<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="PT">
<head>
<META http-equiv="X-UA-Compatible" content="IE=EmulateIE7" >
<%@ page contentType="text/html; charset=iso-8859-15" %>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-15" />

<c:set var="log" value="${pageContext.request.userPrincipal}" scope="request"></c:set>
<c:set var="formBeanName" value="${requestScope['org.apache.struts.action.mapping.instance'].name}" scope="request"></c:set>

<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/ipdms/themes" />
<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<c:set var="IMG_DIR" value="${pageContext.request.contextPath}/images" />

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.product.description" var="productDescription"/>

<title>${productName} - ${productDescription}</title>

</head>

<body>

<script type="text/javascript" src="${JS_DIR}/historico.js" ></script>
<script type="text/javascript" src='${JS_DIR}/jquery/jquery-1.7.2.js' ></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/IPDMSTreePanel.js"></script>

<tiles:importAttribute name="resultPane" scope="request" ignore="true"/>
<tiles:importAttribute name="body" scope="request" ignore="true"/>
<tiles:insert definition="ipdms.base">
	<tiles:put name="header" value="/ipdms/base/header.jsp" />
	<tiles:put name="menu" value="/ipdms/base/menu.jsp" />
	<tiles:put name="main-body" value="/ipdms/workflow/layout/notificationBody.jsp"/>
	<tiles:put name="footer" value="/ipdms/base/footer.jsp" />
</tiles:insert>

</body>
</html>