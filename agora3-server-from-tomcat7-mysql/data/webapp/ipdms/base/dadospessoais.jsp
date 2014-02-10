<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key='ipdms.menu.aplicacoesInternas.geral.alterarDadosPessoais' var='alterarDadosPessoais'/>

<script type="text/javascript">	
	document.title = '${productName} - ${alterarDadosPessoais}';	 
</script>

<div id="ver_ajuda" class="row" style="padding-top:0px; text-align:left">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings" summary="titulo principal da página">
		<tbody>
		  <tr>
		    <td class="titulo1">${alterarDadosPessoais}</td>
		    <td style="vertical-align:top; text-align:center; width:2%;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('s');" class="cursorMao" alt="<fmt:message key='ipdms.forms.ajuda' />" title="<fmt:message key='ipdms.forms.ajuda' />" /></td>
		  </tr>
		</tbody>
	</table>					
</div>
<div id="ajuda" class="info" style="padding-top:0px; display: none; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings" summary="titulo principal da página">
		<tbody>
		  <tr>
		    <td class="titulo1">${alterarDadosPessoais}</td>
		    <td style="vertical-align:top; text-align:center; width:2%;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('n');" class="cursorMao" alt="<fmt:message key='ipdms.forms.ocultarAjuda' />" title="<fmt:message key='ipdms.forms.ocultarAjuda' />" /></td>
		  </tr>
		</tbody>
	</table>
	<fmt:message key="ipdms.colaborador.alterarDadosPessoais.help" />				
</div>

<div id="MensagemErro">
	<html:errors/>
</div>

<html:form action="/saveDadosPessoais" method="post" styleClass="form">
<nested:root name="${formBeanName}">
<html:hidden property="numero"/>
<html:hidden property="ldap"/>
<div class="row" style="padding-bottom:20px;">
	<div class="leftTab label" style="width: 90%; " title="<fmt:message key='ipdms.obrigatorio' />">
  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
  	</div>
</div>

<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 15%; " title="<fmt:message key='ipdms.colaborador.nome' />">
  		<label for="nome">
  			<fmt:message key="ipdms.colaborador.nome" /> *
  		</label>
  	</div>
  	
  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.colaborador.nome' />">
  		<nested:text property="nome" styleId="nome" style="width:98.5%;"/>
  	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 15%; " title="<fmt:message key='ipdms.colaborador.morada'/>">
		<label for="morada">
	  		<fmt:message key="ipdms.colaborador.morada"/> *
	  	</label>
  	</div>
  	
  	<div class="label" style="width: 81%;" title="<fmt:message key='ipdms.colaborador.morada'/>">
  		<nested:textarea property="morada" styleId="morada" style="width:96.9%;"/>
  	</div>
</div>
<div class="row formlabel_sf">
	<div class="leftTab label" style="width: 15%;" title="<fmt:message key='ipdms.colaborador.telefone'/>">
		<label for="telefone">
	  		<fmt:message key="ipdms.colaborador.telefone"/>
	  	</label>
  	</div>
  		
  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.colaborador.telefone'/>">
  		<nested:text property="telefone" styleId="telefone" maxlength="9"/>  		
  	</div>
</div>
<div class="row formlabel_sf">
	<div class="leftTab label" style="width: 15%;" title="<fmt:message key='ipdms.colaborador.telemovel'/>">
		<label for="telemovel">
  			<fmt:message key="ipdms.colaborador.telemovel"/>
  		</label>
  	</div>
  		
  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.colaborador.telemovel'/>">
  		<nested:text property="telemovel" styleId="telemovel" maxlength="9" />
  	</div>
</div>
<div class="row formlabel_sf">
	<div class="leftTab label" style="width: 15%;" title="<fmt:message key='ipdms.colaborador.fax'/>">
		<label for="fax">
	  		<fmt:message key="ipdms.colaborador.fax"/>
	  	</label>
  	</div>
  		
  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.colaborador.fax'/>">
  		<nested:text property="fax" maxlength="20" styleId="fax" size="20" />
  	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 15%; " title="<fmt:message key='ipdms.colaborador.email'/>">
		<label for="email">
  			<fmt:message key="ipdms.colaborador.email"/> *
  		</label>
  	</div>
  	
  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.colaborador.email'/>">
  		<nested:text property="email" maxlength="50" styleId="email" />
  	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 15%; " title="<fmt:message key='ipdms.colaborador.login'/>">
  		<fmt:message key="ipdms.colaborador.login"/>
  	</div>
  	
  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.colaborador.login'/>">
  		<nested:write property="login"/>
  	</div>
</div>

<c:if test="${not dadosPessoaisFormBean.ldap}">
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 15%; " title="<fmt:message key='ipdms.colaborador.passwordnova'/>">
			<label for="passwordnova">
	  			<fmt:message key="ipdms.colaborador.passwordnova"/>
	  		</label>
	  	</div>
	  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.colaborador.passwordnova'/>">
	  		<input type="password" name="passwordNova" id="passwordnova" maxlength="50" >
	  	</div>
	</div>
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 15%; " title="<fmt:message key='ipdms.colaborador.confirmacao'/>">
			<label for="confirmacao">
		  		<fmt:message key="ipdms.colaborador.confirmacao"/>
		  	</label>
	  	</div>
	  	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.colaborador.confirmacao'/>">
	  		<input type="password" name="confirmacao" id="confirmacao" maxlength="50" >
	  	</div>
	</div>
</c:if>
<div class="row formlabel_sf">
   <div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.colaborador.ordenacaolistas'/>">
		<label for="orderAsc"><fmt:message key="ipdms.colaborador.ordenacaolistas"/></label>
	</div>	
	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.colaborador.ordenacaolistas'/>">
 		<nested:checkbox property="orderAsc" styleClass="radion" style="border:0;" styleId="orderAsc"/>
 	</div>
</div>

<div class="row formlabel_sf">
   <div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.colaborador.ordenacaodatanotificacao'/>">
		<label for="orderAsc"><fmt:message key="ipdms.colaborador.ordenacaodatanotificacao"/></label>
	</div>	
	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.colaborador.ordenacaodatanotificacao'/>">
 		<nested:checkbox property="orderByNotifDate" styleClass="radion" style="border:0;" styleId="orderByNotifDate"/>
 	</div>
</div>

<br />
<div class="buttonRow">
	<input type="submit" class="btForm" title="<fmt:message key='ipdms.forms.submit'/>" value="<fmt:message key='ipdms.forms.submit'/>">
	<input type="button" class="btFormEscuro" title="<fmt:message key='ipdms.forms.cancelar'/>" value="<fmt:message key='ipdms.forms.cancelar'/>" onclick="setActionAndSubmit(this.form, 'homepage.do2');">
</div>
</nested:root>
</html:form>