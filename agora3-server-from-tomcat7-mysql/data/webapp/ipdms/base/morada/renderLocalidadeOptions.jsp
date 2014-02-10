<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:message key="ipdms.modules.entidade.localidadeOutra" var="localidadeOutra" />

<option value="-1">${localidadeOutra}</option>
<jsp:include page="renderOptions.jsp"></jsp:include>