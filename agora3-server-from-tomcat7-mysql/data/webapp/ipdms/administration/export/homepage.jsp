<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<SCRIPT src='${pageContext.request.contextPath}/ipdms/js/swf-ajax-ext.js' type="text/javascript"></script>

<fmt:message key="ipdms.product.name" var="productName"/>

<script type="text/javascript">	
	document.title = '${productName} - <fmt:message key="ipdms.administration.export.import.title" />';	 
</script>

<div id="ver_ajuda" class="info" style="padding-top:0px; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1"><fmt:message key="ipdms.administration.export.import.title" /></td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('s');" class="cursorMao" alt="<fmt:message key='ipdms.forms.ajuda' />" title="<fmt:message key='ipdms.forms.ajuda' />" /></td>
		  </tr>
		</tbody>
	</table>					
</div>
<div id="ajuda" class="info" style="padding-top:0px; display: none; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1"><fmt:message key="ipdms.administration.export.import.title" /></td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('n');" class="cursorMao" alt="<fmt:message key='ipdms.forms.ocultarAjuda' />" title="<fmt:message key='ipdms.forms.ocultarAjuda' />" /></td>
		  </tr>
		</tbody>
	</table>		
	<fmt:message key="ipdms.administration.exportImport.help" />			
</div>

<div id="ajaxlayout" >
<br/>
<c:url value="/admin/exportconfiguration.do2" var="exporturl" />
<c:url value="/admin/importconfigurationform.do2" var="importurl" />
<div class="alignLeft">
	<div class="left">
		<img src="${pageContext.request.contextPath}/images/icon/icon-exportar.png" onclick="exportConfiguration();"/>
	</div>
	<div class="right">
		<div class="texto">
			<a href="#" class="formfield" onclick="exportConfiguration();" style="margin-left:0;" title="<fmt:message key='ipdms.administration.export' />">
				<fmt:message key="ipdms.administration.export" />
			</a>
		</div>
	</div>
</div>

<div class="alignLeft">
	<div class="left">
		<img src="${pageContext.request.contextPath}/images/icon/icon-importar.png" /> 
	</div>
	<div class="right">
		<div class="texto">
			<a href="${importurl}" class="formfield" style="margin-left:0;" title="<fmt:message key='ipdms.administration.import' />">
				<fmt:message key="ipdms.administration.import" />
			</a>
		</div>
	</div>
</div>

</div>

<fmt:message key="processo.priority.errorTilte" var="errorTilte"/>
<fmt:message key="processo.priority.errorMsg" var="errorMsg"/>

<script>
function exportConfiguration() {
	maskDuringExport();
	
	Ext.Ajax.request({
		url: '${exporturl}',
		method: 'POST',
		success: function(request) { onCompleteExport(request, false); },
		failure: function() { onCompleteExport(request, true); }
	});
}

function maskDuringExport() {
	Ext.Ajax.on('beforerequest', function(connection,options){
		Ext.getBody().mask('<img src="${pageContext.request.contextPath}/ipdms/js/ext/resources/images/default/grid/loading.gif" /> <fmt:message key="ipdms.administration.export" />...');
	});
	Ext.Ajax.on('requestcomplete', function(connection,options){
		Ext.getBody().unmask();
	});
	Ext.Ajax.on('requestexception', function(connection,options){
		Ext.getBody().unmask();
	});
}

function onCompleteExport(request, failure) {
	if(failure) {
		Ext.MessageBox.show({
            title: '${errorTilte}',
            msg: '${errorMsg}',
            buttons: Ext.MessageBox.OK
       });
	   return;
	}	
	$('ajaxlayout').innerHTML = request.responseText;
	$('ajaxlayout').innerHTML.evalScripts();		
}
</script>