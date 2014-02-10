<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="guichetelectronico.forms.atencao" bundle="${guichetBundle}" var="atencao" />

<div class="barraTitulo">
	<div class="textoTitulo">${atencao}</div>
</div>

<div id="areaCentral">

<div class="row formlabel_sf" >
	 <div class="mensagenCaixa">
		<div style="float:left; width:2%;">
			<img src="${pageContext.request.contextPath}/images/icon/icon-atencao.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;"  alt="${atencao}" title="${atencao}" />
		</div>
		<div style="float:right; width:95%; vertical-align:middle; margin-top:4px; ">
			<div class="info"><fmt:message key="error.runtime.exception" bundle="${guichetBundle}"/></div>
		</div>
	<div style="clear:both"></div>
	</div>
</div>
</div>