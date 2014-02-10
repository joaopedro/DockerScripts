<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:message key="ipdms.dimensoes.designacaoplural" var="dimensoes" />

<table style="width:100%;">
	<td style="width:3%; text-align:left;">
		<img src="${pageContext.request.contextPath}/images/icon/icon-criarNovo.png" onclick="showFormNovoNivel();" class="cursorMao" alt="<fmt:message key="ipdms.dimensoes.nivel.criar" />" title="<fmt:message key="ipdms.dimensoes.nivel.criar" />" />
	</td>
 	<td style="width:70%; text-align:left;">
		<div class="texto">&nbsp;<a href="#" onclick="showFormNovoNivel();" title="<fmt:message key='ipdms.dimensoes.nivel.criar' />" alt="<fmt:message key='ipdms.dimensoes.nivel.criar' />"><fmt:message key="ipdms.dimensoes.nivel.criar" /></a></div>
	</td>
    <td style="width:10%; text-align:right; padding-right:5px;">
		<img src="${pageContext.request.contextPath}/images/icon/icon-print.png" onclick="imprimirDim(event,'${dimensoes}', '<fmt:message key="ipdms.dimensoes.imprimir.msg"/> ',decisaoprint);" class="cursorMao" alt="<fmt:message key='ipdms.dimensoes.imprimirficha'/>" title="<fmt:message key='ipdms.dimensoes.imprimirficha'/>" />
	</td>
 	<td style="width:13%; text-align:left;">
		<div class="texto"><a href="#" onclick="imprimirDim(event,'${dimensoes}', '<fmt:message key="ipdms.dimensoes.imprimir.msg"/> ',decisaoprint);" title="<fmt:message key='ipdms.dimensoes.imprimirficha'/>" alt="<fmt:message key='ipdms.dimensoes.imprimirficha'/>"><fmt:message key="ipdms.dimensoes.imprimirficha"/></a></div>
	</td>
</table>

<div id="novoNivel" style="display:none;">
		<jsp:include page="criarniveisdimensionais.jsp" />
</div>
<div style="clear:both"></div>
<div id="arvoreNiveis">
	<jsp:include page="niveisdimensionaistree.jsp" />		
</div>