<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %>


<!-- INICIO DO HEADER -->
	<div id="header"><html:link action="/publico/homepage"><img src="${pageContext.request.contextPath}/images/guichet/dot_clear.gif"  style="width:160px; height:120px; border:none;"/></html:link></div>
	<div class="barra">
		<div class="barraData"></div>
		<div class="barraLogin">
			<noscript>Your browser does not support JavaScript!</noscript>
			
			<c:choose>
			<c:when test="${log != null}">
				<fmt:message key="guichetelectronico.header.bemvindo" bundle="${guichetBundle}"/> ${pageContext.request.username} | <a href="${pageContext.request.contextPath}/guichetelectronico/publico/j_acegi_logout_guichet">LOGOUT</a>
			</c:when>
			<c:otherwise>
				<html:link action="/publico/login"><fmt:message key="guichetelectronico.header.login" bundle="${guichetBundle}"/></html:link><span class="barraLoginSeparador">&nbsp;</span><html:link action="/publico/register"><fmt:message key="guichetelectronico.header.registar" bundle="${guichetBundle}"/></html:link>
			</c:otherwise>
			</c:choose>
			
			<span style="padding-left:50px;">
				<a href="javascript:decreaseFontSize();"><img src="${pageContext.request.contextPath}/images/guichet/font-dec.gif" alt="<fmt:message key='guichetelectronico.diminuirLetra' bundle='${guichetBundle}'/>" title="<fmt:message key='guichetelectronico.diminuirLetra' bundle='${guichetBundle}'/>" style="border:0px; margin-top:2px; vertical-align:middle;" /></a>
				<a href="javascript:increaseFontSize();"><img src="${pageContext.request.contextPath}/images/guichet/font-inc.gif" alt="<fmt:message key='guichetelectronico.aumentarLetra' bundle='${guichetBundle}'/>" title="<fmt:message key='guichetelectronico.aumentarLetra' bundle='${guichetBundle}'/>" style="border:0px; margin-top:2px; vertical-align:middle;" /></a>
			</span>	
		</div>				
	</div>
	<!-- FIM DO HEADER -->
	
	<!-- ÍNICIO DO BREADCRUMB
	<div id="breadcrumb">			
		<span style="color:black"><fmt:message key="guichetelectronico.header.breadcrumb" bundle="${guichetBundle}"/>:</span> <a href="#" title="Início">Início</a> > <a href="#" title="Cidadãos">Cidadãos</a> > Eu e...  
	</div>	
	FIM DO BREADCRUMB -->