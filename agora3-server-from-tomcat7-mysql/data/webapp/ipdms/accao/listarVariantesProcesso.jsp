<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.variante.variantesProcesso" var="titulo" />
<fmt:message key='ipdms.forms.executar' var="executar"/>

<script type="text/javascript">	
	document.title = '${productName} - ${titulo} ${processo.titulo}';	 
</script>

<div class="row" style="padding-top:0px; text-align:left; ">
	<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${titulo} ${processo.titulo} </td>
		  </tr>
		</tbody>
	</table>					
</div>
<div class="row formlabel_sf" >
	 <div class="mensagenCaixa">
		<div style="float:left; width:2%;">
			<img src="${pageContext.request.contextPath}/images/icon/icon-atencao.png" alt="<fmt:message key="ipdms.instrucao.pedido.info.title"/>" title="<fmt:message key="ipdms.instrucao.pedido.info.title"/>" style="vertical-align:middle; padding-left:10px; padding-right:8px;"/>
		</div>
		<div style="float:right; width:95%; vertical-align:middle; margin-top:4px; ">
			<div class="info"><fmt:message key="ipdms.instrucao.pedido.info"/></div>
		</div>
	<div style="clear:both"></div>
	</div>
</div>

	<c:set var="referer" value="${requestScope['javax.servlet.forward.servlet_path']}" />
	<c:if test="${not empty requestScope['javax.servlet.forward.query_string']}">
		<c:set var="referer" value="${referer}?${requestScope['javax.servlet.forward.query_string']}" />
	</c:if>
	<TABLE style="width:100%; margin-top:1%; border:none;"> 
		<c:forEach items="${variantes}" var="variante">
			<TR>
				<td colspan="2" class="titulo2" style="border-bottom:none;">${variante.titulo}</td>
			</TR>
			<TR>
				<TD style="width:90%; padding-left:15px; height:1%;" class="texto">${variante.descricao}</TD>
				<TD style="width:10%; height:1%;" class="texto">
					<c:choose>
						<c:when test="${fn:indexOf(variante.link, '?') != -1}">
							» <a href="${pageContext.request.contextPath}${variante.link}&tipo=${variante.numeroConteudo}&referer=${referer}" 
							class="texto" title="Executar ${variante.descricao}"><div class="info">${executar}</a>	
						</c:when>
						<c:otherwise>
							» <a href="${pageContext.request.contextPath}${variante.link}?tipo=${variante.numeroConteudo}&referer=${referer}" 
							class="texto" title="${executar} ${variante.descricao}">${executar}</a>	
						</c:otherwise>
					</c:choose>
				</TD>
			</TR>
			<TR><TD colspan="2" style="height:0.7%;">&nbsp;</TD></TR>
		</c:forEach>					
	 </TABLE>
