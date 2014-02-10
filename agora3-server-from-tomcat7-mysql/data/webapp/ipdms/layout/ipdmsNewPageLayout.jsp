<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page contentType="text/html; charset=iso-8859-1" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<jsp:include page="/ipdms/layout/ipdmsScriptsThemes.jsp" />
</head>
<body>
	<c:set var="noReturnLink" scope="request"><tiles:getAsString name="noReturnLink" /></c:set>
	<tiles:insert attribute="body" />
</body>
</html>

