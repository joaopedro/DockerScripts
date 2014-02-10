<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="error.accessdenied.exception.title" var="exceptionTitle" />
<fmt:message key="error.accessdenied.exception.message" var="exceptionMessage" />

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <meta http-equiv="Content-Style-Type" content="text/css">
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv="Cache-Control" content="no-cache">
  <meta http-equiv="expires" content="0">
<META name="GENERATOR" content="IBM WebSphere Studio">
</head>

<body>
${exceptionTitle}<br />
${exceptionMessage}<br />
</body>
</html>