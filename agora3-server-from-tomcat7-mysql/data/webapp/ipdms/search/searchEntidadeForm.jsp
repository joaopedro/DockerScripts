<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.pesquisa.porentidade.nif" var="nif" />
<fmt:message key="ipdms.pesquisa.porentidade.nomeEntidade" var="nomeEntidade" />
<fmt:message key="ipdms.pesquisa.porentidade.numProcesso" var="numProcesso" />
<fmt:message key="ipdms.pesquisa.porentidade.tipoProcesso" var="tipoProcesso" />
<fmt:message key="ipdms.forms.pesquisar" var="pesquisar" />

<html:form method="post" action="/searchEntidades">
	<html:hidden property="page" value="1" />
	
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 10%; " title="${nif}">
  		<label for="nif">${nif}:</label>
  	</div>
  	
  	<div class="label" style="width: 20%;" title="${nif}">
  		<html:text styleClass="textinput" property="params(nif)" size="10" maxlength="25" styleId="nif"/>
  	</div>
  	
  	<div class="leftTab label" style="width: 17%;" title="${nomeEntidade}">
		<label for="nomeEntidade">${nomeEntidade}:</label>
	</div>
			  		
	<div class="label" style="width: 32%;" title="${nomeEntidade}">
		<html:text styleClass="textinput" property="params(nomeEntidade)" style="width: 98%;" maxlength="80" styleId="nomeEntidade"/>
	</div>
	<div style="clear:both"></div>
</div>	

<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 10%; " title="${numProcesso}">
  		<label for="numProcesso">${numProcesso}:</label>
  	</div>
  	
  	<div class="label" style="width: 20%;" title="${numProcesso}">
  		<html:text styleClass="textinput" property="params(numeroProcesso)" style="width: 98%;" maxlength="20" styleId="numProcesso"/>
  	</div>
  	
  	<div class="leftTab label" style="width: 17%;" title="${tipoProcesso}">
		<label for="tipoProcesso">${tipoProcesso}:</label>
	</div>
			  		
	<div class="label" style="width: 32%;" title="${tipoProcesso}">
		<html:select  property="params(tipoProcesso)" styleId="tipoProcesso">
			<option value=""></option>
			<html:options collection="listTiposProcesso" property="numeroConteudo" labelProperty="titulo"/>
		</html:select>
	</div>
	<div style="clear:both"></div>
</div>	
<div class="row formlabel_sf" >
	<div class="leftTabButton label" style="width: 10%;" title="">
		<input type="submit" name="search" title="${pesquisar}" value="${pesquisar}" class="btForm"/>
	</div>
	<div style="clear:both"></div>
</div>	
<br />
</html:form>
