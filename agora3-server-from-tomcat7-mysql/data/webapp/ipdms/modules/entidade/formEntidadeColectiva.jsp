<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>

<nested:root name="entidadeFormBean">
<nested:nest property="colectivo">

<%-- IDENTIFICACAO DO INDIVIDUO --%>
	<div class="row" style="padding-top:0%; text-align:left; ">
		<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
			<tbody>
			  <tr>
			    <td class="titulo2"><fmt:message key="ipdms.modules.entidade.colectivo.identificao" /></td>
			  </tr>
			</tbody>
		</table>					
	</div>

	<div class="row" style="padding-bottom:2%;">
		<div class="leftTab label" style="width: 90%; " title="<fmt:message key='ipdms.obrigatorio' />">
	  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
	  	</div>
	</div>	
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 18%; " title="<fmt:message key="ipdms.modules.entidade.nomealternativo" />">
			<label for="nomeAlternativoLabel"><fmt:message key="ipdms.modules.entidade.nomealternativo" /> *</label>
	  	</div>
	  	
	  	<div class="label" style="width: 79%;" title="<fmt:message key="ipdms.modules.entidade.nomealternativo" />">
	  		<nested:text property="nomeAlternativo" size="60" maxlength="60" styleId="nomeAlternativoLabel"/>	
	  	</div>
	</div>	
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%; " title="<fmt:message key='ipdms.modules.entidade.numeroCRPC' />">
	  		<label for="numeroCRPCLabel"><fmt:message key="ipdms.modules.entidade.numeroCRPC" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 79%;" title="<fmt:message key='ipdms.modules.entidade.numeroCRPC' />">
	  		<nested:text property="numeroCRPC" maxlength="60" size="60" styleId="numeroCRPCLabel"/>
	  	</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%; " title="<fmt:message key='ipdms.modules.entidade.tiposociedade' />">
	  		<label for="tipoSociedadeLabel"><fmt:message key="ipdms.modules.entidade.tiposociedade" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 79%;" title="<fmt:message key='ipdms.modules.entidade.tiposociedade' />">
	  		<nested:select property="siglaTipoSociedade" styleId="tipoSociedadeLabel">
				<html:option value=""><fmt:message key="ipdms.forms.select.default" /></html:option>
				<html:optionsCollection name="tipoSociedadeOptions" label="title" value="value"/>
			</nested:select>
	  	</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%; " title="<fmt:message key='ipdms.modules.entidade.cae' />">
	  		<label for="caeLabel"><fmt:message key="ipdms.modules.entidade.cae" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 79%;" title="<fmt:message key='ipdms.modules.entidade.cae' />">
	  		<nested:text property="cae" maxlength="5" size="5" styleId="caeLabel" />&nbsp;-&nbsp;
			<label for="descricaocaeLabel"><nested:text property="descricaoCae" maxlength="40" size="40" styleId="descricaocaeLabel"/></label>
	  	</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%; " title="<fmt:message key='ipdms.modules.entidade.segmentomercado' />">
	  		<label for="segmentoMercadoLabel"><fmt:message key="ipdms.modules.entidade.segmentomercado" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 79%;" title="<fmt:message key='ipdms.modules.entidade.segmentomercado' />">
	  		<nested:text property="segmentoMercado" maxlength="60" size="60" styleId="segmentoMercadoLabel"/>
	  	</div>
	</div>
	

	<div style="clear:both"><br /></div>

<%-- CONTACTOS --%>
	<div class="row" style="text-align:left;">
		<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
			<tbody>
			  <tr>
			    <td class="titulo2"><fmt:message key="ipdms.modules.entidade.telefonesfax" /></td>
			  </tr>
			</tbody>
		</table>					
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%; " title="<fmt:message key='ipdms.modules.entidade.telefone1' />">
	  		<label for="telefone1Label"><fmt:message key="ipdms.modules.entidade.telefone1" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 20%;" title="<fmt:message key='ipdms.modules.entidade.telefone1' />">
	  		<nested:text property="telefone1" maxlength="20" size="20" onkeypress="return IsNumericKey(event);" styleId="telefone1Label"/>
	  	</div>
	  	
	  	<div class="leftTab label" style="width: 15%; " title="<fmt:message key='ipdms.modules.entidade.telefone2' />">
	  		<label for="telefone2Label"><fmt:message key="ipdms.modules.entidade.telefone2" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 40%;" title="<fmt:message key='ipdms.modules.entidade.telefone2' />">
	  		<nested:text property="telefone2" maxlength="20" size="20" onkeypress="return IsNumericKey(event);" styleId="telefone2Label"/>
	  	</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 18%; " title="<fmt:message key='ipdms.modules.entidade.telemovel' />">
	  		<label for="telemovelLabel"><fmt:message key="ipdms.modules.entidade.telemovel" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 20%;" title="<fmt:message key='ipdms.modules.entidade.telemovel' />">
	  		<nested:text property="telemovel" maxlength="20" size="20" onkeypress="return IsNumericKey(event);" styleId="telemovelLabel"/>
	  	</div>
	  	
	  	<div class="leftTab label" style="width: 15%; " title="<fmt:message key='ipdms.modules.entidade.fax' />">
	  		<label for="faxLabel"><fmt:message key="ipdms.modules.entidade.fax" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 40%;" title="<fmt:message key='ipdms.modules.entidade.fax' />">
	  		<nested:text property="fax" maxlength="20" size="20" onkeypress="return IsNumericKey(event);" styleId="faxLabel"/>
	  	</div>
	</div>
	<div style="clear:both"><br /></div>


<%-- INTERNET --%>
	<div class="row" style="text-align:left;">
		<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
			<tbody>
			  <tr>
			    <td class="titulo2"><fmt:message key="ipdms.modules.entidade.internet" /></td>
			  </tr>
			</tbody>
		</table>					
	</div>

	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%; " title="<fmt:message key='ipdms.modules.entidade.email' />">
	  		<label for="emailLabel"><fmt:message key="ipdms.modules.entidade.email" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 79%;" title="<fmt:message key='ipdms.modules.entidade.email' />">
	  		<nested:text property="email" maxlength="80" size="80" styleId="emailLabel" />
	  	</div>
	</div>

	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%; " title="<fmt:message key='ipdms.modules.entidade.homepage' />">
	  		<label for="webpageLabel"><fmt:message key="ipdms.modules.entidade.homepage" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 79%;" title="<fmt:message key='ipdms.modules.entidade.homepage' />">
	  		<nested:text property="homepage" maxlength="80" size="80" styleId="webpageLabel" />
	  	</div>
	</div>
	
	
	<div style="clear:both"><br /></div>

	

</nested:nest>
</nested:root>
