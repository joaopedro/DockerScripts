<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.modules.entidade.morada.criar" var="criarMorada" />
<fmt:message key="ipdms.modules.entidade.singular.tab.morada" var="morada" />
<fmt:message key="ipdms.modules.entidade.morada.eliminar.confirm" var="eliminarConfirm" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />
<fmt:message key="ipdms.organica.eliminar.aviso" var="avisoMsg" />
<fmt:message key="ipdms.modules.entidade.morada.eliminar.empty" var="emptyMsg" />

<c:set var="entidade_locale" value="${sessionScope['ipdms.entidade.locale']}" scope="request" />

<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/ConfirmCancel.js"></script>

<script type="text/javascript">

var moradasSelc=null;

	function mensagem(event,checks){
		
		moradasSelc=checks;		
		cancelar(event,'${morada}', '${eliminarConfirm}',decisao,'${sim}','${nao}');

		}


	function decisao(btn){

		if(btn=='yes'){
			removeMorada(moradasSelc, '${entidade_locale}', '${avisoMsg}', '${emptyMsg}');
			 }
		else{
			return false;
		    }

	}	
</script>

<div id="ver_ajuda" class="row" style="padding-top:0%; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo2"><fmt:message key="ipdms.modules.entidade.morada.list" /></td>
		  </tr>
		</tbody>
	</table>					
</div>
<div class="alignLeft" style="margin-top:1%;">
	<div class="left">
		<img src="${pageContext.request.contextPath}/images/icon/icon-criarNovo.png" onclick="editMorada('${entidade_locale}');" class="cursorMao" alt="${criarMorada}" title="${criarMorada}" />
	</div>
	<div class="right">
		<div class="texto">&nbsp;<a href="#" onclick="editMorada('${entidade_locale}');">${criarMorada}</a></div>
	</div>
</div>
<div id="divNewMorada"></div>
<div id="existingMoradas" style="width:97%; margin-left:1%;"></div>

<script>
updateDivMoradas('${entidade_locale}');
</script>