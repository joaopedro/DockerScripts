<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<fmt:message key="ipdms.dynamicform.import.title" var="importTitle" />
<fmt:message key='ipdms.dynamicform.export.configfile' var="configfile" />
<fmt:message key="ipdms.forms.anterior" var="anterior" />
<fmt:message key="ipdms.forms.anterior.title" var="anteriorTitle" />
<fmt:message key="ipdms.dynamicform.import.designacao" var="importdesig" />
<fmt:message key="ipdms.dynamicform.import.confirmMsg" var="confirmMsg" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />
<fmt:message key="ipdms.administration.importing" var="importing" />

<div id="ver_ajuda" class="info" style="padding-top:0px; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr><td class="titulo1">${importTitle}</td></tr>
		</tbody>
	</table>					
</div>

<div id="MensagemErro">
	<html:errors/>
</div>

<br/><p class="formlabel">${importTitle}:</p><br/>

<html:form styleId="importForm" action="/importdynamicform" method="POST" enctype="multipart/form-data">
	<html:hidden styleId="method" property="method" value=""/>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 21%; " title="${configfile}">
	  		<label for="configFile">${configfile}:</label> * 
	  	</div>
	  	
	  	<div class="label" style="width: 76%;" title="${configfile}">
	  		<html:file property="configFile" styleClass="formField"/>
	  	</div>
	</div>
	<div class="buttonRow">
		<c:url value="/listDynamicForms.do2" var="importform" />
		<html:button property="back" styleClass="btForm" value="${anterior}" title="${anteriorTitle}"
			onclick="setActionAndSubmit(this.form,'${importform}'); "/>
		<html:button property="importbutton" styleClass="btForm" value="${importdesig}" title="${importdesig} ${configfile}" 
			onclick="importFormFn();"/>
	</div>
</html:form>

<c:set var="loadingImage"><img src="${pageContext.request.contextPath}/ipdms/js/ext/resources/images/default/grid/loading.gif" /></c:set>
<script>
	function maskScreenWhileImporting() {
		Ext.getBody().mask('${loadingImage} ${importing}...');
	}
	function importFormFn() {
		Ext.MessageBox.show( {
								title:'${importTitle}', 
								msg: '${confirmMsg}',
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
