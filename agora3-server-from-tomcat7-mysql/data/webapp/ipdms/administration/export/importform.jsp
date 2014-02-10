<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<fmt:message key='ipdms.forms.anterior' var="anterior"/>
<fmt:message key='ipdms.forms.anterior.title' var="anteriorTitle"/>
<fmt:message key='ipdms.administration.validate' var="validate"/>
<fmt:message key='ipdms.administration.validate.title' var="validateTitle"/>
<fmt:message key='ipdms.administration.importDesc' var="importDesc"/>
<fmt:message key='ipdms.administration.import' var="import"/>
<fmt:message key='ipdms.administration.validating' var="validating"/>
<fmt:message key='ipdms.administration.importing' var="importing"/>
<fmt:message key='ipdms.administration.import.title' var="title"/>
<fmt:message key='ipdms.administration.import.confirmation' var="confirmation"/>
<fmt:message key='webflow.sim' var="sim"/>
<fmt:message key='webflow.nao' var="nao"/>

<div id="ver_ajuda" class="info" style="padding-top:0px; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr><td class="titulo1"><fmt:message key="ipdms.administration.export.import.title" /></td></tr>
		  <tr><td class="titulo2"><fmt:message key="ipdms.administration.import.title" /></td></tr>
		</tbody>
	</table>					
</div>

<div id="MensagemErro">
	<html:errors/>
</div>
<br />
<html:form styleId="importForm" action="/admin/importconfiguration" method="POST" enctype="multipart/form-data">
	<html:hidden styleId="method" property="method" value=""/>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.administration.export.configfile' />">
	  		<label for="configFile"><fmt:message key="ipdms.administration.export.configfile" />:</label> * 
	  	</div>
	  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.administration.export.configfile' />">
	  		<html:file property="configFile" styleClass="formField"/>
	  	</div>
	</div>
	<div class="buttonRow">
		<c:url value="/admin/exportimporthomepage.do2" var="importform" />
		<html:button property="back" styleClass="btForm" value="${anterior}" 
			title="${anteriorTitle}" 
			onclick="setActionAndSubmit(this.form,'${importform}'); "/>
		<html:submit styleClass="btForm" value="${validate}" 
			title="${validateTitle}" onclick="maskScreenWhileValidating(); $('method').value='validate';"/>
		<html:button property="importbutton" styleClass="btForm" value="${importDesc}" title="${import}" 
			onclick="importFormFn();"/>
	</div>
</html:form>

<c:set var="loadingImage"><img src="${pageContext.request.contextPath}/ipdms/js/ext/resources/images/default/grid/loading.gif" /></c:set>
<script>
	function maskScreenWhileValidating() {
		Ext.getBody().mask('${loadingImage} ${validating}...');
	}
	function maskScreenWhileImporting() {
		Ext.getBody().mask('${loadingImage} ${importing}...');
	}
	function importFormFn() {
		Ext.MessageBox.show( {
								title:'${title}', 
								msg: '${confirmation}',
								buttons: {yes:'${sim}', no:'${nao}'},
								modal : true,
								icon: Ext.MessageBox.QUESTION,
								fn: function (btn) { 
									if(btn=='yes') {
										maskScreenWhileImporting(); 
										$('method').value='importConfig'; 
										$('importForm').submit(); 
									}
								}
							});
	}
</script>
