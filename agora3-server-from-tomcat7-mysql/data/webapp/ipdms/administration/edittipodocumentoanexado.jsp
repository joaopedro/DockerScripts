<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html:form action="/saveTipoDocumentoAnexado" method="post" styleClass="form">
	<html:hidden property="tipo.id"/>
	
	<div class="row" style="padding-bottom:20px;">
		<div class="leftTab label" style="width: 90%; " title="<fmt:message key='ipdms.obrigatorio' />">
	  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
	  	</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.tipodocumentoanexado.descricao' />">
	  		<label for="descricao"><fmt:message key="ipdms.tipodocumentoanexado.descricao" /></label> *
	  	</div>
	  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.tipodocumentoanexado.descricao' />">
	  		<html:text property="tipo.descricao" size="100" maxlength="200" styleId="descricao"/>
	  	</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.tipodocumentoanexado.sigla' />">
	  		<label for="sigla"><fmt:message key="ipdms.tipodocumentoanexado.sigla" /></label> *
	  	</div>
	  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.tipodocumentoanexado.sigla' />">
	  		<html:text property="tipo.sigla" size="20" maxlength="20" styleId="sigla"/>
	  	</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.tipodocumentoanexado.extensoes' />">
	  		<label for="extensoes"><fmt:message key="ipdms.tipodocumentoanexado.extensoes" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.tipodocumentoanexado.extensoes' />">
	  		<html:text property="tipo.extensoes" size="20" maxlength="100" styleId="extensoes"/>
	  	</div>
	</div>
	
	<br />
	<div class="buttonRow">
		<input type="button" class="btForm" value="<fmt:message key='ipdms.forms.anterior'/>" title="<fmt:message key='ipdms.forms.anterior.title'/>"
			onclick="setActionAndSubmit(this.form, 'listTipoDocumentoAnexado.do2');">
		<input type="submit" class="btForm" value="<fmt:message key='ipdms.forms.submit'/>" title="<fmt:message key='ipdms.forms.submit.title'/>">
	</div>
</html:form>