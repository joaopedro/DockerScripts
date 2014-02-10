<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<fmt:message key="ipdms.administration.importDesc" var="importDesc" />
<fmt:message key="ipdms.documentos.bundle.import.title" var="importTitle" />
<fmt:message key="ipdms.documentos.bundle.import.confirm" var="importConfirm" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />
<fmt:message key="ipdms.administration.importing" var="importing" />

<div id="ver_ajuda" class="info" style="padding-top:0px; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr><td class="titulo1"><fmt:message key="ipdms.documentos.bundle.title" /></td></tr>
		</tbody>
	</table>					
</div>

<div id="MensagemErro">
	<html:errors/>
</div>

<br/><p class="formlabel"><fmt:message key="ipdms.documentos.bundle.import.title" />:</p><br/>

<html:form styleId="importBundleForm" action="/bundle/importBundle" method="POST" enctype="multipart/form-data">
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.documentos.bundle' />">
	  		<label for="bundleFile"><fmt:message key="ipdms.documentos.bundle" />:</label> * 
	  	</div>
	  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.documentos.bundle' />">
	  		<html:file property="bundleFile" styleClass="formField"/>
	  	</div>
	</div>
	<div class="buttonRow">
		<html:button property="importbutton" styleClass="btForm" value="${importDesc}" title="${importTitle}" 
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
								msg: '${importConfirm}',
								buttons: {yes:'${sim}', no:'${nao}'},
								modal : true,
								icon: Ext.MessageBox.QUESTION,
								fn: function (btn) { 
									if(btn=='yes') {
										maskScreenWhileImporting(); 
										$('importBundleForm').submit(); 
									}
								}
							});
	}
</script>
