<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${not empty moradaDesc}">${moradaDesc}</c:if>
<c:if test="${not empty morada.lote}">, ${morada.lote}</c:if>