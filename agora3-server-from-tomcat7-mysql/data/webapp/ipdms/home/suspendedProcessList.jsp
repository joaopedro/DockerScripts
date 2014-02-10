<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.processos.draft.tipo" var="titulo" />
<fmt:message key="ipdms.variante.designacaosingular" var="variante" />
<fmt:message key="ipdms.pesquisa.results.dataEntrada" var="dataEntrada" />

<fmt:message key="ipdms.forms.anterior" var="anterior" />
<fmt:message key="ipdms.forms.anterior.title" var="anteriorTitle" />
<fmt:message key="ipdms.notification.header.assunto" var="assuntocoltitle"/>

<script type="text/javascript">

	var referer = '<%= org.apache.struts.util.RequestUtils.encodeURL("/suspworklist.do2?" + request.getQueryString()) %>';
	var rules = {
		'#worklist tbody tr': function(el) {
			el.onmouseover = function(){
				Element.addClassName(this,'active-row')				
			};
			el.onmouseout = function() {
				Element.removeClassName(this, 'active-row');
			};
			el.onclick = function(event){
				var queryString = '&referer=' + referer + '&';
				var spanElement = this.select('span');
				if(spanElement.first()) {
					queryString += spanElement.first().innerHTML.split(',').join('&');
				}
				window.location.href= 'suspworklist.do2?method=redirectEditProcess&' + queryString;
			};
		}
	};
	Behaviour.register(rules);
</script>
<script type="text/javascript">	
	document.title = '${productName} - ${titulo}: ${tipoConteudo}';	 
</script>
<div class="row" style="padding-top:0px; width:100%; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${titulo}: ${tipoConteudo}</td>
		  </tr>
		</tbody>
	</table>					
</div>

<html:errors />
	<bean:size id="numberOfItens" name="worklist"/>
	<logic:greaterThan name="numberOfItens" value="0">
		<display:table id="process" name="worklist" htmlId="worklist" pagesize="20" style="cursor: pointer">		
			<display:column title="${variante}" sortable="true">
				<span style="display:none;">numero=${process.contentInterface.servicoonline.numeroConteudo}</span>
				${process.contentInterface.servicoonline.variante.titulo}
			</display:column>
			<display:column title="${dataEntrada}" sortable="true">
				<c:if test="${not empty process.contentInterface.servicoonline.dataEmissao}">
					<fmt:formatDate value="${process.contentInterface.servicoonline.dataEmissao}" pattern="dd-MM-yyyy HH:mm"/>
				</c:if>
			</display:column>
			<display:column title="${assuntocoltitle}" sortable="true">
				${process.contentInterface.servicoonline.assunto}
			</display:column>						
		</display:table>
	</logic:greaterThan>
	<logic:equal name="numberOfItens" value="0">
	<div class="row">
		<div class="leftTab label" style="width: 90%; " >
	  		<fmt:message key="ipdms.processos.draft.tipo.empty" /> ${tipoConteudo}.
	  	</div>
	</div>
	</logic:equal>
	<br />
	
	<form name="anterior" action="processossuspensos.do2" method="post">
	<input type="submit" value="${anterior}" class="btForm" title="${anteriorTitle}" />
	</form>