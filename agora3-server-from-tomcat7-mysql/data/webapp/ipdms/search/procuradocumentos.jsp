<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page import="com.sinfic.ipdms.comum.wrapper.documento.TipoDocumento"%>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key='ipdms.pesquisa.documentos.title' var="title"/>
<fmt:message key='ipdms.pesquisa.documentos.list.emptyMsg' var="emptyMsg" />
<fmt:message key='ipdms.pesquisa.documentos.list.numProcesso' var="numProcesso" />
<fmt:message key='ipdms.pesquisa.documentos.list.numDocumento' var="numDocumento" />
<fmt:message key='ipdms.pesquisa.documentos.list.NUE' var="NUE" />
<fmt:message key='ipdms.pesquisa.documentos.list.NUS' var="NUS" />
<fmt:message key='ipdms.pesquisa.documentos.list.dataRegisto' var="dataRegisto" />
<fmt:message key='ipdms.pesquisa.documentos.list.descricao' var="descricao" />
<fmt:message key='ipdms.pesquisa.documentos.list.autor' var="autor" />
<fmt:message key='ipdms.pesquisa.documentos.list.tipo' var="tipo" />
<fmt:message key='ipdms.pesquisa.documentos.list.consultarDoc' var="consultarDoc" />


<script type="text/javascript">	
	document.title = '${productName} - ${title}';	 
</script>

<bean:define id="mapping" name="<%= org.apache.struts.Globals.MAPPING_KEY %>" />
<bean:define id="referer"><bean:write name="mapping" property="path" />.do2?<c:if test="${param.hist}">hist=true&</c:if>${urlAnterior}</bean:define>

<%-- TITULO --%>
<table style="border:none" cellpadding="0" cellspacing="0" class="headings" >
	<tr>
		<td class="titulo1">${title}</td>
	</tr>
</table>

<%-- FORM PESQUISA --%>
<jsp:include page="procuradocumentosform.jsp" />

<%-- LISTAGEM --%>

<%-- 
	NOTA: o original mapping desta pagina esta a ser guardado pois no caso de o pesquisa form adicionado
	ser o da pesquica avançada, o original mapping é sobreposto por um valor incorrecto. Isto acontece
	pois o jsp do form da pesquisa avançada invoca uma chamada ao controlador de stusts (para obter a lista
	de etapas dinamimacamente) e o valor do original mapping é sobreposto pelo valor do selectatapas
--%>
<c:set var="originalMapping" value="${requestScope['org.apache.struts.action.mapping.instance'].path}"></c:set>

<c:choose>
	<c:when test="${empty paginatedList}">
		<bean:parameter id="pageParam" name="page" value="-1" />
		<div class="row formlabel_sf" >
			<div class="leftTabButton label" style="width: 80%;" title="">
				<logic:greaterThan name="pageParam" value="0">${emptyMsg}</logic:greaterThan>
			</div>
			<div style="clear:both"></div>
		</div>
	</c:when>
	<c:otherwise>
	
		<c:set var="tipoitemvalue"><%= TipoDocumento.INSTRUCAO %></c:set>
		<c:set var="tipoTemplateValue"><%= TipoDocumento.TEMPLATE %></c:set>
		<c:set var="tipoAssociadoInstrucaoValue"><%= TipoDocumento.ASSOCIADO %></c:set>
	
		<display:table style="cursor: pointer;" class="blabla" id="documentoWrapper" name="${paginatedList}" htmlId="worklist" 
						pagesize="20" requestURI="${originalMapping}.do2">
			<%-- E' colocado o request URI fixo pela razao descrita acima. Ver comentario. --%>
			<c:set var="documento" value="${documentoWrapper.doc}" />
			<display:column title="${numProcesso}" class="realce" sortable="true">
				<a href="${pageContext.request.contextPath}/displayconteudo.do2?numero=${documento.servicoOnline.numeroConteudo}&urlAnterior=${referer}">
					${documento.servicoOnline.idProcessoEntidade}
				</a>				
			</display:column>
			<display:column title="${numDocumento}" class="realce" sortable="true" sortProperty="numeroDocumento">
				${documento.numeroDocumento}				
			</display:column>
			<display:column title="${NUE}" class="realce" value="${documento.numeroUnicoEntrada}" />
			<display:column title="${NUS}" class="realce" value="${documento.numeroUnicoSaida}" />
			<display:column title="${dataRegisto}" class="realce" sortable="true" sortProperty="dataEmissao">	
				<fmt:formatDate type="both" value="${documento.dataEmissao}" pattern="dd-MM-yyyy HH:mm"/>
			</display:column>
			<display:column title="${descricao}" class="realce">
				<c:choose>
					<c:when test="${documento.tipoDocumento.value==tipoTemplateValue}">${documento.documentTemplate.titulo}</c:when>
					<c:when test="${documento.tipoDocumento.value==tipoAssociadoInstrucaoValue}">${documento.tipoDocumentoAnexado.descricao}</c:when>
					<c:otherwise>${documento.designacao}</c:otherwise>
				</c:choose>
			</display:column>
			<display:column title="${autor}" class="realce" value="${documento.creator.titulo}" />
			<display:column title="${tipo}" class="realce" value="${documento.tipoDocumento.name}" />
			<display:column title="${consultarDoc}" class="realce" style="align:center">
				<c:if test="${documentoWrapper.exists}">
					<a href="${pageContext.request.contextPath}/file/getDocumento.do2?nc=${documento.numeroConteudo}" target="_blank" title="${consultarDoc}">
						<img src="${pageContext.request.contextPath}/images/icon/icon-consultarDoc.png" class="cursorMao" alt="${consultarDoc}" title="${consultarDoc}" />
					</a>
				</c:if>
			</display:column>
		</display:table>	
	</c:otherwise>
</c:choose>