<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<fmt:message key="ipdms.notification.pesqisa.tipoProcesso.titulo" var="titulo" />
<fmt:message key="ipdms.myprocesses.estado" var="estado" />
<fmt:message key="ipdms.myprocesses.prazoUltrapassado" var="prazoUltrapassado" />
<fmt:message key="ipdms.myprocesses.prazoAproximacao" var="prazoAproximacao" />
<fmt:message key="ipdms.myprocesses.prazoDentro" var="prazoDentro" />
<fmt:message key="ipdms.processo.designacaosingular" var="processoDesignacaosingular" />
<fmt:message key="ipdms.variante.designacaosingular" var="varianteDesignacaosingular" />
<fmt:message key="ipdms.pesquisa.results.dataEntrada" var="dataEntrada" />
<fmt:message key="ipdms.processo.pai" var="processoPai" />
<fmt:message key="ipdms.pesquisa.results.numDoc" var="numDoc" />
<fmt:message key="ipdms.pesquisa.results.etapaActual" var="etapaActual" />
<fmt:message key="ipdms.myprocesses.assignado" var="assignado" />
<fmt:message key="ipdms.colaborador.designacaosingular" var="designacaosingular" />
<fmt:message key="ipdms.notification.pesqisa.tipoProcesso.tramitar.empty" var="tramitarEmpty" />
<fmt:message key="ipdms.forms.anterior" var="anterior" />
<fmt:message key="ipdms.forms.anterior.title" var="anteriorTitle" />

<script type="text/javascript">
	var referer = '<%= org.apache.struts.util.RequestUtils.encodeURL(request.getContextPath() + "/worklist.do2?" + request.getQueryString()) %>';

	var rules = {
		'#worklist tbody tr': function(el) {
			el.onmouseover = function(){
				Element.addClassName(this,'active-row')				
			};
			el.onclick = function(event){
				var queryString = '';
				var spanElement = this.select('span');
				if(spanElement.first()) {
					queryString += spanElement.first().innerHTML.split(',').join('&');
				}
				queryString += "&referer=" + referer;
				window.location.href= 'notification.do2?' + queryString;
			};
			el.onmouseout = function() {
				Element.removeClassName(this, 'active-row');
			};
		}
	};
	Behaviour.register(rules);
</script>

<c:set var="IMG_DIR" value="${pageContext.request.contextPath}/images" />

<div class="row" style="text-align:left; padding-top:0px; ">

	<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${titulo}: ${processo.titulo}</td>
		  </tr>
		</tbody>
	</table>					
</div>
<html:errors />
<bean:size id="numberOfItens" name="worklist"/>
<logic:greaterThan name="numberOfItens" value="0">
	<display:table id="notification" name="worklist" htmlId="worklist" pagesize="20" style="cursor: pointer;">
		<logic:present name="notification">
			<bean:define id="servicoOnline" name="notification" property="process.servicoOnline" />
			<display:column title="${estado}" style="vertical-align: middle;text-align: center">
				<logic:equal name="notification" property="outOfDate" value="true">
	  				<img src='${IMG_DIR}/icon/reprovado-01.png' alt="${prazoUltrapassado}" title="${estado}: ${prazoUltrapassado}" />
				</logic:equal>
				<logic:notEqual name="notification" property="outOfDate" value="true">
					<logic:equal name="notification" property="inAlert" value="true">
						<img src='${IMG_DIR}/icon/aguardar-01.png' alt="${prazoAproximacao}" title="${estado}: ${prazoAproximacao}" />							
					</logic:equal>
					<logic:notEqual name="notification" property="inAlert" value="true">
						<img src='${IMG_DIR}/icon/aprovado-01.png' alt="${prazoDentro}" title="${estado}: ${prazoDentro}" />							
					</logic:notEqual>
				</logic:notEqual>
			</display:column>
			<display:column title="${processoDesignacaosingular}" style="white-space:nowrap;vertical-align: middle;" sortable="true">
	 			<span style="display:none">nid=<bean:write name="notification" property="id"/></span>
				<logic:present name="servicoOnline" property="idProcessoEntidade">
					${servicoOnline.idProcessoEntidade} :: 
				</logic:present>
				<logic:present name="servicoOnline" property="variante">
					${servicoOnline.variante.processo.titulo}
				</logic:present>
			</display:column>
			<display:column title="${varianteDesignacaosingular}" sortable="true">
				<logic:present name="servicoOnline" property="variante">
					${servicoOnline.variante.titulo}
				</logic:present>
			</display:column>
			<display:column title="${dataEntrada}" sortable="true">
				<c:if test="${not empty servicoOnline.dataPreenchimento}">
					<fmt:formatDate value="${servicoOnline.dataPreenchimento.time}" pattern="dd-MM-yyyy HH:mm"/>
				</c:if>
			</display:column>
			<display:column title="${servicoOnline.dynamicDescriptionColumnName}" sortable="true">
				${servicoOnline.dynamicDescription}
			</display:column>					
			<display:column title="${processoPai}" sortable="true">
				<logic:present name="servicoOnline" property="processoPai">
					${servicoOnline.processoPai.idProcessoEntidade}
				</logic:present>
			</display:column>
			<display:column title="${numDoc}" sortable="true">
				${servicoOnline.numeroDocumento}
			</display:column>
			<display:column title="${etapaActual}" sortable="true">
				${servicoOnline.nomeEtapaActual}
			</display:column>
			<display:column title="${assignado}" sortable="true" style="vertical-align: middle;text-align: left;">
				<logic:iterate id="assignee" name="notification" property="assignees" >
					<logic:iterate id="assigneeKey" name="worklistkey" indexId="assigneeKeyIndex">
						<c:if test="${assignee == assigneeKey}">
							<img src='${IMG_DIR}/icon/worklist/colab${assigneeKeyIndex mod 12}.png' alt="${assignee.titulo}" title="${assignee.titulo}" />
						</c:if>
					</logic:iterate>
				</logic:iterate>
			</display:column>
		</logic:present>
	</display:table>
	
	<logic:iterate id="assigneeKey" name="worklistkey" indexId="assigneeKeyIndex">
		<div class="formlabel">
			<img src='${IMG_DIR}/icon/worklist/colab${assigneeKeyIndex mod 12}.png' alt="${assignado}: ${designacaosingular}" title="${assignado}: ${designacaosingular}" />
			<bean:write name="assigneeKey" property="titulo"  />
		</div>
	</logic:iterate>
	
</logic:greaterThan>
<!-- logic:equal name="numberOfItens" value="0" -->
	<div class="row">
		<div class="leftTab label" style="width: 90%; " title="Nome">
	  		${tramitarEmpty} ${processo.titulo}
	  	</div>
	</div>
<!-- /logic:equal -->

<br />

<form name="anterior" action="notifsprocesso.do2" method="post">
	<div class="buttonRow">
		<INPUT type="submit" title="${anteriorTitle}" value="${anterior}" class="btForm">
	</div>
</form>
