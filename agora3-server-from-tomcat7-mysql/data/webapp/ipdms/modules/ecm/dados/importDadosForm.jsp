<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<fmt:message key="ipdms.loading" var="loading" bundle="${ecmBundle}" />
<fmt:message key="ipdms.obrigatorio" var="obrigatorio" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.importar" var="importar" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.designacaoplural" var="dadosDesPlural" bundle="${ecmBundle}" />
<fmt:message key="ecm.dados.importar.ficheiro" var="ficheiro" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.submit" var="submit" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.submit.title" var="submitTitle" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.cancelar" var="cancelar" bundle="${ecmBundle}" />
<fmt:message key="ipdms.forms.cancelar.title" var="cancelarTitle" bundle="${ecmBundle}" />

<html:form styleId="ecmSearchForm" action="/importDados" method="post" enctype="multipart/form-data">

	<input type="hidden" name="method" value="executeImport">

	<fieldset>
		<legend>${importar} ${dadosDesPlural}</legend>
		
		<div id="importErrorDiv"></div>
	
		<div class="row" style="padding-bottom:2%;">
			<div class="leftTab label" style="width: 90%; " title="${obrigatorio}">
				<span class="formlabel_obrigatorio">${obrigatorio}</span>
	  		</div>
		</div>
	
		<div class="row formlabel_sf" style="height:30px;">
			<div class="leftTab label" style="width: 25%; " title="${ficheiro}">
				${ficheiro} *
			</div>
	 		<div class="label" style="width: 72%;" title="${ficheiro}">
	  			<input type="file" name="file">
	  		</div>
		</div>
	
		<div class="buttonRow">
			<input type="button" class="btForm" value='${submit}' onclick="this.form.submit(); jQuery('body').mask('${loading}');" title='${submitTitle}' />
			<input type="button" class="btFormEscuro" value='${cancelar}' onclick="cancelImport();" title='${cancelarTitle}' />
		</div>
	
	</fieldset>
</html:form>