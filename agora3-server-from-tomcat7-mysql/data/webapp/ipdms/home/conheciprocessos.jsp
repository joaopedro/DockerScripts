<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.myprocesses.darconhecimento.title" var="title" />
<fmt:message key="ipdms.forms.ajuda" var="ajuda" />
<fmt:message key="ipdms.forms.ocultarAjuda" var="ocultarAjuda" />
<fmt:message key="ipdms.myprocesses.darconhecimento.help" var="help" />
<fmt:message key="ipdms.instrucao.pedido.info.title" var="atencao" />
<fmt:message key="ipdms.myprocesses.darconhecimento.empty" var="emptyMsg" />
<fmt:message key="ipdms.forms.tipoprocesso" var="tipoprocesso" />
<fmt:message key="ipdms.myprocesses.darconhecimento.numProcessos" var="numProcessos" />

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
<c:if test="${not empty process}">
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
</c:if>



<br/>
<c:choose >
<c:when test="${empty process}">
	<div class="row formlabel_sf" >
		<div class="mensagenCaixa">
			<div style="float:left; width:3%;">
				<img src="images/icon/icon-informacao.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;"  alt="${atencao}" title="${atencao}"/>
			</div>
			<div style="float:right; width:93%; vertical-align:middle; margin-top:4px; ">
				<div class="info">${emptyMsg}</div>
			</div>
			<div style="clear:both"></div>
		</div>
	</div>
</c:when>
<c:otherwise>
<table cellpadding="0" cellspacing="0" class="centro" summary="Tabela com a lista do tipo de processos a dar conhecimento e o número de processos associados ao tipo em questão">
	<tr>
		<th style="width:67.50em" class="centro">${tipoprocesso}</th>
		<th style="width:6.25em" class="centro">${numProcessos}</th>
	</tr>
	<tbody>
		<c:forEach items="${process}" var="processo">
			<tr>
				<td class="centro">
				<c:url var="link" value="listaconhecim.do2">		
					<c:param name="nrconteudo" value="${processo.key.numeroConteudo}"/>
				</c:url> <a href="${link}" title="${processo.key.titulo}">${processo.key.titulo}</a></td>
				<td class="centro" style="text-align: center;">${processo.value}</td>
		</c:forEach>
	</tbody>
</table>
</c:otherwise>
</c:choose>


