<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.menu.processos.minhaArea.processosNotificacoes" var="processosNotificacoes" />
<fmt:message key="ipdms.forms.ajuda" var="ajuda" />
<fmt:message key="ipdms.forms.ocultarAjuda" var="ocultarAjuda" />
<fmt:message key="ipdms.notification.pesqisa.tipoProcesso.help" var="help" />
<fmt:message key="ipdms.forms.tipoprocesso" var="tipoprocesso" />
<fmt:message key="ipdms.notification.designacaoplural" var="designacaoplural" />
<fmt:message key="ipdms.instrucao.pedido.info.title" var="atentao" />
<fmt:message key="ipdms.notification.pesqisa.tipoProcesso.empty" var="emptyMsg" />

<script type="text/javascript">	
	document.title = '${productName} - ${processosNotificacoes}';	 
</script>

<div id="ver_ajuda" class="row" style="padding-top:0px; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${processosNotificacoes}</td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('s');" class="cursorMao" alt="${ajuda}" title="${ajuda}" /></td>
		  </tr>
		</tbody>
	</table>					
</div>
<div id="ajuda" class="info" style="padding-top:0px; display: none; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${processosNotificacoes}</td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('n');" class="cursorMao" alt="${ocultarAjuda}" title="${ocultarAjuda}" /></td>
		  </tr>
		</tbody>
	</table>	
	${help}				
</div>

<div id="MensagemErro">
	<html:errors/>
</div>
<c:choose>
<c:when test="${not empty mapNotificacoesProcesso}">
<br />
<table cellpadding="0" cellspacing="0" class="centro" summary="Tabela com a lista dos processos com notificações e o numero de notificações">
    <tr>
    	<th style="width:67.50em" class="centro">${tipoprocesso}</th>
		<th style="width:6.25em" class="centro">${designacaoplural}</th>
    </tr>
    	<tbody>  
    		<c:forEach items="${mapNotificacoesProcesso}" var="processoImpl">
    			<c:set var="count" value="${processoImpl.value}" />
			    <tr>
			      <td class="centro">
		     			<c:url var="link" value="worklist.do2">
						<c:param name="method" value="search" />
						<c:param name="processType" value="${processoImpl.key.workflowType}" />
						<c:param name="parentActivity" value="${processoImpl.key.workflowProcess}" />
						<c:param name="tipo" value="${processoImpl.key.processo.numeroConteudo}" />
						<c:param name="por_processo" value="1"/>
					</c:url>				
					<a href="${link}" title="${processoImpl.key.processo.titulo}">${processoImpl.key.processo.titulo}</a>
				  </td>
			      <c:choose>
			      	<c:when test="${count < (MAX_NOTIFICATIONS  / 3)}"><c:set var="cor" value="rgb(98,182,61)" /></c:when>
			      	<c:when test="${count < ((MAX_NOTIFICATIONS  / 3) * 2)}"><c:set var="cor" value="rgb(255,255,0)" /></c:when>
			      	<c:otherwise><c:set var="cor" value="rgb(255,50,0)" /></c:otherwise>
			      </c:choose>
			      <td class="centro" style="text-align: center; background-color: ${cor};">${count}</td>
			    </tr>
	    	</c:forEach>
  		</tbody>
</table>	
</c:when>
<c:otherwise>
	<div class="row formlabel_sf" ><div class="mensagenCaixa"><div style="float:left; width:3%;"><img src="images/icon/icon-informacao.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;"  alt="${atentao}" title="${atentao}"/></div><div style="float:right; width:93%; vertical-align:middle; margin-top:4px; "><div class="info">${emptyMsg}</div></div><div style="clear:both"></div></div></div>
</c:otherwise>
</c:choose>