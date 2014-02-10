<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${ logged == 'true' }">
	<bean:message key="kcms.linha.bemvindo.label" locale="locale" /> ${log.userName} | <a href="logout.do2">Logout</a>
</c:if>
<c:if test="${ logged != 'true' }">
	<a href="logar.do2">Login</a>
</c:if>
