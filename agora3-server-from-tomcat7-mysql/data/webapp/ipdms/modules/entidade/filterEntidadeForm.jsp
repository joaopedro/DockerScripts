<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:message key="ipdms.modules.entidade.criar" var="criar" />
<fmt:message key="ipdms.forms.pesquisar" var="pesquisar" />
<fmt:message key="ipdms.modules.entidade.designacaoplural" var="designacaoplural" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ipdms/js/ext/resources/css/messageEditCreate.css" /> 

<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/messageEditCreate.js"></script>

<html:form method="post" action="/listEntidades">
	<html:hidden property="page" value="1" />
<div class="alignLeft">
	<div class="left">
		<img src="${pageContext.request.contextPath}/images/icon/icon-criarNovo.png" onclick="window.location.href='editEntidade.do2';" class="cursorMao" alt="${criar}" title="${criar}" />
	</div>
	<div class="right">
		<div class="texto" title="${criar}"><a href="#" onclick="window.location.href='editEntidade.do2';">${criar}</a></div>
	</div>
</div>	
	<div id='extInfo' ></div>

<script>
if(${not empty save}){
	Ext.example.msg('<fmt:message key="ipdms.modules.entidade.manage" />', '<fmt:message key="ipdms.modules.entidade.saveresult" />');	
} else if(${not empty delete}) {
	Ext.example.msg('<fmt:message key="ipdms.modules.entidade.manage" />', '<fmt:message key="ipdms.modules.entidade.deleteresult" />');		
}
</script>
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.nome' />">
			<label for="labelnome"><fmt:message key="ipdms.modules.entidade.nome" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 75%;" title="<fmt:message key='ipdms.modules.entidade.nome' />">
	  		<html:text styleClass="textinput" property="params(nomeEntidade)" size="50" maxlength="80" styleId="labelnome"/>
	  	</div>
 	</div>
 	
 	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.nif' />">
			<label for="labelnif"><fmt:message key="ipdms.modules.entidade.nif" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.modules.entidade.nif' />">
	  		<html:text styleClass="textinput" property="params(nif)" size="10" maxlength="25" styleId="labelnif"/>
	  	</div>
 	</div>
 	
 	<div style="clear:both"></div>
 	
 	<div class="buttonRow">
		<input type="submit" name="search" value="${pesquisar}" class="btForm" title="${pesquisar} ${designacaoplural}" />	  
	</div>
	
	<div style="clear:both"><br /></div>
</html:form>