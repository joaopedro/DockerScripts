<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<c:set var="bundleName"><tiles:getAsString name="bundlename"/></c:set>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.forms.editar" var="editar"/>
<fmt:message key="ipdms.${bundleName}.designacaosingular" var="designacaosingular"/>

<script type="text/javascript">	
	document.title = '${productName} - ${editar} ${designacaosingular}';	 
</script>
<div id="ver_ajuda" class="info" style="padding-top:0px; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${editar} ${designacaosingular}</td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('s');" class="cursorMao" alt="<fmt:message key='ipdms.forms.ajuda'/>" title="<fmt:message key='ipdms.forms.ajuda'/>" /></td>
		  </tr>
		</tbody>
	</table>					
</div>
<div id="ajuda" class="info" style="padding-top:0px; display: none; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${editar} ${designacaosingular}</td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('n');" class="cursorMao" alt="<fmt:message key='ipdms.forms.ocultarAjuda'/>" title="<fmt:message key='ipdms.forms.ocultarAjuda'/>" /></td>
		  </tr>
		</tbody>
	</table>			
	<fmt:message key="ipdms.${bundleName}.help"/>
</div>

<div id="MensagemErro">
	<html:errors/>
</div>

<tiles:insert attribute="edit-form" flush="true"/>