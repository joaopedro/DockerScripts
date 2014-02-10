<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://ajaxtags.org/tags/ajax" prefix="ajax" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.atencaoMsg" var="atencaoMsg" bundle="${ecmBundle}" />
<fmt:message key="ipdms.emptyRecords" var="emptyRecords" bundle="${ecmBundle}" />
<fmt:message key="ecm.conteudos.descricao" var="descricao" bundle="${ecmBundle}" />
<fmt:message key="ecm.conteudos.campos" var="campos" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.pesquisar" var="pesquisar" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.anterior" var="anterior" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.anterior.title" var="anteriorTitle" bundle="${ecmBundle}" />

<c:choose>
	<c:when test="${paginatedList.fullListSize == 0}">
		<br/>
		<div class="row formlabel_sf" >
			<div class="mensagenCaixa">
				<div style="float:left; width:3%;">
					<img src="${pageContext.request.contextPath}/images/icon/icon-informacao.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;"  alt="${atencaoMsg}" title="${atencaoMsg}"/>
				</div>
				<div style="float:right; width:93%; vertical-align:middle; margin-top:4px; ">
					<div class="info">${emptyRecords}</div>
				</div>
				<div style="clear:both"></div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<ajax:displayTag id="displayTagFrameTemplateConteudo" ajaxFlag="true" baseUrl="${pageContext.request.contextPath}/ecm/listTemplateConteudos.do2">
			<display:table style="cursor: pointer;" id="templateConteudo" name="${paginatedList}" htmlId="worklist" requestURI="">
				<display:column title="${descricao}" property="descricaoTemplateConteudo" class="realce" sortable="true" />				
				<display:column title="${campos}" style="width:6%; text-align:center;">
					<a href="javascript:templateConteudosDetail('templateConteudoDetail_${templateConteudo_rowNum}');">
						<img src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" class="cursorMao" alt="${pesquisar} ${campos}" title="${pesquisar} ${campos}" style="border:none" />
					</a>
					<%@ include file="templateConteudoDetail.jsp" %>					
				</display:column>
			</display:table>			
		</ajax:displayTag>		
	</c:otherwise>
</c:choose>

<form action="${pageContext.request.contextPath}/ecm/templateEstruturas.do2">
	<input type="submit" class="btForm" value="${anterior}" title="${anteriorTitle}" />
</form>