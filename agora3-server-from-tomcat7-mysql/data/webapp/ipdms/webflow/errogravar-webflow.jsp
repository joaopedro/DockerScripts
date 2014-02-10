<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="errors.situacaoErro.title" var="situacaoErro" />
<fmt:message key="errors.situacaoErro.adminMsg" var="adminMsg" />

<P class="formlabel">&nbsp;${situacaoErro}. ${adminMsg}</P>
