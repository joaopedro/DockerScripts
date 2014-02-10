<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="PT">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="Powerby SINFIC" />
<meta name="HandheldFriendly" content="True" />
<meta name="MobileOptimized" content="320" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="log" value="${pageContext.request.userPrincipal}" scope="request"></c:set>
<c:set var="formBeanName" value="${requestScope['org.apache.struts.action.mapping.instance'].name}" scope="request"></c:set>

<c:set var="IMG_DIR" value="${pageContext.request.contextPath}/newlayout/images" />

<fmt:message key="agora.product.name" var="productName"/>
<fmt:message key="agora.product.description" var="productDescription"/>

<link rel="shortcut icon" href="${IMG_DIR}/Ico_AGORA.png" type="image/x-icon"/>

<title>${productName} - ${productDescription}</title>

<tiles:insert attribute="ipdmsScriptsThemes" />

</head>

<body>
  <div class="container">
	<tiles:importAttribute />
	<logic:present role="CIDADAO,EMPRESA">
	
	</logic:present>
	<logic:notPresent role="CIDADAO,EMPRESA">	
		<c:choose>
			<c:when test="${pageContext.request.remoteUser == null}">			
				<tiles:insert attribute="main-body" flush="true"/>
			</c:when>
			<c:otherwise>
				<tiles:insert attribute="header" flush="true"/>
				<tiles:insert attribute="nav" flush="true"/>
				<tiles:insert attribute="main-body" flush="true"/>
			</c:otherwise>
		</c:choose>
	
	</logic:notPresent>
	
	<footer>
		<tiles:insert attribute="footer" flush="true"/>
	</footer>	
  </div>
</body>
</html>