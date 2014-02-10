<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.organica.designacaosingular" var="organicaDes" />
<a class="texto" href="#" onclick="showOrganica('${dfieldId}');" id="chooseorganicas"><img alt="${organicaDes}" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png"></a>
<c:set var="extraproperties" />

<c:if test="${not empty fieldInstance}">
	<c:set var="extraproperties">value="${fieldInstance.value}"</c:set>
	<c:if test="${not empty fieldInstance.relationObject}">
		<c:set var="designacao">${fieldInstance.relationObject.designacao}</c:set>
	</c:if>
</c:if>

<span id="${dfieldId}_label">
${designacao}
</span>
<input type="hidden" id="${dfieldId}" name="${dfieldId}" ${extraproperties} />

<script>
showOrganica = function(id){
	var action = "${pageContext.request.contextPath}/ajaxListOrganica.do2";
	paramts = "valuePlaceOlder=" + id;
	paramts += "&descPlaceOlder=" + id + "_label";
	paramts += "&window=winchoose";	
	ExtWindow('${organicaDes}',action,paramts,'ext');
};
</script>