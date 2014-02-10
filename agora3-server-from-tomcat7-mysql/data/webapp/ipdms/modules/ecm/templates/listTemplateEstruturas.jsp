<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://ajaxtags.org/tags/ajax" prefix="ajax" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.atencaoMsg" var="atencaoMsg" bundle="${ecmBundle}" />
<fmt:message key="ipdms.emptyRecords" var="emptyRecords" bundle="${ecmBundle}" />
<fmt:message key="ecm.template.descricao" var="descricao" bundle="${ecmBundle}" />
<fmt:message key="ecm.template.proprietario" var="proprietario" bundle="${ecmBundle}" />
<fmt:message key="ecm.template.dataCriacao" var="dataCriacao" bundle="${ecmBundle}" />
<fmt:message key="ecm.conteudos.designacaoplural" var="conteudosDes" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.pesquisar" var="pesquisar" bundle="${ecmBundle}" />
<fmt:message key="ecm.instancia.instanciar" var="instanciar" bundle="${ecmBundle}" />
<fmt:message key="ecm.template.designacaosingular" var="templateDes" bundle="${ecmBundle}" />

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
		<ajax:displayTag id="displayTagFrameTemplateEstrutura" ajaxFlag="true" baseUrl="${pageContext.request.contextPath}/ecm/listTemplateEstruturas.do2">
			<display:table style="cursor: pointer;" id="templateEstrutura" name="${paginatedList}" htmlId="worklist" requestURI="">
				<display:column title="${descricao}" property="descricaoTemplate" class="realce" sortable="true" />
				<display:column title="${proprietario}" property="proprietario" class="realce" sortable="true" />
				<display:column title="${dataCriacao}" property="dataCriacao.time" format="{0,date,dd-MM-yyyy}" class="realce" sortable="true" />				
				<display:column title="${conteudosDes}" style="width:6%; text-align:center;">
					<a href="${pageContext.request.contextPath}/ecm/templateConteudos.do2?codigoTemplateEstrutura=${templateEstrutura.codigoTemplate}">
						<img src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" class="cursorMao" alt="${pesquisar} ${conteudosDes}" title="${pesquisar} ${conteudosDes}" style="border:none" />
					</a>
				</display:column>
				<display:column title="${instanciar}" style="width:6%; text-align:center;">
					<a href="#" onclick="javascript:instantiateTemplate('${templateEstrutura.codigoTemplate}');">
						<img src="${pageContext.request.contextPath}/images/icon/icon-copy.png" class="cursorMao" alt="${instanciar} ${templateDes}" title="${instanciar} ${templateDes}" style="border:none" />						
					</a>
				</display:column>
			</display:table>			
		</ajax:displayTag>
	</c:otherwise>
</c:choose>

<div id="divInstantiateTemplate"></div>