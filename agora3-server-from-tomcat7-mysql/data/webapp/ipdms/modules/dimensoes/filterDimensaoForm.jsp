<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<fmt:message key="ipdms.instrucao.pedido.info.title" var="atencao" />
<fmt:message key="ipdms.forms.pesquisar" var="pesquisar" />
<fmt:message key="ipdms.dimensoes.designacaoplural" var="dimensoes" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ipdms/js/ext/resources/css/messageEditCreate.css" /> 

<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/messageEditCreate.js"></script>

<html:form method="post" action="/listDimensoes">
	<html:hidden property="page" value="1" />

<c:if test="${erro==true}">
	<div class="mensagenCaixa">
		<div style="float:left; width:2%;"><img src="images/icon/icon-atencao.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;"  alt="${atencao}" title="${atencao}"/></div>
			<div style="float:right; width:93%; vertical-align:middle; margin-top:4px; ">
				<div class="info">
					<fmt:message key="ipdms.dimensoes.eliminar.error" />
				</div>
			</div>
		<div style="clear:both"></div>
	</div>				
	<br />
</c:if>
				
<div class="alignLeft">
	<div class="left">
		<img src="${pageContext.request.contextPath}/images/icon/icon-criarNovo.png" onclick="window.location.href='editDimensao.do2';" class="cursorMao" alt="<fmt:message key='ipdms.dimensoes.criar' />" title="<fmt:message key='ipdms.dimensoes.criar' />" />
	</div>
	<div class="right">
		<div class="texto"><a href="#" onclick="window.location.href='editDimensao.do2?method=prepare';" title="<fmt:message key="ipdms.dimensoes.criar" />"><fmt:message key="ipdms.dimensoes.criar" /></a></div>
	</div>
</div>	
	<div id='extInfo' ></div>

<script>
if(${not empty save}){
	Ext.example.msg('<fmt:message key="ipdms.dimensoes.titulo" />', '<fmt:message key="ipdms.dimensoes.saveresult" />');	
} else if(${not empty delete}) {
	Ext.example.msg('<fmt:message key="ipdms.dimensoes.titulo" />', '<fmt:message key="ipdms.dimensoes.deleteresult" />');		
}
</script>
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.dimensoes.search.designacao" />">
			<label for="designacao"><fmt:message key="ipdms.dimensoes.search.designacao" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.dimensoes.search.designacao" />">
	  		<html:text styleClass="textinput" property="params(designacao)" size="30" maxlength="80" styleId="designacao"/>
	  	</div>
 	</div>
 	
 	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.dimensoes.search.descricao" />">
			<label for="descricao"><fmt:message key="ipdms.dimensoes.search.descricao" /></label>
	  	</div>
	  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.dimensoes.search.descricao" />">
	  		<html:text styleClass="textinput" property="params(descricao)" size="30" maxlength="80" styleId="descricao" />
	  	</div>
 	</div>
 	
 	<div style="clear:both;"></div>
 	
 	<div class="buttonRow">
		<input type="submit" name="search" value="${pesquisar}" class="btForm" title="${pesquisar} ${dimensoes}" />	  
	</div>
	
	<div style="clear:both;"><br /></div>
</html:form>