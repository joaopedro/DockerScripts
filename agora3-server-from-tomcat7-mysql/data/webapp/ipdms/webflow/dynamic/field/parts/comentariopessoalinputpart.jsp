<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.menu.processos.minhaArea.comentsPessoais" var="comentsPessoais" />

<a class="texto" href="#" onclick="showComentarios('${dfieldId}');">
	<img alt="${comentsPessoais}" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png">
</a>
<textarea id="${dfieldId}" name="${dfieldId}" rows="7">${fieldInstance.value}</textarea>

<script>
showComentarios = function(id){
	var action = "${pageContext.request.contextPath}/comentarioPessoalAction.do2?method=popup";
	action += "&valuePlaceId=" + id;
	action += "&window=winchoose";
	ExtWindow('${comentsPessoais}',action,'','html');
};
</script>