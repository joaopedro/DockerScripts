<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://ajaxtags.org/tags/ajax" prefix="ajax" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.soassociacao.numeroprocesso" var="numeroprocesso" />
<fmt:message key="ipdms.soassociacao.requerente" var="requerente" />
<fmt:message key="ipdms.variante.designacaosingular" var="varianteDes" />
<fmt:message key="ipdms.comunicacaoparecer.etapaProcesso.detalhe.assunto" var="assunto" />
<fmt:message key="ipdms.forms.select" var="select" />

<div style="text-align:center;">

	<ajax:displayTag id="listaProcessosDisplayTag" baseUrl="${pageContext.request.contextPath}/listServicoOnline.do2">
	
		<display:table id="listaProcessos"  name="${paginatedList}" requestURI="" htmlId="worklist">
			
			<c:if test="${empty multiple}">
				<c:set var="onclickfunction" value="affectParent('${listaProcessos.id.numeroConteudo}','${listaProcessos.idProcessoEntidade }');" />
			</c:if>
			
			<display:column title="${numeroprocesso}" sortable="true" sortName="idProcessoEntidade">
				<span style='cursor: hand;text-decoration: underline' onclick="${onclickfunction}">
					${listaProcessos.idProcessoEntidade }
				</span>
			</display:column>
			<display:column title="${requerente}" sortable="true" sortName="titulo">
				<c:forEach items="${listaProcessos.entidades}" var="entidade">
					<c:if test="${entidade.id.role.sigla == 'RQT'}">
						<span style='cursor: hand;text-decoration: underline'  onclick="${onclickfunction}">
							${entidade.id.entidade.nome }
						</span>
					</c:if>
				</c:forEach>			
			</display:column>
			<display:column title="${varianteDes}" sortable="true" sortName="titulo">
				${listaProcessos.variante.titulo}
			</display:column>
			<display:column title="${assunto}" sortable="true">
				${listaProcessos.assunto}
			</display:column>
			<c:if test="${not empty multiple}">
				<display:column title="${select}" sortable="true" sortName="" >
					<td class="formfield">
						<input type="checkbox" id="check_${element.id}" value="${listaProcessos.idProcessoEntidade}" style="border:0;"/>
					</td>
				</display:column>
	  		</c:if>
	  </display:table>
	  
	</ajax:displayTag>
  
</div>

 <div class="buttonRow">
		<input type="button" class="btForm" title="<fmt:message key='ipdms.forms.fechar.title' />" value="<fmt:message key="ipdms.forms.fechar" />" onclick="parent.${param.window }.close();">
		<input type="button" class="btForm" title="<fmt:message key='ipdms.forms.reset.title'/>" value="<fmt:message key="ipdms.forms.reset"/>" onclick="resetCheckboxes(); affectParent('','');" style="border:0;">
		<c:if test="${not empty multiple}">
			<input type="button" class="btForm" title="<fmt:message key='ipdms.forms.select'/>" value="<fmt:message key="ipdms.forms.select"/>" onclick="affectParentMultiple(); parent.${param.window }.close();">
		</c:if>
</div>
