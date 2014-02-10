<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link type=text/css rel=stylesheet href='${pageContext.request.contextPath}/ipdms/themes/estilos.css' />

<div id="previewheader" style="padding-botton: 5px; padding-right: 5px; text-align: right;">
	<jsp:include page="previewdocumentheader.jsp" />
</div>

<div style="padding-top: 5px;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
			<tr>
				<td style="border-bottom: 0px; text-align: center;" class="titulo1" >
					<fmt:message key="ipdms.pdfpreview.naodisponivel" />
				</td>
			</tr>
		</tbody>
	</table>
	<center>
		<p><img src="${pageContext.request.contextPath}/images/icon/icon-alerta.png" /></p>
	</center>
</div>
