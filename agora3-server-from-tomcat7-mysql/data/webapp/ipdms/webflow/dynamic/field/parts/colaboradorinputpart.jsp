<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.colaboradores" var="colaboradoresEscolher" />
<fmt:message key="ipdms.colaborador.designacaoplural" var="colaboradorDes" />

<a class="texto" href="#" onclick="showColaboradores('${dfieldId}', '${field.organica.id}');"><img alt="${colaboradoresEscolher}" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png"></a>
<c:set var="extraproperties" />

<c:if test="${not empty fieldInstance}">
	<c:set var="extraproperties">${extraproperties} value="${fieldInstance.value}"</c:set>
	<c:if test="${not empty fieldInstance.relationObject}">
		<c:set var="login">${fieldInstance.relationObject.login}</c:set>
	</c:if>
</c:if>

<span id="${dfieldId}_label">
		${login}
</span>
<input type="hidden" id="${dfieldId}" name="${dfieldId}" ${extraproperties}/>

<script>

showColaboradores = function(id, filterByOrganica){
	var action = "${pageContext.request.contextPath}/ajaxListOrganicaWithColaboradores.do2";
	
	paramts = "valuePlaceOlder=" + id;
	paramts += "&descPlaceOlder=" + id + "_label";
	if(filterByOrganica) {
		paramts += "&parentId=" + filterByOrganica; 
	}
	
	paramts += "&window=winchoose";	
	paramts += "&includeParent=true";
	ExtWindow('${colaboradorDes}',action,paramts,'ext');
};
</script>