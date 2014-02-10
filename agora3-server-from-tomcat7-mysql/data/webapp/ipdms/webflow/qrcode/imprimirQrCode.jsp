<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="webflow.qrcode.appletNotFound" var="appletNotFound" />
<fmt:message key="webflow.qrcode.imprimirFechar" var="imprimirFechar" />

<script>
function printQrCode()
{
	try {
		var applet = document.jZebra;
		if (applet != null) {
			applet.clear();
			applet.append("^XA");
			applet.append("^FO100,40");
			applet.append("^BQN,2,8");
			applet.append("^FDQA,${param.text}^FS");
			applet.append("^XZ");
			applet.print();
			//alert('Impressão em curso. Janela irá ser fechada no fim da impressão.');
			while(!applet.isDonePrinting()) { 
				//wait 
			}
			window.close();
		} else {
			alert('${appletNotFound}');
		}
	} catch(err) {
		alert(err);
	}	
}


</script>

<applet name="jZebra" code="jzebra.PrintApplet.class" alt="jZebra did not load properly" archive="jzebra.jar" width="0" height="0">
	<param name="printer" value="ZDesigner GK420t">
</applet>

<center>
<img src="${pageContext.request.contextPath}/file/getQrCodeImage.do2?qrCodeFilename=${param.qrCodeFilename}" />
<p>${param.text}</p>
<input type="button" value="${imprimirFechar}" title="${imprimirFechar}" onclick="printQrCode(); " />
</center>
