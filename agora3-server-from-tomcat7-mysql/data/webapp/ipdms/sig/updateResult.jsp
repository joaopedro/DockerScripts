<%@ taglib prefix="html" uri="/tags/html"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<br />
<c:if test="${empty exception}">
	<h1>Pedido registado com sucesso.</h1>
	<c:if test="${empty geographicObject}">
		<br />O Objecto Geográfico foi eliminado!
	</c:if>
	<c:if test="${not empty geographicObject}">
		<br />
		Identificadores SIG:<br /><br />
		<ul id="currentFeatureIdsUL">
		<c:forEach items="${geographicObject.geographicFeatures}" var="feature">
			<li>${feature.sigId}</li>
		</c:forEach>
		</ul>
	</c:if>
</c:if>
<c:if test="${not empty exception}">
	<h1>Ocorreu um erro a gravar no IPDMS:</h1>
	<br />
	<h1>${exception.message}</h1>
	<br />
	${exception.localizedMessage}
	
	<%--
	<pre>
		<c:forEach items="${exception.stackTrace}" var="stackTraceElement">
			${stackTraceElement}
		</c:forEach>
	</pre>
	--%>
	
</c:if>