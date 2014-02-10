<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:message key="ipdms.multipleNotification.invalid.mensagenErro1" var="mensagenErro1" />
<fmt:message key="ipdms.multipleNotification.invalid.notsameetapa_error" var="notsameetapa_error" />
<fmt:message key="ipdms.multipleNotification.invalid.vistaEspecifica_error" var="vistaEspecifica_error" />
<fmt:message key="ipdms.multipleNotification.invalid.encarregue_error" var="encarregue_error" />
<fmt:message key="ipdms.multipleNotification.invalid.isNotRecipient_error" var="isNotRecipient_error" />
<fmt:message key="ipdms.multipleNotification.invalid.notificationsClosed_error" var="notificationsClosed_error" />
<fmt:message key="ipdms.multipleNotification.invalid.condicoesTitle" var="condicoesTitle" />
<fmt:message key="ipdms.multipleNotification.invalid.condicoes.mesmoTipo" var="mesmoTipo" />
<fmt:message key="ipdms.multipleNotification.invalid.condicoes.mesmaEtapa" var="mesmaEtapa" />
<fmt:message key="ipdms.multipleNotification.invalid.condicoes.vistaNaoEspecifica" var="vistaNaoEspecifica" />
<fmt:message key="ipdms.multipleNotification.invalid.condicoes.naoFechadas" var="naoFechadas" />
<fmt:message key="ipdms.multipleNotification.invalid.condicoes.utilizador" var="utilizador" />
<fmt:message key="ipdms.header.home" var="home" />

<div class="mensagenCaixa">
	<ul>
		<table>
			<tr>
				<td><img src="${pageContext.request.contextPath}/images/icon/icon-stop.png"/></td>
				<td valign="middle" class="mensagenErro1">${mensagenErro1}<td></tr>
				<tr>
					<td></td>
					<td>
						<li class="info" style="list-style-image: url(${pageContext.request.contextPath}/images/icon/icon-seta.png); margin-left:10px; *margin-left:-15px; font-weight:normal; color:#000000; padding-top:5px; *padding-top:3px;">
							<c:if test="${not empty multiple_notsameetapa_error}">
								${notsameetapa_error}
							</c:if>
							<c:if test="${not empty vistaEspecifica}">
								${vistaEspecifica_error}
							</c:if>			
							<c:if test="${not empty Encarregue}">
								${encarregue_error} ${Encarregue}
							</c:if>
							<c:if test="${not empty isNotRecipient}">
								${isNotRecipient_error}
							</c:if>
							<c:if test="${not empty notificationsClosed}">
								${notificationsClosed_error}
							</c:if>
						</li>
					</td>
				</tr>
		</table>
	</ul>
</div>
<br/>
<p style="margin-left: 5px;">
	${condicoesTitle}<br/>
	<table>
	<ul style="margin-left: 10px;" >
		<li>- ${mesmoTipo}</li>
		<li>- ${mesmaEtapa}</li>
		<li>- ${vistaNaoEspecifica}</li>
		<li>- ${naoFechadas}</li>
		<li>- ${utilizador}</li>
	</ul>
	</table>
</p>
<br/>
<input type="submit" class="btForm" value="« ${home}" title="${home}" 
	onclick="document.location.href = '${pageContext.request.contextPath}'"/>

