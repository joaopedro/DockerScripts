<%@ taglib uri="http://ajaxtags.org/tags/ajax" prefix="ajax" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="/WEB-INF/ipdms-versionable.tld" prefix="ipdms"%>

<fmt:message key="ipdms.forms.tipoprocesso" var="tipoprocesso" />
<fmt:message key="ipdms.forms.numeroprocesso" var="numeroprocesso" />
<fmt:message key="ipdms.forms.nomeentidade" var="nomeentidade" />
<fmt:message key="ipdms.pesquisa.results.dataEntrada" var="dataEntrada" />
<fmt:message key="ipdms.pesquisa.results.assunto" var="assunto" />
<fmt:message key="ipdms.listetapas.motivo" var="motivo" />
<fmt:message key="ipdms.menucontexto.reabrir" var="reabrir" />

<%--populate the variants list with the variants 
	and the action
--%>
<c:set var="variantes" value="${variantes_suspensas}" />
<c:set var="accao" value="listaprocessosreabrirajax.do2" />
<c:if test="${tipoSuspensao == 'aguardar'}">
	<c:set var="variantes" value="${variantes_pendentes}" />
	<c:set var="accao" value="listaprocessospendentesajax.do2" />	
</c:if>


<%-- form para a pesquisa de processos suspensos --%>
<html:form action="/${accao}" method="post"> 

	<div class="row formlabel_sf">
	 	<div class="leftTab label" style="width: 8%;" title="${tipoprocesso}">${tipoprocesso}</div>	  	
	  	<div class="label" style="width: 15%;" title="${tipoprocesso}">
			<div id="listaprocessos">				
				<html:select property="params(tipoProcesso)" onchange="" style="width: 94%;">
					<option value="" />
					<html:options collection="variantes" property="numeroConteudo" labelProperty="descricao" />
				</html:select>				
			</div>	
	  	</div>
		 	
		<div class="leftTab label" style="width: 8%; " title="${numeroprocesso}">${numeroprocesso}</div>	  	
	  	<div class="label" style="width: 10%;" title="${numeroprocesso}">
	  		<html:text styleClass="textinput" property="params(numProcesso)"  maxlength="20" style="width: 90%;"/>	
	  	</div>  	
		  	  		
		<div class="leftTab label" style="width: 50%;" title="<fmt:message key='ipdms.forms.tipoprocura'/>">
	  		<fmt:message key="ipdms.forms.tipoprocura"/><html:checkbox styleClass="checkinput" property="params(tipoProc)" value="true"/>			
	  	</div>
		<div style="clear:both"></div>
	</div>
	
	<div class="row formlabel_sf" >	
	  	<div class="leftTab label" style="width: 8%;" title="${nomeentidade}">${nomeentidade}</div>
		<div class="label" style="width: 15%;" title="${nomeentidade}">
			<html:text styleClass="textinput" property="params(entidadeNome)" maxlength="20" style="width: 90%;"/>
		</div>
		
	  	<div class="leftTab label" style="width: 8%;" title="<fmt:message key='ipdms.forms.nifentidade'/>"><fmt:message key="ipdms.forms.nifentidade"/></div>
		<div class="label" style="width: 10%;" title="<fmt:message key='ipdms.forms.nifentidade'/>">
			<html:text styleClass="textinput" property="params(entidadeNif)" maxlength="20" style="width: 90%;"/>
		</div>
		<div style="clear:both"></div>
	</div>
	
	<div class="buttonRow">
		<input type="button" onclick="loadListprocessWithEvent('processos',event);" class="btForm" value="<fmt:message key="ipdms.forms.submit"/>" title="<fmt:message key='ipdms.forms.submit.title'/>">		
	</div>

</html:form>


<br/>
<ajax:displayTag id="listProcessesDisplayTag" baseUrl="${pageContext.request.contextPath}/${accao}" >
		
	<display:table id="process" name="paginatedList" htmlId="worklist" requestURI="">			
		
		<display:column title="${numeroprocesso}" style="white-space:nowrap;vertical-align: middle" sortable="true">
			<span style="display:none">nid=<bean:write name="process" property="id"/></span>				
				${process.idProcessoEntidade} 				
		</display:column>				
												
		<display:column title="${tipoprocesso}" sortable="true">
			${process.variante.titulo}				
		</display:column>						
		
		<display:column title="${dataEntrada}" sortable="true">
			<c:if test="${not empty process.dataPreenchimento}">
				<fmt:formatDate value="${process.dataPreenchimento.time}" pattern="dd-MM-yyyy HH:mm"/>
			</c:if>
		</display:column>
				
		<display:column title="${nomeentidade}">	
			<ipdms:set-latest-variante var="variante" numeroConteudo="${process.variante.numeroConteudo}"/>	
			<c:set var="done" value="false" />
			<c:set var="soEntidadeNome" value="" />
			<c:forEach var="soEntidade" items="${process.entidades}">
				<c:if test="${soEntidade.id.role.sigla==variante.processo.rolePrincipal.sigla && !done}">
					<c:set var="soEntidadeNome" value="${soEntidade.id.entidade.nome}" />
					<c:set var="done" value="true" />
				</c:if>
			</c:forEach>
			${soEntidadeNome}
		</display:column>
		
		<display:column title="${assunto}">
			<c:choose>
				<c:when test="${fn:length(process.assunto)<=255}">
					${process.assunto}
				</c:when>
				<c:otherwise>
					${fn:substring(process.assunto,0,244)}...
				</c:otherwise>
			</c:choose>				
		</display:column>
				
		<display:column title="${motivo}" sortable="true">
			<c:forEach var="solog" items="${process.etapasAbertas}">			
				${solog.comentario}
			</c:forEach>											
		</display:column>
				
		<display:column title="${reabrir}" sortable="true">
			 <a href="${pageContext.request.contextPath}/reabrirprocesso.do2?workflowId=${process.workflowId}&tipoSuspensao=${tipoSuspensao}">
			 	<img src="${pageContext.request.contextPath}/images/icon/icon-docVisto.png" 
					alt="${reabrir}" 
					title="${reabrir}" 
					class="cursorMao" />
			</a>							  
		</display:column>
		
	</display:table>		
		
</ajax:displayTag>
 