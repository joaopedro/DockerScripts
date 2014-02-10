<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.etapa.etapasPara" var="etapasPara" />
<fmt:message key="ipdms.etapa.designacaosingular" var="designacaosingular" />
<fmt:message key="ipdms.instrucao.pedido.info.title" var="atencao" />
<fmt:message key="ipdms.etapa.tramitacao.notAllowed" var="tramitacaoNotAllowed" />

<script type="text/javascript">	
	document.title = '${productName} - ${etapasPara} <bean:write name="processo" property="titulo" />';	 
</script>

<div class="row" style="padding-top:0px; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${etapasPara} <bean:write name="processo" property="titulo" /></td>
		  </tr>
		</tbody>
	</table>					
</div>
	
	
	<br />

	<logic:empty name="processo" property="allowedEtapas">
		<div class="row formlabel_sf" ><div class="mensagenCaixa"><div style="float:left; width:3%;"><img src="images/icon/icon-informacao.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;"  alt="${atencao}" title="${atencao}"/></div><div style="float:right; width:93%; vertical-align:middle; margin-top:4px; "><div class="info">${tramitacaoNotAllowed} <bean:write name="processo" property="titulo" />.</div></div><div style="clear:both"></div></div></div>
	</logic:empty>
	<logic:notEmpty name="processo" property="allowedEtapas">	
	<table cellpadding="0" cellspacing="0" class="centro">
    <tr>
      	<th style="width:3%" class="centro">&nbsp;</th>
      	<th style="width:94%" class="centro">${designacaosingular}</th>
    </tr>
    	<tbody>
		    <bean:parameter id="tipo" name="tipo" />
			<logic:iterate id="etapa" name="processo" property="allowedEtapas" indexId="counter" >
		    <tr>
		      <td class="centro">${counter + 1}</td>
		      <td class="centro">
		    	<c:url var="link" value="worklist.do2">
					<c:param name="method" value="search" />
					<c:param name="processType"><bean:write name="processo" property="workflowType"/></c:param>
					<c:param name="parentActivity"><bean:write name="processo" property="workflowProcess"/></c:param>
					<c:param name="tipo"><bean:write name="tipo"/></c:param>
					<c:param name="etapaId"><bean:write name="etapa" property="numeroConteudo"/></c:param>					
				</c:url>		
				<c:set var="tituloEtapa"><bean:write name="etapa" property="titulo" /></c:set>		
				<a href="${link}" title="${tituloEtapa}">${tituloEtapa}</a>
		      </td>
		    </tr>
		    </logic:iterate>
   		</tbody>
	</table>	
	</logic:notEmpty>