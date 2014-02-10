<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.modules.processinstance.numProc" var="numProc" />
<fmt:message key="ipdms.forms.pesquisar" var="pesquisar" />

<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" />
<script type="text/javascript" src="${CONTEXT_PATH}/ipdms/js/ext/ExtContentIPDMS/AjaxRequest.js" ></script>


<html:form action="/listInstances" method="post" onsubmit="return false;">
		
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 10%;" title="${numProc}">
			<label for="numProcesso">${numProc}</label>
	  	</div>	  	
	  	<div class="label" style="width: 88%;" title="${numProc}">
	  		<html:text styleClass="textinput" property="params(numProcesso)"  maxlength="20" size="30"/>	
	  	</div>	  	
 	</div>
 	 	
 	<div class="buttonRow">
		<input type="button" class="btForm" value="${pesquisar}" title="${pesquisar}" onclick="loadListprocessWithEvent('result',event);" />
	</div>	
		
</html:form>

<br/>
<div id="result"></div>