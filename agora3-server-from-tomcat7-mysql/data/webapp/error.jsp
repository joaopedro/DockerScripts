<%
	response.setHeader("Expires ", "Mon, 04 Sep 2000 17:42:40 GMT");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="error.default.exception.title" var="exceptionTitle" />
<fmt:message key="error.default.exception.forwardToHelpdesk.title" var="forwardToHelpdesk" />
<fmt:message key="error.default.exception.forwardToHelpdesk.list1" var="list1" />
<fmt:message key="error.default.exception.forwardToHelpdesk.list2" var="list2" />
<fmt:message key="error.default.exception.forwardToHelpdesk.list3" var="list3" />
<fmt:message key="error.default.exception.forwardToHelpdesk.thanks" var="thanks" />

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

${exceptionTitle}: <%= exception.getMessage() %><br />
<pre><% exception.printStackTrace(); %></pre><p>${forwardToHelpdesk}: <ul>
<li>${list1}</li>
<li>${list2}</li>
<li>${list3}</li>
</ul>
${thanks} </body>
</html>