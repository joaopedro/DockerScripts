<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>

<script type="text/javascript">	
	document.title = 'IPDMS - Editar <bean:message key="ipdms.modules.entidaderelationrole.designacaosingular" locale="locale"/>';	 
</script>

<div id="ver_ajuda" class="info" style="padding-top:0px; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">Editar <bean:message key="ipdms.modules.formacao.editarcarro.designacaosingular" locale="locale"/></td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('s');" class="cursorMao" alt="Ajuda" title="Ajuda" /></td>
		  </tr>
		</tbody>
	</table>					
</div>
<div id="ajuda" class="info" style="padding-top:0px; display: none; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">Editar <bean:message key="ipdms.modules.formacao.editarcarro.designacaosingular" locale="locale"/></td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('n');" class="cursorMao" alt="Ocultar Ajuda" title="Ocultar Ajuda" /></td>
		  </tr>
		</tbody>
	</table>			
	<bean:message key="ipdms.modules.entidaderelationrole.help" locale="locale"/>
</div>

<div id="MensagemErro">
	<html:errors/>
</div>

<html:form action="/saveCarro" method="post" styleClass="form">

	<div class="row" style="padding-bottom:20px;">
		<div class="leftTab label" style="width: 90%; " title="Nome">
	  		<span class="formlabel_obrigatorio"><bean:message key="ipdms.obrigatorio" locale="locale" /></span>
	  	</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; ">
	  		<fmt:message key="ipdms.modules.formacao.editarcarro.marca" />
	  	</div>
	  	
	  	<div class="label" style="width: 80%;">
	  		<html:text property="marca" size="80" maxlength="50"/>
	  	</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; ">
	  		<fmt:message key="ipdms.modules.formacao.editarcarro.modelo" />
	  	</div>
	  	
	  	<div class="label" style="width: 80%;">
	  		<html:text property="modelo" size="20" maxlength="50"/>
	  	</div>
	</div>
	
	<br />
	<div class="buttonRow">
		<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.anterior" />" title="Retroceder ao ecrã anterior"
			onclick="setActionAndSubmit(this.form, 'listCarros.do2');">
		<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.submit" />" title="Submeter a informação">
	</div>

</html:form>