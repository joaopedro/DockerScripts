<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="imgDir" value="${pageContext.request.contextPath}/images" scope="request"/>
<c:set var="iconImgDir" value="${imgDir}/icon/menu/preto" scope="request"/>
<c:set var="botaoMais" value="${imgDir}/button/maisMenu.png" scope="request"/>
<c:set var="botaoMenos" value="${imgDir}/button/menosMenu.png" scope="request"/>


<script type="text/JavaScript">
var cookiePath="${pageContext.request.contextPath}";

function showHideDiv(nivel, id) {

	var endId = '-' + nivel + '-' + id;
	
	if ($('linhamenu'+endId).style.visibility == "hidden") {
		//alert("entrou");
		$('linhamenu'+endId).style.visibility = 'visible'; 
		$('linhamenu'+endId).style.display = 'block'; 
		$('img'+endId).src = '${botaoMenos}'; 


	} else {
		//alert("entrou2");
		$('linhamenu'+endId).style.visibility = 'hidden'; 
		$('linhamenu'+endId).style.display = 'none'; 
		$('img'+endId).src = '${botaoMais}';
	}
} 
</script>

<div id="list-menu" style="background-color:#ffffff">

	<%-- SUPERUSER APP LINKS --%>
	<ul id="menuPrincipal1" style="width:100%; padding-bottom:0.31em;">
		<li class="tituloMenu" style="width:100%;" >
  			<span class="tituloMenuTexto"><fmt:message key='ipdms.menu.aplicacoesInternas'/></span>
  		</li>
		<jsp:include page="menu/supergroup.jsp" />	   <%-- menu com ids' 1-1" --%>	
		<jsp:include page="menu/aplicacoesgroup.jsp" /><%-- menu com ids' 1-2 --%>
		<jsp:include page="menu/guichetgroup.jsp" />   <%-- menu com ids' 1-3 --%>
	</ul>
	<br/>
	<%-- PROCESSOS --%>
	<ul id="menuPrincipal2" style="width:100%; padding-bottom:0.19em;">
	   	<li class="tituloMenu" style="width:100%;">
   			<span class="tituloMenuTexto"><fmt:message key='ipdms.menu.processos'/></span>
   		</li>
		<jsp:include page="menu/processosinstrucaogroup.jsp" /> <%-- menu com ids' 2-1 --%>
		<jsp:include page="menu/pesquisagroup.jsp" />			<%-- menu com ids' 2-2 --%>
		<jsp:include page="menu/tramitacaogroup.jsp" />			<%-- menu com ids' 2-3 --%>
		<jsp:include page="menu/homepagegroup.jsp" />			<%-- menu com ids' 2-4 --%>
	</ul>
	<br/>
	
	<%-- MODULOS --%>
	<ul id="menuPrincipal3" style="width:100%; padding-bottom:0.31em;">
		<li class="tituloMenu" style="width:100%;" >
 			<span class="tituloMenuTexto"><fmt:message key='ipdms.menu.modulos'/></span>
		</li>
		<jsp:include page="menu/modulogroupwithlevels.jsp"></jsp:include> <%-- menu com ids' 3-... --%>
	</ul>
	
</div>



