<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.forms.ajuda" var="ajuda" />
<fmt:message key="ipdms.forms.ocultarAjuda" var="ocultarAjuda" />
<fmt:message key="ipdms.forms.editar" var="editar" />


<script type="text/javascript">	
	document.title = '${productName} - Editar <fmt:message key="ipdms.modules.entidaderelationrole.designacaosingular" />';	 
</script>
<div id="ver_ajuda" class="info" style="padding-top:0px; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${editar} <fmt:message key="ipdms.modules.entidaderelationrole.designacaosingular" /></td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('s');" class="cursorMao" alt="${ajuda}" title="${ajuda}" /></td>
		  </tr>
		</tbody>
	</table>					
</div>
<div id="ajuda" class="info" style="padding-top:0px; display: none; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${editar} <fmt:message key="ipdms.modules.entidaderelationrole.designacaosingular" /></td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('n');" class="cursorMao" alt="${ocultarAjuda}" title="${ocultarAjuda}" /></td>
		  </tr>
		</tbody>
	</table>			
	<fmt:message key="ipdms.modules.entidaderelationrole.help" />
</div>

<div id="MensagemErro">
	<html:errors/>
</div>

<html:form action="/module/entidaderole/saveRole" method="post" styleClass="form">

<html:hidden property="role.id"/>

<div class="row" style="padding-bottom:20px;">
	<div class="leftTab label" style="width: 90%; " title="<fmt:message key='ipdms.obrigatorio'  />">
  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio"  /></span>
  	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.modules.entidaderelationrole.descricao' />">
  		<fmt:message key="ipdms.modules.entidaderelationrole.descricao" />
  	</div>
  	
  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.modules.entidaderelationrole.descricao' />">
  		<html:text property="role.descricao" size="80" maxlength="200"/>
  	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.modules.entidaderelationrole.sigla' />">
  		<fmt:message key="ipdms.modules.entidaderelationrole.sigla" /> *
  	</div>
  	
  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.modules.entidaderelationrole.sigla' />">
  		<html:text property="role.sigla" size="20" maxlength="20"/>
  	</div>
</div>
<br />
<div class="buttonRow">
	<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.anterior" />" title="<fmt:message key='ipdms.forms.anterior.title' />"
		onclick="setActionAndSubmit(this.form, 'listRoles.do2');">
	<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.submit" />" title="<fmt:message key='ipdms.forms.submit' />">
</div>

</html:form>