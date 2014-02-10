<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:message key="ipdms.soassociacao.processosDisponiveis" var="processosDisponiveis" />
<fmt:message key="ipdms.processo.designacaosingular" var="processofieldDes" />
<a class="texto" href="#" onclick="showServicosOnline('${dfieldId}');" id="chooseProcess"><img alt="${processfieldDes}" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png"></a>
<c:set var="extraproperties" />

<c:if test="${not empty fieldInstance}">
	<c:set var="extraproperties">value="${fieldInstance.value}"</c:set>
	<c:if test="${not empty fieldInstance.relationObject}">
		<c:set var="designacao">${fieldInstance.relationObject.idProcessoEntidade} ${fieldInstance.relationObject.variante.titulo}</c:set>
	</c:if>
</c:if>
<span id="${dfieldId}_label"></span>
${designacao}
<input type="hidden" id="${dfieldId}" name="${dfieldId}" ${extraproperties} />
<script>


showServicosOnline=function(id){
	var action = "${pageContext.request.contextPath}/searchServicoOnlinePopup.do2";
	action += "?valuePlaceOlder=" + id;
	action += "&descPlaceOlder=" + id + "_label";
	action += "&window=winchoose";
	action += "&idVariante=showAll";
	//action += "&entidadeId=22";
	//action += "&entidadeRoleId=4"; //requerente: 4 terceiro: 5
	//action += "&exclude=${servicoOnline.id.numeroConteudo}";

	ExtWindow('${processosDisponiveis}',action,'','html', 'refreshDynamicValues');
};
</script>

