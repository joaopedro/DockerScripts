<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.forms.ajuda" var="ajuda" />
<fmt:message key="ipdms.forms.ocultarAjuda" var="ocultarAjuda" />
<fmt:message key="ipdms.accao.emitirdocumento.preencherModelo.help" var="preencherModeloHelp" />
<fmt:message key="ipdms.accao.emitirdocumento.criarNovo.help" var="criarNovoHelp" />
<fmt:message key="ipdms.accao.emitirdocumento.consultarModelo.help" var="consultarModeloHelp" />
<fmt:message key="ipdms.accao.emitirdocumento.importarModelo.help" var="importarModeloHelp" />
<fmt:message key="ipdms.accao.emitirdocumento.importarModelo.help.pt2" var="importarModeloHelpPt2" />
<fmt:message key="ipdms.accao.emitirdocumento.confirmar.help" var="confirmarHelp" />
<fmt:message key="ipdms.accao.emitirdocumento.modeloDe" var="modeloDe" />
<fmt:message key="ipdms.accao.emitirdocumento.criarNovo" var="criarNovo" />
<fmt:message key="ipdms.accao.emitirdocumento.consultarDocumento" var="consultarDocumento" />
<fmt:message key="ipdms.accao.emitirdocumento.importarDocumento" var="importarDocumento" />

<html:form action="/accao/gravardocemitido" method="post" enctype="multipart/form-data">
<nested:root name="emitirDocumentoForm">
<nested:hidden property="numero"/>
<nested:hidden property="numeroItem"/>
<input type="hidden" name="etapa" value="<%= request.getParameter("etapa") %>"/>
<input type="hidden" name="urlAnterior" value="<bean:write name="urlAnterior" />"/>

<script type="text/javascript">	
	document.title = '${productName} - <nested:write property="titulo"/>';	 
</script>

<div id="ver_ajuda" class="row" style="padding-top:0px; text-align:left; ">
   <table style="border:none" cellpadding="0" cellspacing="0" class="headings">
	<tbody>
	  <tr>
	    <td class="titulo1"><nested:write property="titulo"/></td>
	    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('s');" class="cursorMao" alt="${ajuda}" title="${ajuda}" /></td>
	  </tr>
	</tbody>
   </table>					
</div>
<div id="ajuda" class="info" style="padding-top:0px; display: none; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1"><nested:write property="titulo"/></td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('n');" class="cursorMao" alt="${ocultarAjuda}" title="${ocultarAjuda}" /></td>
		  </tr>
		</tbody>
	</table>	
	<ul>
		<c:if test="${emitirDocumentoForm.template != null}">
			<li> ${preencherModeloHelp} <nested:write property="tipodocumento"/>, ${criarNovoHelp}</li>
		</c:if>
		<c:if test="${emitirDocumentoForm.documento != ''}">
			<li> ${consultarModeloHelp}</li>
		</c:if>
		<li> ${importarModeloHelp}
			<nested:notEqual property="documento" value="">${importarModeloHelpPt2}</nested:notEqual>
		</li>
		<li> ${confirmarHelp} </li>
	</ul>				
</div>

<div id="MensagemErro">
	<html:errors/>
</div>

<br />

<table class="formtable" width="100%">

	<tr class="listHeader">
		<th colspan="2" class="formlabel">${modeloDe} <nested:write property="tipodocumento"/></th>
	</tr>

	<c:if test="${params.modelo != null || emitirDocumentoForm.template != null}">
		<nested:equal property="documento" value="">
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td class="formlabel"> » </td>
			<td class="formfield"><a href="${pageContext.request.contextPath}<nested:write property="template"/>" title="${criarNovo}">${criarNovo}</a></td>
		</tr>
		</nested:equal>
	</c:if>

	<nested:notEqual property="documento" value="">
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="formlabel"> » </td>
		<td class="formfield"><a href="${pageContext.request.contextPath}/accao/editarDocumento.do2?doc=<nested:write property="documentoRelativo"/>&<nested:write property="params"/>" title="${consultarDocumento}">${consultarDocumento}</a></td>
	</tr>
	</nested:notEqual>

	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="formlabel"> » </td>
		<td class="formfield">${importarDocumento}<nested:file property="upload.formFile"/></td>
	</tr>

	<tr><td>&nbsp;</td></tr>
	<tr>
		<td style="text-align:center;" colspan="2">
			<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.anterior" />" title="<fmt:message key='ipdms.forms.anterior.title' />"
				onclick="this.form.action='${pageContext.request.contextPath}' + this.form.urlAnterior.value; this.form.enctype=''; this.form.submit();">
			<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.submit" />" title="<fmt:message key='ipdms.forms.submit.title' />">
		</td>
	</tr>
</table>

</nested:root>
</html:form>