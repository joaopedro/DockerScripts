<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${not empty localidadeDesc}">${localidadeDesc}</c:if>
<c:if test="${not empty morada.domicilio}">, ${morada.domicilio}</c:if>