<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.ssl.certificateInfo.certificadoCarregado" var="certificadoCarregado" />
<fmt:message key="ipdms.ssl.certificateInfo.completa" var="completa" />
<fmt:message key="ipdms.ssl.certificateInfo.serialNumber" var="serialNumber" />
<fmt:message key="ipdms.ssl.certificateInfo.issuer" var="issuer" />
<fmt:message key="ipdms.ssl.certificateInfo.subject" var="subject" />
<fmt:message key="ipdms.ssl.certificateInfo.msg1" var="msg1" />
<fmt:message key="ipdms.ssl.certificateInfo.msg2" var="msg2" />
<fmt:message key="ipdms.forms.fechar" var="fechar" />
<fmt:message key="ipdms.forms.fechar.title" var="fecharTitle" />

<fieldset>
	<legend>${certificadoCarregado} 
		<img src="${pageContext.request.contextPath}/images/icon/icon-lock.png" 
			alt="${completa}" title="${completa}"
			onclick="showInfo();"/></legend>
	<br />
	<table>
		<tr>
			<td class="textoBold">${serialNumber}</td>
			<td class="formfield">${userCertificate.serialNumber}</td>
		</tr>
		<tr>
			<td class="textoBold">${issuer}</td>
			<td class="formfield">${userCertificate.issuerDN}</td>
		</tr>
		<tr>
			<td class="textoBold">${subject}</td>
			<td class="formfield">${userCertificate.subjectDN}</td>
		</tr>			
	</table>
	<br />
		<p class="formfield"><i>
		${msg1}
		</i></p>
		<p class="formfield"><i>
		${msg2} 
		</i></p>
</fieldset>

<div style="display: none;">
	<div id="certInfoDiv">
		<center><input type="button" onclick="hideInfoWindow();" title="${fecharTitle}" value="${fechar}"></center><br />
		${userCertificate}
		<center><br /><input type="button" onclick="hideInfoWindow();" title="${fecharTitle}" value="${fechar}"></center>
	</div>
</div>


<script>
 var infoWin;

 showInfo = function () {	
	infoWin = new Ext.Window({
		id            : 'windowShowInfo',
		animEl        : this,
		animCollapse  : true,
		maximizable   : false,
		width         : 600,
		height        : 500,
		autoScroll	  : true,
		closable      : false,
		modal		  : true,
		contentEl 	  : 'certInfoDiv'
			
	});
	infoWin.show();
 };
 	
 hideInfoWindow = function () {
	 if(infoWin != null) {
		 infoWin.hide();
		 //infoWin.destroy();
	 }
 }; 
</script>
