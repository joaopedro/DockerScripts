<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:message key="ipdms.dynamicform.form.criar" var="criar" />
<fmt:message key="ipdms.dynamicform.form.importar" var="importar" />
<fmt:message key="ipdms.dynamicform.form.creationdate.de" var="de" />
<fmt:message key="ipdms.dynamicform.form.creationdate.ate" var="ate" />
<fmt:message key="ipdms.dynamicform.form.creationdate.inicio" var="inicio" />
<fmt:message key="ipdms.dynamicform.form.creationdate.fim" var="fim" />
<fmt:message key="ipdms.forms.pesquisar" var="pesquisar" />
<fmt:message key="ipdms.dynamicform.form.designacaoplural" var="designacaoplural" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ipdms/js/ext/resources/css/messageEditCreate.css" /> 
<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/messageEditCreate.js"></script>

<html:form method="post" action="/listDynamicForms">
	<html:hidden property="page" value="1" />
	<div class="alignLeft">
		<div class="left">
			<img src="${pageContext.request.contextPath}/images/icon/icon-criarNovo.png" 
					onclick="window.location.href='editDynamicForm.do2';" class="cursorMao" 
					alt="${criar}" title="${criar}" />
		</div>
		<div class="right">
			<div class="texto"><a href="#" onclick="window.location.href='editDynamicForm.do2';" title="${criar}">${criar}</a></div>
		</div>
	</div>	
	<div class="alignLeft">
		<div class="left">
			<img src="${pageContext.request.contextPath}/images/icon/icon-importar.png" 
					onclick="window.location.href='importdynamicformform.do2';" class="cursorMao" 
					alt="${importar}" title="${importar}" />
		</div>
		<div class="right">
			<div class="texto">
				<a href="#" onclick="window.location.href='importdynamicformform.do2';" title="${importar}">
					${importar}
				</a></div>
		</div>
	</div>	

	<div id='extInfo' ></div>

<%--
	<script>	
	if(${not empty save}){
		Ext.example.msg('<fmt:message key="ipdms.modules.entidade.manage" />', '<fmt:message key="ipdms.modules.entidade.saveresult" />');	
	} else if(${not empty delete}) {
		Ext.example.msg('<fmt:message key="ipdms.modules.entidade.manage" />', '<fmt:message key="ipdms.modules.entidade.deleteresult" />');		
	}
	</script>
--%>

	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 15%;" title="<fmt:message key='ipdms.dynamicform.form.description' />">
			<label for="descricao"><fmt:message key="ipdms.dynamicform.form.description" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 82%;" title="<fmt:message key='ipdms.dynamicform.form.description' />">
	  		<html:text styleClass="textinput" property="params(description)" size="60" maxlength="60" styleId="descricao"/>
	  	</div>
 	</div>
 	
 	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 15%; " title="<fmt:message key='ipdms.dynamicform.form.creationdate' /> ${de}">
			<label for="beginCreationDate"><fmt:message key="ipdms.dynamicform.form.creationdate" /> ${de} </label>
	  	</div>
  	    <div class="label" style="width: 17%;" title="${inicio}">
    	    <html:text styleId="beginCreationDate" property="params(beginCreationDate)" size="10" maxlength="10" styleClass="date" onkeypress="return false;" onfocus="Calendar.setup({ inputField : this.id, ifFormat : '%d-%m-%Y', showsTime : false });"/>
		 	<img style="vertical-align: bottom" id="beginCreateDate" src="${pageContext.request.contextPath}/images/icon/icon-calendario.png" onclick="" class="cursorMao" alt="${inicio}" title="${inicio}" />
	        <script type='text/javascript'>
	          	Calendar.setup({ inputField : 'beginCreationDate', ifFormat : '%d-%m-%Y', showsTime : false });
	          	Calendar.setup({ inputField : 'beginCreationDate', ifFormat : '%d-%m-%Y', button : "beginCreateDate" });
			</script>
    	</div>	  	
	  	<div class="leftTab label" style="width: 5%; " title="${ate}">
			<label for="endCreationDate"> ${ate} </label>
	  	</div>
	  	<div class="label" style="width: 35%;" title="${fim}">
	  		<html:text styleId="endCreationDate" property="params(endCreationDate)" size="10" maxlength="10" styleClass="date" onkeypress="return false;"
                            onfocus="Calendar.setup({ inputField : this.id, ifFormat : '%d-%m-%Y', showsTime : false });"/>
	  		<img style="vertical-align: bottom" id="endCreateDate" src="${pageContext.request.contextPath}/images/icon/icon-calendario.png" onclick="" class="cursorMao" alt="${fim}" title="${fim}" />
	        <script type='text/javascript'>
	          	Calendar.setup({ inputField : 'endCreationDate', ifFormat : '%d-%m-%Y', showsTime : false });
	          	Calendar.setup({ inputField : 'endCreationDate', ifFormat : '%d-%m-%Y', button : "endCreateDate" });
			</script>
	  	</div>
 	</div>
 	
 	<div style="clear:both"></div>
 	
 	<div class="buttonRow">
		<input type="submit" name="search" value="${pesquisar}" class="btForm" title="${pesquisar} ${designacaoplural}" />	  
	</div>
	<div style="clear:both"><br /></div>
</html:form>