<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.relatorio.analisarDadosSistema" var="analisarDadosSistema" />
<fmt:message key="ipdms.forms.ajuda" var="ajuda" />
<fmt:message key="ipdms.forms.ocultarAjuda" var="ocultarAjuda" />
<fmt:message key="ipdms.relatorio.executar.help" var="help" />
<fmt:message key="ipdms.relatorio.designacaoplural" var="relatorioDesignacaoplural" />

<div id="ver_ajuda" class="row" style="padding-top:0px; text-align:left; ">
   <table style="border:none" cellpadding="0" cellspacing="0" class="headings">
	<tbody>
	  <tr>
	    <td class="titulo1">${analisarDadosSistema}</td>
	    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('s');" class="cursorMao" alt="${ajuda}" title="${ajuda}" /></td>
	  </tr>
	</tbody>
   </table>					
</div>
<div id="ajuda" class="info" style="padding-top:0px; display: none; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${analisarDadosSistema}</td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('n');" class="cursorMao" alt="${ocultarAjuda}" title="${ocultarAjuda}" /></td>
		  </tr>
		</tbody>
	</table>	
	${help}				
</div>

<div id="MensagemErro">
	<html:errors/>
</div>

<br />

<table style="border:1" cellpadding="0" cellspacing="0" class="centro" summary="Lista de Relatórios">	
  <tr>
  	<th class="centro">${relatorioDesignacaoplural}</th>
  </tr>	  
<logic:iterate name="relatorios" id="relatorio">
<nested:root name="relatorio">
	<tr class="centro">
	  	<td class="centro">	  	
	  		<c:set var="tituloRelatorio"><nested:write property="titulo" /></c:set>
	  		<nested:link action="/formularioanalise" paramId="numero" paramProperty="id" title="${tituloRelatorio}">
	  			${tituloRelatorio}
	  		</nested:link>
	  	</td>
	</tr>
</nested:root>
</logic:iterate>	
</table>
