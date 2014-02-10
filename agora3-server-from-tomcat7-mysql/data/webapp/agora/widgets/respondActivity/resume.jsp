<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="agora.respondactivity.resume" var="resume" />
<fmt:message key="agora.respondactivity.response" var="response" />

<div style="font-size: 0.625em">
    <br/>
    ${resume}
    <c:if test="${not empty result}">
        <br/>
        ${response} ${result}
    </c:if>
</div>
