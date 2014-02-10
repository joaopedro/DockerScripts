<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">
function inicio() {
	document.location = "${pageContext.request.contextPath}";
}
</script>
<div class="left"><a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/images/header/bannerIPDMS.jpg" title="<fmt:message key='ipdms.header.home'/>" alt="ipdms.header.home" style="border:none;" /></a></div>
<%-- a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/images/header/logo.gif" title="Logo" alt="Logo"  style="border:none;"/></a--%>
<%-- div class="right">&nbsp;</div--%>
<div class="barraTopo">	
	
	<c:set var="nralertas" value="${sessionScope.ipdms_modules_alert_numberOfActiveAlerts}" />
	<c:set var="nrpareceres" value="${sessionScope.ipdms_parecer_alert_numberOfActivePareceres}" />
	<c:if test="${pageContext.request.interno && (nralertas > 0 || nrpareceres > 0)}">
		<div class="barraTopoLeft">
			<img src="${pageContext.request.contextPath}/images/icon/icon-alerta.png"
				alt="<fmt:message key='ipdms.modules.alert.NovoAlertaNotificacao'/> / <fmt:message key="ipdms.comunicacaoparecer.alerta"/>"
				title="<fmt:message key='ipdms.modules.alert.NovoAlertaNotificacao'/> / <fmt:message key="ipdms.comunicacaoparecer.alerta"/>" />			
			
			<div class="barraTopoLeftTexto">
				<%-- Mostra uma notificação com o nr de alertas --%>
				<c:if test="${nralertas > 0}">
					[${sessionScope.ipdms_modules_alert_numberOfActiveAlerts}]
					<a href="${pageContext.request.contextPath}/activeAlertsByUser.do2" title="<fmt:message key='ipdms.modules.alert.NovoAlertaNotificacao'/>">
						<fmt:message key="ipdms.modules.alert.NovoAlertaNotificacao"/></a>
				</c:if>
				<c:if test="${nralertas > 0 && nrpareceres > 0}">&nbsp;|&nbsp;</c:if>
				<%-- Mostra uma notificação com o nr de pareceres a aguardar resposta --%>
				<c:if test="${nrpareceres > 0}">
					[${sessionScope.ipdms_parecer_alert_numberOfActivePareceres}]
					<a href="${pageContext.request.contextPath}/comunicacoesPareceres.do2?method=show" title="<fmt:message key='ipdms.comunicacaoparecer.alerta'/>">
						<fmt:message key="ipdms.comunicacaoparecer.alerta"/> 
					</a>
				</c:if>		
				
			</div>
		</div>
	
	</c:if>
		
	<div class="barraTopoRight">
		<c:if test="${log != null && pageContext.request.interno}">
			<fmt:message key="message.welcome"/>
			${pageContext.request.username}&nbsp;&nbsp;
			<%-- Icon Certificado caso ele ja tenha sido carregado para a sessao--%>
			<c:if test="${not empty sessionScope['com.sinfic.ipdms.security.x509certificate']}">
				<a href="${pageContext.request.contextPath}/ipdms/ssl/showCertificate.jsp" target="_blank"><img src="${pageContext.request.contextPath}/images/icon/icon-lock-white.png"
					alt="<fmt:message key='ipdms.header.certificado'/>"
					title="<fmt:message key='ipdms.header.certificado'/>" style="border:none;"/></a>
			</c:if>
			|&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/j_acegi_logout" title="<fmt:message key='ipdms.header.sair'/>"><fmt:message key="ipdms.header.sair"/></a>
		</c:if>	
	</div>
	
</div>

<%-- NOVO CÓDIGO DA BARRA PRETA DO HEADER
<div class="barraTopo">
	<div class="barraTopoLeft">
		<table style="width:50%;">
			<tr>
				<td style="width:50px"><a href="${pageContext.request.contextPath}">Homepage</a></td>
				<td style="width:2px;">|</td>
				<td style="width:10px"><img src="${pageContext.request.contextPath}/images/icon/icon-alerta.png" alt="Alerta" title="Alerta" /></td>
				<td >[${sessionScope.ipdms_modules_alert_numberOfActiveAlerts}] <a href="${pageContext.request.contextPath}/activeAlertsByUser.do2"> Novas Alertas / Notificações</a></td>
			</tr>
		</table>	 			
	</div>	
	<div class="barraTopoRight">
		<c:if test="${log.colaborador != null && log.interno}">
			Bem vindo (a)
			<bean:write name="log" property="userName"/>&nbsp;&nbsp;
			|&nbsp;&nbsp;<html:link action="/logout">Sair</html:link>
		</c:if>	
	</div>
</div>
--%>


<%-- 
QUANDO FOR IMPLEMENTADO O BREADCRUMB É PRECISO IR MUDAR EM BAIXO NO JAVASCRIPT NO PANE NORTH PARA size:130 QUE ESTÁ NO IPDMSLAYOUT.JSP 
<div class="breadcrumb">Home » Breadcrumb </div>
--%>
