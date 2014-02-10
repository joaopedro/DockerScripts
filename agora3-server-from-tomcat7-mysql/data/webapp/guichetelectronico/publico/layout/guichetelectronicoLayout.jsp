<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<META http-equiv="X-UA-Compatible" content="IE=EmulateIE8" >
	<%@ page contentType="text/html; charset=iso-8859-1" %>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	
	<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
	<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	
	<c:set var="log" value="${pageContext.request.userPrincipal}" scope="request"></c:set>
	<c:set var="formBeanName" value="${requestScope['org.apache.struts.action.mapping.instance'].name}" scope="request"></c:set>
	
	<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/ipdms/themes" />
	<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
	<c:set var="IMG_DIR" value="${pageContext.request.contextPath}/images" />
	<c:set var="IMG_GUICHET_DIR" value="${pageContext.request.contextPath}/images/guichet" />
	<fmt:setBundle basename="resources/GuichetResources" scope="session" var="guichetBundle"/>
	
	<fmt:message key="guichetelectronico.product.name" var="productName" bundle="${guichetBundle}"/>
	<fmt:message key="guichetelectronico.product.description" var="productDescription" bundle="${guichetBundle}"/>

	<TITLE>${productName} - ${productDescription}</TITLE>
	
	<tiles:insert attribute="guichetScriptsThemes" />
	
	<fmt:message key='guichetelectronico.sugestoes' bundle='${guichetBundle}' var='sugestoesDes'/>
	<fmt:message key='guichetelectronico.reclamacoes' bundle='${guichetBundle}' var='reclamacoesDes'/>
</head>
<!-- FIM HEADER -->

<body>


<div id="container">
	<!-- TOP -->
	<tiles:insert attribute="header" flush="true"/>
	<!-- END OF TOP -->


	<div id="loading" style="padding: 100px; display: none;"></div>
	
	<!-- CENTER -->
	<div id="wrapper">	
		<div id="content">
			<tiles:insert attribute="main-body" />
		</div>
	</div>		
	<!-- END OF CENTER -->

	<div style="*margin-top:-178px; *clear:both;">

	<!-- MENU -->
	<div class="mensagens">
	</div>	
	<div id="navigation">
		<div class="menu">
			<tiles:insert attribute="menu" flush="true"/>
		</div>
		
		</div>
			<form action="${pageContext.request.contextPath}/guichetelectronico/publico/pesquisar.do2" name="pesquisaForm">
			<div id="extra">
				<div class="menu2">
			        <ul>
			            <li class="tituloPesquisa">
							<fmt:message key="guichetelectronico.pesquisa.titulo" bundle="${guichetBundle}"/>
						</li>
			            <li class="caixaPesquisa">
							<label for="pesquisa"><fmt:message key="guichetelectronico.pesquisa.chave" bundle="${guichetBundle}"/>:</label><br />				
								<input type="text" name="searchString" id="searchString" title="<fmt:message key='guichetelectronico.pesquisa.chave' bundle='${guichetBundle}'/>" />
								<html:link href="javascript:document.pesquisaForm.submit();" style="display:inline; border:none; color:#000000" title="OK">:: OK ::</html:link></li>
			            <li>
			            	<html:link action="/publico/listarvariantes.do2?proc=${procSugestoes}" title="${sugestoesDes}">${sugestoesDes} <img src="${IMG_DIR}/guichet/sugestao.png" alt="${sugestoesDes}" title="${sugestoesDes}"  style="float:right; position:absolute; margin-left:30px; padding-bottom:2px; border:none;" /></html:link>
						</li>
			            <li>
							<html:link action="/publico/listarvariantes.do2?proc=${procReclamacoes}" title="${reclamacoesDes}">${reclamacoesDes} <img src="${IMG_DIR}/guichet/reclamacao.png" alt="${reclamacoesDes}" title="${reclamacoesDes}"  style="float:right; position:absolute; margin-left:18px; padding-top:2px; padding-bottom:2px; border:none;"/></html:link>
						</li>
			        </ul>
				</div>
			</div>
			</form>
		</div>
		<!-- END OF MENU -->

		<div style="clear:both; padding-bottom:20px;"></div>

		<!-- INICIO DO FOOTER -->
		<div id="footer">
			<jsp:include page="../base/footer.jsp"/>
		</div>
		<!-- FIM DO FOOTER -->
	</div>
</body>
</html>