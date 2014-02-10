<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="agora.attachdocuments.files.attached" var="filesAttached" />
<fmt:message key="agora.attachdocuments.files.attached.empty" var="filesAttachedEmpty" />

<c:if test="${not empty filesUploaded}">
    ${filesAttached}
    <br/>
    <c:forEach items="${filesUploaded}" var="fl">
        ${fl.description} - ${fl.fileName}
        <br/>
    </c:forEach>
</c:if>
<c:if test="${empty filesUploaded}">
    ${filesAttachedEmpty}
</c:if>

