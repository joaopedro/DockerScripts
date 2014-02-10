<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.modules.entidade.designacaoplural" var="entidadeDes" />

<a class="texto" href="#" onclick="showEntidadesSimplePopup('${dfieldId}');" id="entidadePopupImg"><img alt="${entidadeDes}" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png"></a>
<c:set var="extraproperties" />

<c:if test="${not empty fieldInstance}">
	<c:set var="extraproperties">${extraproperties} value="${fieldInstance.value}"</c:set>
	<c:if test="${not empty fieldInstance.relationObject}">
		<c:set var="nome">${fieldInstance.relationObject.nome}</c:set>
	</c:if>	
</c:if>

<span id="${dfieldId}_label">
	${nome}
</span>
<input type="hidden" id="${dfieldId}" name="${dfieldId}" ${extraproperties} />
			
<script>

showEntidadesSimplePopup = function(id){
	var action = "${pageContext.request.contextPath}/listEntidadeSimplePopup.do2?method=showPopup";
	
	action += "&idEntidade=" + id;
	action += "&nomeEntidade=" + id + "_label";
	action += "&window=winchoose";

	//TODO: replace EXT invocation with jQuery
	//ExtWindow('${entidadeDes}',action,'','html', 'refreshDynamicValues');
};
</script>