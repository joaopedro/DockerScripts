<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	<c:when test="${field.type == 'PHOTO'}"><%--Ignore--%></c:when>
	<c:when test="${field.type == 'MULTIPLEPHOTO'}"><%--Ignore--%></c:when>
	<c:when test="${field.type == 'ALERT'}"><%--Ignore--%></c:when>
	<c:when test="${field.type == 'RADIOINPUT'}"><jsp:include page="radiofield.jsp" /></c:when>
	<c:when test="${field.type == 'TABLEOFFIELDS'}"><jsp:include page="tableoffieldsfield.jsp" /></c:when>
	<c:otherwise><jsp:include page="genericfield.jsp" /></c:otherwise>
</c:choose>