<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://ajaxtags.org/tags/ajax" prefix="ajax" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<fmt:message key="ipdms.funcao.titulo" var="titulo" />
<fmt:message key="ipdms.grupo.login" var="login" />
<fmt:message key="ipdms.organica.designacaosingular" var="organica" />
<fmt:message key="ipdms.tramitacao.assignar" var="assignar" />
<fmt:message key="ipdms.tramitacao.distribuicao.darconhecimento" var="dconhecimento" />


<div id="lista" class="label" style="width: 70%; margin-top: 20px; margin-bottom: 15px;">
	<ajax:displayTag id="colaboradoresDisplayTag" baseUrl="${pageContext.request.contextPath}/ajaxListColaboradoresDynamic.do2">
		<display:table id="colaborador" name="${paginatedList}" htmlId="worklist" requestURI="">
			<display:column title="${titulo}" property="titulo"></display:column>
			<display:column title="${login}" property="login"></display:column>			
			<display:column title="${organica}" property="organicaPrincipal.designacao"></display:column>		
			<c:if test="${sign}">
			    <display:column title="${assignar}" style="text-align:center;">
				    <input type="checkbox" value="checked" id="rowSelected_${colaborador.numeroConteudo}" name="rowSelected_${colaborador.numeroConteudo}" onclick="addToAssigList(this,'${colaborador.titulo}');"/>
			    </display:column>
			</c:if>
            <c:if test="${darConhecimento}">
                <display:column title="${dconhecimento}" style="text-align:center;">
                    <input type="checkbox" value="checked" id="rowSelecteddarconhec_${colaborador.numeroConteudo}" name="rowSelecteddarconhec_${colaborador.numeroConteudo}" onclick="addToDarConhecimentoList(this,'${colaborador.titulo}');"/>
                </display:column>
			</c:if>
		</display:table>	
	</ajax:displayTag>									
</div>