<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.modules.entidade.morada.criar" var="criarMorada" />

<div class="row" style="padding-top:0%; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo2"><fmt:message key="ipdms.modules.entidade.moradaestrangeira.list" /></td>
		  </tr>
		</tbody>
	</table>					
</div>
<div class="alignLeft" style="margin-top:1%;">
	<div class="left">
		<img src="${pageContext.request.contextPath}/images/icon/icon-criarNovo.png" onclick="editMoradaEs();" class="cursorMao" alt="${criarMorada}" title="${criarMorada}" />
	</div>
	<div class="right">
		<div class="texto">&nbsp;<a href="#" onclick="editMoradaEs();">${criarMorada}</a></div>
	</div>
</div>

<div id="divEditMoradaEs"></div>
<div id="existingMoradasEs" style="width:97%; margin-left:1%;"></div>

<script>
updateDivMoradasEs();
</script>


