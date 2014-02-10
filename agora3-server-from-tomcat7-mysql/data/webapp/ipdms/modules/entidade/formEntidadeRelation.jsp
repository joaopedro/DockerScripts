<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.modules.entidaderelations.criar" var="criar" />
<fmt:message key="ipdms.modules.entidade.designacaoplural" var="entidades" />

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/CustomToolbar.css" />
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/Window_Iframe.js"></script>


<div class="row" style="padding-top:0%; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo2"><fmt:message key="ipdms.modules.entidade.entidaderelation.list" /></td>
		  </tr>
		</tbody>
	</table>					
</div>
<div class="alignLeft" style="margin-top:1%;">
	<div class="left">
		<img src="${pageContext.request.contextPath}/images/icon/icon-criarNovo.png" onclick="editEntidadeRelation();" class="cursorMao" alt="${criar}" title="${criar}" />
	</div>
	<div class="right">
		<div class="texto">&nbsp;<a href="#" onclick="editEntidadeRelation();">${criar}</a></div>
	</div>
</div>
<div id="divEditEntidadeRelation"></div>
<div id="existingEntidadeRelations" style="width:97%; margin-left:1%;"></div>

<script>
updateDivEntidadeRelations();

showEntidadesSimplePopup = function () {
	var action = "${pageContext.request.contextPath}/listEntidadeSimplePopup.do2?method=showPopup";
	action += "&idEntidade=entidadeRelationId";
	action += "&nomeEntidade=entidadeRelationDescription";
	//action += "&nifEntidade=entidade_nif";
	action += "&window=winchoose";
	ExtWindow('${entidades}',action,'','html');
}
</script>


