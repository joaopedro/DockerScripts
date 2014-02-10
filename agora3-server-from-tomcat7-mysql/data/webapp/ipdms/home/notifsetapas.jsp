<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.menu.processos.minhaArea.etapasNotificacoes" var="title" />
<fmt:message key="ipdms.forms.ajuda" var="ajuda" />
<fmt:message key="ipdms.forms.ocultarAjuda" var="ocultarAjuda" />
<fmt:message key="ipdms.notification.pesqisa.etapas.help" var="help" />
<fmt:message key="ipdms.etapa.designacaosingular" var="etapa" />
<fmt:message key="ipdms.notification.designacaoplural" var="notifications" />
<fmt:message key="ipdms.notification.pesqisa.etapas.empty" var="emptyMsg" />

<script type="text/javascript">	
	document.title = '${productName} - ${title}';	 
</script>

<div id="ver_ajuda" class="row" style="padding-top:0px; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${title}</td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('s');" class="cursorMao" alt="${ajuda}" title="${ajuda}" /></td>
		  </tr>
		</tbody>
	</table>					
</div>
<div id="ajuda" class="info" style="padding-top:0px; display: none; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${title}</td>
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
<c:when test="${not empty mapNotificacoesEtapa}">

<br />
<table cellpadding="0" cellspacing="0" class="centro" summary="Tabela com a lista das etapas com notificações e o número de processos associados à etapa em questão">
    <tr>    	
    	<th style="width:67.50em" class="centro">${etapa}</th>
		<th style="width:6.25em" class="centro">${notifications}</th>
    </tr>
    	<tbody>  
    	<c:forEach items="${mapNotificacoesEtapa}" var="mapEntry">
    		<c:set var="count" value="${mapEntry.value}" />
		    <tr>
		      <td class="centro">
	     		<c:url var="link" value="worklist.do2">
					<c:param name="method" value="search" />
					<c:param name="tipo" value="${mapEntry.key.numeroConteudo}" />
					<c:param name="etapaId" value="${mapEntry.key.numeroConteudo}" />
					<c:param name="por_etapa" value="1" />
				</c:url>				
				<a href="${link}" title="${mapEntry.key.titulo}">${mapEntry.key.titulo}</a>
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
<span class="texto">
	<br />
	${emptyMsg}
</span>
</c:otherwise>
</c:choose>